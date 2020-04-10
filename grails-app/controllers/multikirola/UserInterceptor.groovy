package multikirola

class UserInterceptor {

    def springSecurityService

    UserInterceptor(){
        matchAll().excludes(uri:'/')
                .excludes(controller: 'home')
                .excludes(controller: 'login')
                .excludes(controller: 'user', action: 'register')
                .excludes(controller: 'user', action: 'save')
                .excludes(controller: 'user', action: 'forgotPassword')
                .excludes(controller: 'user', action: 'resetPassword')
                .excludes(controller: 'user', action: 'updatePassword')
                .excludes(controller: 'actividadMultikirola')
                .excludes(controller: 'static')
                .excludes(uri: '/error')
                .excludes(uri: '/notFound')
                .excludes(controller: 'ficheros')
    }

    boolean before() {
        if (springSecurityService.isLoggedIn() || isExcludedURI(request.requestURI)) {
            log.info("***** Before filter is true")
            return true
        } else {
            log.warn("***** Redirigiendo a la vista de login")
            redirect(controller: "login", action: "auth")
            return false
        }
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }

    boolean isExcludedURI(final String requestedURI) {
        def excludedURIs = ['/', '/error', '/notFound', '/static/presentacion', '/ficheros/*', '/resetPassword/*']
        boolean result = false

        if (requestedURI in excludedURIs) result = true
        return result
    }
}
