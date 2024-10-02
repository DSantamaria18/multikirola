package multikirola

import groovy.transform.CompileDynamic

@CompileDynamic
class Participante {

    String nombre
    String apellido1
    String apellido2
    Centro centro
    //Curso curso
    String sexo
    String movil
    String email
    Date fechaNacimiento
    String token
    Date dateCreated
    Date lastUpdated

    static belongsTo = [usuario: User]

    static constraints = {
        nombre(nullable: false, blank: false)
        apellido1(nullable: false, blank: false)
        apellido2(nullable: true, blank: true)
        fechaNacimiento(nullable: false, blank: false, max: new Date())
        sexo(inList: ['F', 'M', 'NB'])
        movil(nullable: false, blank: false)
        email(nullable: false, email: true, blank: false)
        centro(nullable: false, blank: false)
        //curso(nullable: true, blank: true)
        token(nullable: false, unique: true, display: false)
        usuario(nullable: false, display: false)
    }

    String toString() {
        return "${this?.nombre} ${this?.apellido1} ${this?.apellido2}"
    }
}
