<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Document List</title>
    <asset:javascript src="ficheros.js"/>
</head>

<body>
<g:render template="/navbar"/>

<div class="container">
    <div class="content scaffold-list" role="main">
        <h1><g:message code="default.label.ficheros"/></h1>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div id="success"></div>

        <div class="table table-responsive">
            <table>
                <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Tamaño (KB)</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${fileList}" status="i" var="file">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" id="fichero" data-nombre="${file.nombre.decodeURL()}">
                        <td>
                            <span class="pull-left">
                                <g:link action="downloadFile"
                                        params='[fileId: file.nombre.replace(".", "###")]'>
                                    <input type="button" class="btn btn-sm btn-info"
                                           value="${file.nombre.decodeURL()}"/>
                                </g:link>
                            </span>
                        </td>
                        <td>
                            <span>
                                <label>${file.tamaño.decodeURL()}</label>
                            </span>
                        </td>
                        <td>
                            <span style="padding-left: 10px;">
                                <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MANAGER">
                                    <g:link class="delete"
                                            action="deleteFile"
                                            params='[fileId: file.nombre.replace(".", "###")]'>
                                        <input type="button" class="btn btn-danger" value="Borrar"
                                               onclick="return confirm('El fichero se borrará. ¿Estás seguro/a?');"/>
                                    </g:link>
                                </sec:ifAnyGranted>
                            </span>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MANAGER">
            <div class="container">
                <div class="col-md-8 col-md-offset-2">
                    <h3>Subir Fichero</h3>

                    <form method="POST" action="#" enctype="multipart/form-data">
                        <div class="form-group">
                            <div class="input-group input-file" name="infoFiles">
                                <span class="input-group-btn">
                                    <button class="btn btn-warning btn-choose" type="button"
                                            onclick="buscar()">Buscar</button>
                                </span>
                                <input type="text" class="form-control" id="FileNameInput"
                                       placeholder='Selecciona un fichero...' readonly/>
                                <span class="input-group-btn">
                                    <g:actionSubmit class="btn btn-primary" value="Subir" action="uploadFile"/>
                                </span>
                                <input type="file" class="form-control" id="FileUpload" name="FileUpload"
                                       onchange="copyFileName()"
                                       style="visibility:hidden" ;/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </sec:ifAnyGranted>
    </div>
</div>

</body>
</html>