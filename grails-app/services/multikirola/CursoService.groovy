package multikirola

import grails.gorm.services.Service

@Service(Curso)
interface CursoService {

    Curso get(Serializable id)

    List<Curso> list(Map args)

    Long count()

    void delete(Serializable id)

    Curso save(Curso curso)

}