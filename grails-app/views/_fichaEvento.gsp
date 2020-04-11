<div class="list-event-item thumbnail" eventId="${evento?.id}">
    <g:link controller="actividadMultikirola" action="registrarParticipantes" params="[eventId: evento.id]"
            class="link-evento">

        <img src='${createLink(controller: "home", action: "renderActivityImage", params: [img: "${evento.modalidad_id}.jpg"])}'
             alt="actividad"/>

        <div class="caption">
            <h1 class="text-center text-uppercase"><strong>${evento?.nombre}</strong></h1>

            <div class="list-event-date">
                <i class="glyphicon glyphicon-calendar"></i>
                <span class="text-capitalize">
                    <g:formatDate date="${evento.fecha}" formatName="default.date.format" style="MEDIUM"/>
                </span>a
            </div>

            <div class="list-event-time">
                <i class="glyphicon glyphicon-time"></i>
                <span>${evento?.horario}</span><br/>
            </div>

            <div class="item-event-venue">
                <i class="glyphicon glyphicon-map-marker"></i>
                <span>${evento?.lugar}</span>
                <span>${evento?.recinto}</span>
            </div>

            <g:if test="${evento?.edad_minima > 0}">
                <p class="text-danger"><i class="glyphicon glyphicon-alert"></i><span><g:message
                        code="default.label.avisoEdadMinima" args="[evento?.edad_minima]"/></span></p>
            </g:if>

        </div>

    </g:link>
</div>