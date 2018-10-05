<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src='application.css'/>
</head>

<body>

<g:render template="/navbar"/>

<div class="container">
    <div id="signupbox" style="margin-top:50px"
         class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                %{--<div class="panel-title">Registro</div>--}%
                <div class="panel-title"> <g:message code="default.label.registro"/></div>
            </div>

            <div class="panel-body">
                <form id="signup-form" class="form-horizontal" role="form" onsubmit="return validateForm()"
                      action="/multikirola/user/save" method="post">

                    <div id="signup-alert" style="display:none" class="alert alert-danger">
                        <p>Error:</p>
                        <span></span>
                    </div>


                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.user}">
                        <ul class="errors" role="alert">
                            <g:eachError bean="${this.user}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                        error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>

                    %{--<div style="margin-bottom: 25px" class="input-group">--}%
                    <div style="margin-top: 20px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="username" type="text" class="form-control" data-toggle="tooltip-user" title="Tu identificador de acceso a la aplicación. Debe ser único."
                               name="${securityConfig.apf.usernameParameter}" value=""
                               %{--placeholder="Nombre de usuario"--}%
                               placeholder="<g:message code="default.label.nombreUsuario"/>"
                               onchange="$('.error').attr('hidden', true);"/>
                    </div>
                    <div>
                        %{--<label id="error-username" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-username" class="error" style="color: red" hidden><g:message code="default.error.nombreUsuario"/></label>
                        <label id="error-caracteresUsername" class="error" style="color: red" hidden><g:message code="default.error.caracteresNombreUsuario"/></label>
                    </div>
                    %{--<div style="margin-bottom: 20px" class="input-group">--}%


                    %{--<div style="margin-bottom: 20px" class="input-group">--}%
                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="useremail" type="text" class="form-control"
                               %{--name="email" value="" placeholder="Email"--}%
                               name="email" value=""
                               placeholder="<g:message code="default.label.correoElectronico"/>"
                               onchange="$('.error').attr('hidden', true); "/>
                    </div>
                    <div>
                        <label id="error-email" class="error" style="color: red" hidden><g:message code="default.error.email"/></label>
                    </div>

                    %{--<div style="margin-bottom: 20px" class="input-group">--}%
                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
                        <input id="userphone" type="text" class="form-control" name="telefono" value=""
                               %{--placeholder="Teléfono" onchange="$('.error').attr('hidden', true); "/>--}%
                               placeholder="<g:message code="default.label.telefono"/>"
                               onchange="$('.error').attr('hidden', true); "/>
                    </div>
                    <div>
                        %{--<label id="error-userphone" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-userphone" class="error" style="color: red" hidden><g:message code="default.error.telefono"/></label>
                    </div>

                    %{--<div class="input-group">--}%
                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                        <input id="usercellphone" type="text" class="form-control" name="movil" value=""
                               %{--placeholder="Teléfono móvil" onchange="$('.error').attr('hidden', true); "/>--}%
                               placeholder="<g:message code="default.label.telefonoMovil"/>"
                               onchange="$('.error').attr('hidden', true); "/>
                    </div>
                    <div>
                        %{--<label id="error-usercellphone" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-usercellphone" class="error" style="color: red" hidden><g:message code="default.error.telefono"/></label>
                    </div>

                    <div class="input-group" style="margin-bottom: 10px">
                        <div class="checkbox">
                            <label>
                                <g:checkBox id="whatsapp" name="whatsapp" value="${this.user?.whatsapp}"/>
                                %{--Notificadme por Whatsapp--}%
                                <g:message code="default.label.notificadmeWhatsapp"/>
                            </label>
                        </div>
                    </div>
                    <div>
                        %{--<label id="error-whatsapp" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-whatsapp" class="error" style="color: red" hidden><g:message code="default.error.whatsapp"/></label>
                    </div>

                    <div style="margin-top: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password" type="password" class="form-control"
                               name="${securityConfig.apf.passwordParameter}"
                               %{--placeholder="Contraseña" onchange="$('.error').attr('hidden', true); "/>--}%
                               placeholder="<g:message code="default.label.contrasena"/>"
                               onchange="$('.error').attr('hidden', true); "/>
                    </div>
                    <div>
                        %{--<label id="error-password" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-password" class="error" style="color: red" hidden><g:message code="default.error.password"/></label>
                        <label id="error-longitudPassword" class="error" style="color: red" hidden><g:message code="default.error.longitudPassword"/></label>
                        <label id="error-digitoPassword" class="error" style="color: red" hidden><g:message code="default.error.digitoPassword"/></label>
                        <label id="error-minusculasPassword" class="error" style="color: red" hidden><g:message code="default.error.minuculaPassword"/></label>
                        <label id="error-mayusculasPassword" class="error" style="color: red" hidden><g:message code="default.error.mayusculasPassword"/></label>
                        <label id="error-contenidoPassword" class="error" style="color: red" hidden><g:message code="default.error.contenidoPassword"/></label>
                    </div>

                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password2" type="password" class="form-control"
                               %{--name="password2" placeholder="Confirmar contraseña"--}%
                               name="password2"
                               placeholder="<g:message code="default.label.confirmarContrasena"/>"
                               onchange="$('.error').attr('hidden', true);"/>
                    </div>
                    <div>
                        %{--<label id="error-password2" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-password2" class="error" style="color: red" hidden><g:message code="default.error.password2"/></label>
                    </div>

                    <div style="margin-top: 20px" class="input-group">
                        <div class="checkbox">
                            <label>
                                %{--<input id="legal" type="checkbox" name="terms"
                                       value="1" onchange="$('.error').attr('hidden', true); "/> He leído y acepto los <a href="#" target="_blank"> Términos y Condiciones </a> y la <a href="#" target="_blank">Política de Privacidad</a> .--}%
                                <g:checkBox id="legal" name="terms"/>
                                %{--He leído y acepto los <a href="#" target="_blank"> Términos y Condiciones </a> y la <a href="#" target="_blank">Política de Privacidad</a>--}%
                                <span><g:message code="default.label.textoGDPR" htmlEscape="false"/>
                            </label>
                        </div>
                    </div>
                    <div>
                        %{--<label id="error-legal" class="error" style="color: red" hidden>ERROR!!!</label>--}%
                        <label id="error-legal" class="error" style="color: red" hidden><g:message code="default.error.checkCondiciones"/></label>
                    </div>

                    <div class="form-group" style="margin-top: 20px">
                        <!-- Button -->
                        <div class="col-md-9">
                            <input id="btn-signup" type="submit" class="btn btn-info save"
                                   %{--name="register" value="Enviar"/>--}%
                                   name="register" value="<g:message code="default.label.enviar"/>"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>