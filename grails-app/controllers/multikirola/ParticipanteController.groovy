package multikirola

import grails.plugin.springsecurity.annotation.Secured

import javax.servlet.http.Part

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class ParticipanteController {

    ParticipanteService participanteService
    ActividadMultikirolaService actividadMultikirolaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        User currentUser = getAuthenticatedUser()
        def participantesList = Participante.findAllByUsuario(currentUser)
        def actividadMultikirolaList = actividadMultikirolaService.getActiveInscriptions(currentUser.id)

        render(view: "index", model: [participantesList: participantesList, actividadMultikirolaList: actividadMultikirolaList])
    }

    /*def show(Long id) {
        respond participanteService.get(id)
    }*/

    def show(Participante participante) {
        User currentUser = getAuthenticatedUser()
        if (participante && participante.usuario == currentUser){
            respond participante
        } else {
            redirect(uri: '/')
        }
    }

    def create() {
        User currentUser = getAuthenticatedUser()
        params.email = currentUser.email
        params.telefono= currentUser.telefono
        params.movil = currentUser.movil

        respond new Participante(params)
    }

    /*def save(Participante participante) {
        if (participante == null) {
            notFound()
            return
        }


        try {
            participanteService.save(participante)
        } catch (ValidationException e) {
            respond participante.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'participante.label', default: 'Participante'), participante.id])
                redirect participante
            }
            '*' { respond participante, [status: CREATED] }
        }
    }*/

    @Transactional
    def save(Participante participante) {
        if (participante == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        String token = encodeToken(participante)
        participante.token = token

        User currentUser = getAuthenticatedUser()
        participante.usuario = currentUser

        participante.validate()

        if (participante.hasErrors()) {
            transactionStatus.setRollbackOnly()
            if (participante.errors.getFieldError('token')) {
                participante.errors.reject('participant.already.exists', "Este participante ya ha sido dado de alta [${participante.token}]")
            }
            respond participante.errors, view: 'create'
            return
        }

        participanteService.save(participante)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'participante.label', default: 'Participante'), participante.token])
                redirect participante
            }
            '*' { respond participante, [status: CREATED] }
        }
    }

    /*def edit(Long id) {
        respond participanteService.get(id)
    }*/

    def edit(Participante participante) {
        User currentUser = getAuthenticatedUser()
        if (participante && participante.usuario == currentUser){
            respond participante
        } else {
            redirect(uri: '/')
        }
    }

    /* def update(Participante participante) {
         if (participante == null) {
             notFound()
             return
         }

         try {
             participanteService.save(participante)
         } catch (ValidationException e) {
             respond participante.errors, view:'edit'
             return
         }

         request.withFormat {
             form multipartForm {
                 flash.message = message(code: 'default.updated.message', args: [message(code: 'participante.label', default: 'Participante'), participante.id])
                 redirect participante
             }
             '*'{ respond participante, [status: OK] }
         }
     }*/

    @Transactional
    def update(Participante participante) {
        if (participante == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (participante.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond participante.errors, view: 'edit'
            return
        }

        participante.save(flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'participante.label', default: 'Participante'), participante.token])
                redirect participante
            }
            '*' { respond participante, [status: OK] }
        }
    }

    /* def delete(Long id) {
         if (id == null) {
             notFound()
             return
         }

         participanteService.delete(id)

         request.withFormat {
             form multipartForm {
                 flash.message = message(code: 'default.deleted.message', args: [message(code: 'participante.label', default: 'Participante'), id])
                 redirect action:"index", method:"GET"
             }
             '*'{ render status: NO_CONTENT }
         }
     }*/

    @Transactional
    def delete(Participante participante) {
        if (participante == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        participanteService.delete(flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'participante.label', default: 'Participante'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'participante.label', default: 'Participante'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    private static String encodeToken(Participante participante) {
        List salt = ["M", "U", "L", "T", "I", "K", "I", "R", "O", "L", "A", "K"]
        def fecha = participante.fechaNacimiento.toTimestamp().toString().split(" ")[0].split('-')
        String año = fecha[0].toString().reverse()
        String mes = fecha[1]
        String dia = fecha[2]

        String nombre = participante.nombre.substring(0, 2).toUpperCase()
        String apellido = participante.apellido1.substring(0, 2).toUpperCase()

        String random1 = salt[11]
        String random2 = salt[2]
        String random3 = salt[7]
        String token = random1 + año + apellido + random2 + dia + nombre + mes + random3

        return token
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def gestionParticipantes(){
        User currentUser = getAuthenticatedUser()
        if(!currentUser){
            redirect(uri:'/login/auth')
            return
        }

        def c = Participante.createCriteria()
        def participantesList = c.list{
            and{
                order("apellido1", "asc")
                order("apellido2", "asc")
                order("nombre", "asc")
            }
        }

        [participantesList: participantesList]
    }

    def filtrarParticipantes(params){
        String apellido1 = params?.apellido1
        String telefono = params?.telefono
        String movil = params?.movil

        def c = Participante.createCriteria()
        def participantesList = c.list {
            like("apellido1", apellido1)
        }

//        def participantesList = Participante.findAllByApellido1IlikeAndTelefonoIlikeAndMovilIlike(apellido1,telefono,movil)
//        def participantesList = participanteService.filtrarParticipantes(params)
        render(template: "tablaParticipantes", model:[participantesList: participantesList])
    }

}
