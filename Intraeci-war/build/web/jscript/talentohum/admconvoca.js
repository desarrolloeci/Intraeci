var respEstPart = false;
var respAspir = true;

function initCalendar() {
    //Define y configura el calendario
    Calendar.setup({
        inputField: 'FecIni', // id del campo de texto 
        ifFormat: '%d/%m/%Y', // formato de la fecha que se escriba en el campo de texto 
        button: 'lanzador' // el id del botón que lanzará el calendario 
    });

    //Define y configura el calendario
    Calendar.setup({
        inputField: 'FecFin', // id del campo de texto 
        ifFormat: '%d/%m/%Y', // formato de la fecha que se escriba en el campo de texto 
        button: 'lanzador2' // el id del botón que lanzará el calendario 
    });
}

function glowThis(element) {
    var parentTable = element.parentNode;
    var parentRow = element.parentNode;

    while (parentTable.tagName.toLowerCase() != 'table') {
        parentTable = parentTable.parentNode;
    }
    
    while (parentRow.tagName.toLowerCase() != 'tr') {
        parentRow = parentRow.parentNode;
    }

    var rows = parentTable.getElementsByTagName('tr');
    for (var i = 0; i < rows.length; i++) {
        rows[i].className = '';
    }

    parentRow.className = 'selectedRow';
}