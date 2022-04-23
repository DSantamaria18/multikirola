package multikirola

import grails.gorm.transactions.Transactional
import groovy.sql.Sql
import java.text.SimpleDateFormat

@Transactional
class UsuarioService {

    def dataSource
    EmailService emailService

    def getAllUsersInfo() {
        def userRoleList = UserRole.findAllByRole(Role.findByAuthority('ROLE_CUSTOMER'))
        List<User> userList = []
        for (user in userRoleList.user) {
            if(user.enabled) {
                userList.add(user)
            }
        }
        return userList
    }

    def filtraUsuarios(Boolean qWhatsApp, Boolean qUserEnabled, Date qFechaDesde){
        Sql sql = new Sql(dataSource)
        def fDesde = new SimpleDateFormat('yyyy-MM-dd').format(qFechaDesde)
        String qSoloW = ''
        String qEstadoUsuario = ''
        if (qWhatsApp != null){
            qSoloW = " AND u.whatsapp = ${qWhatsApp}"
        }
        if (qUserEnabled != null){
            qEstadoUsuario = " AND u.enabled = ${qUserEnabled}"
        }

        String qFecha = " AND u.date_created >= '${fDesde}'"
        String baseQuery = "Select * FROM user u INNER JOIN user_role ur ON ur.user_id = u.id WHERE ur.role_id = 7"
        String orderQuery = " ORDER BY u.nombre ASC, u.apellidos ASC"

        String query = baseQuery + qFecha + qSoloW + qEstadoUsuario + orderQuery

        def usuariosList = sql.rows(query)
        return usuariosList
    }

    void sendResetPasswordEmail(User user){
        def token = Token.findByEmail(user.email)
        if(!token) {
            token = new Token(email: user.email)
            token.validate()
            token.save(flush: true, failOnError: true);
        }
        emailService.sendResetPasswordEmail(user, token)
    }
}
