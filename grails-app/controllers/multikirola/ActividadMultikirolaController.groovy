package multikirola

import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*

class ActividadMultikirolaController {

    ActividadMultikirolaService actividadMultikirolaService

    def index() {}

    def showEvents(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def eventList = actividadMultikirolaService.findEvents(params.modalidad)

        if (eventList.size() == 0) {
            flash.message = "Lo sentimos, no hay actividades programadas para esta modalidad..."
        }

        if (eventList.size() == 0) {
            flash.message = "Recuerda que debes dar de alta al menos un participante"
        }
        [eventList: eventList]
    }

    def registrarParticipantes(Long eventId){
        User currentUser = getAuthenticatedUser()

        if(!currentUser){
            redirect(uri:'/login/auth')
            return
        }

        if(!actividadMultikirolaService.isMultikirolaEvent(eventId))  redirect(uri:'/')
        def evento = actividadMultikirolaService.findEvent(eventId).first()
        def participantesRegistradosList = actividadMultikirolaService.findRegisteredParticipants(eventId, currentUser.id)
        def participantesList = actividadMultikirolaService.findAvailableParticipants(eventId, currentUser.id)

        [evento: evento,  participantesList: participantesList, participantesRegistradosList: participantesRegistradosList]
    }

    def save(params){
        if (params['eventId'] == null || params.participanteId == null) {
//            notFound()
            return
        }

        User currentUser = getAuthenticatedUser()
        def eventId = params.eventId as Long

//        participantes.each() {
            ActividadMultikirola actividadMultikirola = new ActividadMultikirola()
            actividadMultikirola.evento = eventId as Long
            actividadMultikirola.participante = params.participanteId as Long
            actividadMultikirola.telefono = params.telefono
            actividadMultikirola.movil = params.movil

            try {
                actividadMultikirola.save(flush: true)
            } catch (ValidationException e) {
                respond actividadMultikirola.errors, view: 'registrarParticipantes'
                return
            }

//        }

        def participantesList = actividadMultikirolaService.findAvailableParticipants(eventId, currentUser.id)
        def participantesRegistradosList = actividadMultikirolaService.findRegisteredParticipants(eventId, currentUser.id)

        /* request.withFormat {
             form multipartForm {
                 flash.message = "Participantes inscritos correctamente..."
 //                flash.message = message(code: 'default.created.message', args: [message(code: 'participantes.label', default: 'Curso'), participantes.id])
                 redirect showEvents()
             }
             '*' { respond actividadMultikirola, [status: CREATED] }
         }*/
        render(template: "selectorParticipantes", model: [participantesList: participantesList])
        render(template: "participantesRegistrados", model: [participantesRegistradosList: participantesRegistradosList])
    }

    def delete(Long eventId, Long participanteId) {
        if (eventId == null || participanteId == null) {
//            notFound()
            return
        }

        actividadMultikirolaService.deletePArticipantFromEvent(eventId, participanteId)

        redirect(action: "registrarParticipantes", params:[eventId: eventId])

        /*request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'curso.label', default: 'Curso'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }*/
    }

    def getNextEvents(){
        def eventList = actividadMultikirolaService.findNextEvents()

        render(template: "listaEventos", model:[eventList: eventList])
    }
}
