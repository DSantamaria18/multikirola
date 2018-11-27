package multikirola

import com.sun.org.apache.xpath.internal.operations.Bool
import grails.core.GrailsApplication
import grails.gorm.transactions.Transactional
import grails.web.mapping.LinkGenerator
import groovy.sql.Sql
import java.text.SimpleDateFormat


@Transactional
class UsuarioService {

    UserService userService
    def dataSource
    LinkGenerator linkGenerator

    def getAllUsersInfo() {
        return User.findAll()
    }

    def filtraUsuarios(Boolean qWhatsApp, Date qFechaDesde){
        Sql sql = new Sql(dataSource)
        def fDesde = new SimpleDateFormat('yyyy-MM-dd').format(qFechaDesde)
        String qSoloW = ''
        if (qWhatsApp != null){
            qSoloW = " AND u.whatsapp = ${qWhatsApp}"
        }

        String qFecha = " WHERE u.date_created >= '${fDesde}'"
        String baseQuery = "Select * FROM user u"
        String orderQuery = " ORDER BY u.nombre ASC, u.apellidos ASC"

        String query = baseQuery + qFecha + qSoloW + orderQuery

        def usuariosList = sql.rows(query)
        return usuariosList
    }

    void createPasswordResetTokenForUser(User user, String token){
        user.resetToken = token
        Date currentDate = new Date()
        user.resetTokenFecha = currentDate.plus(1)
        userService.save(user)
    }

    boolean isValidResetPasswordToken(User user){
        Date currentDate = new Date()
        boolean isValidToken = user.resetTokenFecha >= currentDate
        return isValidToken
    }
}
