<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Multikirolak</title>

</head>

<body>

<g:render template="/navbar"></g:render>


<div class="svg" role="presentation">
    <div class="multikirolak-logo-container">
        <g:img dir="images" file="multikirolak.jpg" class="img-responsive home-img-multikirola" style="margin: 0 auto"/>
    </div>
</div>

<g:if test="${eventList.size() > 0}">
    <div id="content" role="main">
        <section class="row ">
            <h1>Próximas Actividades</h1>

            <div class="grid-container" id="grid-actividades-home">
                <g:each in="${eventList}" var="evento" status="i">
                    <div class="grid-item" id="${evento.id}" modalidad-id="${evento.modalidad_id}">
                        <div class="list-event-item thumbnail" eventId="${evento?.id}">
                            <g:link controller="actividadMultikirola" action="registrarParticipantes"
                                    params="[eventId: evento.id]" class="link-evento">
                            %{--${evento.modalidad_id} - ${evento.modalidad}--}%
                                <g:img dir="images" file="${evento.modalidad_id}.jpg"
                                       class="img-responsive img-rounded"/>

                                <div class="caption">
                                    <h1 class="text-center text-uppercase"><strong>${evento?.tipo_actividad}</strong>
                                    </h1>

                                    <p>

                                    <div class="list-event-date">
                                        <i class="glyphicon glyphicon-calendar"></i>
                                        <span class="text-capitalize">
                                            <g:formatDate date="${evento.fecha}" format="EEEE dd-MMMM-yyyy"
                                                          style="MEDIUM"/>
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
                    </div>
                </g:each>
            </div>
        </section>
    </div>
</g:if>
</body>

</html>
