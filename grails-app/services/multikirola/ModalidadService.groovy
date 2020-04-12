package multikirola

import grails.gorm.services.Service

@Service(Modalidad)
interface ModalidadService {

    Modalidad get(Serializable id)

    List<Modalidad> list(Map args)

    Long count()

    void delete(Serializable id)

    Modalidad save(Modalidad modalidad)

}