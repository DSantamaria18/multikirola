package multikirola

import grails.testing.mixin.integration.Integration
import grails.transaction.*
import org.springframework.beans.factory.annotation.Autowired
import spock.lang.Specification

@Integration
@Rollback
class UsuarioServiceIntSpec extends Specification {

    @Autowired
    UsuarioService usuarioService

    private void setupData() {
        User enabledUser = new User(username: 'enabled@user.com', password: 'pass', nombre: 'enabled', apellidos: 'user',
                enabled: true, email: 'disabled@user.com').save(flush: true, failOnError: true)
        /* User disabledUser = new User(username: 'disabled@user.com', password: 'pass', nombre: 'disabled', apellidos: 'user',
                 enabled: false).save(flush: true, failOnError: true)*/
    }

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        given:
        int enabledUsers = usuarioService.getAllUsersInfo().size()
        int totalUsers = User.count()

        when:
        User disabledUser = new User(username: 'disabled@user.com', password: 'pass', nombre: 'disabled', apellidos: 'user',
                enabled: false, email: 'disabled@user.com').save(flush: true, failOnError: true)

        then:
//        true == false
        assert usuarioService.getAllUsersInfo().size() == enabledUsers
        assert User.count() == totalUsers + 1
        assert enabledUsers <= totalUsers

    }
}
