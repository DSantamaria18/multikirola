package multikirola

import grails.gorm.transactions.Transactional
import groovy.sql.Sql

@Transactional
class ParticipanteImplService {
    def dataSource

    def filtrarParticipantes(params) {
        String apellido1 = params?.apellido1
        String telefono = params?.telefono
        String movil = params?.movil

        String baseQuery = "SELECT id, apellido1, apellido2, nombre, sexo, fecha_nacimiento AS fechaNacimiento, " +
                "telefono, movil, token FROM participante p WHERE 1=1 "
        String apellido1Query = "AND p.apellido1 LIKE '%${apellido1}%'"
        String telefonoQuery = "AND p.telefono LIKE '%${telefono}%'"
        String movilQuery = "AND p.movil LIKE '%${movil}%'"

        String query = baseQuery + apellido1Query + telefonoQuery + movilQuery

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

}
