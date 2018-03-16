<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Multikirolak</title>

</head>

<body>

<g:render template="navbar"></g:render>

%{--<content tag="nav">

    <li><a href="/multikirola">Inicio</a></li>

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Multikirolak<span class="caret"></span></a>
        <ul class="dropdown-menu">
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
                <li><g:link controller='participante' action="index">Participantes</g:link></li>
                <li><g:link controller='logout'>Cerrar Sesión</g:link></li>
            </ul>
        </li>
    </sec:ifLoggedIn>

    <sec:ifNotLoggedIn><li><g:link controller='login'>Identificarse</g:link></li></sec:ifNotLoggedIn>
</content>--}%


<div class="svg" role="presentation">
    <div class="multikirolak-logo-container">
        <g:img dir="images" file="multikirolak.jpg" class="img-responsive home-img-multikirola" style="margin: 0 auto"/>
    </div>
</div>

<div id="content" role="main">
    <section class="row ">
        <h1>Próximas Actividades</h1>

        <div class="grid-container" id="grid-actividades-home">
            <g:each in="${eventList}" var="evento" status="i">
                <div class="grid-item" id="${evento.id}" modalidad-id="${evento.modalidad_id}">
                    <div class="list-event-item thumbnail" eventId="${evento?.id}">
                        <g:link controller="actividadMultikirola" action="registrarParticipantes"
                                params="[eventId: evento.id]" class="link-evento">
                        %{--${evento.modalidad_id} - ${evento.modalidad}--}%
                            <g:img dir="images" file="${evento.modalidad_id}.jpg" class="img-responsive img-rounded"/>

                            <div class="caption">
                                <h1 class="text-center text-uppercase"><strong>${evento?.tipo_actividad}</strong></h1>

                                <p>

                                <div class="list-event-date">
                                    <i class="glyphicon glyphicon-calendar"></i>
                                    <span class="text-capitalize">
                                        <g:formatDate date="${evento.fecha}" format="EEEE dd-MMMM-yyyy" style="MEDIUM"/>
                                    </span>
                                </div>

                                <div class="list-event-time">
                                    <i class="glyphicon glyphicon-time"></i>
                                    <span>${evento?.horario}</span><br/>
                                </div>

                                <div class="item-event-venue">
                                    <i class="glyphicon glyphicon-map-marker"></i>
                                    <span>${evento?.lugar}</span>
                                    <span>${evento?.recinto}</span>
                                    <span>${evento?.instalacion}</span><br/>
                                </div>

                            </div>
                        </g:link>
                    </div>
                </div>
            </g:each>
        </div>
    </section>
</div>

</body>

</html>
