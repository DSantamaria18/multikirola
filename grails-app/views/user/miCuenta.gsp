<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src='application.css'/>

    <style>
    /* Icon when the collapsible content is shown */
    .btn:after {
        font-family: "Glyphicons Halflings";
        content: "\e114";
        float: right;
        margin-left: 15px;
    }

    /* Icon when the collapsible content is hidden */
    .btn.collapsed:after {
        content: "\e080";
    }
    </style>

    <asset:javascript src="miCuenta.js"/>
</head>

<body>

<g:render template="/navbar"/>

<div class="container">
    <div id="signupbox" style="margin-top:50px"
         class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title"><g:message code="default.label.micuenta"/></div>
            </div>

            <div class="panel-body">
                <form id="myaccount-form" class="form-horizontal" onsubmit="return validateForm()"
                      role="form" action="/multikirola/user/update" method="post">

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

                    <input id="username" type="hidden"
                           name="${securityConfig.apf.usernameParameter}"
                           value="${this.user?.username}"/>

                    <div style="margin-top: 20px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="nombre" type="text" class="form-control" data-toggle="tooltip-user"
                               title="Tu nombre" name="nombre"
                               value="${this.user?.nombre}"
                               placeholder="<g:message code="default.label.nombreUsuario"/>"
                               onchange="$('.error').attr('hidden', true);"/>
                        <input id="apellidos" type="text" class="form-control" data-toggle="tooltip-user"
                               title="Tus apellidos" name="apellidos"
                               value="${this.user?.apellidos}"
                               placeholder="<g:message code="default.label.apellidosUsuario"/>"
                               onchange="$('.error').attr('hidden', true);"/>
                    </div>

                    <div>
                        <label id="error-nombre" class="error" style="color: red" hidden><g:message
                                code="default.error.nombreUsuario"/></label>
                        <label id="error-caracteresUsername" class="error" style="color: red" hidden><g:message
                                code="default.error.caracteresNombreUsuario"/></label>
                        <label id="error-apellidos" class="error" style="color: red" hidden><g:message
                                code="default.error.apellidos"/></label>
                        <label id="error-caracteresApellidos" class="error" style="color: red" hidden><g:message
                                code="default.error.caracteresApellidos"/></label>
                    </div>

                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="useremail" type="text" class="form-control"
                               name="email"
                               placeholder="<g:message code="default.label.correoElectronico"/>"
                               value="${this.user?.email}"
                               onchange="$('.error').attr('hidden', true); " readonly/>
                    </div>

                    <div>
                        <label id="error-email" class="error" style="color: red" hidden>ERROR!!!</label>
                    </div>

                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                        <input id="usercellphone" type="text" class="form-control" name="movil"
                               value="${this.user?.movil}"
                               placeholder="<g:message code="default.label.telefonoMovil"/>"
                               onchange="$('.error').attr('hidden', true); "/>
                    </div>

                    <div>
                        <label id="error-usercellphone" class="error" style="color: red" hidden>ERROR!!!</label>
                    </div>

                    <div class="input-group" style="margin-bottom: 10px">
                        <div class="checkbox">
                            <label>
                                <g:checkBox id="whatsapp" name="whatsapp"
                                            value="${this.user?.whatsapp}"/>
                                <g:message code="default.label.notificadmeWhatsapp"/>
                            </label>
                        </div>
                    </div>

                    <div>
                        <label id="error-whatsapp" class="error" style="color: red" hidden>ERROR!!!</label>
                    </div>

                    <!-- PASSWORD -->
                    <button type="button" class="btn collapsed" data-toggle="collapse"
                            data-target="#password-group"><g:message
                            code="default.label.actualizarContrasena"/></button>

                    <div id="password-group" class="collapse">
                        <div style="margin-top: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password" type="password" class="form-control"
                                   name="${securityConfig.apf.passwordParameter}"
                                   placeholder="<g:message code="default.label.nuevaContrasena"/>"
                                   onchange="$('.error').attr('hidden', true); "/>
                        </div>

                        <div>
                            <label id="error-password" class="error" style="color: red" hidden>ERROR!!!</label>
                        </div>

                        <div style="margin-top: 10px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password2" type="password" class="form-control"
                                   name="password2"
                                   placeholder="<g:message code="default.label.confirmarContrasena"/>"
                                   onchange="$('.error').attr('hidden', true);"/>
                        </div>

                        <div>
                            <label id="error-password2" class="error" style="color: red" hidden>ERROR!!!</label>
                        </div>
                    </div>


                    <div class="form-group" style="margin-top: 20px">
                        <!-- Button -->
                        <div class="row"></div>

                        <div class="col-md-6 mb-3">
                            <input id="btn-myaccount" type="submit" class="btn btn-info save"
                                   name="register"
                                   value="<g:message code="default.label.actualizar"/>"/>
                        </div>

                        <br/>

                        <div class="col-md-6 mb-3">
                            <input id="btn-borrar-cuenta" type="button" class="btn btn-danger delete"
                                   name="borrar-cuenta" data-toggle="modal" data-target="#modal-eliminar-cuenta"
                                   value="<g:message code="micuenta.button.borrarCuenta" default="Eliminar cuenta"/>"/>
                        </div>
                    </div
            </div>

        </form>

        </div>
    </div>
</div>
</div>

<!-- Modal -->
<div id="modal-eliminar-cuenta" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><g:message code="micuenta.modal.eliminarCuenta.header"
                                                   default="Eliminar Cuenta"/></h4>
            </div>

            <div class="modal-body">
                <p><g:message code="micuenta.modal.eliminarCuenta.texto"
                              default="Sabes que se borrará tu cuenta, no?"/></p>
            </div>

            <div class="modal-footer">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input"
                           id="check-modal-eliminar-cuenta"
                            onchange="modalButtonEnable()">
                    <label class="custom-control-label" for="check-modal-eliminar-cuenta">
                        <g:message code="micuenta.modal.check.label" default="Sí, estoy seguro"/>
                    </label>
                </div>
                <button type="button" id="btn-modal-eliminar-cuenta" class="btn btn-danger"
                        data-dismiss="modal" disabled onclick="borrarCuenta()">
                    <g:message code="default.label.enviar"/>
                </button>
            </div>
        </div>

    </div>
</div>
</body>

</html>