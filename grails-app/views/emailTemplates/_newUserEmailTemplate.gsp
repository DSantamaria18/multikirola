<%@ page contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <h1>Datos del usuario:</h1>
            <br />
            <div style="margin-top: 20px" class="input-group">
                <input id="nombre" type="text" class="form-control" data-toggle="tooltip-user"
                       title="Tu nombre" name="nombre"
                       value="${user?.nombre}"
                       placeholder="<g:message code="default.label.nombreUsuario"/>"
                       onchange="$('.error').attr('hidden', true);"/>
                <input id="apellidos" type="text" class="form-control" data-toggle="tooltip-user"
                       title="Tus apellidos" name="apellidos"
                       value="${user?.apellidos}"
                       placeholder="<g:message code="default.label.apellidosUsuario"/>"
                       onchange="$('.error').attr('hidden', true);"/>
            </div>

            <div style="margin-top: 10px" class="input-group">
                <input id="useremail" type="text" class="form-control"
                       name="email"
                       value="${user?.email}"
                       placeholder="<g:message code="default.label.correoElectronico"/>"
                       onchange="$('.error').attr('hidden', true); "/>
            </div>

            <div style="margin-top: 10px" class="input-group">
                <input id="usercellphone" type="text" class="form-control" name="movil"
                       placeholder="<g:message code="default.label.telefonoMovil"/>"
                       onchange="$('.error').attr('hidden', true); "
                       value="${user?.movil}"/>
            </div>

            <div class="input-group" style="margin-bottom: 10px">
                <div class="checkbox">
                    <label>
                        <g:checkBox id="whatsapp" name="whatsapp" value="${this.user?.whatsapp}"/>
                        <g:message code="default.label.notificadmeWhatsapp"/>
                    </label>
                </div>
            </div>
        </div>
    </div>
</body>
</html>