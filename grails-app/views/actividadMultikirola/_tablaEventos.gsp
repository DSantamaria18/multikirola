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
            <tr  data-id="${event.id}" onclick="goToEvent(this)">
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