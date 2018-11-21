package multikirola

class UsuarioController {

    UsuarioService usuarioService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def usuariosList = usuarioService.getAllUsersInfo()

        [usuariosList: usuariosList]
    }
}
