package multikirola

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import org.apache.commons.lang.WordUtils

class UserController {

    SpringSecurityService springSecurityService
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
                for(user in userRoleList.user) {
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

    def recuperarContraseña(){
        mailService.sendMail {
            from "qualit18@gmail.com"
            to "dsantamaria18@gmail.com"
            subject "recuperar contraseña"
            text "He olvidado mi contraseña"
        }
    }


}
