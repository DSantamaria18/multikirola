<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src='application.css'/>
</head>

<body>

<g:render template="/navbar"/>

%{--<content tag="nav">
    <sec:ifAnyGranted roles='ROLE_ADMIN'>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Application Status <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>
                <li><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>
                <li><a href="#">App version:
                    <g:meta name="info.app.version"/></a>
                </li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Grails version:
                    <g:meta name="info.app.grailsVersion"/></a>
                </li>
                <li><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
                <li><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>
            </ul>
        </li>
    </sec:ifAnyGranted>

    <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MANAGER, ROLE_USER'>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Multikirola<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link class="list" controller="Curso" action="index">Cursos</g:link></li>
                <li><g:link class="list" controller="Centro" action="index">Centros</g:link></li>
            </ul>
        </li>
    </sec:ifAnyGranted>

    <sec:ifAnyGranted roles='ROLE_ADMIN'>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">Seguridad<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li class="controller"><g:link controller="User" action="index">Usuarios</g:link></li>
                <li class="controller"><g:link controller="Role" action="index">Roles</g:link></li>
                <li class="controller"><g:link controller="UserRole" action="index">Roles-Usuarios</g:link></li>
            </ul>
        </li>
    </sec:ifAnyGranted>

    <sec:ifLoggedIn>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">
                <i class="glyphicon glyphicon-user"></i>
                <sec:username/>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><g:link controller='user' action="miCuenta">Mi Cuenta</g:link></li>

                <li><g:link controller='logout'>Cerrar Sesión</g:link></li>
            </ul>
        </li>
    </sec:ifLoggedIn>

    <sec:ifNotLoggedIn><li><g:link controller='login'>Identificarse</g:link></li></sec:ifNotLoggedIn>
</content>--}%

<div class="container">
    <div id="signupbox" style="margin-top:50px"
         class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Registro</div>
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
                        <input id="username" type="text" class="form-control"
                               name="${securityConfig.apf.usernameParameter}" value=""
                               placeholder="Nombre de usuario"
                               onchange="$('.error').attr('hidden', true);"/>
                    </div>
                    <div>
                        <label id="error-username" class="error" style="color: red" hidden>ERROR!!!</label>
                    </div>
                    %{--<div style="margin-bottom: 20px" class="input-group">--}%


                    %{--<div style="margin-bottom: 20px" class="input-group">--}%
                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="useremail" type="text" class="form-control"
                               name="email" value="" placeholder="Email"
                               onchange="$('.error').attr('hidden', true); "/>
                    </div>
                    <div>
                        <label id="error-email" class="error" style="color: red" hidden>ERROR!!!</label>
                    </div>

                    %{--<div style="margin-bottom: 20px" class="input-group">--}%
                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
                        <input id="userphone" type="text" class="form-control" name="telefono" value=""
                               placeholder="Teléfono" onchange="$('.error').attr('hidden', true); "/>
                    </div>
                    <div>
                        <label id="error-userphone" class="error" style="color: red" hidden>ERROR!!!</label>
                    </div>

                    %{--<div class="input-group">--}%
                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                        <input id="usercellphone" type="text" class="form-control" name="movil" value=""
                               placeholder="Teléfono móvil" onchange="$('.error').attr('hidden', true); "/>
                    </div>
                    <div>
                        <label id="error-usercellphone" class="error" style="color: red" hidden>ERROR!!!</label>
                    </div>

                    <div class="input-group" style="margin-bottom: 10px">
                        <div class="checkbox">
                            <label>
                                <g:checkBox id="whatsapp" name="whatsapp"
                                            value="${this.user?.whatsapp}"/> Notificadme por Whatsapp
                            </label>
                        </div>
                    </div>
                    <div>
                        <label id="error-whatsapp" class="error" style="color: red" hidden>ERROR!!!</label>
                    </div>

                    <div style="margin-top: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password" type="password" class="form-control"
                               name="${securityConfig.apf.passwordParameter}"
                               placeholder="Contraseña" onchange="$('.error').attr('hidden', true); "/>
                    </div>
                    <div>
                        <label id="error-password" class="error" style="color: red" hidden>ERROR!!!</label>
                    </div>

                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password2" type="password" class="form-control"
                               name="password2" placeholder="Confirmar contraseña"
                               onchange="$('.error').attr('hidden', true);"/>
                    </div>
                    <div>
                        <label id="error-password2" class="error" style="color: red" hidden>ERROR!!!</label>
                    </div>

                    <div style="margin-top: 20px" class="input-group">
                        <div class="checkbox">
                            <label>
                                %{--<input id="legal" type="checkbox" name="terms"
                                       value="1" onchange="$('.error').attr('hidden', true); "/> He leído y acepto los <a href="#" target="_blank"> Términos y Condiciones </a> y la <a href="#" target="_blank">Política de Privacidad</a> .--}%
                                <g:checkBox id="legal" name="terms"/>
                                He leído y acepto los <a href="#" target="_blank"> Términos y Condiciones </a> y la <a href="#" target="_blank">Política de Privacidad</a>
                            </label>
                        </div>
                    </div>
                    <div>
                        <label id="error-legal" class="error" style="color: red" hidden>ERROR!!!</label>
                    </div>

                    <div class="form-group" style="margin-top: 20px">
                        <!-- Button -->
                        <div class="col-md-9">
                            <input id="btn-signup" type="submit" class="btn btn-info save"
                                   name="register" value="Enviar"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>