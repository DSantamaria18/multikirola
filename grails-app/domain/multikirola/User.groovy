package multikirola

import com.sun.org.apache.xpath.internal.operations.Bool
import grails.plugin.springsecurity.userdetails.GrailsUser
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    String username
    String password
    String email
    String movil
    boolean whatsapp = false
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    Date dateCreated
    Date lastUpdated
    String nombre
    String apellidos

    static hasMany = [participantes: Participante]

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        password nullable: false, blank: false, password: true, display: false
        username nullable: false, blank: false, unique: true
        email nullable: false, blank: false, email: true, unique: true
        movil nullable: true, blank: true
        whatsapp()
        enabled display: false
        accountExpired display: false
        accountLocked display: false
        passwordExpired display: false
        nombre nullable: false, blank: false
        apellidos nullable: false, blank: false
    }

    static mapping = {
	    password column: '`password`'
    }
}
