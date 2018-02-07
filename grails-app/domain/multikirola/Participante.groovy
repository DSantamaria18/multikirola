package multikirola

class Participante {

    String nombre
    String apellido1
    String apellido2
    Centro centro
    Curso curso
    String sexo
    String movil
    Boolean whatsapp
    String telefono
    String email

    static constraints = {
        nombre(nullable: false, blank: false)
        apellido1(nullable: false, blank: false)
        apellido2()
        centro(nullable: false, blank: false)
        curso(nullable: false, blank: false)
        sexo(inList: ['EMAKUMEZKOA - MUJER', 'GIZONEZKOA - HOMBRE'])
        movil(nullable: false, blank: false)
        whatsapp()
        telefono()
        email(nullable: false, email: true, blank: false)
    }
}
