package multikirola

import com.sun.org.apache.xpath.internal.operations.Bool
import grails.plugin.springsecurity.annotation.Secured
import groovy.transform.CompileDynamic
import jxl.Workbook
import jxl.WorkbookSettings
import jxl.write.Border
import jxl.write.BorderLineStyle
import jxl.write.Colour
import jxl.write.Label
import jxl.write.Number
import jxl.write.WritableCellFormat
import jxl.write.WritableFont
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook

import javax.xml.bind.ValidationException
import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@CompileDynamic
//@Transactional(readOnly = false)
class ParticipanteController {

    ParticipanteService participanteService
    ParticipanteImplService participanteImplService
    ActividadMultikirolaService actividadMultikirolaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        User currentUser = getAuthenticatedUser() as User
        def participantesList = Participante.findAllByUsuario(currentUser)
        def actividadMultikirolaList = actividadMultikirolaService.getActiveInscriptions(currentUser.id)

        render(view: "index", controller: "participante", model: [participantesList: participantesList, actividadMultikirolaList: actividadMultikirolaList])
    }

    def show(Long id) {
        User currentUser = getAuthenticatedUser() as User
        Participante participante = Participante.findById(id)
        if (participante && participante.usuario == currentUser) {
            respond participanteService.get(id)
        } else {
            redirect(uri: '/')
        }
    }

    def create() {
        User currentUser = getAuthenticatedUser() as User
        params.email = currentUser.email
        params.movil = currentUser.getMovil()

        respond new Participante(params)
    }

    @Transactional
    def save(Participante participante) {
        if (participante == null) {
            notFound()
            return
        }

        String token = encodeToken(participante)
        participante.token = token

        Participante participante2 = Participante.findByToken(token)
        if (participante2) {
            log.error(">>> ERROR: Ya existe el participante ${token}")
            flash.message = message(code: 'participante.create.duplicatedToken', args: [$ { token }], default: "Ya existe un participante con este token: ${token}")
            respond participante
            return
        }

        User currentUser = getAuthenticatedUser() as User
        participante.usuario = currentUser

        participante.validate()

        try {
            participanteService.save(participante)
        } catch (ValidationException e) {
            log.error(e.message)
            log.error(e.stackTrace)
            respond participante.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'default.label.participante', default: 'Participante'), participante.token])
//                redirect action: 'index', method: 'GET'
                redirect action: 'index'
            }
            '*' { respond participante, [status: CREATED] }
        }
    }

    def edit(Participante participante) {
        User currentUser = getAuthenticatedUser()
        if (participante && participante.usuario == currentUser) {
            respond participante
        } else {
            redirect(uri: '/')
        }
    }

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

    @Transactional
    def delete(Participante participante) {
        if (participante == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        participanteService.delete(participante.id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'participante.label', default: 'Participante'), participante.id])
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
    def gestionParticipantes() {
        User currentUser = getAuthenticatedUser()
        if (!currentUser) {
            redirect(uri: '/login/auth')
            return
        }

        String apellido1 = ""
        String movil = ""
        String email = ""
        Long centro = null
        Boolean activos = null
        Date fdesde = Date.parse('yyyy-MM-dd', '1900-01-01')
        Date fhasta = Date.parse('yyyy-MM-dd', '2100-01-01')
        def participantesList = participanteImplService.filtrarParticipantes(apellido1, movil, email, centro, activos, fdesde, fhasta)

        [participantesList: participantesList]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def descargarParticipantes() {

        String apellido1 = params?.apellido1
        String movil = (params?.movil) ?: ""
        String email = (params?.email) ?: ""

        Long centro = null
        if (params?.centro != "") {
            centro = params.centro as Long
        }

        Boolean activos = null
        if (params?.qUserEnabled == "true") {
            activos = Boolean.TRUE
        } else if (params?.qUserEnabled == "false") {
            activos = Boolean.FALSE
        }

        Date fechaDesde = (params.qFechaDesde) ? Date.parse('yyyy-MM-dd', params.qFechaDesde) : Date.parse('yyyy-MM-dd', '1900-01-01')
        Date fechaHasta = (params.qFechaHasta) ? Date.parse('yyyy-MM-dd', params.qFechaHasta) : Date.parse('yyyy-MM-dd', '2100-01-01')

        def participantesList = participanteImplService.filtrarParticipantes(apellido1, movil, email, centro, activos, fechaDesde, fechaHasta)

        // Fichero
        response.setContentType('application/vnd.ms-excel')
        response.setHeader('Content-Disposition', "Attachment;Filename=Participantes.xls")
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
        sheet.addCell(new Label(1, 1, "Listado de Participantes", titleFormat))

        int columna = 1
        int fila = 3

        try {
            //Título listado de participantes
            sheet.addCell(new Label(1, 1, "Participantes", titleFormat))
            fila = fila + 2

            // Cabecera listado participantes
            sheet.addCell(new Label(columna, fila, "ID", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "CENTRO", headerFormat))
            columna++
            /*sheet.addCell(new Label(columna, fila, "CURSO", headerFormat))
            columna++*/
            sheet.addCell(new Label(columna, fila, "APELLIDO 1", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "APELLIDO 2", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "NOMBRE", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "SEXO", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "EMAIL", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "MOVIL", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "F.NACIMIENTO", headerFormat))
            columna++
            sheet.addCell(new Label(columna, fila, "ACTIVO", headerFormat))

            fila++
            columna = 1

            // Datos de los participantes
            participantesList.each {
                sheet.addCell(new Number(columna, fila, it.id, cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.centro}".toUpperCase(), cellFormat))
                columna++
                /*sheet.addCell(new Label(columna, fila, "${it.curso}".toUpperCase(), cellFormat))
                columna++*/
                sheet.addCell(new Label(columna, fila, "${it.apellido1}".toUpperCase(), cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.apellido2}".toUpperCase(), cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.nombre}".toUpperCase(), cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.sexo}", cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.email}".toUpperCase(), cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${it.movil}", cellFormat))
                columna++
                sheet.addCell(new Label(columna, fila, "${formatDate(format: "dd/MM/yyyy", date: it.fechaNacimiento)}", cellFormat))
                columna++
                if (it.activo == true) {
                    sheet.addCell(new Label(columna, fila, "SI", cellFormat))
                } else {
                    sheet.addCell(new Label(columna, fila, "NO", cellFormat))
                }

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

    def filtrarParticipantes() {

        String apellido1 = params?.apellido1
        String movil = (params?.movil) ?: ""
        String email = (params?.email) ?: ""

        Long centro = null
        if (params?.centro != "") {
            centro = params.centro as Long
        }

        Boolean activos = null
        if (params?.activos == "true") {
            activos = Boolean.TRUE
        } else if (params?.activos == "false") {
            activos = Boolean.FALSE
        }

        Date fechaDesde = Date.parse('yyyy-MM-dd', params?.fDesde)
        Date fechaHasta = Date.parse('yyyy-MM-dd', params?.fHasta)

        def participantesList = participanteImplService.filtrarParticipantes(apellido1, movil, email, centro, activos, fechaDesde, fechaHasta)

        render(template: "tablaParticipantes", model: [participantesList: participantesList])
    }

}
