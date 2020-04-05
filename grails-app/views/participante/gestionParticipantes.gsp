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

                        <div class="fieldcontain row">
                            <label>
                                %{--Curso :--}%
                                <g:message code="default.label.curso"/>
                            </label>
                            <g:select name="curso"
                                      from="${Curso.listOrderByNombre()}"
                                      value="''"
                                      noSelection="${['': 'Cualquiera']}"
                                      optionKey="id"
                                      optionValue="nombre"
                                      id="qCurso"/>
                        </div>

                        <div class="fieldcontain row">
                            <label>
                                %{--F. Nacimiento :--}%
                                <g:message code="default.label.fechaNacimiento"/>
                            </label>
                            <g:datePicker name="fechaDesde" precision="month" id="qFechaDesde"
                                          relativeYears="${-15..0}" noSelection="['':'']" default="none"/> y
                            <g:datePicker name="fechaHasta" precision="month" id="qFechaHasta"
                                          relativeYears="${-15..0}" noSelection="['':'']" default="none"/>
                        </div>

                        <!-- botones filtrado-->
                        <div class="row fieldcontain">
                            <button type="button" class="row btn-block btn-primary"
                                    onclick="filtrarParticipantes(
                                        $('#qApellido1').val()
                                        , $('#qMovil').val()
                                        , $('#qEmail').val()
                                        , $('#qCentro option:selected').val()
                                        , $('#qCurso option:selected').val()
                                        , $('#qFechaDesde_year').val() + '-' + $('#qFechaDesde_month').val()
                                        , $('#qFechaHasta_year').val() + '-' + $('#qFechaHasta_month').val()
                                        )">
                                FILTRAR PARTICIPANTES</button>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>

    </div>

    <div>
        <g:link class="btn btn-primary" action="descargarParticipantes">
            <g:message default="Descargar" code="default.label.descargar"/> <i class="glyphicon glyphicon-download"></i>
        </g:link>
    </div>

    <div id="tabla-participantes">
        <g:render template="tablaParticipantes" model="[participantesList: participantesList]"/>
    </div>

</div>
</body>
</html>