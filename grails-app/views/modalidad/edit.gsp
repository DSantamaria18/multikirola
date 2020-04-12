<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'default.label.modalidad', default: 'Modalidad')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER"/>
<body>
<a href="#edit-modalidad" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.modalidades"/></g:link></li>
    </ul>
</div>

<div id="edit-modalidad" class="content scaffold-edit" role="main">
    <h1 class="text-uppercase"><strong>${this.modalidad?.nombre}</strong></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.modalidad}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.modalidad}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <fieldset class="form">

        <form method="POST" action="#" enctype="multipart/form-data">
            <g:hiddenField name="modalidad-id" id="modalidad-id"/>
            <input type="file" id="imagen" name="imagen">
            <g:actionSubmit class="btn btn-primary"
                            value="${message(code: 'default.button.updateModalidad', default: 'Actualizar imagen')}"
                            action="uploadImage"/>
        </form>
    </fieldset>
</div>
</body>
</html>
