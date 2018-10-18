<div class="table-responsive">
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Fecha</th>
            <th>Modalidad</th>
            <th>Lugar</th>
            <th>Horario</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${eventList}" var="event" status="i">
            <tr  data-id="${event.id}" onclick="goToEvent(this)">
                <td>${event.id}</td>
                %{--<td><g:formatDate date="${event.fecha}" format="dd-MM-yyyy"/></td>--}%
                <td><g:formatDate date="${event.fecha}" formatName="default.date.format"/></td>
                <td>${event.modalidad}</td>
                <td>${event.lugar} ${event.recinto} ${event.instalacion}</td>
                <td>${event.horario}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>