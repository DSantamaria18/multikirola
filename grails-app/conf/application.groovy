// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'multikirola.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'multikirola.UserRole'
grails.plugin.springsecurity.authority.className = 'multikirola.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        [pattern: '/', access: ['permitAll']],
        [pattern: '/Home', access: ['permitAll']],
        [pattern: '/error', access: ['permitAll']],
        [pattern: '/index', access: ['permitAll']],
        [pattern: '/index.gsp', access: ['permitAll']],
        [pattern: '/shutdown', access: ['permitAll']],
        [pattern: '/assets/**', access: ['permitAll']],
        [pattern: '/**/js/**', access: ['permitAll']],
        [pattern: '/**/css/**', access: ['permitAll']],
        [pattern: '/**/images/**', access: ['permitAll']],
        [pattern: '/**/favicon.ico', access: ['permitAll']],
        [pattern: '/**/fonts/**', access: ['permitAll']],
        [pattern: '/register/**', access: ['permitAll']],
        [pattern: '/Curso/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Centro/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']],
        [pattern: '/Participante/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER', 'ROLE_CUSTOMER']],
        [pattern: '/User/**', access: ['permitAll']],
        //[pattern: '/User/**', access: ['ROLE_ADMIN']],
        [pattern: '/Role/**', access: ['ROLE_ADMIN']],
        [pattern: '/UserRole/**', access: ['ROLE_ADMIN']],
        [pattern: '/static/**', access: ['permitAll']],
        [pattern: '/ActividadMultikirola/**', access: ['permitAll']],
        [pattern: '/ficheros/**', access: ['permitAll']],
        [pattern: '/Usuario/**', access: ['ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
        [pattern: '/assets/**', filters: 'none'],
        [pattern: '/**/js/**', filters: 'none'],
        [pattern: '/**/css/**', filters: 'none'],
        [pattern: '/**/images/**', filters: 'none'],
        [pattern: '/**/favicon.ico', filters: 'none'],
        [pattern: '/**', filters: 'JOINED_FILTERS']
]

