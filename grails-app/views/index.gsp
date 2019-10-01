<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Multikirolak</title>
    <asset:javascript src="application.js"/>

</head>
<body>

<g:render template="/navbar"/>

<div class="svg" role="presentation">
    <div class="grails-logo-container">
        <g:img dir="images" file="multikirolak.jpg" class="img-responsive grails-logo" style="margin: 0 auto"/>
    </div>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>Próximas Actividades</h1>
        <div class="grid-container" id="grid-actividades-home">
        <g:render template="listaEventos" model="[eventList: eventList]"/>
        </div>
    </section>
</div>

</body>
</html>
