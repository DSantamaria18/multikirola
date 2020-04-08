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
                <div class="panel-title"><g:message code="default.label.reset"/></div>
            </div>

            <div class="panel-body">
                <form id="signup-form" class="form-horizontal" role="form" onsubmit="return validateForm()"
                      action="/user/forgotPassword" method="post">

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
                            <g:if test="${this.user.errors?.getFieldError('username').getCode() == 'unique'}">
                                <li data-field-id="${error.field}>
                                <g:message code="register.user.duplicated"
                                           args="${[this.user.errors?.getFieldError('username').getRejectedValue()]}"
                                           default="El usuario ${this.user.errors?.getFieldError('username').getRejectedValue()} ya existe"/>
                                </li>
                            </g:if>
                            <g:else>
                                <li <g:if
                                    test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                    error="${error}"/></li>
                            </g:else>
                        </g:eachError>
                        </ul>
                    </g:hasErrors>

                    <input id="username" type="hidden"
                           name="${securityConfig.apf.usernameParameter}"
                           value=""/>

                    <div style="margin-top: 10px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                        <input id="useremail" type="text" class="form-control"
                               name="email" value=""
                               placeholder="<g:message code="default.label.correoElectronico"/>"
                               onchange="$('.error').attr('hidden', true); "/>
                    </div>

                    <div>
                        <label id="error-email" class="error" style="color: red" hidden><g:message
                                code="default.error.email"/></label>
                    </div>

                    <div class="form-group" style="margin-top: 20px">
                        <!-- Button -->
                        <div class="col-md-9">
                            <input id="btn-password-recovery" type="submit" class="btn btn-info save"
                                   name="passwordRecoveryBtn" value="<g:message code="default.label.enviar"/>"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>