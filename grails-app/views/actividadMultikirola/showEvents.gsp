<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Eventos Fútbol Sala</title>

</head>

<body>

<g:render template="/navbar"/>

%{--<div class="nav" role="navigation">
    <ul>
        --}%%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%%{--
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>--}%


<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

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
                    <div class="row fieldcontain">
                        <label>
                            Tiene lugar entre:
                        </label>
                        <g:datePicker name="fechaDesde" precision="day" id="qFechaDesde"
                                      years="${2016..2030}"/> y
                        <g:datePicker name="fechaHasta" precision="day" id="qFechaHasta"
                                      years="${2016..2030}"/>
                    </div>

                    <!-- botones filtrado-->
                    <div class="row fieldcontain">
                        <button type="button" class="row btn-block btn-primary"
                                onclick="filtrarEventos($('#qFechaDesde_year').val() + '-' + $('#qFechaDesde_month').val()
                                    + '-' + $('#qFechaDesde_day').val(), $('#qFechaHasta_year').val() + '-'
                                    + $('#qFechaHasta_month').val() + '-' + $('#qFechaHasta_day').val())">
                            FILTRAR EVENTOS</button>
                    </div>
                </g:form>
            </div>
        </div>
    </div>

</div>


<!-- Listado de eventos -->
<g:if test="${eventList.size() > 0}">
    <div id="tabla-eventos">
        <g:render template="tablaEventos" model="[eventList: eventList]"/>
    </div>
</g:if>

</body>



