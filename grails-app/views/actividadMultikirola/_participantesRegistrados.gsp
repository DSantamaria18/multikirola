<g:if test="${participantesRegistradosList?.size() > 0}">
    <g:each in="${participantesRegistradosList}" var="participanteRegistrado" status="i">

        <div class="participanteRegistrado-row list-group-item" participante-id="${participanteRegistrado.id}" style="display: flex; justify-content: space-between;">
            <div class="participanteRegistrado-datarow" >
                <i class="glyphicon glyphicon-ok"></i>
                <span class="text-capitalize"> ${participanteRegistrado.nombre} ${participanteRegistrado.apellido1} ${participanteRegistrado?.apellido2}</span>
            </div>

            <div class="btn btn-danger btn-sm push eliminar-push borrar-participante-btn" id="borrarParticipanteBtn-${i}" onclick="borrarParticipante(this)">
                <i class="glyphicon glyphicon-remove"></i>
            </div>
        </div>

    </g:each>
</g:if>