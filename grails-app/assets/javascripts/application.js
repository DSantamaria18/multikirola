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


    if (password === undefined) {
        $('#error-password').text('Debes introducir una contraseña');
        $('#error-password').attr('hidden', false);
        return false;
    }

    if (password.length < 8) {
        $('#error-password').text('La contraseña debe tener al menos 8 caracteres');
        $('#error-password').attr('hidden', false);
        return false;
    }

    if (!/\d/.test(password)) {
        $('#error-password').text('La contraseña debe tener al menos un dígito');
        $('#error-password').attr('hidden', false);
        return false;
    }

    if (!/[a-z]/.test(password)) {
        $('#error-password').text('La contraseña debe tener al menos una letra minúscula');
        $('#error-password').attr('hidden', false);
        return false;
    }

    if (!/[A-Z]/.test(password)) {
        $('#error-password').text('La contraseña debe tener al menos una letra mayúscula');
        $('#error-password').attr('hidden', false);
        return false;
    }

    if (/[^0-9a-zA-Z]/.test(password)) {
        $('#error-password').text('La contraseña debe tener al menos 8 caracteres');
        $('#error-password').attr('hidden', false);
        return false;
    }

    if (password !== password2) {
        $('#error-password2').text('Las contraseñas no coinciden');
        $('#error-password2').attr('hidden', false);
        return false;
    }
    return passOk;
}

function validateForm() {
    console.log("Validando datos de registro");
    var formOk = true;

    var username = $('#username').val();
    var email = $('#useremail').val();
    var telefono = $('#userphone').val();
    var movil = $('#usercellphone').val();
    var whatsapp = $('#whatsapp').prop('checked');


    /* validación de username */
    if (username == "") {
        $('#error-username').text('Debes introducir un nombre de usuario.');
        $('#error-username').attr('hidden', false);
        formOk = false;
    } else {
        var user_re = /^\w+$/; // Sólo caracteres y números
        if (!user_re.test(username)) {
            $('#error-username').text('Caracteres no válidos en el nombre de usuario.');
            $('#error-username').attr('hidden', false);
            formOk = false;
        }
    }

    /* validación de email */
    var email_re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (email == "" || !email_re.test(email)) {
        $('#error-email').text('Debes introducir un email válido.');
        $('#error-email').attr('hidden', false);
        formOk = false;
    }

    /* validación de telefono */
    var telefono_re = /^(\+34|0034|34)?[6|7|9][0-9]{8}$/;
    if (telefono == "" || !telefono_re.test(telefono)) {
        $('#error-userphone').text('Debes introducir un teléfono válido.');
        $('#error-userphone').attr('hidden', false);
        formOk = false;
    }
    /* validación de movil */
    if (movil == "" || !telefono_re.test(movil)) {
        $('#error-usercellphone').text('Debes introducir un teléfono válido.');
        $('#error-usercellphone').attr('hidden', false);
        formOk = false;
    }

    /* validación de whatsapp sin movil */
    if (movil == "" && whatsapp == true) {
        $('#error-whatsapp').text('Debes introducir un móvil.');
        $('#error-whatsapp').attr('hidden', false);
        formOk = false;
    }

    if ($('#legal').size() > 0) {
        var legal = $('#legal').prop('checked');
        if (legal == false) {
            $('#error-legal').text('Debes aceptar las condiciones.');
            $('#error-legal').attr('hidden', false);
            formOk = false;
        }
    }

    /* validación de password */
    if ($('#password-group.in').size() > 0 || $('#password-group').size < 1) {
        if (!isValidPassword()) {
            formOk = false;
        } else {
            console.log("No es necesario validar la contraseña");
        }
    }

    return formOk;
}

function passEvent(elem){
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

function inscribirParticipante() {
    var eventId = $('#eventId').val();
    var participanteId = $('#selected-participant-id').val();
    var telefono =  $('#participante-telefono').val();
    var movil =  $('#participante-mobile').val();

    if(telefono.length < 9 || movil.length < 9) {
        alert("Los datos de contacto del participante no son correctos...")
    }

    var params = {
        eventId: eventId,
        participanteId: participanteId,
        telefono: telefono,
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
};

function showContactInfo() {
    var telefono = $('option:selected').attr('phone');
    var movil = $('option:selected').attr('mobile');
    var id = $('option:selected').attr('id');

    $('#selected-participant-id').val(id);
    $('#participante-telefono').val(telefono);
    $('#participante-mobile').val(movil);

    $('.form-datos-contacto').show();
    $('.div-inscribirParticipanteBtn').show();

};

function unsubscribeParticipant(elem){
    var eventId = $(elem).parent().siblings('#event-id').data('id');
    var nombre_participante = $(elem).parent().siblings('#participant-name').text();
    var participanteId = $(elem).parent().siblings('#participant-name').data('id');

    console.log(nombre_participante);
    var msg = nombre_participante.toUpperCase() + " no participará en el evento. ¿Estás seguro?";
    var result = confirm(msg);

    if(result){
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

/*$('tr[role="button"]').click(function () {
    window.location= $(this).data('href');
});*/

function goToEvent(elem) {
    var eventId = $(elem).data('id');
    window.location= "/multikirola/actividadMultikirola/eventInfo?event=" + eventId;
};


function filtrarEventos(fechaIniDesde, fechaIniHasta, actividad) {
    $.get("/multikirola/actividadMultikirola/filtrarEventos/",
        {
            'fechaDesde': fechaIniDesde,
            'fechaHasta': fechaIniHasta,
            'actividad': actividad
        }).done(function (data, status) {
            console.log(status);
            $('#tabla-eventos').html(data);
    })
};

function filtrarParticipantes(apellido1, telefono, movil){
    console.log("filtrando...");
    $.get("/multikirola/participante/filtrarParticipantes/",
        {
            apellido1: apellido1,
            telefono: telefono,
            movil: movil

        }).done(function (data, status) {
        console.log(status);
        $('#tabla-participantes').html(data);
    })
}