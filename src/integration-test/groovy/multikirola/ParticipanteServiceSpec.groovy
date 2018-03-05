package multikirola

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ParticipanteServiceSpec extends Specification {

    ParticipanteService participanteService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Participante(...).save(flush: true, failOnError: true)
        //new Participante(...).save(flush: true, failOnError: true)
        //Participante participante = new Participante(...).save(flush: true, failOnError: true)
        //new Participante(...).save(flush: true, failOnError: true)
        //new Participante(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //participante.id
    }

    void "test get"() {
        setupData()

        expect:
        participanteService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Participante> participanteList = participanteService.list(max: 2, offset: 2)

        then:
        participanteList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        participanteService.count() == 5
    }

    void "test delete"() {
        Long participanteId = setupData()

        expect:
        participanteService.count() == 5

        when:
        participanteService.delete(participanteId)
        sessionFactory.currentSession.flush()

        then:
        participanteService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Participante participante = new Participante()
        participanteService.save(participante)

        then:
        participante.id != null
    }
}
