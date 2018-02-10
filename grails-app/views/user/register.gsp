<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src='application.css'/>
</head>

<body>

<div class="container">
    <div id="signupbox" style="margin-top:50px"
         class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Registro</div>

                <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink"
                                                                                           href="/multikirola/login/auth">Iniciar sesión</a>
                </div>
            </div>

            <div class="panel-body">
                <form id="signupform" class="form-horizontal" role="form" action="/multikirola/user/save" method="post">

                    <div id="signupalert" style="display:none" class="alert alert-danger">
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

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="signup-useremail" type="text" class="form-control" name="email" value=""
                               placeholder="Email">
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="signup-username" type="text" class="form-control"
                               name="${securityConfig.apf.usernameParameter}" value="" placeholder="Nombre y apellidos">
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
                        <input id="signup-userphone" type="text" class="form-control" name="telefono" value=""
                               placeholder="Teléfono">
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                        <input id="signup-usercellphone" type="text" class="form-control" name="movil" value=""
                               placeholder="Teléfono móvil">
                    </div>

                    <div class="input-group" style="margin-bottom: 25px">
                        <div class="checkbox">
                            <label>
                                <input id="signup-whatsapp" type="checkbox" name="whatsapp"
                                       value="1"> Notificarme por Whatsapp
                            </label>
                        </div>
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="signup-password" type="password" class="form-control"
                               name="${securityConfig.apf.passwordParameter}" placeholder="Contraseña">
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="signup-password2" type="password" class="form-control"
                               name="password2" placeholder="Confirmar contraseña">
                    </div>

                    <div class="input-group" style="margin-bottom: 25px">
                        <div class="checkbox">
                            <label>
                                <input id="signup-terms" type="checkbox" name="terms"
                                       value="1"> Acepto los términos y condiciones
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-md-9">
                            <button id="btn-signup" type="submit" class="btn btn-info save"
                                    name="create">Enviar</button>
                        </div>
                    </div>

                </form>

            </div>
        </div>

    </div>
</div>
</body>
</html>