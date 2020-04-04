package multikirola

class UserInterceptor {

    def springSecurityService

    UserInterceptor(){
        matchAll().excludes(uri:'/')
                .excludes(controller: 'home')
                .excludes(controller: 'login')
                .excludes(controller: 'user', action: 'register')
                .excludes(controller: 'user', action: 'save')
                .excludes(controller: 'actividadMultikirola')
                .excludes(controller: 'static')
                .excludes(uri: '/error')
                .excludes(uri: '/notFound')
                .excludes(controller: 'ficheros')
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
        def excludedURIs = ['/', '/error', '/notFound', '/static/presentacion', '/ficheros/*']
        boolean result = false

        if (requestedURI in excludedURIs) result = true
        return result
    }
}
