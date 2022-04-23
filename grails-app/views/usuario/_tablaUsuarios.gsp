<table>
    <thead>
    <tr>
        <th><g:message code="default.label.nombre"/></th>
        <th><g:message code="default.label.apellidosUsuario"/></th>
        <th><g:message code="default.label.movil"/></th>
        <th>WhatsApp</th>
        <th><g:message code="default.label.email"/></th>
        <th><g:message code="default.label.estado"/></th>
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
            <td>
                <g:if test="${usario.enabled}">
                    <g:message code="default.label.activo"/>
                </g:if>
                <g:else>
                    <g:if test="${usario.enabled}">
                        <g:message code="default.label.inactivo"/>
                    </g:if>
                </g:else>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>