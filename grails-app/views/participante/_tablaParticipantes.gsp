<div class="table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th>#</th>
            %{--<th>Centro</th>--}%
            <th><g:message code="default.label.centro"/></th>
            %{--<th>Curso</th>--}%
            <th><g:message code="default.label.curso"/></th>
            <th><g:message code="default.label.nombre"/></th>
            %{--<th>Apellido 1</th>--}%
            <th><g:message code="default.label.apellido1"/></th>
            %{--<th>Apellido 2</th>--}%
            <th><g:message code="default.label.apellido2"/></th>
            %{--<th>Teléfono</th>--}%
            <th><g:message code="default.label.telefono"/></th>
            %{--<th>Móvil</th>--}%
            <th><g:message code="default.label.telefonoMovil"/></th>
            <th>Email</th>
            %{--<th>F. Nacimiento</th>--}%
            <th><g:message code="default.label.fechaNacimiento"/></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${participantesList}" var="participante" status="i">
            <tr data-id="${participante.id}" onclick="">
                <td>${participante.id}</td>
                %{--<td class="text-uppercase">${participante.centro?.nombre}</td>--}%
                <td class="text-uppercase">${participante.centro}</td>
                %{--<td class="text-uppercase">${participante.curso?.nombre}</td>--}%
                <td class="text-uppercase">${participante.curso}</td>
                <td class="text-capitalize">${participante.nombre}</td>
                <td class="text-capitalize">${participante.apellido1}</td>
                <td class="text-capitalize">${participante.apellido2}</td>
                <td>${participante.telefono}</td>
                <td>${participante.movil}</td>
                <td>${participante.email}</td>
                <td><g:formatDate date="${participante.fechaNacimiento}" format="dd-MM-yyyy"/></td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>