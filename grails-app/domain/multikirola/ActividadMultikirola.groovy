package multikirola

class ActividadMultikirola implements Serializable {
    Long evento
    Long participante
//    String telefono
    String movil

    static constraints = {
        evento(nullable: false, blank: false)
        participante(nullable: false, blank: false)
//        telefono()
        movil()
    }

    static mapping = {
        id composite: ['evento', 'participante']
    }
}
