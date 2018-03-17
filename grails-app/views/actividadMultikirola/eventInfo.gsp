<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>

<g:render template="/navbar"/>


<div class="nav" role="navigation">
    <ul>
        %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

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
            %{--<div id="selector-participantes">
                <g:render template="selectorParticipantes"/>
            </div>--}%

        </div>

    </div>


    <!-- Listado de participantes inscritos en el evento -->
</div>

<div class="container">
    <h1>Participantes Inscritos  <span class="badge">${participantesList.size()}</span> </h1>

    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Apellidos</th>
                <th>Nombre</th>
                <th>Teléfono</th>
                <th>Movil</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${participantesList}" var="participante" status="i">
                <tr>
                    <td>${participante.token}</td>
                    <td>${participante.apellido1} ${participante.apellido2}</td>
                    <td>${participante.nombre}</td>
                    <td>${participante.telefono}</td>
                    <td>${participante.movil}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>