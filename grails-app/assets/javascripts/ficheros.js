//= require jquery-2.2.0.min
//= require bootstrap
//= require_tree .
//= require_self

function buscar() {
    console.log("buscando fichero");
    $('#FileUpload').click();
}

function copyFileName() {
    var filename = "";
    filename = $('#FileUpload').val().split('\\').pop();
    $('#FileNameInput').val(filename);
}