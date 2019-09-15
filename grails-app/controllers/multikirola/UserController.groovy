package multikirola

import grails.core.GrailsApplication
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices
import org.springframework.validation.Errors
import org.apache.commons.lang.WordUtils

class UserController {

    SpringSecurityService springSecurityService
    UserService userService
    GrailsApplication grailsApplication

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE", borrarCuenta: "POST"]

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        User currentUser = getAuthenticatedUser() as User

        if (Role.findByAuthority('ROLE_ADMIN') in currentUser.getAuthorities()) {
            respond userService.list(params), model: [userCount: userService.count()]
        } else {
            if (Role.findByAuthority('ROLE_USER') in currentUser.getAuthorities()) {
                def userRoleList = UserRole.findAllByRole(Role.findByAuthority('ROLE_CUSTOMER'))
                List<User> userList = []
                for (user in userRoleList.user) {
                    userList.add(user)
                }
                respond userList(params), model: [userCount: userList.size()]
            }
        }
    }

    @Secured('ROLE_ADMIN')
    def show(Long id) {
        respond userService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def create() {
        respond new User(params)
    }

    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            user.email = user.email.toLowerCase()
            user.username = user.email
            user.nombre = WordUtils.capitalizeFully(user.nombre)
            user.apellidos = WordUtils.capitalizeFully(user.apellidos)

            sendMail {
                from grailsApplication.config.getProperty('email.from')
                to user.email
                subject("Registro en Multikirola")
                html g.render(template: 'emailRegistro', model: [user: user])
            }

            sendMail {
                from grailsApplication.config.getProperty('email.from')
                to grailsApplication.config.getProperty('email.userChangeNotificationsTo')
                subject("Nuevo usuario registrado en Multikirola")
                html g.render(template: 'notificacion', model: [user: user])
            }

            userService.save(user)

            def role = Role.findByAuthority('ROLE_CUSTOMER')
            UserRole.create(user, role, true)

            springSecurityService.reauthenticate user.username

        } catch (ValidationException e) {
            log.error("ERROR AL GUARDAR EL USUARIO: ${user.errors}")
            respond user.errors, view: 'register'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect url: '/'
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(Long id) {
        respond userService.get(id)
    }

    def update(User user) {
        if (user == null) {
            notFound()
            return
        }
        User updUser = getAuthenticatedUser()
        try {
            if (updUser.username == user.username) {
                updUser.nombre = WordUtils.capitalizeFully(user.nombre)
                updUser.apellidos = WordUtils.capitalizeFully(user.apellidos)
                updUser.movil = user.movil
                updUser.whatsapp = user.whatsapp
                if (user.password != null) {
                    updUser.password = user.password
                }
                userService.save(updUser)
            } else {
                throw new Exception("Error de validación del usuario")
            }
        } catch (ValidationException e) {
            //            redirect(action: 'miCuenta')
            flash.message = "Se ha producido un error. Por favor, revisa los datos introducidos e inténtalo de nuevo..."
            render(view: 'miCuenta', model: [user: updUser])
            return
        } catch (Exception ex) {
            flash.message = "No se han podido actualizar los datos del usuario ${user.username.toLowerCase()}"
            render(view: 'miCuenta', model: [user: updUser])
            return
        }

        sendMail {
            from grailsApplication.config.getProperty('email.from')
            to grailsApplication.config.getProperty('email.userChangeNotificationsTo')
            subject("Cambios en la cuenta del usuario ${updUser.nombre} ${updUser.apellidos} [${updUser.id}]")
            html g.render(template: 'notificacion', model: [user: updUser])
        }

        request.withFormat {
            form multipartForm {
                flash.message = "Datos actualizados"
                redirect(action: 'miCuenta')
            }
            '*' { respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        userService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def register() {
        respond new User(params)
    }

    def miCuenta() {
        if (isLoggedIn()) {
            Long userId = getAuthenticatedUser().id
            User user = userService.get(userId)
            render(view: 'miCuenta', model: [user: user])
        }
    }

    def borrarCuenta() {
        if (isLoggedIn()) {
            final User user = getAuthenticatedUser()
            final String nombre = params.nombre
            final String apellidos = params.apellidos
            final String email = params.email
            final String movil = params.movil

            if (user.email == email && user.nombre == nombre && user.apellidos == apellidos && user.movil == movil) {
                user.enabled = false
                userService.save(user)

                sendMail {
                    from grailsApplication.config.getProperty('email.from')
                    to grailsApplication.config.getProperty('email.userChangeNotificationsTo')
                    subject("Solicitud de borrado de cuenta ${user.nombre} ${user.apellidos} [${user.id}]")
                    html g.render(template: 'notificacionBorrado', model: [user: user])
                }

                sendMail {
                    from grailsApplication.config.getProperty('email.from')
                    to user.email
                    subject("Borrado de cuenta de Multikirolak")
                    text "Tu cuenta se ha dado de baja en Multikirolak. Si necesitas contactar con nosotros puedes " +
                            "enviarnos un email a ${grailsApplication.config.getProperty('email.userChangeNotificationsTo')}"
                }

                final Authentication auth = SecurityContextHolder.context.authentication
                new SecurityContextLogoutHandler().logout(request, response, auth);

                redirect uri: '/'
            }
        }
    }
}
