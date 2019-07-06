<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src='application.css'/>
</head>

<body>
<div class="container">
    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                %{--<div class="panel-title">Iniciar Sesión</div>--}%
                <div class="panel-title"><g:message code="default.label.login"/></div>
            </div>

            <div style="padding-top:30px" class="panel-body">

                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                <form id="loginform" class="form-horizontal" role="form" action='${postUrl}' method="post">

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="login-username" type="text" class="form-control"
                               %{--name="${securityConfig.apf.usernameParameter}" value="" placeholder="Usuario">--}%
                               name="${securityConfig.apf.usernameParameter}" value="" placeholder=<g:message code="default.label.email"/>>
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="login-password" type="password" class="form-control"
                               %{--name="${securityConfig.apf.passwordParameter}" placeholder="Contraseña">--}%
                               name="${securityConfig.apf.passwordParameter}" placeholder=<g:message code="default.label.contrasena"/>>
                    </div>


                    <div style="margin-top:10px" class="form-group">
                        <!-- Button -->

                        <div class="col-sm-12 controls">
                            %{--<button type="submit" class="btn btn-success">Entrar</button>--}%
                            <button type="submit" class="btn btn-success"><g:message code="default.label.entrar"/></button>
                            %{--<div style="float:right; font-size: 80%; position: relative; "><g:link controller='register' action='forgotPassword'>¿Olvidaste la contraseña?</g:link></div>--}%
                            %{--<div style="float:right; font-size: 80%; position: relative; "><g:link controller='register' action='forgotPassword'><g:message code="default.label.recuperarContrasena"/></g:link></div>--}%
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%">
                                %{--¿No tienes cuenta?--}%
                                <g:message code="default.label.noTienesCuenta"/>
                                <a href="/multikirola/user/register">
                                    %{--Regístrate aquí--}%
                                    <g:message code="default.label.registrateAqui"/>
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