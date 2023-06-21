var http_request;

function initCalendar() {
    //Define y configura el calendario
    Calendar.setup({
        inputField: 'fechaCons', // id del campo de texto 
        ifFormat: '%d/%m/%Y', // formato de la fecha que se escriba en el campo de texto 
        button: 'lanzador' // el id del botón que lanzará el calendario 
    });
}

function postToURL(url, param, funcion) {
    // Obtener la instancia del objeto XMLHttpRequest
    http_request = false;
    if (window.XMLHttpRequest) {// IE7+, Firefox, Chrome, Opera, Safari
        http_request = new XMLHttpRequest();
    } else {// IE6, IE5
        try {
            http_request = new ActiveXObject('Microsoft.XMLHTTP');
        } catch (err) {
            try { 
                http_request = new ActiveXObject('Msxml2.XMLHTTP');
            } catch (err) {
                alert('No se ha instanciado el objeto XMLHttpRequest');
                return false;
            }
        }
    }
    http_request.onreadystatechange = funcion;

    //Enviar Peticion
    http_request.open('POST', url, true);
    http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    http_request.send(param);
    return true;
}

function consultarEstudiante() {
    var carneEst = document.getElementById('carneEst').value;
    
    carneEst = carneEst.replace(/ /g, '');
    
    if (carneEst == '' || !(/\d/g.test(carneEst))) {
        alert('El carne o documento debe ser numérico.');
        return;
    }

    postToURL('getCarne', 'carne=' + carneEst, resultConsultarEstudiante);
}

function resultConsultarEstudiante() {
    if (http_request.readyState != 4) return false;
    if (http_request.status != 200) return false;

    var xmlRes = http_request.responseXML;

    if (xmlRes == null) return false;

    var result = xmlRes.getElementsByTagName('resultado')[0];

    if (result.getElementsByTagName('estado')[0].firstChild.nodeValue == '0') {
        var carneEst = document.getElementById('carneEst').value;
        alert('No se ha encontrado al estudiante de carné ' + carneEst + ' o el estudiante no se encuentra activo en el semestre actual.');
        return false;
    }
    
    if (result.getElementsByTagName('estado')[0].firstChild.nodeValue == '-1') {
        alert('Ha ocurrido un fallo al realizar la operación. Compruebe que su sesión continue activa.');
        return false;
    }
    
    document.getElementById('carneEst').value = result.getElementsByTagName('carne')[0].firstChild.nodeValue;
    
    document.getElementById('xlsHistEstLink').href = 'xlsHistEst?carne=' + document.getElementById('carneEst').value;
    
    document.getElementById('nomEst').innerHTML = result.getElementsByTagName('nombre')[0].firstChild.nodeValue;
    document.getElementById('progEst').innerHTML = result.getElementsByTagName('programa')[0].firstChild.nodeValue;
    
    document.getElementById('titleHistEst').innerHTML = result.getElementsByTagName('nombre')[0].firstChild.nodeValue;

    document.getElementById('carneEst').disabled = true;
    document.getElementById('btnCarne').disabled = true;
    document.getElementById('btnHistEst').disabled = false;
    document.getElementById('divCarne').style.opacity = '0';
    document.getElementById('divCarne').style.display = 'none';
    document.getElementById('cancelEst').style.opacity = '1';
    document.getElementById('cancelEst').style.display = 'block';
    document.getElementById('divHistEst').style.opacity = '1';
    document.getElementById('divHistEst').style.display = 'block';
    
    var asignaturas = result.getElementsByTagName('asignaturas')[0];
    
    if (asignaturas.childNodes.length > 0) {
        var selMaterias = document.getElementById('matCons');
        var optsLength = selMaterias.options.length;
        
        for (var i = 0; i < optsLength; i++) {
            selMaterias.remove(0);
        }
        
        /*var selOpt = document.createElement("option");
        selOpt.text = 'Otra';
        selOpt.value = '0';
        selMaterias.add(selOpt);*/
        
        var asignatura;
        var idAsig;
        var nomAsig;

        for (var i = 0; i < asignaturas.childNodes.length; i++) {
            asignatura = asignaturas.childNodes[i];
            
            idAsig = asignatura.getElementsByTagName('idAsig')[0].firstChild.nodeValue;
            nomAsig = asignatura.getElementsByTagName('nomAsig')[0].firstChild.nodeValue;
            
            var selOpt = document.createElement("option");
            selOpt.value = idAsig;
            selOpt.text = nomAsig;
            selMaterias.add(selOpt);
        }
    }
}

