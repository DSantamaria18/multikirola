package multikirola


class UserInterceptor {

    def springSecurityService

    boolean before() {
        if (!springSecurityService.isLoggedIn()) {
            redirect(controller: "login", action: "auth")
            return false
        } else {
            return true
        }
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }

}
