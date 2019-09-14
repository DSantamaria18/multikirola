function modalButtonEnable() {
    const confirmed = $('#check-modal-eliminar-cuenta').is(':checked');
    if(confirmed) $('#btn-modal-eliminar-cuenta').removeAttr('disabled');
    else $('#btn-modal-eliminar-cuenta').attr("disabled", true);
}

function borrarCuenta(){
    const email = $('#useremail').val();
    const movil = $('#usercellphone').val();
    const nombre =  $('#nombre').val();
    const apellidos = $('#apellidos').val();

    const datos = {
        nombre: nombre,
        apellidos: apellidos,
        movil: movil,
        email: email
    };

    $.ajax({
        type: "POST",
        url: "/multikirola/user/borrarCuenta",
        data: datos,
        success: function(response) {
            console.log(response);
            // window.location ="/multikirola/participante/index" ;
        },
        error: function(error) {
            console.log(error);
            // window.location ="/multikirola/participante/create" ;
        }
    })

}