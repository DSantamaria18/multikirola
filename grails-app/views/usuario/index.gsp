<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Document List</title>
</head>

<body>
<g:render template="/navbar"/>

<div class="container">
    <div class="content scaffold-list" role="main">
        <h1><g:message code="default.label.usuarios"/></h1>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div id="success"></div>

        <div class="table table-responsive">
            <table>
                <thead>
                <tr>
                    <th><g:message code="default.label.nombre"/></th>
                    <th><g:message code="default.label.apellidosUsuario"/></th>
                    <th><g:message code="default.label.movil"/></th>
                    <th>WhatsApp</th>
                    <th><g:message code="default.label.email"/></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${usuariosList}" status="i" var="usario">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" id="infoUsuario"
                        data-nombre="${usario.nombre}">
                        <td>${usario.nombre}</td>
                        <td>${usario.apellidos}</td>
                        <td>${usario.movil}</td>
                        <td>
                            <g:if test="${usario.whatsapp}">
                                <g:message code="default.boolean.true"/>
                            </g:if>
                            <g:else>
                                <g:message code="default.boolean.false"/>
                            </g:else>
                        </td>
                        <td>${usario.email}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>