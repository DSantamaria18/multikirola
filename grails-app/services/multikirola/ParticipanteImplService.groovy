package multikirola

import grails.gorm.transactions.Transactional
import groovy.sql.Sql

@Transactional
class ParticipanteImplService {
    def dataSource

    def filtrarParticipantes(params) {

        String baseQuery = "SELECT p.id, p.apellido1, p.apellido2, p.nombre, p.sexo, p.fecha_nacimiento AS fechaNacimiento, " +
//                "p.telefono, p.movil, p.email, p.token, c.nombre as centro, cu.nombre as curso " +
                "p.movil, p.email, p.token, c.nombre as centro, cu.nombre as curso " +
                "FROM participante p, centro c, curso cu WHERE p.centro_id = c.id AND p.curso_id = cu.id "
        String apellido1Query = (params?.apellido1)? "AND p.apellido1 LIKE '%${params.apellido1}%' " : ""
        String movilQuery = (params?.movil)? "AND p.movil LIKE '%${params.movil}%' ": ""
        String emailQuery = (params?.email)? "AND p.email LIKE '%${params.email}%' " : ""
        String centroQuery = (params.centro != '')? "AND p.centro_id = ${params.centro} " : ""
        String cursoQuery = (params.curso != '')? "AND p.curso_id = ${params.curso} " : ""
        String fechaQuery = ((params.fdesde != "-") && (params.fhasta !="-")) ? "AND p.fecha_nacimiento BETWEEN '${params.fdesde}-01' " +
                "AND '${params.fhasta}-01' " : ""

        String query = baseQuery + apellido1Query + movilQuery + emailQuery + centroQuery + cursoQuery + fechaQuery

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

}
