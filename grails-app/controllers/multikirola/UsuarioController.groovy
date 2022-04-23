package multikirola

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
import org.codehaus.groovy.runtime.NullObject

import java.sql.Timestamp
import java.text.SimpleDateFormat

class UsuarioController {

    UsuarioService usuarioService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def usuariosList = usuarioService.getAllUsersInfo()

        [usuariosList: usuariosList]
    }

    def filtrarUsuarios() {
        Boolean qWhatsApp = null
        if (params.qWhatsApp == "true") {
            qWhatsApp = Boolean.TRUE
        } else if (params.qWhatsApp == "false") {
            qWhatsApp = Boolean.FALSE
        }
        Date qFechaDesde = Date.parse('yyyy-MM-dd', params.qFechaDesde)

        def usuariosList = usuarioService.filtraUsuarios(qWhatsApp, qFechaDesde)

        render([template: 'tablaUsuarios', model: [usuariosList: usuariosList]])
    }

    def exportarUsuarios() {
        Boolean qWhatsApp = null
        if (params.qWhatsApp == "true") {
            qWhatsApp = Boolean.TRUE
        } else if (params.qWhatsApp == "false") {
            qWhatsApp = Boolean.FALSE
        }
        Date qFechaDesde = (params.qFechaDesde) ? Date.parse('yyyy-MM-dd', params.qFechaDesde) : Date.parse('yyyy-MM-dd', '1900-01-01')

        def usuariosList = usuarioService.filtraUsuarios(qWhatsApp, qFechaDesde).collect{[Nombre: it.nombre, Apellidos: it.apellidos, Móvil: it.movil, Whatsapp: it.whatsapp, Email:it.email, Activo:it.enabled]}

        if (usuariosList.size() > 0) {
            response.setContentType('application/vnd.ms-excel')
            response.setHeader('Content-Disposition', "Attachment;Filename=Usuarios.xls")
            WorkbookSettings ws = new WorkbookSettings()
            ws.setLocale(new Locale("es", "ES"))
            WritableWorkbook workbook = Workbook.createWorkbook(response.outputStream, ws)

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

            String nombreHoja = "Usuarios"
            WritableSheet sheet = workbook.createSheet(nombreHoja, 0)

            sheet.addCell(new Label(0, 0, "Usuarios", titleFormat))

            int columna = 0
            int fila = 3

            try {

                def cabeceras = usuariosList[0].keySet()
                cabeceras.each {
                    sheet.addCell(new Label(columna, fila, it, headerFormat))
                    columna++
                }
                fila++
                columna = 0
                usuariosList.each {
                    def datosEvento = it.values()
                    datosEvento.each {
                        if (it?.getClass() == String) {
                            sheet.addCell(new Label(columna, fila, it.toUpperCase(), cellFormat))
                        } else {
                            if (it?.getClass() == Boolean) {
                                if (it == true) {
                                    sheet.addCell(new Label(columna, fila, "SI", cellFormat))
                                } else {
                                    sheet.addCell(new Label(columna, fila, "NO", cellFormat))
                                }
                            } else {
                                if (it?.getClass() == Timestamp) {
                                    String fecha = new SimpleDateFormat("dd/MM/yyyy").format(it)
                                    sheet.addCell(new Label(columna, fila, fecha, cellFormat))
                                } else {
                                    if (it.getClass() == NullObject) {
                                        sheet.addCell(new Label(columna, fila, "", cellFormat))
                                    } else {
                                        if (it == 0) {
                                            sheet.addCell(new Label(columna, fila, it.toString(), cellFormat))
                                        } else {
                                            if (it) sheet.addCell(new Number(columna, fila, it as int, cellFormat))
                                        }
                                    }
                                }
                            }
                        }
                        columna++
                    }
                    fila++
                    columna = 0
                }
                fila = fila + 2

                for (int c = 0; c < 40; c++) {
                    sheet.setColumnView(c, 25)
                }

            } catch (Exception e) {
                e.printStackTrace()
            }

            workbook.write()
            workbook.close()
        } else {
            flash.message = "Error al exportar. El filtro seleccionado no devolvió ningún resultado"
            redirect(uri: "/usuario/index")
        }

    }

}
