package multikirola

import grails.gorm.transactions.Transactional

@Transactional
class UsuarioService {

    def getAllUsersInfo() {
        return User.findAll()
    }
}
