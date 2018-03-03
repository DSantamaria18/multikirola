<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Eventos Fútbol Sala</title>
</head>

<body>

<div id="list-eventos" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:if test="${eventList.size() > 0}">
        <h1>Próximas actividades de ${eventList[0]?.modalidad}</h1>
        <table>
            <thead>
            <tr>
                %{--<g:sortableColumn property="header" title="ID"/>--}%
                <g:sortableColumn property="header" title="ACTIVIDAD"/>
                %{--<g:sortableColumn property="header" title="MODALIDAD"/>--}%
                <g:sortableColumn property="header" title="FECHA"/>
                <g:sortableColumn property="header" title="LUGAR"/>
                <g:sortableColumn property="header" title="RECINTO"/>
                <g:sortableColumn property="header" title="INSTALACION"/>
                <g:sortableColumn property="header" title="HORARIO"/>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${eventList}" var="evento" status="i">
                <tr eventId="${evento?.id}">
                    %{--<td>${evento.id}</td>--}%
                    <td>${evento?.tipo_actividad}</td>
                    %{--<td>${evento.modalidad}</td>--}%
                    <td><g:formatDate date="${evento.fecha}"/></td>
                    <td>${evento?.lugar}</td>
                    <td>${evento?.recinto}</td>
                    <td>${evento?.instalacion}</td>
                    <td>${evento?.horario}</td>
                    <td><input type="button" class="btn btn-info" value="VER"/></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:if>
    <g:else>
        <h1>No hay eventos programados para esta actividad...</h1>
    </g:else>

</div>

</body>