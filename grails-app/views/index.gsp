<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Multikirolak</title>
    <asset:javascript src="application.js"/>

</head>

<body>

<g:render template="/navbar"/>

<div class="svg" role="presentation">
    <div class="grails-logo-container">
        <g:img dir="images" file="multikirolak.jpg" class="img-responsive grails-logo" style="margin: 0 auto"/>
    </div>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>Próximas Actividades</h1>

        %{--<div class="grid-container actividades-home">
            <div class="grid-item futbol-sala-home">
                <g:link action="showEvents" controller="actividadMultikirola">

                    <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 20]">
                        <g:img dir="images" file="futbol-sala.jpg" class="img-responsive"/>
                    </g:link>
                </g:link>
            </div>

            <div class="grid-item beisbol-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 8]">
                    <g:img dir="images" file="beisbol.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item hockey-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 24]">
                    <g:img dir="images" file="hockey.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item rugby-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 39]">
                    <g:img dir="images" file="rugby.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item danza-moderna-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 13]">
                    <g:img dir="images" file="danza-moderna.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item balonmano-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 7]">
                    <g:img dir="images" file="balonmano.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item pelota-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 1]">
                    <g:img dir="images" file="pelota.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item tiro-con-arco-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 49]">
                    <g:img dir="images" file="tiro-con-arco.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item herri-kirolak-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 22]">
                    <g:img dir="images" file="herri-kirolak.jpeg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item waterpolo-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 54]">
                    <g:img dir="images" file="waterpolo.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item futbol-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 19]">
                    <g:img dir="images" file="futbol.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item atletismo-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 5]">
                    <g:img dir="images" file="atletismo.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item baloncesto-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 6]">
                    <g:img dir="images" file="baloncesto.png" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item surf-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 44]">
                    <g:img dir="images" file="surf.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item patinaje-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 34]">
                    <g:img dir="images" file="patinaje.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item pesca-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 3]">
                    <g:img dir="images" file="pesca.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item paddle-surf-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 32]">
                    <g:img dir="images" file="paddle-surf.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item badminton-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 1]">
                    <g:img dir="images" file="badminton.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item kayak-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 26]">
                    <g:img dir="images" file="kayak.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item vela-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 20]">
                    <g:img dir="images" file="vela.jpg" class="img-responsive"/>
                </g:link>
            </div>

            <div class="grid-item mountain-bike-home">
                <g:link action="showEvents" controller="actividadMultikirola" params="['modalidad': 28]">
                    <g:img dir="images" file="mountain-bike.jpg" class="img-responsive"/>
                </g:link>
            </div>
        </div>--}%

        <div class="grid-container" id="grid-actividades-home">
            %{--<g:each in="${eventList}" var="evento" status="i">
                <div class="grid-item home-20">
                    <div class="list-event-item thumbnail" eventId="${evento?.id}">
                        <g:link controller="actividadMultikirola" action="registrarParticipantes"
                                params="[eventId: evento.id]" class="link-evento">
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
                </div>
            </g:each>--}%
        <g:render template="listaEventos" model="[eventList: eventList]"/>
        </div>
    </section>
</div>

%{--<g:javascript>
    $(document).ready(function () {
        $.get("/multikirola/actividadMultikirola/getNextEvents/",
                function (data, status) {
                    console.log(status);
                    $('#grid-actividades-home').html(data)
                })
    });
</g:javascript>--}%
</body>


</html>
