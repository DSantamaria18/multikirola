<!doctype html>
<html>
<head>
    <title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="main">
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>

<body>
<g:if env="development">
    <g:if test="${Throwable.isInstance(exception)}">
        <g:renderException exception="${exception}"/>
    </g:if>
    <g:elseif test="${request.getAttribute('javax.servlet.error.exception')}">
        <g:renderException exception="${request.getAttribute('javax.servlet.error.exception')}"/>
    </g:elseif>
    <g:else>
        <ul class="errors">
            <li>An error has occurred</li>
            <li>Exception: ${exception}</li>
            <li>Message: ${message}</li>
            <li>Path: ${path}</li>
        </ul>
    </g:else>
</g:if>
<g:else>
    <ul class="errors">
        <li>An error has occurred</li>
    </ul>

    <h1>Grails Runtime Exception</h1>

    <h2>Error Details</h2>

    <div class="message">
        <strong>Error ${request.'javax.servlet.error.status_code'}:</strong>
        ${request.'javax.servlet.error.message'.encodeAsHTML()}<br/>
        <strong>Servlet:</strong> ${request.'javax.servlet.error.servlet_name'}<br/>
        <strong>URI:</strong> ${request.'javax.servlet.error.request_uri'}<br/>
        <g:if test="${exception}">
            <strong>Exception Message:</strong> ${exception.message?.encodeAsHTML()} <br/>
            <strong>Caused by:</strong> ${exception.cause?.message?.encodeAsHTML()} <br/>
            <strong>Class:</strong> ${exception.className} <br/>
            <strong>At Line:</strong> [${exception.lineNumber}] <br/>
            <strong>Code Snippet:</strong><br/>

            <div class="snippet">
                <g:each var="cs" in="${exception.codeSnippet}">
                    ${cs?.encodeAsHTML()}<br/>
                </g:each>
            </div>
        </g:if>
    </div>

    <g:if test="${exception}">
        <div class="message">
            <h2>Stack Trace</h2>

            <div class="stack">
                <pre><g:each in="${exception.stackTraceLines}">${it.encodeAsHTML()}<br/></g:each></pre>
            </div>
        </div>
    </g:if>
</g:else>
</body>
</html>
