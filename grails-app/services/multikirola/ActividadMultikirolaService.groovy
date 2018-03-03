package multikirola

import grails.gorm.transactions.Transactional
import groovy.sql.Sql

@Transactional
class ActividadMultikirolaService {
    def dataSource

    def findEvents(final String modalidadId) {
        final String query = "select e.id, tipo_actividad, r.nombre as recinto, fecha, l.nombre_lugar as lugar, horario, " +
                "i.nombre_instalacion as instalacion, m.nombre as modalidad " +
                "FROM evento e " +
                "LEFT JOIN lugar l ON e.lugar_id = l.id " +
                "LEFT JOIN recinto r ON e.recinto_id = r.id " +
                "LEFT JOIN instalacion i ON e.instalacion_id = i.id " +
                "LEFT JOIN modalidad m ON e.modalidad_id = m.id " +
                "WHERE multikirola = TRUE and fecha >= '2018-01-01' " +
                "AND modalidad_id = ${modalidadId} ORDER BY fecha DESC"

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }
}
