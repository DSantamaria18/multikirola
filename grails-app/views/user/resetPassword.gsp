<!DOCTYPE html>
<html lang="${locale}">
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src='application.css'/>
</head>

<body>
<g:render template="/navbar"/>
<div class="container">
    <div id="resetPasswordBox" style="margin-top:50px"
         class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title"><g:message code="default.title.resetPassword"/></div>
            </div>

            <div class="panel-body">
                <form id="reset-password-form" class="form-horizontal" onsubmit="return validateForm()"
                      role="form" action="/multikirola/user/update" method="post">

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

                    <input id="token" type="hidden"
                           name="resetPasswordToken"
                           value="${token}"/>


                    <!-- PASSWORD -->
                    <div id="password-group">
                        <div style="margin-top: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password" type="password" class="form-control"
                                   name="password"
                                   %{--name="${securityConfig.apf.passwordParameter}"--}%
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
                        <div class="col-md-9">
                            <input id="btn-myaccount" type="submit" class="btn btn-info save"
                                   name="register"
                                   value="<g:message code="default.label.actualizar"/>"/>
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>
</body>
</html>