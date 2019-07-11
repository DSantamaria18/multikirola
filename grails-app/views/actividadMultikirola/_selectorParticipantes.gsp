<div class="form-group" style="display: flex"%{-- id="selector-participantes"--}%>
    <input type="hidden" value="" id="selected-participant-id">

    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <select class="form-control" id="select-participantes" onchange="showContactInfo()">
            %{--<option value="" selected disabled>Selecciona un participante...</option>--}%
            <option value="" selected disabled><g:message code="registroParticipantes.combo.nullSelected"/></option>
            <g:each in="${participantesList}" var="participante" status="j">
                <option id="${participante.id}"
%{--                        phone="${participante?.telefono}"--}%
                        mobile="${participante?.movil}"
                        fnacimiento="${participante?.fecha_nacimiento}">
                    ${participante.nombre} ${participante.apellido1} ${participante?.apellido2}
                </option>
            </g:each>
        </select>
    </div>
</div>

<!-- Datos de contacto -->
<div class="form-group form-datos-contacto" hidden>
    <span class="lead">Por favor, verifica los datos de contacto...</span>

    <input class="hidden" id="participante-fnacimiento" value=""/>

    %{--<div class="participante-item-telefono input-group" style="margin-bottom: 5px">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
        <input type="text" class="form-control" id="participante-telefono"
               value=""/>
    </div>--}%

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
           style="width: 100%; margin: 0 auto" onclick="inscribirParticipante()">
            <i class="glyphicon glyphicon-plus"></i>
            <i class="glyphicon glyphicon-user"></i>
        </a>
    </div>
</div>

<!-- Participantes Registrados -->
<div class="participantes-list list-group" id="div-participantes-registrados">
%{--<g:render template="participantesRegistrados"/>--}%
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
</div>