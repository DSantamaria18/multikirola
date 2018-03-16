package multikirola

import grails.gorm.transactions.Transactional
import groovy.sql.Sql

@Transactional
class ActividadMultikirolaService {
    def dataSource

    def findEvents(final String modalidadId) {
        final String query = "select e.id, tipo_actividad, r.nombre as recinto, fecha, l.nombre_lugar as lugar, horario, " +
                "i.nombre_instalacion as instalacion, m.nombre as modalidad,  m.id as modalidad_id " +
                "FROM evento e " +
                "LEFT JOIN lugar l ON e.lugar_id = l.id " +
                "LEFT JOIN recinto r ON e.recinto_id = r.id " +
                "LEFT JOIN instalacion i ON e.instalacion_id = i.id " +
                "LEFT JOIN modalidad m ON e.modalidad_id = m.id " +
                "WHERE multikirola = TRUE and fecha >= now() " +
                "AND modalidad_id = ${modalidadId} ORDER BY fecha DESC"

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

    def findEvent(Long eventId){
        final String query = "select e.id, tipo_actividad, r.nombre as recinto, fecha, l.nombre_lugar as lugar, horario, " +
                "i.nombre_instalacion as instalacion, m.nombre as modalidad, m.id as modalidad_id " +
                "FROM evento e " +
                "LEFT JOIN lugar l ON e.lugar_id = l.id " +
                "LEFT JOIN recinto r ON e.recinto_id = r.id " +
                "LEFT JOIN instalacion i ON e.instalacion_id = i.id " +
                "LEFT JOIN modalidad m ON e.modalidad_id = m.id " +
                "WHERE e.id = ${eventId}"

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

    def findNextEvents() {
        final String query = "select e.id, tipo_actividad, r.nombre as recinto, fecha, l.nombre_lugar as lugar, horario, " +
                "i.nombre_instalacion as instalacion, m.nombre as modalidad,  m.id as modalidad_id " +
                "FROM evento e " +
                "LEFT JOIN lugar l ON e.lugar_id = l.id " +
                "LEFT JOIN recinto r ON e.recinto_id = r.id " +
                "LEFT JOIN instalacion i ON e.instalacion_id = i.id " +
                "LEFT JOIN modalidad m ON e.modalidad_id = m.id " +
                "WHERE multikirola = TRUE and fecha >= now() " +
                "AND modalidad_id IN (1,3,5,6,7,8,13,19,20,22,24,26,28,32,34,39,44,49,52,54,62) " +
                "ORDER BY fecha ASC"

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

    def findRegisteredParticipants(Long eventId, Long userId){
        final String query = "SELECT * FROM actividad_multikirola am, participante p " +
                "WHERE am.participante = p.id AND am.evento = ${eventId} AND participante IN (SELECT id FROM " +
                "participante as p WHERE p.usuario_id = ${userId})"

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

    def findAvailableParticipants(Long eventId, Long userId){
        final String query = "SELECT * FROM participante AS p " +
                "WHERE p.usuario_id = ${userId} AND p.id NOT IN (SELECT participante FROM " +
                "actividad_multikirola AS am WHERE evento = ${eventId})"

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

    void deletePArticipantFromEvent(Long eventId, Long participanteId){
        final String query = "DELETE FROM actividad_multikirola " +
                "WHERE evento = ${eventId} AND participante = ${participanteId}"

        final Sql sql = new Sql(dataSource)
        sql.execute(query)
    }

    boolean isMultikirolaEvent(Long eventId){
        final String query = "SELECT multikirola FROM evento WHERE id = ${eventId}"

        final Sql sql = new Sql(dataSource)
        final result = sql.rows(query).first()
        return result['multikirola'] == true
    }
}
