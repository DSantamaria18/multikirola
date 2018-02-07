package multikirola

import grails.gorm.services.Service

@Service(Centro)
interface CentroService {

    Centro get(Serializable id)

    List<Centro> list(Map args)

    Long count()

    void delete(Serializable id)

    Centro save(Centro centro)

}