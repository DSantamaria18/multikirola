<div class="list-event-item thumbnail" eventId="${evento?.id}">
    <g:link controller="actividadMultikirola" action="registrarParticipantes"  params="[eventId: evento.id]" class="link-evento" >
        <g:img dir="images" file="${evento.modalidad_id}.jpg" class="img-responsive img-rounded"/>

        <div class="caption">
            <h1 class="text-center text-uppercase"><strong>${evento?.tipo_actividad}</strong></h1>

            <p>
            <div class="list-event-date">
                <i class="glyphicon glyphicon-calendar"></i>
                <span class="text-capitalize">
                    <g:formatDate date="${evento.fecha}" format="EEEE dd-MMMM-yyyy" style="MEDIUM"/>
                </span>
            </div>

            <div class="list-event-time">
                <i class="glyphicon glyphicon-time"></i>
                <span>${evento?.horario}</span><br/>
            </div>

            <div class="item-event-venue">
                <i class="glyphicon glyphicon-map-marker"></i>
                <span>${evento?.lugar}</span>
                <span>${evento?.recinto}</span>
                <span>${evento?.instalacion}</span><br/>
            </div>

        </div>

    </g:link>
</div>