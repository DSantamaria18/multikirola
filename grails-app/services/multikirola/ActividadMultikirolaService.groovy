package multikirola

import grails.gorm.transactions.Transactional
import groovy.sql.Sql

@Transactional
class ActividadMultikirolaService {
    def dataSource

    def getEvents() {
        final String query = "select e.id, tipo_actividad, r.nombre as recinto, fecha, l.nombre_lugar as lugar, horario, " +
                "i.nombre_instalacion as instalacion, m.nombre as modalidad,  m.id as modalidad_id " +
                "FROM evento e " +
                "LEFT JOIN lugar l ON e.lugar_id = l.id " +
                "LEFT JOIN recinto r ON e.recinto_id = r.id " +
                "LEFT JOIN instalacion i ON e.instalacion_id = i.id " +
                "LEFT JOIN modalidad m ON e.modalidad_id = m.id " +
                "WHERE multikirola = TRUE " +
                "ORDER BY fecha DESC"

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

    def findEvent(Long eventId) {
        final String query = "select e.id, tipo_actividad, r.nombre as recinto, fecha, l.nombre_lugar as lugar, horario, " +
                "i.nombre_instalacion as instalacion, m.nombre as modalidad, m.id as modalidad_id, e.edad_minima, e.edad_maxima " +
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

    def findNextEvents(Integer limit = null) {
        String query = "select e.id, e.nombre, e.edad_minima, e.tipo_actividad, r.nombre as recinto, fecha, l.nombre_lugar as lugar, horario, " +
                "i.nombre_instalacion as instalacion, m.nombre as modalidad,  m.id as modalidad_id " +
                "FROM evento e " +
                "LEFT JOIN lugar l ON e.lugar_id = l.id " +
                "LEFT JOIN recinto r ON e.recinto_id = r.id " +
                "LEFT JOIN instalacion i ON e.instalacion_id = i.id " +
                "LEFT JOIN modalidad m ON e.modalidad_id = m.id " +
                "WHERE multikirola = TRUE " +
                "and fecha >= CURDATE() " +
                "ORDER BY fecha ASC "

        if (limit) query += "LIMIT ${limit} "

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

    def findRegisteredParticipants(Long eventId, Long userId) {
        final String query = "SELECT * FROM actividad_multikirola am, participante p " +
                "WHERE am.participante = p.id AND am.evento = ${eventId} AND participante IN (SELECT id FROM " +
                "participante as p WHERE p.usuario_id = ${userId})"

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

    def findRegisteredParticipants(Long eventId) {
        final String query = "SELECT p.id, p.apellido1, p.apellido2, p.nombre, p.movil, p.email, c.nombre as centro, " +
                "cu.nombre as curso, p.sexo, p.fecha_nacimiento as fnacimiento FROM actividad_multikirola am, participante p, centro c, curso cu " +
                "WHERE am.participante = p.id  AND p.centro_id = c.id AND p.curso_id = cu.id " +
                " AND am.evento = ${eventId} ORDER BY p.apellido1, p.apellido2 ASC"

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

    def findAvailableParticipants(Long eventId, Long userId) {
        final String query = "SELECT * FROM participante AS p " +
                "WHERE p.usuario_id = ${userId} AND p.id NOT IN (SELECT participante FROM " +
                "actividad_multikirola AS am WHERE evento = ${eventId})"

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

    void deletePArticipantFromEvent(Long eventId, Long participanteId) {
        final String query = "DELETE FROM actividad_multikirola " +
                "WHERE evento = ${eventId} AND participante = ${participanteId}"

        final Sql sql = new Sql(dataSource)
        sql.execute(query)
    }

    boolean isMultikirolaEvent(Long eventId) {
        final String query = "SELECT multikirola FROM evento WHERE id = ${eventId}"

        final Sql sql = new Sql(dataSource)
        final result = sql.rows(query).first()
        return result['multikirola'] == true
    }

    def getActiveInscriptions(Long userId) {
        final String query = "SELECT e.id as evento_id, e.nombre as evento, p.id as participante_id, p.nombre as nombre_participante, " +
                "p.apellido1 as apellido1_participante, p.apellido2 as apellido2_participante, e.fecha as fecha " +
                "FROM actividad_multikirola AS am " +
                "INNER JOIN participante AS p " +
                "   ON p.id = am.participante " +
                "INNER JOIN evento AS e " +
                "   ON e.id = am.evento " +
                "WHERE p.usuario_id = ${userId} AND fecha >= now()"

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }

    def filtrarEventos(params){
        String fDesde = params.fechaDesde
        String fHasta = params.fechaHasta

        String baseQuery = "SELECT e.id, e.tipo_actividad, r.nombre as recinto, fecha, l.nombre_lugar as lugar, horario, " +
                "i.nombre_instalacion as instalacion, m.nombre as modalidad,  m.id as modalidad_id " +
                "FROM evento e " +
                "LEFT JOIN lugar l ON e.lugar_id = l.id " +
                "LEFT JOIN recinto r ON e.recinto_id = r.id " +
                "LEFT JOIN instalacion i ON e.instalacion_id = i.id " +
                "LEFT JOIN modalidad m ON e.modalidad_id = m.id " +
                "WHERE (e.fecha BETWEEN '${fDesde}' AND '${fHasta}' " +
                    "OR fecha_fin BETWEEN '${fDesde}' AND '${fHasta}' " +
                    "OR (fecha < '${fDesde}' AND fecha_fin > '${fHasta}')) " +
                "AND multikirola = TRUE "

        String sortQuery = "ORDER BY fecha DESC "
        String query = baseQuery + sortQuery

        final Sql sql = new Sql(dataSource)
        final results = sql.rows(query)
        return results
    }
}
