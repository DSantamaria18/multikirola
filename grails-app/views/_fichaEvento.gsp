<div class="list-event-item thumbnail" eventId="${evento?.id}">
    <g:link controller="actividadMultikirola" action="registrarParticipantes"  params="[eventId: evento.id]" class="link-evento" >
        <g:img dir="images" file="${evento.modalidad_id}.jpg" class="img-responsive img-rounded"/>

        <div class="caption">
            <h1 class="text-center text-uppercase"><strong>${evento?.modalidad}</strong></h1>

            <div class="list-event-date">
                <i class="glyphicon glyphicon-calendar"></i>
                <span class="text-capitalize">
                    %{--<g:formatDate date="${evento.fecha}" format="EEEE dd-MMMM-yyyy" style="MEDIUM"/>--}%
                    %{--<g:formatDate date="${evento.fecha}" format="dd-MM-yyyy" style="MEDIUM"/>--}%
                    <g:formatDate date="${evento.fecha}" formatName="default.date.format" style="MEDIUM"/>
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
                %{--<span>${evento?.instalacion}</span><br/>/--}%
            </div>

            <g:if test="${evento?.edad_minima > 0}">
                %{--<p class="text-danger"><i class="glyphicon glyphicon-alert"></i><span> La edad mínima para participar es de ${evento?.edad_minima} año(s)</span></p>--}%
                <p class="text-danger"><i class="glyphicon glyphicon-alert"></i><span> <g:message code="default.label.avisoEdadMinima" args="[evento?.edad_minima]"/></span></p>
            </g:if>

        </div>

    </g:link>
</div>