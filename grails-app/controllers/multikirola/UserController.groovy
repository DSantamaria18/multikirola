package multikirola

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.apache.commons.lang.WordUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU


class UserController {

    SpringSecurityService springSecurityService
    UsuarioService usuarioService
    UserService userService
    def mailService

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]
//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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
            userService.save(user)

            def role = Role.findByAuthority('ROLE_CUSTOMER')
            UserRole.create(user, role, true)

            mailService.sendMail {
                async true
                from "qualit18@gmail.com"
                to "ilacruz@getxo.eus"
                subject "Alta de nuevo usuario en Multikirolak"
                html g.render(template: "/emailTemplates/newUserEmailTemplate", model: [user: user])
            }

            springSecurityService.reauthenticate user.username

        } catch (ValidationException e) {
//            respond user.errors, view: 'register'
            log.error("ERROR AL GUARDAR EL USUARIO: ${user.errors}")
            redirect(action: 'register')
//            respond user.errors, view:'create'
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
        User updUser = getAuthenticatedUser() as User
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

    def recuperarContraseña() {

        String email = params?.userid
        User user = User.findByEmail(email)

        if (user) {
            String token = UUID.randomUUID().toString()
            usuarioService.createPasswordResetTokenForUser(user, token)
            Locale locale = RCU.getLocale(request)
            String link = createLink(controller: 'user', action: 'resetPassword', params: [token: token, lang: locale], absolute: true)

            mailService.sendMail {
                async true
                from "qualit18@gmail.com"
                to "dsantamaria18@gmail.com"
                subject "${g.message(code: 'default.email.subject.recuperarContrasena', locale: locale)}"
                text "El usuario ${user.email} ha solicitado recuperar su contraseña"
            }

            mailService.sendMail {
                async true
                from "qualit18@gmail.com"
//                to user.email
                to "dsantamaria18@gmail.com"
                subject "${g.message(code: 'default.email.subject.recuperarContrasena', locale: locale)}"
                html g.render(template: "/emailTemplates/resetPasswordEmail", model: [username: user.nombre, link: link, locale: locale])
            }
            render(view: 'resetPasswordEmailEnviado', model: [user: user, locale: locale])
        } else {
            throw new NullPointerException("No se ha encontrado el usuario con email ${email}")
        }
    }

    def resetPassword() {
        String token = params.token
        User user = User.findByResetToken(token)
        if (user) {
            if (usuarioService.isValidResetPasswordToken(user)) {
                [usuario: user]
            } else {
                flash.message = "El enlace ha expirado..."
                render(view: '/error')
                return
            }
        } else {
            throw new NullPointerException("No se ha encontrado el usuario con email ${email}")
        }
    }

    def updatePassword() {

    }


}
