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

    .inscribir-push {
        display: inline-flex;
        flex-flow: row;
        /*background: #2e6da4;*/
        margin-left: auto
    }

    .eliminar-push {
        display: inline-flex;
        flex-flow: row;
        /*background: #2e6da4;*/
        margin-left: auto
    }

    .inscribir-link {
        text-decoration: none;
    }

    .inscribir-span {
        line-height: 100px;
        padding: 15px;
        color: white;
        font-size: xx-large;
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

<div id="list-eventos" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:if test="${eventList.size() > 0}">
        <h1 class="text-center">Próximas actividades de ${eventList[0]?.modalidad}</h1>

        <div class="list-group list-event">
            <g:each in="${eventList}" var="evento" status="i">
            %{--<a href="#" eventId="${evento?.id}" class="list-group-item" style="text-decoration: none">
                <h4>${evento?.tipo_actividad}</h4><br/>
                <span><label>FECHA:</label></span>
                <span><g:formatDate date="${evento.fecha}"/></span>
                <span>${evento?.horario}</span><br />
                --}%%{--<span>${evento.modalidad}</span><br/>--}%%{--
                --}%%{--<span><label>ACTIVIDAD:</label></span>--}%%{--

                <span><label>LUGAR:</label></span>
                <span>${evento?.lugar}</span>
                <span>${evento?.recinto}</span>
                <span>${evento?.instalacion}</span><br/>
            </a>--}%
                <div class="panel panel-info list-event-item" eventId="${evento?.id}">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">${evento?.tipo_actividad}</h3>
                    </div>

                    <div class="list-event-row">
                        <div class="panel-body">
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

                        <div class="push inscribir-push btn btn-primary push">
                            <a href="#modal-participante" class="inscribir-link btn" data-toggle="modal"
                               data-target="#modal-participante" aria-labelledby="modal-participante"
                               aria-hidden="true" data-event="${evento.id}" onclick="passEvent(this)">
                                %{--<i class="glyphicon glyphicon-plus-sign inscribir-span"></i>--}%
                                <i class="glyphicon glyphicon-plus inscribir-span"></i>
                            </a>

                        </div>
                    </div>

                    <div class="panel-footer">
                        %{--<g:if test="${participantesEventoList?.size() > 0}">--}%
                        %{--<g:each in="${participantesEventoList}" var="participante">--}%

                        <div class="participante-row" style="display: flex">
                            <div class="participante-datarow">
                                <i class="glyphicon glyphicon-user"></i>
                                <span class="text-capitalize">paco</span>
                                %{--<span class="text-capitalize">${participante.nombre}</span>--}%
                                <span class="text-capitalize">porras</span>
                                %{--<span class="text-capitalize">${participante.apellido1}</span>--}%
                                <span class="text-capitalize">perez</span>
                                %{--<span class="text-capitalize">${participante?.apellido2}</span>--}%
                            </div>

                            <div class="btn btn-danger push eliminar-push">
                                <i class="glyphicon glyphicon-remove"></i>
                            </div>
                        </div>
                        %{--</g:each>--}%
                        %{--</g:if>--}%
                    </div>
                </div>
            </g:each>
        </div>

    </g:if>
    <g:else>
        <h1>No hay eventos programados para esta actividad...</h1>
    </g:else>

</div>


<div id="modal-participante" class="modal fade" role="dialog" tabindex="-1" aria-labelledby="modal-participante"
     aria-hidden="true">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <input type="hidden" name="eventId" id="eventId"/>
            <g:if test="${participantesList?.size() > 0}">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <h1 class="modal-title">Selecciona un participante</h1>
                </div>

                <div class="modal-body modal-participante-body list-group">

                    <g:each in="${participantesList}" var="participante" status="i">
                        <div class="modal-participante-item list-group-item"
                             style="display: flex;justify-content: space-evenly;">
                            <div class="modal-participante-item-data" style="display: block;">
                                <div class="modal-participante-item-nombre">
                                    <g:checkBox name="checkbox-participante" value="${participante.id}"/>
                                    <span class="text-capitalize">${participante.nombre} ${participante.apellido1} ${participante?.apellido2}</span>
                                </div>

                                <div class="modal-participante-item-data">
                                    <span class="telefono">
                                        <i class="glyphicon glyphicon-earphone">${participante?.telefono}</i>
                                    </span>
                                    <span class="movil">
                                        <i class="glyphicon glyphicon-phone">${participante?.movil}</i>
                                    </span>
                                </div>
                            </div>

                            <div class="modal-participante-item-edit">
                            %{-- <a href="#modal-edit-participante" class="btn btn-primary" data-toggle="modal"
                                data-target="#modal-edit-participante" aria-labelledby="modal-edit-participante"
                                aria-hidden="true">
                                 <i class="glyphicon glyphicon-pencil"></i>
                             </a>--}%
                            %{--<a href="#" class="btn btn-primary" paticipanteId="${participante.id}" id="edit-participante"
                               data-participanteid="${participante.id}">
                                <i class="glyphicon glyphicon-pencil"></i>
                            </a>--}%

                                <g:link controller="participante" action="edit" params="[id: participante.id]"
                                        class="btn btn-primary">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                </g:link>
                            </div>

                        </div>

                    </g:each>

                </div>

                <div class="modal-footer">
                    <h1 class="lead text-left">Por favor, revisa que los datos de contacto de los participantes son correctos</h1>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <input type="button" class="btn btn-primary" data-dismiss="modal" id="apuntar-btn" value="Apuntar"
                           onclick="apuntarParticipantes(this)"/>
                </div>
            </g:if>
            <g:else>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <span>
                    <h1 class="lead text-left" style="padding-left: 20px">
                        Es necesario iniciar sesión para poder inscribirse en la actividad.
                    </h1>
                </span>

                <div style="display: flex; justify-content: center">
                    <a class="btn btn-primary" href="/multikirola/login/auth"
                       style="text-decoration: none; margin-bottom: 10px">Iniciar Sesión</a>
                </div>

                <div class="modal-footer"></div>

            </g:else>
        </div>

    </div>
</div>


%{--<div id="modal-edit-participante" class="modal fade" role="dialog" tabindex="-1"
     aria-labelledby="modal-edit-participante"
     aria-hidden="true">
    <div class="modal-dialog modal-edit-participante-dialog">

        <!-- Modal content-->
        <div class="modal-content modal-edit-participante-content">
            <div class="modal-header modal-edit-participante-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>

                <h1 class="modal-title modal-edit-participante">Selecciona un participante</h1>
            </div>

            <div class="modal-body modal-edit-participante-body">
                <form class="form-inline">
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></div>
                            <input type="tel" class="form-control" id="telefono" value=$('').text()>
                            </div>
                        </div>
                </form>
            </div>

            <div class="modal-footer modal-edit-participante-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Volver</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Guardar</button>
            </div>
        </div>

    </div>
</div>--}%

</body>



