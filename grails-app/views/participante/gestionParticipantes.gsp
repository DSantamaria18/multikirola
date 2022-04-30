<%@ page import="multikirola.Curso; multikirola.Centro" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'participante.label', default: 'Participante')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<g:render template="/navbar"/>

<a href="#list-participante" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>


<div class="container">
    <div class="panel-group" id="panel-filtro">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a data-toggle="collapse" data-parent="#panel-filtro" href="#panel-opciones-filtrado">
                    <h4 class="panel-title">Opciones de filtrado</h4>
                </a>
            </div>

            <!-- Condiciones filtrado -->
            <div class="panel-collapse collapse" id="panel-opciones-filtrado">
                <div class="panel-body form-group">
                    <g:form resource="${this.query}" method="post" action="exportEventosFiltrados">

                        <div class=" row fieldcontain">
                            <label>
                                %{--Apellido 1:--}%
                                <g:message code="default.label.apellido1"/>
                            </label>
                            <g:textField name="apellido1" id="qApellido1"/>
                        </div>

                    %{--<div class="fieldcontain row">
                        <label>
                            Teléfono :
                        </label>
                        <g:textField name="telefono" id="qTelefono"/>
                    </div>--}%

                        <div class="fieldcontain row">
                            <label>
                                %{--Móvil :--}%
                                <g:message code="default.label.telefonoMovil"/>
                            </label>
                            <g:textField name="movil" id="qMovil"/>
                        </div>

                        <div class="fieldcontain row">
                            <label>
                                Email :
                            </label>
                            <g:textField name="email" id="qEmail"/>
                        </div>

                        <div class="fieldcontain row">
                            <label>
                                %{--Centro :--}%
                                <g:message code="default.label.centro"/>
                            </label>
                            <g:select name="centro"
                                      from="${Centro.listOrderByNombre()}"
                                      value="''"
                                      noSelection="${['': 'Cualquiera']}"
                                      optionKey="id"
                                      optionValue="nombre"
                                      id="qCentro"/>
                        </div>

                    %{--<div class="fieldcontain row">
                        <label>
                            --}%%{--Curso :--}%%{--
                            <g:message code="default.label.curso"/>
                        </label>
                        <g:select name="curso"
                                  from="${Curso.listOrderByNombre()}"
                                  value="''"
                                  noSelection="${['': 'Cualquiera']}"
                                  optionKey="id"
                                  optionValue="nombre"
                                  id="qCurso"/>
                    </div>--}%

                        <div class="fieldcontain row">
                            <label for="qUserEnabled"><g:message code="default.label.UsuariosActivos"
                                                                 default="Usuarios Activos"/></label>
                            <g:select name="qUserEnabled"
                                      id="qUserEnabled"
                                      from="${[g.message(code: "default.boolean.true", default: "SI"), g.message(code: "default.boolean.false", default: "NO")]}"
                                      noSelection="${['null': g.message(code: "default.label.cualquiera", default: "CUALQUIERA")]}"
                                      keys="${[true, false]}"/>
                        </div>

                        <div class="fieldcontain row">
                            <label>
                                <g:message code="default.label.fechaNacimiento"/>
                            </label>
                            <input name="qFechaDesde" id="qFechaDesde" type="date" step="month"> -
                            <input name="qFechaHasta" id="qFechaHasta" type="date" step="month">
                        </div>

                        <!-- botones filtrado-->
                        <div class="fieldcontain row">
                            <button type="button" class="row btn-block btn-primary"
                                    onclick="filtrarParticipantes()">FILTRAR PARTICIPANTES</button>

                            <g:actionSubmit class="btn-block btn-info"
                                            value="${g.message(code: "default.label.exportar", default: "Exportar").toUpperCase()}"
                                            action="descargarParticipantes"/>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>

    </div>

    <div id="tabla-participantes">
        <g:render template="tablaParticipantes" model="[participantesList: participantesList]"/>
    </div>

</div>

<g:javascript>
    function filtrarParticipantes() {
        const qApellido1 = $("#qApellido1").val();
        const qMovil = $("qMovil").val();
        const qEmail = $("qEmail").val();
        const qCentro = $('#qCentro option:selected').val();
        const qUserEnabled = $('#qUserEnabled option:selected').val();

        const fechaDesde = '1900-01-01';
        let qFechaDesde = $('#qFechaDesde').val();
        if (qFechaDesde === "") {
            qFechaDesde = fechaDesde;
        }

        const fechaHasta = '2100-01-01';
        let qFechaHasta = $('#qFechaHasta').val();
        if (qFechaHasta === "") {
            qFechaHasta = fechaHasta;
        }

        $.post("/participante/filtrarParticipantes",
                {
                    apellido1: qApellido1,
                    movil: qMovil,
                    email: qEmail,
                    centro: qCentro,
                    activos: qUserEnabled,
                    fDesde: qFechaDesde,
                    fHasta: qFechaHasta
                }, function (data, status) {
            console.log(status);
            $('#tabla-participantes').html(data);
        }
        );
    };
</g:javascript>
</body>
</html>