function regConsulta() {
    var fechaReg = document.getElementById('fechaCons').value;
    
    if (!validaFechaCompleta(fechaReg)) return;
    
    var carneEst = document.getElementById('carneEst').value;
    var carneEstInput = document.getElementById('carneEst').disabled;
    
    var visita = (document.getElementsByName('tVisita')[1].checked?'0':'1');
    
    var tipoList = document.getElementById('tipoConsList');
    var tipo;
    if (tipoList == null) {
        tipo =  document.getElementById('tipoCons').innerHTML;
    } else {
        tipo = tipoList.options[tipoList.selectedIndex].value;
    }
    
    var asigList = document.getElementById('matCons');
    var asignatura = asigList.options[asigList.selectedIndex].value;

    var asunto = document.getElementById('temaCons').value;
    
    var observaciones = document.getElementById('obsCons').value;
    
    if (carneEst == '' || carneEstInput == false || asunto == '') {
        alert(  'Para registrar una consulta es necesario que estén definidos todos los siguientes campos:\n' +
                '  - Carné\n' +
                '  - Temática');
        return;
    }
    
    var parameters =    'fecha=' + fechaReg +
                        '&carne=' + carneEst +
                        '&visita=' + visita +
                        '&tipo=' + tipo +
                        '&asignatura=' + asignatura +
                        '&tema=' + asunto +
                        '&observaciones=' + observaciones;

    postToURL('regConsulta', parameters, resultRegConsulta);
}

function resultRegConsulta() {
    if (http_request.readyState != 4) return false;
    if (http_request.status != 200) return false;

    var xmlRes = http_request.responseXML;

    if (xmlRes == null) return false;

    var result = xmlRes.getElementsByTagName('resultado')[0];

    if (result.getElementsByTagName('estado')[0].firstChild.nodeValue == '0') {
        alert('Ha ocurrido un fallo al realizar la operación. Compruebe que su sesión continue activa.');
        return false;
    }
    
    if (result.getElementsByTagName('estado')[0].firstChild.nodeValue == '-1') {
        alert('La fecha seleccionada no debe ser mayor a la fecha actual.');
        return false;
    }
    
    alert('Se ha registrado la consulta satisfactoriamente.');

    document.getElementById('carneEst').value = '';
    
    var asigList = document.getElementById('matCons');
    var asigLength = asigList.options.length;

    for (var i = 0; i < asigLength; i++) {
        asigList.remove(0);
    }
    
    var selOpt = document.createElement("option");
    selOpt.text = '_';
    selOpt.value = '0';
    asigList.add(selOpt);
    
    document.getElementById('temaCons').value = '';

    document.getElementById('nomEst').innerHTML = '-';
    document.getElementById('progEst').innerHTML = '-';
    
    document.getElementById('titleHistEst').innerHTML = '';

    document.getElementById('carneEst').disabled = false;
    document.getElementById('btnCarne').disabled = false;
    document.getElementById('btnHistEst').disabled = true;
    document.getElementById('cancelEst').style.opacity = '0';
    document.getElementById('cancelEst').style.display = 'none';
    document.getElementById('divHistEst').style.opacity = '0';
    document.getElementById('divHistEst').style.display = 'none';
    document.getElementById('divCarne').style.opacity = '1';
    document.getElementById('divCarne').style.display = 'block';
    
    document.getElementById('obsCons').value = '';
    
    document.getElementsByName('tVisita')[0].checked = true;
    document.getElementsByName('tVisita')[1].checked = false;
}

function cancelEst() {
    document.getElementById('carneEst').value = '';
    document.getElementById('nomEst').innerHTML = '-';
    document.getElementById('progEst').innerHTML = '-';
    
    document.getElementById('titleHistEst').innerHTML = '';

    document.getElementById('carneEst').disabled = false;
    document.getElementById('btnCarne').disabled = false;
    document.getElementById('btnHistEst').disabled = true;
    document.getElementById('cancelEst').style.opacity = '0';
    document.getElementById('cancelEst').style.display = 'none';
    document.getElementById('divHistEst').style.opacity = '0';
    document.getElementById('divHistEst').style.display = 'none';
    document.getElementById('divCarne').style.opacity = '1';
    document.getElementById('divCarne').style.display = 'block';
    
    var selMaterias = document.getElementById('matCons');
    var optsLength = selMaterias.options.length;
        
    for (var i = 0; i < optsLength; i++) {
        selMaterias.remove(0);
    }

    var selOpt = document.createElement("option");
    selOpt.text = '_';
    selOpt.value = '0';
    selMaterias.add(selOpt);
}

