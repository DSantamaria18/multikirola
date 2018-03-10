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

    const username = $('#username').val();
    const email = $('#useremail').val();
    const telefono = $('#userphone').val();
    const movil = $('#usercellphone').val();
    const whatsapp = $('#whatsapp').prop('checked');


    /* validación de username */
    if (username == "") {
        $('#error-username').text('Debes introducir un nombre de usuario.');
        $('#error-username').attr('hidden', false);
        formOk = false;
    } else {
        const user_re = /^\w+$/; // Sólo caracteres y números
        if (!user_re.test(username)) {
            $('#error-username').text('Caracteres no válidos en el nombre de usuario.');
            $('#error-username').attr('hidden', false);
            formOk = false;
        }
    }

    /* validación de email */
    const email_re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (email == "" || !email_re.test(email)) {
        $('#error-email').text('Debes introducir un email válido.');
        $('#error-email').attr('hidden', false);
        formOk = false;
    }

    /* validación de telefono */
    const telefono_re = /^(\+34|0034|34)?[6|7|9][0-9]{8}$/;
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
        const legal = $('#legal').prop('checked');
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

function apuntarParticipantes() {
    var eventId = $('#eventId').val;
    var selectedParticpantsIds = [];
    var selectedParticipants = [];

    $('#checkbox-participante:checked').each(function(){
        var participanteId = $(this).val();
        console.log(participanteId);
        selectedParticpantsIds.push(participanteId);
        console.table(selectedParticpantsIds);
        var nombre = $(this).siblings('span').text();
        selectedParticipants.push(nombre);
        console.table(selectedParticipants);
    });

    for(part in selectedParticipants) {
        var html = `<div class="participante-row" style="display: flex"><i class=\"glyphicon glyphicon-user\"></i><span class=\"text-capitalize\">${part}</span></div><div class="btn btn-danger push eliminar-push"> <i class="glyphicon glyphicon-remove"></i></div>`
        console.log(html);
        $('.panel-footer').append(html);

    };

    var params = {
        eventoId: eventId,
        selectedParticpantsIds: selectedParticpantsIds
    }

    $.post("/multikirola/")

};

function passEvent(elem){
    var eventId = $(elem).data('event');
    $('#eventId').val(eventId);
};