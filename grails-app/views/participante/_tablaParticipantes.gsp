<div class="table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th>#</th>
            <th><g:message code="default.label.centro"/></th>
            <th><g:message code="default.label.nombre"/></th>
            <th><g:message code="default.label.apellido1"/></th>
            <th><g:message code="default.label.apellido2"/></th>
            <th><g:message code="default.label.telefonoMovil"/></th>
            <th>Email</th>
            <th><g:message code="default.label.fechaNacimiento"/></th>
            <th><g:message code="default.label.estado"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${participantesList}" var="participante" status="i">
            <tr data-id="${participante.id}" onclick="">
                <td>${participante.id}</td>
                <td class="text-uppercase">${participante.centro}</td>
                <td class="text-capitalize">${participante.nombre}</td>
                <td class="text-capitalize">${participante.apellido1}</td>
                <td class="text-capitalize">${participante.apellido2}</td>
                <td>${participante.movil}</td>
                <td>${participante.email}</td>
                <td><g:formatDate date="${participante.fechaNacimiento}" formatName="default.date.format"/></td>
                <td>
                    <g:if test="${participante.activo}">
                        <g:message code="default.label.activo"/>
                    </g:if>
                    <g:else>
                        <g:message code="default.label.inactivo"/>
                    </g:else>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>