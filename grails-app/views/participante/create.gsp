<%@ page import="multikirola.Curso" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'default.label.participante', default: 'Participante')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<g:render template="/navbar"/>

<a href="#create-participante" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                     default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                           args="[g.message(code: 'default.label.participante')]"/></g:link></li>
    </ul>
</div>

<div id="create-participante" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[g.message(code: 'default.label.participante')]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.participante}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.participante}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

%{-- <g:form resource="${this.participante}" method="POST">
     <fieldset class="form">
         <f:all bean="participante"/>
     </fieldset>
     <fieldset class="buttons">
         <g:submitButton name="create" class="save"
                         value="${message(code: 'default.button.create.label', default: 'Create')}"/>
     </fieldset>
 </g:form>--}%

    <div class="container">
        <g:form resource="${this.participante}" method="POST">
            <fieldset class="form">
                <div class="input-group">
                    <span class="input-group-addon"><g:message code="default.label.nombre"/></span>
                    <input id="nombre" type="text" class="form-control" name="participante.nombre" value=""
                           onchange="$('.error').attr('hidden', true);"/>
                </div>
                <br>

                <div class="input-group">
                    <span class="input-group-addon"><g:message code="default.label.apellido1"/></span>
                    <input id="apellido1" type="text" class="form-control" name="participante.apellido1" value=""
                           onchange="$('.error').attr('hidden', true);"/>
                </div>
                <br>

                <div class="input-group">
                    <span class="input-group-addon"><g:message code="default.label.apellido2"/></span>
                    <input id="apellido2" type="text" class="form-control" name="participante.apellido2" value=""
                           onchange="$('.error').attr('hidden', true);"/>
                </div>
                <br>

                <div class="input-group">
                    <span class="input-group-addon"><g:message code="default.label.centro"/></span>
                   <g:select name="participante.centro.id"
                             from="${ multikirola.Centro.list()}"
                             value="${participante?.centro?.id}"
                             optionValue="nombre"
                             optionKey="id"
                             noSelection="${['null': g.message(code: 'default.label.centro')]}"/>
                </div>
                <br>

                <div class="input-group">
                    <span class="input-group-addon"><g:message code="default.label.curso"/></span>
                    <g:select name="participante.curso.id"
                              from="${ multikirola.Curso.list()}"
                              value="${participante?.curso?.id}"
                              optionValue="nombre"
                              optionKey="id"
                              noSelection="${['null': g.message(code: 'default.label.curso')]}"/>

                </div>
                <br>

                <div class="input-group">
                    <!-- TODO: cambiar por combo de sexos -->
                    <span class="input-group-addon"><g:message code="default.label.sexo"/></span>
                    <g:select name="participante.sexo"
                              from="${['F', 'M']}"
                              valueMessagePrefix="default.label.sexo"
                              value="${participante?.sexo}"
                              noSelection="${['null': g.message(code: 'default.label.sexo')]}"/>
                </div>
                <br>

                <div class="input-group">
                    <span class="input-group-addon"><g:message code="default.label.movil"/></span>
                    <input id="movil" type="text" class="form-control" name="participante.movil" value=""
                           onchange="$('.error').attr('hidden', true);"/>
                </div>
                <br>

                <div class="input-group">
                    <span class="input-group-addon"><g:message code="default.label.telefono"/></span>
                    <input id="telefono" type="text" class="form-control" name="participante.telefono" value=""
                           onchange="$('.error').attr('hidden', true);"/>
                </div>
                <br>

                <div class="input-group">
                    <span class="input-group-addon">Email</span>
                    <input id="email" type="text" class="form-control" name="participante.email" value=""
                           onchange="$('.error').attr('hidden', true);"/>
                </div>
                <br>

                <div class="input-group">
                    <span class="input-group-addon"><g:message code="default.label.fechaNacimiento"/></span>
                    <input id="fechaNacimiento" type="date" class="form-control" name="participante.fechaNacimiento" value=""
                           onchange="$('.error').attr('hidden', true);"/>
                </div>
                <br>
                <div class="form-group">
                    <input id="btn-myaccount" type="submit" class="btn btn-info save"
                           name="register"
                    %{--value="Actualizar"/>--}%
                           value="<g:message code="default.button.create.label"/>"/>
                </div>
            </fieldset>
        %{--<fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>--}%

        </g:form>
    </div>
</div>
</body>
</html>
