package multikirola

import java.text.SimpleDateFormat

class UsuarioController {

    UsuarioService usuarioService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def usuariosList = usuarioService.getAllUsersInfo()

        [usuariosList: usuariosList]
    }

    def filtrarUsuarios(){
        Boolean qWhatsApp = null
        if (params.qWhatsApp == "true") {
            qWhatsApp = Boolean.TRUE
        } else if (params.qWhatsApp == "false"){
            qWhatsApp = Boolean.FALSE
        }
        Date qFechaDesde =  Date.parse('yyyy-MM-dd', params.qFechaDesde)
//        Date qFechaDesde =  SimpleDateFormat.format(params.qFechaDesde)

        def usuariosList = usuarioService.filtraUsuarios(qWhatsApp, qFechaDesde)

        render([template: 'tablaUsuarios', model:[usuariosList: usuariosList]])
    }
}
