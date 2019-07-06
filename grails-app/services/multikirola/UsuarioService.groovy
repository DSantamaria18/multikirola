package multikirola

import grails.gorm.transactions.Transactional
import groovy.sql.Sql

import java.text.SimpleDateFormat

@Transactional
class UsuarioService {

    def dataSource

    def getAllUsersInfo() {
        return User.findAll()
    }

    def filtraUsuarios(Boolean qWhatsApp, Date qFechaDesde){
        Sql sql = new Sql(dataSource)
        def fDesde = new SimpleDateFormat('yyyy-MM-dd').format(qFechaDesde)
        String qSoloW = ''
        if (qWhatsApp != null){
            qSoloW = " AND u.whatsapp = ${qWhatsApp}"
        }

        String qFecha = " WHERE u.date_created >= '${fDesde}'"
        String baseQuery = "Select * FROM user u"
        String orderQuery = " ORDER BY u.nombre ASC, u.apellidos ASC"

        String query = baseQuery + qFecha + qSoloW + orderQuery

        def usuariosList = sql.rows(query)
        return usuariosList
    }
}
