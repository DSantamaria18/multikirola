<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    %{--<title>Eventos Fútbol Sala</title>--}%
</head>

<style>

.content {
    margin: 0% 25%;
}

.form-horizontal {
    margin: 25% 25%;
}

@media only screen and (min-width: 600px) {
    .content {
        margin: 0% 25%;
    }
}
</style>

<body>

<g:render template="/navbar"/>

<div class="container">
    <div id="event-info" class="content mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2" role="main">
        <h1>${evento?.tipo_actividad} ${evento?.modalidad}</h1>
        <input type="hidden" id="eventId" value="${evento.id}">
        <input type="hidden" id="edadMinima" value="${evento.edad_minima}">

        <!-- Datos del evento -->
        <div class="form-horizontal">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    <input type="text" class="form-control" id="event-date" readonly
                    %{--value="${formatDate(date: evento.fecha, format: "dd-MM-yyyy")}">--}%
                           value="${formatDate(date: evento.fecha, formatName: 'default.date.format')}">
                    %{--value="${formatDate(date: evento.fecha, format: "EEEE, d MMMM yyyy", style: "LONG")}">--}%
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                    <input type="text" class="form-control" id="event-time" readonly
                           value="${evento.horario}">
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                    <input type="text" class="form-control" id="event-venue" readonly
                           value="${evento?.lugar} ${evento?.recinto} ${evento?.instalacion}">
                </div>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-exclamation-sign"></i></span>
                    <input type="text" class="form-control" id="event-restriction" readonly
%{--                           value="${message(code:'your.code.here', default: 'Edad mínima', params:[evento?.edad_minima])} ${evento?.edad_minima} años">--}%
                           value="${message(code:'your.code.here', default: 'Edad mínima', args:[evento?.edad_minima]).decodeHTML()}">
                </div>
            </div>

            <!-- Participantes registrables -->
            <div id="selector-participantes">
                <g:render template="selectorParticipantes"/>
            </div>

        </div>
    </div>
</div>

</body>
</html>