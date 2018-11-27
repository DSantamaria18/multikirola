<!DOCTYPE html>
<html lang="${locale}">
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src='application.css'/>
</head>

<body>
<g:render template="/navbar"/>

<div class="container">
    <h1>Recibirás un email con las intrucciones para reestablecer tu contraseña en la dirección de correo ${user.email} .</h1>

    <div class="btn btn-primary">
        <g:link controller="home" action="index"><g:message code="default.link.volverAlInicio"
                                                            default="Volver al Inicio"/></g:link>
    </div>
</div>
</body>
</html>