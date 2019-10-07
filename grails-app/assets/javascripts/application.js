// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require bootstrap
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function ($) {
        $(document).ajaxStart(function () {
            $('#spinner').fadeIn();
        }).ajaxStop(function () {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}

function isValidPassword() {
    var passOk = true;
    var password = $('#password').val();
    var password2 = $('#password2').val();

    if (password.length < 8) {
        $('#error-longitudPassword').attr('hidden', false);

        return false;
    }

    if (/[^0-9a-zA-Z]/.test(password)) {
        $('#error-contenidoPassword').attr('hidden', false);
        return false;
    }

    if (password !== password2) {
        $('#error-password2').attr('hidden', false);
        return false;
    }
    return passOk;
}

function validateForm() {
    console.log("Validando datos de registro");
    var formRegistroOk = true;

    // var username = $('#username').val();
    let nombre = $('#nombre').val();
    let apellidos = $('#apellidos').val();
    const email = $('#useremail').val();
    const movil = $('#usercellphone').val();
    const whatsapp = $('#whatsapp').prop('checked');

    /* validación de nombre y apellidos */
    // const nombre_regex = /^[a-zA-Z'ñÑ\-áéíóúÁÉÍÓÚàèìòùÀÈÌÒÙäëïöüÄËÏÖÜ\s]*$/;
    const nombre_regex = /^([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\']+[\s])+([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\'])+[\s]?([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\'])?$/g;
    if (nombre == "" || nombre.length < 2) {
        $('#error-nombre').attr('hidden', false);
        formRegistroOk = false;
    } else {
        const nombreOk = nombre_regex.test(nombre);
        if (nombreOk === false) {
            $('#error-caracteresUsername').attr('hidden', false);
            formRegistroOk = false;
        }
    }

    if (apellidos == "" || apellidos.length < 2) {
        $('#error-apellidos').attr('hidden', false);
        formRegistroOk = false;
    } else {
        const apellidosOk = nombre_regex.test(apellidos);
        if (apellidosOk === false) {
            $('#error-caracteresApellidos').attr('hidden', false);
            formRegistroOk = false;
        }
    }

    /* validación de email */
    var email_re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zñA-ZÑ\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (email == "" || !email_re.test(email)) {
        $('#error-email').attr('hidden', false);
        formRegistroOk = false;
    }

    /* validación de movil */
    var telefono_re = /^(\+34|0034|34)?[6|7|9][0-9]{8}$/;
    if (movil == "" || !telefono_re.test(movil)) {
        $('#error-usercellphone').attr('hidden', false);
        formRegistroOk = false;
    }

    /* validación de whatsapp sin movil */
    if (movil == "" && whatsapp === true) {
        $('#error-whatsapp').text('Debes introducir un móvil.');
        $('#error-whatsapp').attr('hidden', false);
        formRegistroOk = false;
    }

    if ($('#legal').size() > 0) {
        var legal = $('#legal').prop('checked');
        if (legal == false) {
            $('#error-legal').text('Debes aceptar las condiciones.');
            $('#error-legal').attr('hidden', false);
            formRegistroOk = false;
        }
    }

    /* validación de password */
    if ($('#password-group.in').size() > 0 || $('#password-group').size() < 1) {
        if (!isValidPassword()) {
            formRegistroOk = false;
        } else {
            console.log("No es necesario validar la contraseña");
        }
    }

    return formRegistroOk;
}

function passEvent(elem) {
    var eventId = $(elem).data('event');
    $('#eventId').val(eventId);
};

function borrarParticipante(elem) {
    var eventId = $('#eventId').val();
    console.log(eventId);

    var participanteId = $(elem).parent().attr('participante-id')
    console.log(participanteId);

    $.post("/multikirola/actividadMultikirola/delete",
        {
            eventId: eventId,
            participanteId: participanteId
        }, function (data, status) {
            console.log(status);
        }
    );

    $(elem).closest('.participanteRegistrado-row').remove();

};

function calcularEdad(fnacimiento) { // birthday is a date
    var ageDifMs = Date.now() - fnacimiento.getTime();
    var ageDate = new Date(ageDifMs); // miliseconds from epoch
    var result = Math.abs(ageDate.getUTCFullYear() - 1970);
    console.log(result);
    return result;
    // return Math.abs(ageDate.getUTCFullYear() - 1970);
};

function inscribirParticipante() {
    var eventId = $('#eventId').val();
    var participanteId = $('#selected-participant-id').val();
    // var telefono =  $('#participante-telefono').val();
    var movil = $('#participante-mobile').val();
    var fnacimiento = new Date($('#participante-fnacimiento').val());
    var edadMinima = parseInt($('#edadMinima').val());

    var edad = calcularEdad(fnacimiento);
    if (edad < edadMinima) {
        alert("La edad mínima para poder inscribirse es de " + edadMinima.toString() + " años.");
    } else {


        // if (telefono.length < 9 || movil.length < 9) {
        if (movil.length < 9) {
            alert("Los datos de contacto del participante no son correctos...")
        }

        var params = {
            eventId: eventId,
            participanteId: participanteId,
            // telefono: telefono,
            movil: movil
        }

        $.post('/multikirola/actividadMultikirola/save', params,
            function (data, status) {
                console.log(status);
                $('#selected-participant-id').val('');
                $('#participante-telefono').val('');
                $('#participante-mobile').val('');
                $('.form-datos-contacto').hide();
                $('.div-inscribirParticipanteBtn').hide();
                // $('#div-participantes-registrados').html(data);
                $('#selector-participantes').html(data);
            }
        );
    }
};

function showContactInfo() {
    var telefono = $('option:selected').attr('phone');
    var movil = $('option:selected').attr('mobile');
    var id = $('option:selected').attr('id');
    var fnacimiento = $('option:selected').attr('fnacimiento');

    $('#selected-participant-id').val(id);
    $('#participante-telefono').val(telefono);
    $('#participante-mobile').val(movil);
    $('#participante-fnacimiento').val(fnacimiento);

    $('.form-datos-contacto').show();
    $('.div-inscribirParticipanteBtn').show();

};

function unsubscribeParticipant(elem) {
    var eventId = $(elem).parent().siblings('#event-id').data('id');
    var nombre_participante = $(elem).parent().siblings('#participant-name').text();
    var participanteId = $(elem).parent().siblings('#participant-name').data('id');

    console.log(nombre_participante);
    var msg = nombre_participante.toUpperCase() + " no participará en el evento. ¿Estás seguro?";
    var result = confirm(msg);

    if (result) {
        $.post("/multikirola/actividadMultikirola/delete",
            {
                eventId: eventId,
                participanteId: participanteId
            }, function (data, status) {
                console.log(status);
                $(elem).closest('#registros').remove();
            }
        );
    }
};

$('#username').hover(function () {
    $(this).tooltip();
});

function goToEvent(elem) {
    var eventId = $(elem).data('id');
    window.location = "/multikirola/actividadMultikirola/eventInfo?event=" + eventId;
};


function filtrarEventos(fechaIniDesde, fechaIniHasta) {
    $.get("/multikirola/actividadMultikirola/filtrarEventos/",
        {
            'fechaDesde': fechaIniDesde,
            'fechaHasta': fechaIniHasta
        }).done(function (data, status) {
        console.log(status);
        $('#tabla-eventos').html(data);
    })
};

function filtrarParticipantes(apellido1, movil, email, centro, curso, fDesde, fHasta) {

    $.get("/multikirola/participante/filtrarParticipantes/",
        {
            apellido1: apellido1,
            movil: movil,
            email: email,
            centro: centro,
            curso: curso,
            fdesde: fDesde,
            fhasta: fHasta

        }).done(function (data, status) {
        console.log(status);
        $('#tabla-participantes').html(data);
    })
}