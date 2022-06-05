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
        <input type="hidden" id="edadMinima" value="${evento?.edad_minima}">
        <input type="hidden" id="edadMaxima" value="${evento?.edad_maxima}">

        <!-- Datos del evento -->
        <div class="form-horizontal">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    <input type="text" class="form-control" id="event-date" readonly
                           value="${formatDate(date: evento.fecha, formatName: 'default.date.format')}">
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
                    <span class="input-group-addon"><i class="glyphicon glyphicon-comment"></i></span>
                    <textarea  class="form-control" id="event-avisos" readonly>${evento?.avisos}</textarea>
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