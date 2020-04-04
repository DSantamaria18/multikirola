<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Document List</title>
</head>

<body>
<g:render template="/navbar"/>

<div class="container">
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        </ul>
    </div>
    <br/>
    <div class="row" id="filter-options">
        <div class="panel-group" id="accordion-cat-1">
            <div class="panel panel-default panel-faq">
                <div class="panel-heading">
                    <a data-toggle="collapse" data-parent="#accordion-cat-1" href="#faq-cat-1-sub-1">
                        <h4 class="panel-title">
                            <g:message code="default.label.opcionesDeFiltrado" default="Opciones de Filtrado"/>
                            <span class="pull-right"></span>
                        </h4>
                    </a>
                </div>

                <div id="faq-cat-1-sub-1" class="panel-collapse collapse">
                <div class="panel-body form-group">
                    <g:form resource="${this.query}" method="POST" controller="Usuario" action="exportarUsuarios">

                        <div class="form-group">
                            <label for="qWhatsApp"><g:message code="default.label.notificacionesWhatsapp"
                                                                  default="Notificaciones WhatsApp"/></label>
                            <g:select name="qWhatsApp"
                                      id="qWhatsApp"
                                      from="${[g.message(code: "default.boolean.true", default: "SI"), g.message(code: "default.boolean.false", default: "NO")]}"
                                      noSelection="${['null': g.message(code: "default.label.cualquiera", default: "CUALQUIERA")]}"
                                      keys="${[true, false]}"/>
                        </div>

                        <div class="form-group">
                            <label for="qFechaDesde"><g:message code="default.label.fechaDesde"
                                                                default="Fecha Desde:"/></label>
                            <input name="qFechaDesde" id="fecha-desde" type="date" step="day">
                        </div>

                        <div class="row fieldcontain">
                            <button type="button" class="row btn-block btn-primary"
                                    onclick="filtrarUsuarios();">
                                <g:message code="default.label.filtrarUsuarios" default="FILTRAR USUARIOS"/>
                            </button>
                            <g:actionSubmit class="btn-block btn-info" value="${g.message(code: "default.label.exportar", default: "Exportar")}"
                                            action="exportarUsuarios"/>
                        </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>

    <div class="content scaffold-list" role="main">
        <h1><g:message code="default.label.usuarios"/></h1>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div id="success"></div>

        <div class="table table-responsive" id="tabla-usuarios">
            <g:render template="tablaUsuarios"/>
        </div>
    </div>
</div>
<g:javascript>

    function filtrarUsuarios() {
        const qWhatsApp = $('#qWhatsApp option:selected').val();
        const fecha = '1900-01-01';
        let qFechaDesde = $('#fecha-desde').val();
        if (qFechaDesde === "") {
            qFechaDesde = fecha;
        }

        $.post("/Usuario/filtrarUsuarios",
                {
                    qWhatsApp: qWhatsApp,
                    qFechaDesde: qFechaDesde
                }, function (data, status) {
            console.log(status);
            $('#tabla-usuarios').html(data);
        }
        );
    };

</g:javascript>
</body>
</html>