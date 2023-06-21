//====  Funciones para procesos de la Hoja de Evaluación
function evalinstitucional(tipo, op){
    //== Hace visible o invisible la tabla para evaluar institucional
    var  url;
    if (op == "1") {
//        setVisibilidad(['tabeval=inline','pevalinst=none','aevalinst=inline']);
        url = 'setEvaluacion?idev=1&tpev=' + tipo;
        conectarMethod(url, muestraFormulario, 'GET');
    } else {
        document.fevalinst.reset() ;
        setVisibilidad(['tabeval=none','pevalinst=inline','aevalinst=none']);
    }
}

function muestraFormulario() {
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var cant = xmldoc.getElementsByTagName("cant")[0].firstChild.nodeValue;

    if (cant == "0")
        setVisibilidad(['tabeval=inline','pevalinst=none','aevalinst=inline']);
    else
        alert("Ya está registrada la evaluación deseada para el periodo de evaluación activo") ;
}

function guardarEval(tenc, tusu, ini, fin){
    //== Invoca el servlet para guardar la evaluación
    var url, i, j, np = 0, dil = "", res;
    var objs = new Array() ;
    url = 'setEvaluacion?enc=' + tenc + '&usu=' + tusu  ;
    if (tenc == "1") {
        for (i = ini; i <= fin ; i++ ) {
            res = '0' ;
            for(j = 0; j < 5; j++) {
                obj = document.getElementsByName('P'+i).item(j);
                if (obj.checked)
                    res = obj.value ;
            }
            if (res == '0') {
                alert("No ha respondido la pregunta: " + (np + 1) ) ;
                return ;
            }
            dil = dil + res ;
            np++ ;
        }
        url = url + '&resp=' + dil + '&npr=' + np ;
        respServlet = "evalinstitucional(0, 0)" ;
    } else if (tenc == "2") {
        objs = document.getElementsByName("obj");
        for(j = 0; j < objs.length; j++) {
            res = parseInt(document.getElementsByName("obj").item(j).value) ;
            if (res < 0 || res > 100 || res.toString() != document.getElementsByName("obj").item(j).value) {
                alert("Alcance de objetivo fuera de rango [0..100]") ;
                return ;
            }
            if (document.getElementsByName("raz").item(j).value == "" || document.getElementsByName("raz").item(j).value == " "  ) {
                alert("Debe registrar una breve justificación del cumplimiento de cada objetivo") ;
                return ;
            }

            dil = "&id" + j + "=" + document.getElementsByName("idobj").item(j).value +
                  "&obj" + j + "=" + document.getElementsByName("obj").item(j).value +
                  "&raz" + j + "=" + document.getElementsByName("raz").item(j).value ;
        }
        url = url + dil + '&npr=' + j ;
        respServlet = "evalCompromisos(1, 0)" ;
    }
    conectarMethod(url, muestraResultadoSP, 'POST');
}

function evalCompromisos(tipo, op){
    //== Hace visible o invisible la tabla con compromisos de docencia ED
    document.fevalinst.reset() ;
    if (op == "1")
        setVisibilidad(['tabcomp=inline','aevalcomp=inline','pevalcomp=none']);
    else
        setVisibilidad(['tabcomp=none','aevalcomp=none','pevalcomp=inline']);
    var tabla=document.getElementById('cuerpocomp');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
    var url = 'getEvalComp?op=20&tpe=' + tipo;
    conectarMethod(url, muestraCompromisos, 'POST');
}

function muestraCompromisos() {
    var cuerpo,fila,nodo,columna, ident ;
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("listacompromisos")[0];
    var reg = lista.getElementsByTagName("compromiso");
    var elementos=["idcom","tipo","comp","medidor"];
    cuerpo=document.getElementById('cuerpocomp');
    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 4; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j - 1);
            columna.innerHTML=nodo;
        }
        columna=fila.insertCell(j - 1);
        columna.innerHTML="<input type='hidden' size='3' value='" + ident + "' name='idobj' id='idobj" + i + "'/>" +
                          "<input type='text' size='3' maxsize='3' name='obj' id='obj" + i + "'/>" ;
        columna=fila.insertCell(j);
        columna.innerHTML="<textarea rows='2' cols='55' name='raz' id='raz" + i + "'></textarea>" ;

    }
}



