<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Eventos Fútbol Sala</title>

    <style>
    .list-event {
        margin: 2%;
    }

    .panel-heading {
        display: block;
    }

    .list-event-row {
        display: flex;
    }

    .panel-body {
        display: block;
    }

    /*.inscribir-push {
        display: inline-flex;
        flex-flow: row;
        !*background: #2e6da4;*!
        margin-left: auto
    }*/

    .eliminar-push {
        display: inline-flex;
        flex-flow: row;
        /*background: #2e6da4;*/
        margin-left: auto
    }

    .inscribir-link {
        text-decoration: none;
        color: white;
    }

    .inscribir-span {
        line-height: 100px;
        padding: 15px;
        color: white;
        font-size: xx-large;
    }

    .participante-row {
        display: flex;
        padding-bottom: 10px;
    }

    .link-evento {
        text-decoration: none;
    }

    @media only screen and (min-width: 600px) {
        .content {
            margin: 0% 25%;
        }
    }
    </style>
</head>

<body>

<g:render template="/navbar"/>

<div class="nav" role="navigation">
    <ul>
        %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>


<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<div id="list-eventos" class="content scaffold-list" role="main">

    <g:if test="${eventList.size() > 0}">
        <div class="list-event row" id="">
            <g:each in="${eventList}" var="evento" status="i">
               %{-- <div class="list-event-item thumbnail" eventId="${evento?.id}">
                    <g:link controller="actividadMultikirola" action="registrarParticipantes"  params="[eventId: evento.id]" class="link-evento" >
                        <g:img dir="images" file="${evento.modalidad_id}.jpg" class="img-responsive img-rounded"/>

                        <div class="caption">
                            <h1 class="text-center text-uppercase"><strong>${evento?.tipo_actividad}</strong></h1>

                            <p>
                            <div class="list-event-date">
                                <i class="glyphicon glyphicon-calendar"></i>
                                <span class="text-capitalize">
                                    <g:formatDate date="${evento.fecha}" format="EEEE dd-MMMM-yyyy" style="MEDIUM"/>
                                </span>
                            </div>

                            <div class="list-event-time">
                                <i class="glyphicon glyphicon-time"></i>
                                <span>${evento?.horario}</span><br/>
                            </div>

                            <div class="item-event-venue">
                                <i class="glyphicon glyphicon-map-marker"></i>
                                <span>${evento?.lugar}</span>
                                <span>${evento?.recinto}</span>
                                <span>${evento?.instalacion}</span><br/>
                            </div>

                        </div>

                    </g:link>
                </div>--}%
                <g:fichaEvento event="${evento}"/>
            </g:each>
        </div>

    </g:if>
    <g:else>
        <h1>No hay eventos programados para esta actividad...</h1>
    </g:else>

</div>

</body>



