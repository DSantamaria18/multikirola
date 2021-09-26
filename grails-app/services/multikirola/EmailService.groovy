package multikirola

import grails.core.GrailsApplication
import grails.gorm.transactions.Transactional
import grails.util.Environment

@Transactional
class EmailService {

    GrailsApplication grailsApplication

    /**
     * @param user
     * @param emailTo
     * @return
     */
    def sendEmailRegistro(User user, String emailTo) {
        log.info("Enviando email a ${emailTo}")
        sendMail {
            from grailsApplication.config.getProperty('email.from')
            if (Environment.current == Environment.PRODUCTION) {
                to emailTo
            } else {
                to grailsApplication.config.getProperty('email.testToAddress')
            }
            subject("Registro en Multikirola")
            html(view: '_emailRegistro', model: [user: user])
        }
    }

    /**
     * @param user
     * @return
     */
    def sendChangeNotificacion(User user) {
        sendMail {
            from grailsApplication.config.getProperty('email.from')
            if (Environment.current == Environment.PRODUCTION) {
                to grailsApplication.config.getProperty('email.userChangeNotificationsTo')
            } else {
                to grailsApplication.config.getProperty('email.testToAddress')
            }
            subject("Nuevo usuario registrado en Multikirola")
            html0(view: '_notificacion', model: [user: user])
        }
    }

    /**
     * @param user
     * @param token
     * @return
     */
    def sendResetPasswordEmail(User user, UserToken token) {
        log.info("Enviando email de cambio de password a ${user.email} con token ${token}")
        sendMail {
            from grailsApplication.config.getProperty('email.from')
            if (Environment.current == Environment.PRODUCTION) {
                to user.email
            } else {
                to grailsApplication.config.getProperty('email.testToAddress')
            }
            subject("MULTIKIROLA - Solicitud de cambio de contraseña ")
            html(view: '_resetPasswordEmail', model: [user: user, token: token])
        }
    }
}
