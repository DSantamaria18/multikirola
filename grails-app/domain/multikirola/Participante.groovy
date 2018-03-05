package multikirola

class Participante {

    String nombre
    String apellido1
    String apellido2
    Centro centro
    Curso curso
    String sexo
    String movil
    String telefono
    String email
    Date fechaNacimiento
    String token

    static belongsTo = [usuario: User]

    static constraints = {
        nombre(nullable: false, blank: false)
        apellido1(nullable: false, blank: false)
        apellido2(nullable: true, blank: true)
        centro(nullable: false, blank: false)
        curso(nullable: false, blank: false)
        sexo(inList: ['EMAKUMEZKOA - MUJER', 'GIZONEZKOA - HOMBRE'])
        telefono()
        movil(nullable: false, blank: false)
        email(nullable: false, email: true, blank: false)
        fechaNacimiento(nullable: false, blank: false, max: new Date())
        token(nullable: false, unique: true)
    }


  /*  boolean isValidToken(String token) {
        def decodedInfo = decodeToken(token)
        if (findAllByFechaNacimientoAndApellido1LikeAndNombreLike(decodedInfo.fecha, decodedInfo.apellido1, decodedInfo.nombre).size() > 0) {
            return false
        } else {
            return true
        }
    }*/

 /*   def decodeToken(String token) {
        def decodedInfo
        String año = token.substring(1, 4).reverse()
        String dia = token.substring(7, 9)
        String mes = token.substring(11, 13)
        String fecha = "${año}-${mes}-${dia}"

        Date fechaNacimiento = new Date(fecha)

        decodedInfo.fecha = fechaNacimiento
        decodedInfo.nombre = token.substring(9, 11)
        decodedInfo.apellido1 = token.substring(4, 6)

        return decodedInfo
    }*/

   /* private String encodeToken(Participante participante){
        List salt = ["M","U","L","T","I","K", "I","R","O","L", "A", "K"]
        def fecha = participante.fechaNacimiento.toTimestamp().toString().split(" ")[0].split('-')
        String año = fecha[0].toString().reverse()
        String mes = fecha[1]
        String dia = fecha[2]

        String nombre = participante.nombre.substring(0,2).toUpperCase()
        String apellido = participante.apellido1.substring(0,2).toUpperCase()

        Collections.shuffle(salt)
        String random1 = salt[0]
        String random2 = salt[5]
        String random3 = salt[11]
        String token = random1 + año + apellido + random2 + dia + nombre + mes + random3

        return token
    }*/

   /* def beforeInsert(){
        this.token = encodeToken(this)
        this.validate('token')
    }*/
}
