<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'modalidad.label', default: 'Modalidad')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER"/>
<body>
<g:render template="/navbar"/>
<a href="#show-modalidad" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.modalidades"
                                                           args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-modalidad" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="caption">
        <h1 class="text-center text-uppercase"><strong>${this.modalidad?.nombre}</strong></h1>

        <img src='${createLink(controller: "modalidad", action: "renderModalidadImage", params: [img: "${this.modalidad.id}.jpg"])}'
             alt="actividad" class="img-modalidad"/>

        <g:form resource="${this.modalidad}" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${this.modalidad}"><g:message
                        code="default.button.editModalidad.label"
                        default="Cambiar imagen"/></g:link>
            </fieldset>
        </g:form>
    </div>
</body>
</html>
