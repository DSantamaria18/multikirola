package multikirola

import grails.gorm.transactions.Transactional
import groovy.sql.Sql

@Transactional
class ParticipanteImplService {
    def dataSource

    def filtrarParticipantes(params) {

        String baseQuery = "SELECT p.id, p.apellido1, p.apellido2, p.nombre, p.sexo, p.fecha_nacimiento AS fechaNacimiento, " +
                "p.movil, p.email, p.token, c.nombre as centro, cu.nombre as curso, u.enabled as activo " +
                "FROM participante p, centro c, user u WHERE p.centro_id = c.id AND p.usuario_id = u.id "
        String apellido1Query = (params?.apellido1) ? "AND p.apellido1 LIKE '%${params.apellido1}%' " : ""
        String movilQuery = (params?.movil) ? "AND p.movil LIKE '%${params.movil}%' " : ""
        String emailQuery = (params?.email) ? "AND p.email LIKE '%${params.email}%' " : ""
        String centroQuery = (params.centro != '') ? "AND p.centro_id = ${params.centro} " : ""
        String activosQuery = (params.activos != '') ? "AND u.enabled = ${params.activos} " : ""
        String fechaQuery = ((params.fdesde != "-") && (params.fhasta != "-")) ? "AND p.fecha_nacimiento BETWEEN '${params.fdesde}-01' " +
                "AND '${params.fhasta}-01' " : ""

        String query = baseQuery + apellido1Query + movilQuery + emailQuery + centroQuery + cursoQuery + fechaQuery + activosQuery

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

}
