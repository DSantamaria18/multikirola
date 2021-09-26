package multikirola

class Token {
    String email
    String value = UUID.randomUUID().toString().replaceAll('-', '')
    Date dateCreated = new Date()

    static mapping = {
        version false
    }

    static constraints = {
        email(nullable: false, blank: false)
        value(nullable: false, blank: false, unique: true)
        dateCreated(nullable: false, blank: false)
    }
}
