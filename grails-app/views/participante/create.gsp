<%@ page import="multikirola.Curso" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'default.label.participante', default: 'Participante')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<g:render template="/navbar"/>

<a href="#create-participante" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                     default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                           args="[g.message(code: 'default.label.participante')]"/></g:link></li>
    </ul>
</div>

<div id="create-participante" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[g.message(code: 'default.label.participante')]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.participante}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.participante}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <div class="container">
        <g:form resource="${this.participante}" method="POST">
            <fieldset class="form">
                <div class="input-group" id="div-nombre">
                    <span class="input-group-addon"><g:message code="default.label.nombre"/></span>
                    <input id="nombre" type="text" class="form-control" name="participante.nombre" value=""
                           onchange="$('#div-nombre').removeClass('has-error')"/>
                </div>
                <br>

                <div class="input-group" id="div-apellido1">
                    <span class="input-group-addon"><g:message code="default.label.apellido1"/></span>
                    <input id="apellido1" type="text" class="form-control" name="participante.apellido1" value=""
                           onchange="$('#div-apellido1').removeClass('has-error')"/>
                </div>
                <br>

                <div class="input-group" id="div-apellido2">
                    <span class="input-group-addon"><g:message code="default.label.apellido2"/></span>
                    <input id="apellido2" type="text" class="form-control" name="participante.apellido2" value=""
                           onchange="$('#div-apellido2').removeClass('has-error')"/>
                </div>
                <br>

                <div class="input-group" id="div-centro">
                    <span class="input-group-addon"><g:message code="default.label.centro"/></span>
                    <g:select name="participante.centro.id"
                              from="${multikirola.Centro.list()}"
                              value="${participante?.centro?.id}"
                              optionValue="nombre"
                              optionKey="id"
                              noSelection="${['null': g.message(code: 'default.label.centro')]}"/>
                </div>
                <br>

                %{--<div class="input-group" id="div-curso">
                    <span class="input-group-addon"><g:message code="default.label.curso"/></span>
                    <g:select name="participante.curso.id"
                              from="${multikirola.Curso.list()}"
                              value="${participante?.curso?.id}"
                              optionValue="nombre"
                              optionKey="id"
                              noSelection="${['null': g.message(code: 'default.label.curso')]}"/>
                </div>
                <br>--}%

                <div class="input-group" id="div-sexo">
                    <span class="input-group-addon"><g:message code="default.label.sexo"/></span>
                    <g:select name="participante.sexo"
                              from="${['F', 'M']}"
                              valueMessagePrefix="default.label.sexo"
                              value="${participante?.sexo}"
                              noSelection="${['null': g.message(code: 'default.label.sexo')]}"/>
                </div>
                <br>

                <div class="input-group" id="div-movil">
                    <span class="input-group-addon"><g:message code="default.label.movil"/></span>
                    <input id="movil" type="text" class="form-control"
                           name="participante.movil" value="${this.participante?.movil}"
                           onchange="$('#div-movil').removeClass('has-error')"/>
                </div>
                <br>

                <div class="input-group" id="div-email">
                    <span class="input-group-addon">Email</span>
                    <input id="email" type="text" class="form-control"
                           name="participante.email" value="${this.participante?.email}"
                           onchange="$('#div-email').removeClass('has-error')"/>
                </div>
                <br>

                <div class="input-group" id="div-fecha">
                    <span class="input-group-addon"><g:message code="default.label.fechaNacimiento"/></span>
                    <input id="fechaNacimiento" type="date" class="form-control" name="participante.fechaNacimiento"
                           value=""
                           onchange="$('#div-fecha').removeClass('has-error')"/>
                </div>
                <br>

                <div class="form-group">
                    <input id="btn-myaccount" type="button" class="btn btn-info save"
                           name="register" value="<g:message code="default.button.create.label"/>"/>
                </div>

            </fieldset>

        </g:form>
    </div>
    <g:javascript>

    document.getElementsByName('register')[0].addEventListener('click', function () {
        let datosOK = validaDatosParticipante();
        if(datosOK){
            console.log("Creando participante");
            const nombre = $('#nombre').val();
            const apellido1 = $('#apellido1').val();
            const apellido2 = $('#apellido2').val();
            const centro = $('[name="participante.centro.id"]').val();
            const curso = $('[name="participante.curso.id"]').val();
            const sexo = $('[name="participante.sexo"]').val();
            const movil = $('#movil').val();
            const email = $('#email').val();
            const fechaNacimiento = new Date($('#fechaNacimiento').val()).toISOString();

            const datos = {
                nombre: nombre,
                apellido1: apellido1,
                apellido2: apellido2,
                centro: centro,
                curso: curso,
                sexo: sexo,
                movil: movil,
                email: email,
                fechaNacimiento: fechaNacimiento
            };

            $.post("/participante/save", datos,
                function (data, status) {
                    console.log(status);
                    window.location ="/participante/index" ;
                }
            );

            $.ajax({
                type: "POST",
                url: "/participante/save",
                data: datos,
                success: function(response) {
                  console.log(response);
                  window.location ="/participante/index" ;
                },
                error: function(error) {
                  console.log(error);
                  window.location ="/participante/create" ;
                }
            })

        }else {
            alert("${message(code: 'registro.participante.alerterror', default: 'Por favor, revisa los campos...')}");
        }
    });

    function validaDatosParticipante() {
        var validacionOK = true;
        validacionOK = validaNombre() && validaApellido1() && validaApellido2() && validaCentro() && validaCurso() && validaSexo() && validaMovil() && validaEmail() && validaFechaNacimiento();
        return validacionOK;
    }

    function validaNombre() {
        console.log("validando nombre");
        var formOk = true;
        var nombre = $('#nombre').val();
        console.log('Nombre: ' + nombre);
        if (nombre == "" || nombre == undefined) {
            $('#div-nombre').addClass('has-error');
            formOk = false;
        } else {
            const nombre_re = /^[a-zA-Z'ñÑ\-áéíóúÁÉÍÓÚàèìòùÀÈÌÒÙäëïöüÄËÏÖÜ\s]*$/;
            if (!nombre_re.test(nombre)) {
                $('#div-nombre').addClass('has-error');
                formOk = false;
            }
        }
        console.log(formOk);
        return formOk;
    }

    function validaApellido1() {
        console.log("validando apellido1");
        var formOk = true;
        var apellido1 = $('#apellido1').val();
        console.log('Apellido1: ' + apellido1);
        if (apellido1 == "" || apellido1 == undefined) {
            $('#div-apellido1').addClass('has-error');
            formOk = false;
        } else {
            const apellido1_re = /^[a-zA-Z'ñÑ\-áéíóúÁÉÍÓÚàèìòùÀÈÌÒÙäëïöüÄËÏÖÜ\s]*$/;
            if (!apellido1_re.test(apellido1)) {
                $('#div-apellido1').addClass('has-error');
                formOk = false;
            }
        }
        console.log(formOk);
        return formOk;
    }

    function validaApellido2() {
        console.log("validando apellido 2");
        var formOk = true;
        var apellido2 = $('#apellido2').val();
        console.log('Apellido2: ' + apellido2);
        const apellido2_re = /^[a-zA-Z'ñÑ\-áéíóúÁÉÍÓÚàèìòùÀÈÌÒÙäëïöüÄËÏÖÜ\s]*$/;
        if (apellido2.length > 0 && !apellido2_re.test(apellido2)) {
            $('#div-apellido2').addClass('has-error');
            formOk = false;
        }
        console.log(formOk);
        return formOk;
    }

    function validaCentro() {
        console.log("validando Centro");
        var formOk = true
        var centro = $('[name="participante.centro.id"]').val();
        if (centro == "null") {
            formOk = false;
            $('#div-centro').addClass('has-error');
        }
        return formOk;
    }

    document.getElementsByName('participante.centro.id')[0].addEventListener('change', function (){
        $('#div-centro').removeClass('has-error');
    });

    function validaCurso() {
        console.log("validando Curso");
        var formOk = true
        var curso = $('[name="participante.curso.id"]').val();
        if (curso == "null") {
            formOk = false;
            $('#div-curso').addClass('has-error');
        }
        return formOk;
    }

    document.getElementsByName('participante.curso.id')[0].addEventListener('change', function (){
        $('#div-curso').removeClass('has-error');
    });


    function validaSexo() {
        console.log("validando Sexo");
        var formOk = true
        var sexo = $('[name="participante.sexo"]').val();
        if (sexo == "null") {
            formOk = false;
            $('#div-sexo').addClass('has-error');
        }
        return formOk;
    }

    document.getElementsByName('participante.sexo')[0].addEventListener('change', function (){
        $('#div-sexo').removeClass('has-error');
    });

    function validaMovil() {
        console.log("validando Movil");
        var formOk = true;
        var movil = $('#movil').val();
        console.log('Movil: ' + movil);
        if (movil == "" || movil == undefined) {
            $('#div-movil').addClass('has-error');
            formOk = false;
        } else {
            var movil_re = /(\+34|0034|34)?[ -]*(6|7)[ -]*([0-9][ -]*){8}/; // Sólo caracteres
            if (!movil_re.test(movil)) {
                $('#div-movil').addClass('has-error');
                formOk = false;
            }
        }
        console.log(formOk);
        return formOk;
    }

    function validaEmail() {
        console.log("validando Email");
        var formOk = true;
        var email = $('#email').val();
        console.log('Email: ' + email);
        if (email == "" || email == undefined) {
            $('#div-email').addClass('has-error');
            formOk = false;
        } else {
            var email_re = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/gi;
            if(!email_re.test(email)) {
                $('#div-email').addClass('has-error');
                formOk = false;
            }
        }
        console.log(formOk);
        return formOk;
    }

    function validaFechaNacimiento() {
        console.log("validando Fecha Nacimiento");
        var formOk = true;
        var fecha = $('#fechaNacimiento').val();
        console.log('Fecha Nacimiento: ' + fecha);
        if (fecha == "" || fecha == undefined) {
            $('#div-fecha').addClass('has-error');
            formOk = false;
        } else {
            var fecha_re = /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/;
            if(!fecha_re.test(fecha)) {
                $('#div-fecha').addClass('has-error');
                formOk = false;
            }
        }
        console.log(formOk);
        return formOk;
    }

    </g:javascript>
</div>

</body>
</html>
