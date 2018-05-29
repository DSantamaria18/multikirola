<content tag="nav">

    <li><a href="/multikirola"><g:message code="default.home.label"></g:message></a></li>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Multikirolak<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><g:link controller="static" action="presentacion"><g:message code="default.label.zerdamultikirola"/></g:link></li>
        </ul>
    </li>

    <sec:ifAnyGranted roles='ROLE_ADMIN'>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Application Status <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>
                <li><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>
                <li><a href="#">App version:
                    <g:meta name="info.app.version"/></a>
                </li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Grails version:
                    <g:meta name="info.app.grailsVersion"/></a>
                </li>
                <li><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
                <li><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>
            </ul>
        </li>
    </sec:ifAnyGranted>

    <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MANAGER, ROLE_USER'>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Gestión<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link class="list" controller="ActividadMultikirola" action="showEvents">Actividades</g:link></li>
                <li><g:link class="list" controller="Centro" action="index">Centros</g:link></li>
                <li><g:link class="list" controller="Curso" action="index">Cursos</g:link></li>
                <li><g:link class="list" controller="Participante"
                            action="gestionParticipantes">Participantes</g:link></li>
                %{--<li><g:link class="list" controller="User" action="index">Usuarios</g:link></li>--}%
            </ul>
        </li>
    </sec:ifAnyGranted>



    <sec:ifAnyGranted roles='ROLE_ADMIN'>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Seguridad<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li class="controller"><g:link controller="User" action="index">Usuarios</g:link></li>
                <li class="controller"><g:link controller="Role" action="index">Roles</g:link></li>
                <li class="controller"><g:link controller="UserRole" action="index">Roles-Usuarios</g:link></li>
            </ul>
        </li>
    </sec:ifAnyGranted>

    <sec:ifLoggedIn>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">
                <i class="glyphicon glyphicon-user"></i>
                <sec:username/>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><g:link controller='user' action="miCuenta">Mi Cuenta</g:link></li>
                <li><g:link controller='participante' action="index">Participantes</g:link></li>
                <li><g:link controller='logout'>Cerrar Sesión</g:link></li>
            </ul>
        </li>
    </sec:ifLoggedIn>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false"><g:message code="default.languages.label"/> <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <navBar:localeDropdownListItems uri="${request.forwardURI}"/>
        </ul>
    </li>

    <sec:ifNotLoggedIn><li><g:link controller='login'><g:message code="default.login.label"/></g:link></li></sec:ifNotLoggedIn>
</content>