function getHistoricoEst() {
    var carneEst = document.getElementById('carneEst').value;
    
    document.getElementById('formContent').style.opacity = '0';
    document.getElementById('formContent').style.display = 'none';
    document.getElementById('formHistEst').style.display = 'table';
    document.getElementById('formHistEst').style.opacity = '1';
    
    document.getElementById('loadingHistEst').style.display = 'block';
    document.getElementById('tblHistEst').style.display = 'none';
    
    document.getElementById('loadingHistEst').innerHTML = 'Se están cargando las consultas del estudiante, espere un momento por favor...';
    
    postToURL('getHistEst', 'carne=' + carneEst, resultHistoricoEst);
}

function resultHistoricoEst() {
    if (http_request.readyState != 4) return false;
    if (http_request.status != 200) {
        goBackHistoricoEst();
        return false;
    }

    var xmlRes = http_request.responseXML;

    if (xmlRes == null) return false;

    var result = xmlRes.getElementsByTagName('resultado')[0];

    if (result.getElementsByTagName('estado')[0].firstChild.nodeValue == '0') {
        document.getElementById('loadingHistEst').innerHTML = 'El estudiante no posee consultas en el período actual.';
        return false;
    }
    
    if (result.getElementsByTagName('estado')[0].firstChild.nodeValue == '-1') {
        document.getElementById('loadingHistEst').innerHTML = 'Ha ocurrido un fallo al intentar obtener el histórico. Compruebe que su sesión continue activa.';
        return false;
    }
    
    document.getElementById('loadingHistEst').style.display = 'none';
    document.getElementById('tblHistEst').style.display = 'table';
    
    var consultas = result.getElementsByTagName('consulta');
    
    var e = ['fecha', 'profesor', 'estudiante', 'carne', 'tipo', 'asignatura', 'tema'];
    var table = document.getElementById('tblHistEst');
    var row;
    var cell;
    
    var rowsLength = table.rows.length;
    
    for (var i = 0; i < (rowsLength-1); i++) {
        table.deleteRow(1);
    }
    
    for (var i = 0; i < consultas.length; i++) {

        row = table.insertRow(i+1);
        
        for (var j = 0; j < e.length; j++) {
            cell = row.insertCell(j)
            cell.innerHTML = consultas[i].getElementsByTagName(e[j])[0].firstChild.nodeValue;
        }
    }
}

function goBackHistoricoEst() {
    document.getElementById('formContent').style.display = 'table';
    document.getElementById('formContent').style.opacity = '1';
    document.getElementById('formHistEst').style.opacity = '0';
    document.getElementById('formHistEst').style.display = 'none';
}


function getHistoricoProf() {
    document.getElementById('formContent').style.opacity = '0';
    document.getElementById('formContent').style.display = 'none';
    document.getElementById('formHistProf').style.display = 'table';
    document.getElementById('formHistProf').style.opacity = '1';
    
    document.getElementById('loadingHistProf').style.display = 'block';
    document.getElementById('tblHistProf').style.display = 'none';
    
    document.getElementById('loadingHistProf').innerHTML = 'Se están cargando las consultas del profesor, espere un momento por favor...';
    
    postToURL('getHistProf', '', resultHistoricoProf);
}

function resultHistoricoProf() {
    if (http_request.readyState != 4) return false;
    if (http_request.status != 200) {
        goBackHistoricoProf();
        return false;
    }

    var xmlRes = http_request.responseXML;

    if (xmlRes == null) return false;

    var result = xmlRes.getElementsByTagName('resultado')[0];

    if (result.getElementsByTagName('estado')[0].firstChild.nodeValue == '0') {
        document.getElementById('loadingHistProf').innerHTML = 'El profesor no posee consultas en el período actual.';
        return false;
    }
    
    if (result.getElementsByTagName('estado')[0].firstChild.nodeValue == '-1') {
        document.getElementById('loadingHistProf').innerHTML = 'Ha ocurrido un fallo al intentar obtener el histórico. Compruebe que su sesión continue activa.';
        return false;
    }
    
    document.getElementById('loadingHistProf').style.display = 'none';
    document.getElementById('tblHistProf').style.display = 'table';
    
    var consultas = result.getElementsByTagName('consulta');
    
    var e = ['fecha', 'profesor', 'estudiante', 'carne', 'tipo', 'asignatura', 'tema'];
    var table = document.getElementById('tblHistProf');
    var row;
    var cell;
    
    var rowsLength = table.rows.length;
    
    for (var i = 0; i < (rowsLength-1); i++) {
        table.deleteRow(1);
    }
    
    for (var i = 0; i < consultas.length; i++) {

        row = table.insertRow(i+1);
        
        for (var j = 0; j < e.length; j++) {
            cell = row.insertCell(j)
            cell.innerHTML = consultas[i].getElementsByTagName(e[j])[0].firstChild.nodeValue;
        }
    }
}

