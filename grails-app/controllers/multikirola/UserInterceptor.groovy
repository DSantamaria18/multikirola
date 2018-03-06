package multikirola

class UserInterceptor {

    def springSecurityService

    UserInterceptor(){
        matchAll().excludes(uri:'/multikirola/')
                .excludes(controller: 'home')
                .excludes(controller: 'login')
                .excludes(controller: 'user', action: 'register')
                .excludes(controller: 'user', action: 'save')
                .excludes(controller: 'actividadMultikirola')
                .excludes(controller: 'static')
                .excludes(uri: '/multikirola/error')
                .excludes(uri: '/multikirola/notFound')
    }

    boolean before() {
        if (springSecurityService.isLoggedIn() || isExcludedURI(request.requestURI)) {
            return true
        } else {
            redirect(controller: "login", action: "auth")
            return false
        }
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }

    boolean isExcludedURI(final String requestedURI) {
        def excludedURIs = ['/multikirola/', '/multikirola/error', '/multikirola/notFound', '/multikirola/static/presentacion']
        boolean result = false

        if (requestedURI in excludedURIs) result = true
        return result
    }
}
