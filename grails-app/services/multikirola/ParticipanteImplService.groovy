package multikirola

import grails.gorm.transactions.Transactional
import groovy.sql.Sql

import java.text.SimpleDateFormat

@Transactional
class ParticipanteImplService {
    def dataSource

    def filtrarParticipantes(String apellido1, String movil, String email, Long centro, Boolean activos, Date fechaDesde, Date fechaHasta) {

        String baseQuery = "SELECT p.id, p.apellido1, p.apellido2, p.nombre, p.sexo, p.fecha_nacimiento AS fechaNacimiento, " +
                "p.movil, p.email, p.token, c.nombre as centro, u.enabled as activo " +
                "FROM participante p, centro c, user u WHERE p.centro_id = c.id AND p.usuario_id = u.id "
        String apellido1Query = (apellido1 != "") ? "AND p.apellido1 LIKE '%${apellido1}%' " : ""
        String movilQuery = (movil != "") ? "AND p.movil LIKE '%${movil}%' " : ""
        String emailQuery = (email != "") ? "AND p.email LIKE '%${email}%' " : ""
        String centroQuery = (centro != null) ? "AND p.centro_id = ${centro} " : ""
        String activosQuery = (activos != null) ? "AND u.enabled = ${activos} " : ""

        def fDesde = new SimpleDateFormat('yyyy-MM-dd').format(fechaDesde)
        def fHasta = new SimpleDateFormat('yyyy-MM-dd').format(fechaHasta)
        String fechaQuery = "AND p.fecha_nacimiento BETWEEN '${fDesde}' " + "AND '${fHasta}' "

        String query = baseQuery + apellido1Query + movilQuery + emailQuery + centroQuery + fechaQuery + activosQuery

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

}
