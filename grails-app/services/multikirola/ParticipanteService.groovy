package multikirola

import grails.gorm.services.Service

@Service(Participante)
interface ParticipanteService {

    Participante get(Serializable id)

    List<Participante> list(Map args)

    Long count()

    void delete(Serializable id)

    Participante save(Participante participante)

}