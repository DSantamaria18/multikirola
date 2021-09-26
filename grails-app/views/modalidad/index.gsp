<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'modalidad.label', default: 'Modalidad')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER"/>
<body>
<g:render template="/navbar"/>
<a href="#list-modalidad" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
     %{--   <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>--}%
    </ul>
</div>

<div id="list-modalidad" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.modalidades"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:table collection="${modalidadList}"/>

    <div class="pagination">
        <g:paginate total="${modalidadCount ?: 0}"/>
    </div>
</div>
</body>
</html>