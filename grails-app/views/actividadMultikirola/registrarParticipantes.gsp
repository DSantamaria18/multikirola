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

        <!-- Datos del evento -->
        <div class="form-horizontal">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    <input type="text" class="form-control" id="event-date" readonly
                           value="${formatDate(date: evento.fecha, format: "EEEE, d MMMM yyyy", style: "LONG")}">
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

            <!-- Participantes registrables -->
            <div id="selector-participantes">
            <g:render template="selectorParticipantes"/>
        </div>
           %{-- <div class="form-group" style="display: flex" id="selector-participantes">
                <input type="hidden" value="" id="selected-participant-id">

                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <select class="form-control" id="select-participantes">
                        <option value="" selected disabled>Selecciona un participante...</option>
                        <g:each in="${participantesList}" var="participante" status="j">
                            <option id="${participante.id}"
                                    phone="${participante?.telefono}"
                                    mobile="${participante?.movil}">
                                ${participante.nombre} ${participante.apellido1} ${participante?.apellido2}
                            </option>
                        </g:each>
                    </select>
                </div>
            </div>

            <!-- Datos de contacto -->
            <div class="form-group form-datos-contacto" hidden>
                <span class="lead">Por favor, verifica los datos de contacto...</span>

                <div class="participante-item-telefono input-group" style="margin-bottom: 5px">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                    <input type="text" class="form-control" id="participante-telefono"
                           value=""/>
                </div>

                <div class="participante-item-movil input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                    <input type="text" class="form-control" id="participante-mobile"
                           value=""/>
                </div>
            </div>

            <!-- Botón inscribir participante -->
            <div class="form-group div-inscribirParticipanteBtn" hidden>
                <div class="input-group" style="display: block">
                    <a href="#" class="btn btn-success" type="button" id="inscribirParticipanteBtn"
                       style="width: 100%; margin: 0 auto">
                        <i class="glyphicon glyphicon-plus"></i>
                        <i class="glyphicon glyphicon-user"></i>
                    </a>
                </div>
            </div>--}%

           %{-- <!-- Participantes Registrados -->
            <div class="participantes-list list-group" id="div-participantes-registrados">
            --}%%{--<g:render template="participantesRegistrados"/>--}%%{--
                <g:if test="${participantesRegistradosList?.size() > 0}">
                    <g:each in="${participantesRegistradosList}" var="participanteRegistrado" status="i">

                        <div class="participanteRegistrado-row list-group-item"
                             participante-id="${participanteRegistrado.id}"
                             style="display: flex; justify-content: space-between;">
                            <div class="participanteRegistrado-datarow">
                                <i class="glyphicon glyphicon-ok"></i>
                                <span class="text-capitalize">${participanteRegistrado.nombre} ${participanteRegistrado.apellido1} ${participanteRegistrado?.apellido2}</span>
                            </div>

                            <div class="btn btn-danger btn-sm push eliminar-push borrar-participante-btn"
                                 id="borrarParticipanteBtn-${i}" onclick="borrarParticipante(this)">
                                <i class="glyphicon glyphicon-remove"></i>
                            </div>
                        </div>

                    </g:each>
                </g:if>
            </div>--}%

        </div>

    </div>
</div>

</body>
</html>