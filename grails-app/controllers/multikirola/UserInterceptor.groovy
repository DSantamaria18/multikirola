package multikirola

class UserInterceptor {

    def springSecurityService

    UserInterceptor(){
        matchAll().excludes(uri:'/')
                .excludes(controller: 'login')
                .excludes(controller: 'user', action: 'register')
                .excludes(controller: 'user', action: 'save')
    }

    boolean before() {
        if (!springSecurityService.isLoggedIn() && controllerName != null) {
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
