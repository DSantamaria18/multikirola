<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'participante.label', default: 'Participante')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="/navbar"/>

<a href="#list-participante" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        %{--<li><g:link class="create" action="create"><g:message code="default.new." args="[entityName]"/></g:link></li>--}%
        <li><g:link class="create" action="create">
                <g:message code="default.new.participante"/>
            </g:link>
        </li>
    </ul>
</div>

<div id="list-participante" class="content scaffold-list" role="main">
    %{--<h1><g:message code="default.list.label" args="[entityName]"/></h1>--}%
    <h1><g:message code="default.list.listaParticipantes"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:table collection="${participantesList}"/>
</div>


<g:if test="${actividadMultikirolaList.size() > 0}">
    <div id="list-inscripciones" class="content scaffold-list">
        <h1>Inscripciones Activas</h1>
        <table class="table">
            <thead>
            <tr>
                %{--<th>Evento</th>--}%
                <th><g:message code="default.label.evento"/></th>
                %{--<th>Fecha</th>--}%
                <th><g:message code="default.label.fecha"/></th>
                %{--<th>Nombre</th>--}%
                <th><g:message code="default.label.nombre"/></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${actividadMultikirolaList}" var="am" status="i">
                <tr id="registros">
                    <td id="event-id" data-id="${am.evento_id}" hidden></td>
                    <td id="event-name">${am.evento}</td>
                    %{--<td id="event-date"><g:formatDate date="${am.fecha}" format="EEEE dd-MMMM-yyyy" style="MEDIUM"/></td>--}%
                    <td id="event-date"><g:formatDate date="${am.fecha}" format="dd-MM-yyyy" style="MEDIUM"/></td>
                    <td id="participant-name"
                        data-id="${am.participante_id}">${am.nombre_participante} ${am.apellido1_participante} ${am.apellido2_participante}</td>
                    <td id="remove-btn"><div class="btn btn-sm btn-danger" onclick="unsubscribeParticipant(this)"><i
                            class="glyphicon glyphicon-remove"></i></div></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</g:if>
</body>
</html>