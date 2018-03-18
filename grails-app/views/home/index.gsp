<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Multikirolak</title>

</head>

<body>

<g:render template="/navbar"></g:render>


<div class="svg" role="presentation">
    <div class="multikirolak-logo-container">
        <g:img dir="images" file="multikirolak.jpg" class="img-responsive home-img-multikirola" style="margin: 0 auto"/>
    </div>
</div>

<g:if test="${eventList.size() > 0}">
    <div id="content" role="main">
        <section class="row ">
            <h1>Próximas Actividades</h1>

            <div class="grid-container" id="grid-actividades-home">
                <g:each in="${eventList}" var="evento" status="i">
                    <div class="grid-item" id="${evento.id}" modalidad-id="${evento.modalidad_id}">
                        <g:fichaEvento event="${evento}"/>
                    </div>
                </g:each>
            </div>
        </section>
    </div>
</g:if>
</body>

</html>
