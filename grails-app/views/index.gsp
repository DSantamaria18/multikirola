<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Multikirolak</title>
</head>

<body>
<content tag="nav">
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
               aria-expanded="false">Multikirola<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link class="list" controller="Curso" action="index">Cursos</g:link></li>
                <li><g:link class="list" controller="Centro" action="index">Centros</g:link></li>
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
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            <i class="glyphicon glyphicon-user"></i>
            <sec:username/>
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><g:link controller='user' action="miCuenta">Mi Cuenta</g:link></li>
            <li><g:link controller='logout'>Cerrar Sesión</g:link></li>
        </ul>
    </li>
    </sec:ifLoggedIn>

    <sec:ifNotLoggedIn><li><g:link controller='login'>Identificarse</g:link></li></sec:ifNotLoggedIn>
</content>

<div class="svg" role="presentation">
    <div class="grails-logo-container">
        <g:img dir="images" file="multikirolak.jpg" class="img-responsive grails-logo" style="margin: 0 auto"/>
        %{--<asset:image src="multikirolak.jpg" class="grails-logo"/>--}%
        %{--<asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>--}%
    </div>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>Multikirolak</h1>

        %{--<div id="controllers" role="navigation">
            <h2>Available Controllers:</h2>
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                    <li class="controller">
                        <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                    </li>
                </g:each>
            </ul>
        </div>--}%
    </section>
</div>

</body>
</html>
