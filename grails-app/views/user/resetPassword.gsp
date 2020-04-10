<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src='application.css'/>
</head>

<body>

<g:render template="/navbar"/>

<div class="container">
    <div id="reset-password-box" style="margin-top:50px"
         class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title"><g:message code="default.label.actualizarContrasena"/></div>
            </div>

            <div class="panel-body">
                <form id="actualizar-password-form" class="form-horizontal" onsubmit="return isValidPassword()"
                      role="form" action="/user/updatePassword" method="post">

                    <div id="myaccount-alert" style="display:none" class="alert alert-danger">
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
                    <input id="token" name="token" type="hidden" value="${token.value}">

                    <div id="password-group">
                        <div style="margin-top: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password" type="password" class="form-control"
                                   name="${securityConfig.apf.passwordParameter}"
                                   placeholder="<g:message code="default.label.nuevaContrasena"/>"
                                   onchange="$('.error').attr('hidden', true); "/>
                        </div>

                        <div>
                            <label id="error-longitudPassword" class="error" style="color: red"
                                   hidden>La contraseña de tener al menos 8 caracteres</label>
                            <label id="error-contenidoPassword" class="error" style="color: red"
                                   hidden>La contraseña contiene caracteres no válidos</label>
                        </div>

                        <div style="margin-top: 10px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password2" type="password" class="form-control"
                                   name="password2"
                                   placeholder="<g:message code="default.label.confirmarContrasena"/>"
                                   onchange="$('.error').attr('hidden', true);"/>
                        </div>

                        <div>
                            <label id="error-password2" class="error" style="color: red"
                                   hidden>Las contraseñas no coinciden</label>
                        </div>
                    </div>

                    <div class="form-group" style="margin-top: 20px">
                        <!-- Button -->
                        <div class="row botones">
                            <div class="col-md-6 mb-3">
                                <input id="btn-actualizar-pass" type="submit" class="btn btn-info save"
                                       name="actualizar-pass"
                                       value="<g:message code="default.label.actualizar" default="Actualizar"/>"/>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

</html>