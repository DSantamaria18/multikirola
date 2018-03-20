<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>

<g:render template="/navbar"/>


%{--<div class="nav" role="navigation">
    <ul>
        --}%%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%%{--
        <li><g:link action="descargarParticipantes"><i class="glyphicon glyphicon-download"></i> </g:link></li>
    </ul>
</div>--}%

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
    <h1>Participantes <span class="badge">${participantesList.size()}</span>
        <span style="text-decoration: none; margin-left: 25%">

            <g:link class="btn btn-primary" action="descargarParticipantes" params="[eventId: evento.id ]">
                <i class="glyphicon glyphicon-download"></i>
            </g:link>
        </span>
    </h1>

    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th hidden>Id</th>
                <th>Apellidos</th>
                <th>Nombre</th>
                <th>F. Nacimiento</th>
                <th>Teléfono</th>
                <th>Movil</th>
                <th>Email</th>
                <th>Centro</th>
                <th>Curso</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${participantesList}" var="participante" status="i">
                <tr>
                    <td hidden>${participante.id}</td>
                    <td class="text-capitalize">${participante.apellido1} ${participante.apellido2}</td>
                    <td class="text-capitalize">${participante.nombre}</td>
                    <td><g:formatDate date="${participante.fnacimiento}" format="dd-MM-yyyy"/></td>
                    <td>${participante.telefono}</td>
                    <td>${participante.movil}</td>
                    <td>${participante.email}</td>
                    <td>${participante.centro}</td>
                    <td>${participante.curso}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>