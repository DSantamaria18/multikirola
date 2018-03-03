<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Multikirolak</title>
</head>

<body>

%{--<content tag="nav">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Multikirolak<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="/multikirola/static/presentacion.html">Qué es Multikirolak</a></li>
            <li><g:link controller="static" action="presentacion">Qué es Multikirolak</g:link></li>
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
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">
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
</content>--}%

<g:render template="navbar"></g:render>

<div class="svg" role="presentation">
    <div class="grails-logo-con
    <g:link action="showEvents" controller="actividadMultikirola">
        <g:img dir="images" file="multikirolak.jpg" class="img-responsive grails-logo" style="margin: 0 auto"/>
    </g:link>%{--<asset:image src="multikirolak.jpg" class="grail
        s-logo"/>--}%
    %{--<asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>--}%
    </div>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>Multikirolak</h1>

        <div class="grid-container actividades-home">
            <div class="grid-item futbol-sala-home">
                <g:link action="showEvents" controller="actividadMultikirola">

                    <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 20]">
                        <g:img dir="images" file="futbol-sala.jpg" class="img-responsive"/>
                    </g:link>
                </g:link>
            </div>

            <div class="grid-item beisbol-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 8]">
                    <g:img dir="images" file="beisbol.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item hockey-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 24]">
                    <g:img dir="images" file="hockey.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item rugby-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 39]">
                    <g:img dir="images" file="rugby.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item danza-moderna-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 13]">
                    <g:img dir="images" file="danza-moderna.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item balonmano-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 7]">
                    <g:img dir="images" file="balonmano.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item pelota-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 1]">
                    <g:img dir="images" file="pelota.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item tiro-con-arco-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 49]">
                    <g:img dir="images" file="tiro-con-arco.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item herri-kirolak-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 22]">
                    <g:img dir="images" file="herri-kirolak.jpeg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item waterpolo-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 54]">
                    <g:img dir="images" file="waterpolo.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item futbol-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 19]">
                    <g:img dir="images" file="futbol.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item atletismo-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 5]">
                    <g:img dir="images" file="atletismo.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item baloncesto-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 6]">
                    <g:img dir="images" file="baloncesto.png" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item surf-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 44]">
                    <g:img dir="images" file="surf.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item patinaje-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 34]">
                    <g:img dir="images" file="patinaje.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item pesca-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 3]">
                    <g:img dir="images" file="pesca.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item paddle-surf-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 32]">
                    <g:img dir="images" file="paddle-surf.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item badminton-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 1]">
                    <g:img dir="images" file="badminton.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item kayak-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 26]">
                    <g:img dir="images" file="kayak.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item vela-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 20]">
                    <g:img dir="images" file="vela.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item mountain-bike-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 28]">
                    <g:img dir="images" file="mountain-bike.jpg" class="img-responsive"/>
                </g:link>
            </div>
        </div>
    </section>
</div>

</body>
</html>
