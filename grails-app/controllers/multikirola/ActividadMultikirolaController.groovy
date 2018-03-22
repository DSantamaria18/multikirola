package multikirola

import grails.validation.ValidationException

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*



import jxl.Workbook
import jxl.WorkbookSettings
import jxl.write.Border
import jxl.write.BorderLineStyle
import jxl.write.Colour
import jxl.write.DateTime
import jxl.write.Label
import jxl.write.Number
import jxl.write.WritableCellFormat
import jxl.write.WritableFont
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook


class ActividadMultikirolaController {

    ActividadMultikirolaService actividadMultikirolaService

    def index() {}

    def showEvents(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def eventList = actividadMultikirolaService.getEvents()
//        def eventList = actividadMultikirolaService.findEvents(params.modalidad)

        /*if (eventList.size() == 0) {
            flash.message = "Lo sentimos, no hay actividades programadas para esta modalidad..."
        }*/

    /*    if (eventList.size() == 0) {
            flash.message = "Recuerda que debes dar de alta al menos un participante"
        }*/
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

    def eventInfo(params){
        def eventId = params.event as Long
        User currentUser = getAuthenticatedUser()

        if(!currentUser){
            redirect(uri:'/login/auth')
            return
        }

        def evento = actividadMultikirolaService.findEvent(eventId).first()
        def participantesList = actividadMultikirolaService.findRegisteredParticipants(eventId)
//        def participantesDisponiblesList = actividadMultikirolaService.findAvailableParticipants(eventId)

        [evento: evento,  participantesList: participantesList]
    }

    def descargarParticipantes(params){
        def eventId = params.eventId as Long
        def evento = actividadMultikirolaService.findEvent(eventId).first()
        def participantesList = actividadMultikirolaService.findRegisteredParticipants(eventId)

        String actividad = evento.tipo_actividad
        String modalidad = evento.modalidad
        String fecha = new SimpleDateFormat("dd/MM/yyyy").format(evento.fecha)
        String horario = evento?.horario
        String lugar = evento?.lugar
        String recinto = evento?.recinto
        String instalacion = evento?.instalacion

        // Fichero
        response.setContentType('application/vnd.ms-excel')
        response.setHeader('Content-Disposition', "Attachment;Filename='Participantes_${modalidad}_${fecha}.xls'")
        WorkbookSettings ws = new WorkbookSettings()
        ws.setLocale(new Locale("es", "ES"))
        WritableWorkbook workbook = Workbook.createWorkbook(response.outputStream, ws)

        // Estilos
        WritableFont titleFont = new WritableFont(WritableFont.ARIAL, 16, WritableFont.BOLD)
        WritableCellFormat titleFormat = new WritableCellFormat()
        titleFormat.setFont(titleFont)

        WritableFont headerFont = new WritableFont(WritableFont.ARIAL, 11, WritableFont.BOLD)
        WritableCellFormat headerFormat = new WritableCellFormat()
        headerFormat.with {
            setBackground(Colour.GREY_25_PERCENT)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setFont(headerFont)
            setWrap(true)
        }

        WritableFont cellFont = new WritableFont(WritableFont.ARIAL, 10)
        WritableCellFormat cellFormat = new WritableCellFormat()
        cellFormat.with {
            setFont(cellFont)
            setBorder(Border.ALL, BorderLineStyle.THIN)
            setWrap(true)
        }

        // Nombre de la hoja
        String nombreHoja = "Participantes"
        WritableSheet sheet = workbook.createSheet(nombreHoja, 0)

        // Título
        sheet.addCell(new Label(1, 1, "Multikirola ${modalidad} ${fecha}", titleFormat))

        int columna = 1
        int fila = 3
        try {

            // Datos del evento
            sheet.addCell(new Label(columna, fila, "Nº Evento: ", headerFormat))
            sheet.addCell(new Number(columna + 1, fila, eventId , cellFormat))
            fila++

            sheet.addCell(new Label(columna, fila, "Modalidad: ", headerFormat))
            sheet.addCell(new Label(columna + 1, fila, modalidad , cellFormat))
            fila++

            sheet.addCell(new Label(columna, fila, "Tipo: ", headerFormat))
            sheet.addCell(new Label(columna + 1, fila, actividad , cellFormat))
            fila++

            sheet.addCell(new Label(columna, fila, "Fecha: ", headerFormat))
            sheet.addCell(new Label(columna + 1, fila, fecha , cellFormat))
            fila++

            sheet.addCell(new Label(columna, fila, "Horario: ", headerFormat))
            sheet.addCell(new Label(columna + 1, fila, horario , cellFormat))
            fila++

            sheet.addCell(new Label(columna, fila, "Lugar: ", headerFormat))
            sheet.addCell(new Label(columna + 1, fila, lugar , cellFormat))
            fila++

            sheet.addCell(new Label(columna, fila, "Recinto: ", headerFormat))
            sheet.addCell(new Label(columna + 1, fila, recinto , cellFormat))
            fila++

            sheet.addCell(new Label(columna, fila, "Instalación: ", headerFormat))
            sheet.addCell(new Label(columna + 1, fila, instalacion , cellFormat))
            fila = fila + 3

            //Título listado de participantes
            sheet.addCell(new Label(1, 1, "Participantes", titleFormat))
            fila = fila + 2

            // Cabecera listado participantes
            sheet.addCell(new Label(columna, fila, "CENTRO ", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "CURSO ", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "NOMBRE ", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "APELLIDOS ", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "SEXO ", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "EMAIL ", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "TELEFONO ", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "MOVIL ", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "F.NACIMIENTO ", headerFormat))

            fila++
            columna = 1

            // Datos de los participantes
            participantesList.each {
                sheet.addCell(new Label(columna, fila, "${it.centro}".toUpperCase() , cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.curso}".toUpperCase() , cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.nombre}".toUpperCase() , cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.apellido1} ${it.apellido2}".toUpperCase()  , cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.sexo}" , cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.email}".toUpperCase() , cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.telefono}" , cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.movil}" , cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${formatDate(format: "dd/MM/yyyy", date: it.fnacimiento)}", cellFormat))

                columna = 1
                fila++
            }


            for (int c = 1; c < 15; c++) {
                sheet.setColumnView(c, 30)
            }
        } catch (Exception e) {
            e.printStackTrace()
        }

        workbook.write()
        workbook.close()

    }

    def filtrarEventos(params){
        def eventList = actividadMultikirolaService.filtrarEventos(params)
        render(template: "tablaEventos", model:[eventList: eventList])
    }
}
