<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src='application.css'/>
</head>

<body>

<content tag="nav">
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
</content>

<div class="container">
    <div id="signupbox" style="margin-top:50px"
         class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Mi Cuenta</div>
            </div>

            <div class="panel-body">
                <form id="signupform" class="form-horizontal" onsubmit="return validatePassword()"
                      role="form" action="/multikirola/user/update" method="post">

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
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="signup-username" type="text" class="form-control"
                               name="${securityConfig.apf.usernameParameter}" value="${this.user?.username}"
                               placeholder="Nombre de usuario" readonly>
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="signup-useremail" type="text" class="form-control" name="email"
                               value="${this.user?.email}"
                               placeholder="Email">
                    </div>


                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
                        <input id="signup-userphone" type="text" class="form-control" name="telefono"
                               value="${this.user?.telefono}"
                               placeholder="Teléfono">
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                        <input id="signup-usercellphone" type="text" class="form-control" name="movil"
                               value="${this.user?.movil}"
                               placeholder="Teléfono móvil">
                    </div>

                    <div class="input-group" style="margin-bottom: 25px">
                        <div class="checkbox">
                            <label>
                                <input id="signup-whatsapp" type="checkbox" name="whatsapp"
                                       value="${this.user?.whatsapp}">
                                %{--<input id="signup-whatsapp" type="checkbox" name="whatsapp" value="1"> --}%
                                Notificarme por Whatsapp
                            </label>
                        </div>
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password" type="password" class="form-control"
                               name="${securityConfig.apf.passwordParameter}" placeholder="Nueva Contraseña">
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password2" type="password" class="form-control"
                               name="password2" placeholder="Confirmar contraseña">
                    </div>

                    %{-- <div class="input-group" style="margin-bottom: 25px">
                        <div class="checkbox">
                            <label>
                                <input id="signup-terms" type="checkbox" name="terms"
                                       value="1"> Acepto los términos y condiciones
                            </label>
                        </div>
                    </div>--}%

                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-md-9">
                            %{--<button id="btn-signup" type="submit" class="btn btn-info save"
                                    name="update" value="Actualizar">Actualizar</button>--}%
                    <input id="btn-signup" type="submit" class="btn btn-info save"
                            name="update" value="Actualizar"/>
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>
<g:javascript>
    function validatePassword() {
        var pass1 = $('#password').val();
        var pass2 = $('#password2').val();

        if (pass1 === pass2){
            return true;
        }else {
            alert('Las contraseñas no coinciden');
            return false;
        }
    }
</g:javascript>
</body>

</html>