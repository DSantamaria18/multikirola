<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Eventos Fútbol Sala</title>

</head>

<body>

<g:render template="/navbar"/>

%{--<div class="nav" role="navigation">
    <ul>
        --}%%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%%{--
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>--}%


<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>



<g:if test="${eventList.size() > 0}">
    <div class="table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Actividad</th>
            <th>Modalidad</th>
            <th>Fecha</th>
            <th>Horario</th>
            <th>Lugar</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${eventList}" var="event" status="i">
            <tr role="button" data-href="/multikirola/actividadMultikirola/eventInfo?event=${event.id}">
                <td>${event.id}</td>
                <td>${event.tipo_actividad}</td>
                <td>${event.modalidad}</td>
                <td><g:formatDate date="${event.fecha}" format="dd-MM-yyyy"/></td>
                <td>${event.horario}</td>
                <td>${event.lugar} ${event.recinto} ${event.instalacion}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</g:if>



</body>