function goBackHistoricoProf() {
    document.getElementById('formContent').style.display = 'table';
    document.getElementById('formContent').style.opacity = '1';
    document.getElementById('formHistProf').style.opacity = '0';
    document.getElementById('formHistProf').style.display = 'none';
}

function getHistoricoDec() {
    
    document.getElementById('formContent').style.opacity = '0';
    document.getElementById('formContent').style.display = 'none';
    document.getElementById('formHistDec').style.display = 'table';
    document.getElementById('formHistDec').style.opacity = '1';
    
    document.getElementById('loadingHistDec').style.display = 'block';
    document.getElementById('tblHistDec').style.display = 'none';
    
    document.getElementById('loadingHistDec').innerHTML = 'Se están cargando las consultas, espere un momento por favor...';
    
    postToURL('getHistDec', '', resultHistoricoDec);
}

function resultHistoricoDec() {
    if (http_request.readyState != 4) return false;
    if (http_request.status != 200) {
        goBackHistoricoDec();
        return false;
    }

    var xmlRes = http_request.responseXML;

    if (xmlRes == null) return false;

    var result = xmlRes.getElementsByTagName('resultado')[0];

    if (result.getElementsByTagName('estado')[0].firstChild.nodeValue == '0') {
        document.getElementById('loadingHistDec').innerHTML = 'No se han registrado consultas en el período actual.';
        return false;
    }
    
    if (result.getElementsByTagName('estado')[0].firstChild.nodeValue == '-1') {
        document.getElementById('loadingHistDec').innerHTML = 'Ha ocurrido un fallo al intentar obtener el histórico. Compruebe que su sesión continue activa.';
        return false;
    }
    
    document.getElementById('loadingHistDec').style.display = 'none';
    document.getElementById('tblHistDec').style.display = 'table';
    
    var consultas = result.getElementsByTagName('consulta');
    
    var e = ['fecha', 'profesor', 'estudiante', 'carne', 'tipo', 'asignatura', 'tema'];
    var table = document.getElementById('tblHistDec');
    var row;
    var cell;
    
    var rowsLength = table.rows.length;
    
    for (var i = 0; i < (rowsLength-1); i++) {
        table.deleteRow(1);
    }
    
    for (var i = 0; i < consultas.length; i++) {

        row = table.insertRow(i+1);
        
        for (var j = 0; j < e.length; j++) {
            cell = row.insertCell(j)
            cell.innerHTML = consultas[i].getElementsByTagName(e[j])[0].firstChild.nodeValue;
        }
    }
}

function goBackHistoricoDec() {
    document.getElementById('formContent').style.display = 'table';
    document.getElementById('formContent').style.opacity = '1';
    document.getElementById('formHistDec').style.opacity = '0';
    document.getElementById('formHistDec').style.display = 'none';
}

function changeTipo() {
    var tipoList = document.getElementById('tipoConsList');
    var tipoId = tipoList.selectedIndex;
    
    if (tipoId == 0) {
        document.getElementById('lisMatEstT').style.display = 'block';
        document.getElementById('lisMatEstI').style.display = 'block';
    } else {
        document.getElementById('lisMatEstT').style.display = 'none';
        document.getElementById('lisMatEstI').style.display = 'none';
        document.getElementById('matCons').selectedIndex = 0;
    }
}

function validaFechaCompleta(valor){
    var patt = /^([1-9]|([0][1-9])|([1-2][0-9])|([3][0-1]))[/]([1-9]|([0][1-9])|([1][0-2]))[/](\d{4})$/;
    
    if (!patt.test(valor)) {
        alert('Formato de fecha incorrecto. Formato dd/mm/aaaa');
        return false;
    }
    return true;
}

function exportExcel(tableID) {
    //Obtiene el contenido de la tabla en código HTML
    var exportData = document.getElementById(tableID);
    
    if (exportData == null) return false;
    
    exportData = '<html><head><title>Exportando a Excel...</title></head><body onload="document.write("Después de realizar su descarga puede cerrar esta descarga."'
            + 'window.close()"><table border="1" style="border: 1px solid black;">' + exportData.innerHTML.toString()
            + '</table></body></html>';
    
    //Enviamos la tabla
    conectarSendParam('exportExcel','POST','exportData',encodeURIComponent(exportData));
}