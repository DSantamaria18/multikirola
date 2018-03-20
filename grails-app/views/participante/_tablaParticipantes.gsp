<div class="table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th>#</th>
            <th>Apellido 1</th>
            <th>Apellido 2</th>
            <th>Nombre</th>
            <th>Fecha Nacimiento</th>
            <th>Teléfono</th>
            <th>Móvil</th>
            <th>Email</th>
            <th>Centro</th>
            <th>Curso</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${participantesList}" var="participante" status="i">
            <tr data-id="${participante.id}" onclick="">
                <td>${participante.id}</td>
                <td class="text-capitalize">${participante.apellido1}</td>
                <td class="text-capitalize">${participante.apellido2}</td>
                <td class="text-capitalize">${participante.nombre}</td>
                <td><g:formatDate date="${participante.fechaNacimiento}" format="dd-MM-yyyy"/></td>
                <td>${participante.telefono}</td>
                <td>${participante.movil}</td>
                <td>${participante.email}</td>
                <td>${participante.centro.nombre}</td>
                <td>${participante.curso.nombre}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>