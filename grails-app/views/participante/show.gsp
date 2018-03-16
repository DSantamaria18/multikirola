<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'participante.label', default: 'Participante')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-participante" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-participante" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <ol class="property-list participante">
        <g:if test="${participante?.id}">
            <li class="fieldcontain" hidden>
                <span id="id-label" class="property-label"><g:message code="participante.codigo.label"
                                                                      default="ID Participante:"/></span>
                <span class="property-value" aria-labelledby="id-label"><g:fieldValue
                        bean="${participante}"
                        field="id"/></span>
            </li>
        </g:if>

        <g:if test="${participante?.token}">
            <li class="fieldcontain">
                <span id="token-label" class="property-label"><g:message code="participante.token.label"
                                                                         default="ID Participante:"/></span>
                <span class="property-value" aria-labelledby="token-label"><g:fieldValue
                        bean="${participante}"
                        field="token"/></span>
            </li>
        </g:if>

        <g:if test="${participante?.nombre} && ${participante?.apellido1} && ${participante?.apellido2}">
            <li class="fieldcontain">
                <span id="nombre-label" class="property-label"><g:message code="participante.nombre.label"
                                                                          default="Nombre:"/></span>
                <span class="property-value" aria-labelledby="nombre-label">
                    <g:fieldValue bean="${participante}" field="nombre"/>
                    <g:fieldValue bean="${participante}" field="apellido1"/>
                    <g:fieldValue bean="${participante}" field="apellido2"/>
                </span>
            </li>
        </g:if>

        <g:if test="${participante?.fechaNacimiento}">
            <li class="fieldcontain">
                <span id="fechaNacimiento-label" class="property-label"><g:message
                        code="participante.fechaNacimiento.label"
                        default="Fecha de nacimiento:"/></span>
                <span class="property-value" aria-labelledby="fechaNacimiento-label">
                    <g:formatDate format="dd-MM-yyyy" date="${participante.fechaNacimiento}"/>
                </span>
            </li>
        </g:if>

        <g:if test="${participante?.sexo}">
            <li class="fieldcontain">
                <span id="sexo-label" class="property-label"><g:message code="participante.sexo.label"
                                                                        default="Sexo:"/></span>
                <span class="property-value" aria-labelledby="sexo-label"><g:fieldValue
                        bean="${participante}"
                        field="sexo"/></span>
            </li>
        </g:if>

        <g:if test="${participante?.telefono}">
            <li class="fieldcontain">
                <span id="telefono-label" class="property-label"><g:message code="participante.telefono.label"
                                                                            default="Teléfono:"/></span>
                <span class="property-value" aria-labelledby="telefono-label"><g:fieldValue
                        bean="${participante}"
                        field="telefono"/></span>
            </li>
        </g:if>

        <g:if test="${participante?.movil}">
            <li class="fieldcontain">
                <span id="movil-label" class="property-label"><g:message code="participante.movil.label"
                                                                         default="Móvil:"/></span>
                <span class="property-value" aria-labelledby="movil-label"><g:fieldValue
                        bean="${participante}"
                        field="movil"/></span>
            </li>
        </g:if>

        <g:if test="${participante?.email}">
            <li class="fieldcontain">
                <span id="email-label" class="property-label"><g:message code="participante.email.label"
                                                                         default="Email:"/></span>
                <span class="property-value" aria-labelledby="email-label"><g:fieldValue
                        bean="${participante}"
                        field="email"/></span>
            </li>
        </g:if>

        <g:if test="${participante?.centro}">
            <li class="fieldcontain">
                <span id="centro-label" class="property-label"><g:message code="participante.centro.label"
                                                                          default="Centro:"/></span>
                <span class="property-value" aria-labelledby="centro-label"><g:fieldValue
                        bean="${participante}"
                        field="centro"/></span>
            </li>
        </g:if>


        <g:if test="${participante?.curso}">
            <li class="fieldcontain">
                <span id="curso-label" class="property-label"><g:message code="participante.curso.label"
                                                                         default="Curso:"/></span>
                <span class="property-value" aria-labelledby="curso-label"><g:fieldValue
                        bean="${participante}"
                        field="curso"/></span>
            </li>
        </g:if>
    </ol>

    %{--<f:display bean="participante"/>--}%
    <g:form resource="${this.participante}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.participante}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
