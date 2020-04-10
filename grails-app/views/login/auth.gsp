<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src='application.css'/>
</head>

<body>
<div class="container">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.user}">
        <ul class="errors" role="alert">
        <g:eachError bean="${this.user}" var="error">
            <g:if test="${this.user.errors?.getFieldError('username').getCode() == 'unique' }">
                <li data-field-id="${error.field}>
                <g:message code="register.user.duplicated"
                           args="${[this.user.errors?.getFieldError('username').getRejectedValue()]}"
                           default="El usuario ${this.user.errors?.getFieldError('username').getRejectedValue()} ya existe" />
                </li>
            </g:if>
            <g:else>
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
            </g:else>
        </g:eachError>
        </ul>
    </g:hasErrors>

    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title"><g:message code="default.label.login"/></div>
            </div>

            <div style="padding-top:30px" class="panel-body">

                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                <form id="loginform" class="form-horizontal" role="form" action='${postUrl}' method="post">

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="login-username" type="text" class="form-control"
                               name="${securityConfig.apf.usernameParameter}" value="" placeholder=<g:message code="default.label.email"/>>
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="login-password" type="password" class="form-control"
                               name="${securityConfig.apf.passwordParameter}" placeholder=<g:message code="default.label.contrasena"/>>
                    </div>

                    <div style="margin-top:10px" class="form-group">
                        <div class="col-sm-12 controls">
                            <button type="submit" class="btn btn-success"><g:message code="default.label.entrar"/></button>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%">
                                %{--¿No tienes cuenta?--}%
                                <g:message code="default.label.noTienesCuenta"/>
                                <a href="/user/register">
                                    %{--Regístrate aquí--}%
                                    <g:message code="default.label.registrateAqui"/>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-12 control">
                            <div style="padding-top:15px; font-size:85%">
                                %{--¿Has olvidado la contraseña?--}%
                                <g:message code="default.label.recuperarContrasena"/>
                                <a href="/user/forgotPassword">
                                    %{--Regístrate aquí--}%
                                    <g:message code="default.label.reset" default="Recuperar contraseña"/>
                                </a>
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