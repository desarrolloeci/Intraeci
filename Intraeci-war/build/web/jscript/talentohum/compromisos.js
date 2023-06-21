//====  Funciones para procesos de la Hoja de compromisos
function compDocencia(op, tipo){
    //== Hace visible o onvisible la tabla con compromisos de docencia
    var tabla, filas, tam, i, url;
    tp = tipo ;
    if (tipo == "1") {
        if (op == "1")
            setVisibilidad(['tabcdoc=inline','acomdoc=inline','pcomdoc=none','ncomdoc=inline']);
        else
            setVisibilidad(['tabcdoc=none','acomdoc=none','pcomdoc=inline','ncomdoc=none']);
        tabla=document.getElementById('cuerpocdoc');
        filas=tabla.rows;
        tam=filas.length;
        for(i = 0; i < tam; i++)
            tabla.deleteRow(0);
        document.fcompdoc.idcdoc.value = "0" ;
        document.fcompdoc.nasig.value = "" ;
        document.fcompdoc.ngrp.value = "0" ;
        document.fcompdoc.hc.value = "0" ;
        document.fcompdoc.hp.value = "0" ;
        document.fcompdoc.ha.value = "0" ;
        document.fcompdoc.hd.value = "0" ;
        document.fcompdoc.bld.checked = false ;
        url = 'Compromiso?op=1';
        conectarMethod(url, muestraClases, 'POST');
    } else {
        if (op == "1")
            setVisibilidad(['tabcdocp=inline','acomdocp=inline','pcomdocp=none','ncomdocp=inline']);
        else
            setVisibilidad(['tabcdocp=none','acomdocp=none','pcomdocp=inline','ncomdocp=none']);
        tabla=document.getElementById('cuerpocdocp');
        filas=tabla.rows;
        tam=filas.length;
        for(i = 0; i < tam; i++)
            tabla.deleteRow(0);
        document.fcompdocp.idcdocp.value = "0" ;
        document.fcompdocp.nasigp.value = "" ;
        document.fcompdocp.ngrpp.value = "0" ;
        document.fcompdocp.hcp.value = "0" ;
        document.fcompdocp.hpp.value = "0" ;
        document.fcompdocp.hap.value = "0" ;
        document.fcompdocp.hdp.value = "0" ;
        document.fcompdocp.bldp.checked = false ;
        url = 'Compromiso?op=2';
        conectarMethod(url, muestraClases, 'POST');
    }
}

function muestraClases() {
    var cuerpo,fila,texto,nodo,link,columna, div, ident, su = 0.0 ; 
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("listacompromisos")[0];
    var reg = lista.getElementsByTagName("compromiso");
    var elementos=["idcom","nombre","nsem","hc","hp","hae","had","thor"];
    if (tp == "1") 
        cuerpo=document.getElementById('cuerpocdoc');
    else
        cuerpo=document.getElementById('cuerpocdocp');
    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 8; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j - 1);
            if (j == 1){              
                columna.innerHTML="<a href='#' onclick='detCompromiso("+ident+"," + tp + ")'>"+nodo+"</a>";
            } else {
                columna.innerHTML=nodo;
            }
        }
        columna=fila.insertCell(j-1);
        if ( (reg[i].getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") {
            columna.innerHTML="<a href='#' onclick='elimCompromiso("+ident+", " + tp + ")'><img src='img/eliminar.gif'/></a>";            
        }
        su = su + parseFloat(reg[i].getElementsByTagName("thor")[0].firstChild.nodeValue);
        if (tp == "1")
            document.fcompdoc.th.value = su ;
        else
            document.fcompdocp.thp.value = su ;
    }
}

function EditarClase() {
    //== Activa los campos de la forma para edición de compromisos de clase
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("compromiso")[0];
    if (tp == "1") {
        document.fcompdoc.bld.checked = true ;
        if ((reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") {
            setVisibilidad(['GuardarComDoc=inline']);
            if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N")
                document.fcompdoc.bld.checked = false ;
        } else {
            setVisibilidad(['GuardarComDoc=none']);
        }
        document.fcompdoc.idcdoc.value = reg.getElementsByTagName("idcom")[0].firstChild.nodeValue ;
        document.fcompdoc.idintdoc.value = reg.getElementsByTagName("idobj")[0].firstChild.nodeValue ;
        document.fcompdoc.nasig.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
        document.fcompdoc.ngrp.value = reg.getElementsByTagName("nsem")[0].firstChild.nodeValue ;
        document.fcompdoc.hc.value = reg.getElementsByTagName("hc")[0].firstChild.nodeValue ;
        document.fcompdoc.hp.value = reg.getElementsByTagName("hp")[0].firstChild.nodeValue ;
        document.fcompdoc.ha.value = reg.getElementsByTagName("hae")[0].firstChild.nodeValue ;
        document.fcompdoc.hd.value = reg.getElementsByTagName("had")[0].firstChild.nodeValue ;
    } else {
        document.fcompdocp.bldp.checked = true ;
        if ((reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") {
            setVisibilidad(['GuardarComDocp=inline']);
            if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N")
                document.fcompdocp.bldp.checked = false ;
        } else {
            setVisibilidad(['GuardarComDocp=none']);
        }
        document.fcompdocp.idcdocp.value = reg.getElementsByTagName("idcom")[0].firstChild.nodeValue ;
        document.fcompdocp.idintdocp.value = reg.getElementsByTagName("idobj")[0].firstChild.nodeValue ;
        document.fcompdocp.nasigp.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
        document.fcompdocp.ngrpp.value = reg.getElementsByTagName("nsem")[0].firstChild.nodeValue ;
        document.fcompdocp.hcp.value = reg.getElementsByTagName("hc")[0].firstChild.nodeValue ;
        document.fcompdocp.hpp.value = reg.getElementsByTagName("hp")[0].firstChild.nodeValue ;
        document.fcompdocp.hap.value = reg.getElementsByTagName("hae")[0].firstChild.nodeValue ;
        document.fcompdocp.hdp.value = reg.getElementsByTagName("had")[0].firstChild.nodeValue ;
    }
}

function guardarClase(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (oped == "0") {
        alert("No se puede modificar hoja de compromisos") ;
        return ;
    }
    var url 
    if (tp == "1") {
        url = 'GrabarCompromiso?op=1&' + getValores(['idcdoc','idintdoc','nivd','ngrp','hc','hp','ha','hd']) +
        "&blq=" + document.fcompdoc.bld.checked ;
        respServlet = "compDocencia(1, 1)" ;
    } else {
        url = 'GrabarCompromiso?op=2&' + getValores(['idcdocp','idintdocp','nivdp','ngrpp','hcp','hpp','hap','hdp']) +
        "&blq=" + document.fcompdocp.bldp.checked ;
        respServlet = "compDocencia(1, 2)" ;
    }
    conectarMethod(url, muestraResultadoSP, 'POST');
}

function nuevaClase() {
    //== Genera los valores iniciales para crear un nuevo registro de compromiso de docencia
    if (oped == "0") {
        alert("No se puede modificar hoja de compromisos") ;
        return ;
    }
    if (tp == "1") {
        document.fcompdoc.idcdoc.value = "0" ;
        document.fcompdoc.nasig.value = "" ;
        document.fcompdoc.nivd.value = "PRE" ;
        document.fcompdoc.ngrp.value = "0" ;
        document.fcompdoc.hc.value = "0" ;
        document.fcompdoc.hp.value = "0" ;
        document.fcompdoc.ha.value = "0" ;
        document.fcompdoc.hd.value = "0" ;
        document.fcompdoc.bld.checked = false ;
        setVisibilidad(['GuardarComDoc=inline']);
    } else {
        document.fcompdocp.idcdocp.value = "0" ;
        document.fcompdocp.nasigp.value = "" ;
        document.fcompdocp.nivdp.value = "POST" ;
        document.fcompdocp.ngrpp.value = "0" ;
        document.fcompdocp.hcp.value = "0" ;
        document.fcompdocp.hpp.value = "0" ;
        document.fcompdocp.hap.value = "0" ;
        document.fcompdocp.hdp.value = "0" ;
        document.fcompdocp.bldp.checked = false ;
        setVisibilidad(['GuardarComDocp=inline']);
    }
}

function compED(op, tipo){
    //== Hace visible o onvisible la tabla con compromisos de docencia ED
    var tabla, filas, tam, url, i ;
    tp = tipo ;
    if (tipo == "3") {
        if (op == "1")
            setVisibilidad(['tabced=inline','acomed=inline','pcomed=none','ncomed=inline']);
        else
            setVisibilidad(['tabced=none','acomed=none','pcomed=inline','ncomed=none']);
        tabla=document.getElementById('cuerpoced');
        filas=tabla.rows;
        tam=filas.length;
        for(i = 0; i < tam; i++) {
            tabla.deleteRow(0);
        }
        document.fcomped.idced.value = "0" ;
        document.fcomped.ncured.value = "" ;
        document.fcomped.finied.value = "" ;
        document.fcomped.ffined.value = "" ;
        document.fcomped.thed.value = "0" ;
        document.fcomped.bled.checked = false ;
    } else if (tipo == "4") {
        if (op == "1")
            setVisibilidad(['tabcedit=inline','acomedit=inline','pcomedit=none','ncomedit=inline']);
        else
            setVisibilidad(['tabcedit=none','acomedit=none','pcomedit=inline','ncomedit=none']);
        tabla=document.getElementById('cuerpocedit');
        filas=tabla.rows;
        tam=filas.length;
        for(i = 0; i < tam; i++) {
            tabla.deleteRow(0);
        }
        document.fcompedit.idcedit.value = "0" ;
        document.fcompedit.ncuredit.value = "" ;
        document.fcompedit.finiedit.value = "" ;
        document.fcompedit.ffinedit.value = "" ;
        document.fcompedit.thedit.value = "0" ;
        document.fcompedit.bledit.checked = false ;
    } else {
        if (op == "1")
            setVisibilidad(['tabcpr=inline','acompr=inline','pcompr=none','ncompr=inline']);
        else
            setVisibilidad(['tabcpr=none','acompr=none','pcompr=inline','ncompr=none']);
        tabla=document.getElementById('cuerpocpr');
        filas = tabla.rows;
        tam = filas.length;
        for(var j = 0; j < tam; j++) {
            tabla.deleteRow(0);
        }
        document.fcomppr.idcpr.value = "0" ;
        document.fcomppr.idintpr.value = "0" ;
        document.fcomppr.npr.value = "" ;
        document.fcomppr.finipr.value = "" ;
        document.fcomppr.ffinpr.value = "" ;
        document.fcomppr.thpr.value = "0" ;
        document.fcomppr.blpr.checked = false ;
    }
    url = 'Compromiso?op=' + tp;
    conectarMethod(url, muestraED, 'POST');
}

function muestraED() {
    var cuerpo,fila,texto,nodo,link,columna, div, ident ;
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("listacompromisos")[0];
    var reg = lista.getElementsByTagName("compromiso");
    var elementos=["idcom","nombre","fini","ffin","thor"];
    if (tp == "3")
        cuerpo=document.getElementById('cuerpoced');
    else if (tp == "4")
        cuerpo=document.getElementById('cuerpocedit');
    else
        cuerpo=document.getElementById('cuerpocpr');
    var su = 0.0 ;
    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 5; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j - 1);
            if (j == 1)
                columna.innerHTML="<a href='#' onclick='detCompromiso("+ident+"," + tp + ")'>"+nodo+"</a>";
            else 
                columna.innerHTML=nodo;
        }
        columna=fila.insertCell(j-1);
        if ((reg[i].getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") 
            columna.innerHTML="<a href='#' onclick='elimCompromiso("+ident+", " + tp + ")'><img src='img/eliminar.gif'/></a>";   
        su = su + parseFloat(reg[i].getElementsByTagName("thor")[0].firstChild.nodeValue);
        if (tp == "3" )
            document.fcomped.shed.value = su ;
        else if (tp == "4" )
            document.fcompedit.shedit.value = su ;
        else
            document.fcomppr.shpr.value = su ;
    }
}

function EditarED() {
    //== Activa los campos de la forma para edición de compromisos de clase
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("compromiso")[0];
    if (tp == "3") {
        document.fcomped.bled.checked = true ;
        if ((reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") {
            setVisibilidad(['GuardarComED=inline']);
            if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N")
                document.fcomped.bled.checked = false ;
        } else {
            setVisibilidad(['GuardarComED=none']);
        }
        document.fcomped.idced.value = reg.getElementsByTagName("idcom")[0].firstChild.nodeValue ;
        document.fcomped.ncured.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
        document.fcomped.finied.value = reg.getElementsByTagName("fini")[0].firstChild.nodeValue ;
        document.fcomped.ffined.value = reg.getElementsByTagName("ffin")[0].firstChild.nodeValue ;
        document.fcomped.thed.value = reg.getElementsByTagName("thor")[0].firstChild.nodeValue ;
    } else if (tp == "4") {
        document.fcompedit.bledit.checked = true ;
        if ((reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") {
            setVisibilidad(['GuardarComEDit=inline']);
            if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N")
                document.fcompedit.bledit.checked = false ;
        } else {
            setVisibilidad(['GuardarComED=none']);
        }
        document.fcompedit.idcedit.value = reg.getElementsByTagName("idcom")[0].firstChild.nodeValue ;
        document.fcompedit.ncuredit.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
        document.fcompedit.finiedit.value = reg.getElementsByTagName("fini")[0].firstChild.nodeValue ;
        document.fcompedit.ffinedit.value = reg.getElementsByTagName("ffin")[0].firstChild.nodeValue ;
        document.fcompedit.thedit.value = reg.getElementsByTagName("thor")[0].firstChild.nodeValue ;
    } else {
        document.fcomppr.blpr.checked = true ;
        if ((reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") {
            setVisibilidad(['GuardarComPR=inline']);
            if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N")
                document.fcomppr.blpr.checked = false ;
        } else {
            setVisibilidad(['GuardarComPR=none']);
        }
        document.fcomppr.idcpr.value = reg.getElementsByTagName("idcom")[0].firstChild.nodeValue ;
        document.fcomppr.idintpr.value = reg.getElementsByTagName("idobj")[0].firstChild.nodeValue ;
        document.fcomppr.npr.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
        document.fcomppr.finipr.value = reg.getElementsByTagName("fini")[0].firstChild.nodeValue ;
        document.fcomppr.ffinpr.value = reg.getElementsByTagName("ffin")[0].firstChild.nodeValue ;
        document.fcomppr.thpr.value = reg.getElementsByTagName("thor")[0].firstChild.nodeValue ;
    }
}

function nuevaED() {
    //== Genera los valores iniciales para crear un nuevo registro de compromiso de ED
    if (oped == "0") {
        alert("No se puede modificar hoja de compromisos") ;
        return ;
    }
    if (tp == "3") {
        document.fcomped.idced.value = "0" ;
        document.fcomped.ncured.value = "" ;
        document.fcomped.finied.value = "" ;
        document.fcomped.ffined.value = "" ;
        document.fcomped.thed.value = "0" ;
        document.fcomped.bled.checked = false ;
        setVisibilidad(['GuardarComED=inline']);
    } else if (tp == "4")  {
        document.fcompedit.idcedit.value = "0" ;
        document.fcompedit.ncuredit.value = "" ;
        document.fcompedit.finiedit.value = "" ;
        document.fcompedit.ffinedit.value = "" ;
        document.fcompedit.thedit.value = "0" ;
        document.fcompedit.bledit.checked = false ;
        setVisibilidad(['GuardarComEDit=inline']);
    } else  {
        document.fcomppr.idcpr.value = "0" ;
        document.fcomppr.idintpr.value = "0" ;
        document.fcomppr.npr.value = "" ;
        document.fcomppr.finipr.value = "" ;
        document.fcomppr.ffinpr.value = "" ;
        document.fcomppr.thpr.value = "0" ;
        document.fcomppr.blpr.checked = false ;
        setVisibilidad(['GuardarComPR=inline']);
    }
}

function guardarED(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (oped == "0") {
        alert("No se puede modificar hoja de compromisos") ;
        return ;
    }
    var url ;
    if (tp == "3") {
        if (!validaFecha(document.fcomped.finied.value) || !validaFecha(document.fcomped.ffined.value))
            return ;
        if (parseInt(document.fcomped.finied.value.substring(3,5)) > 5 || parseInt(document.fcomped.ffined.value.substring(3,5)) > 5 ) {
            alert("Las fechas deben corresponder al periodo del compromiso")
            return ;
        }
        url = 'GrabarCompromiso?op=3&' + getValores(['idced','ncured','finied','ffined','thed']) +
        "&blq=" + document.fcomped.bled.checked ;
        respServlet = "compED(1, 3)" ;
    } else if (tp == "4") {
        if (!validaFecha(document.fcompedit.finiedit.value) || !validaFecha(document.fcompedit.ffinedit.value))
            return ;
        if (parseInt(document.fcompedit.finiedit.value.substring(3,5)) > 12 || parseInt(document.fcompedit.ffinedit.value.substring(3,5)) > 12 ) {
            alert("Las fechas deben corresponder al periodo del compromiso")
            return ;
        }
        url = 'GrabarCompromiso?op=4&' + getValores(['idcedit','ncuredit','finiedit','ffinedit','thedit']) +
        "&blq=" + document.fcompedit.bledit.checked ;
        respServlet = "compED(1, 4)" ;
    } else {
        if (!validaFecha(document.fcomppr.finipr.value) || !validaFecha(document.fcomppr.ffinpr.value))
            return ;
        if (parseInt(document.fcomppr.finipr.value.substring(3,5)) > 5 || parseInt(document.fcomppr.ffinpr.value.substring(3,5)) > 5 ) {
            alert("Las fechas deben corresponder al periodo del compromiso")
            return ;
        }
        url = 'GrabarCompromiso?op=5&' + getValores(['idcpr','npr','finipr','ffinpr','thpr','idintpr']) +
        "&blq=" + document.fcomppr.blpr.checked ;
        respServlet = "compED(1, 5)" ;
    }
    conectarMethod(url, muestraResultadoSP, 'POST');
}

function compOC(op){
    //== Hace visible o onvisible la tabla con compromisos de docencia ED
    tp = '6' ;
    if (op == "1")
        setVisibilidad(['tabcooc=inline','acomoc=inline','pcomoc=none','ncomoc=inline']);
    else
        setVisibilidad(['tabcooc=none','acomoc=none','pcomoc=inline','ncomoc=none']);
    var tabla=document.getElementById('cuerpococ');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
    document.fcompoc.idcoc.value = "0" ;
    document.fcompoc.nooc.value = "" ;
    document.fcompoc.desoc.value = "" ;
    document.fcompoc.thoc.value = "0" ;
    document.fcompoc.bloc.checked = false ;
    var url = 'Compromiso?op=6';
    conectarMethod(url, muestraOC, 'POST');
}

function muestraOC() {
    var cuerpo,fila,texto,nodo,link,columna, div, ident, su = 0.0 ;
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("listacompromisos")[0];
    var reg = lista.getElementsByTagName("compromiso");
    var elementos=["idcom","tipo","nombre","hc"];
    cuerpo=document.getElementById('cuerpococ');
    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 4; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j - 1);
            if (j == 1)
                columna.innerHTML="<a href='#' onclick='detCompromiso("+ident+"," + tp + ")'>"+nodo+"</a>";
            else 
                columna.innerHTML=nodo;
        }
        columna=fila.insertCell(j-1);
        if ((reg[i].getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") 
            columna.innerHTML="<a href='#' onclick='elimCompromiso("+ident+", " + tp + ")'><img src='img/eliminar.gif'/></a>";
        su = su + parseFloat(reg[i].getElementsByTagName("thor")[0].firstChild.nodeValue);
        document.fcompoc.shoc.value = su ;
    }
}

function guardarOC(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (oped == "0") {
        alert("No se puede modificar hoja de compromisos") ;
        return ;
    }
    var url = 'GrabarCompromiso?op=6&' + getValores(['idcoc','idtpc','desoc','thoc']) +
    "&blq=" + document.fcompoc.bloc.checked ;
    respServlet = "compOC(1)" ;
    conectarMethod(url, muestraResultadoSP, 'POST');
}

function EditarOC() {
    //== Activa los campos de la forma para edición de compromisos de clase
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("compromiso")[0];
    document.fcompoc.bloc.checked = true ;
    if ((reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") {
        setVisibilidad(['GuardarComOC=inline']);
        if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N")
            document.fcompoc.bloc.checked = false ;
    } else {
        setVisibilidad(['GuardarComOC=none']);
    }
    document.fcompoc.idcoc.value = reg.getElementsByTagName("idcom")[0].firstChild.nodeValue ;
    document.fcompoc.nooc.value = reg.getElementsByTagName("tipo")[0].firstChild.nodeValue ;
    document.fcompoc.idtpc.value = reg.getElementsByTagName("idtp")[0].firstChild.nodeValue ;
    document.fcompoc.desoc.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
    document.fcompoc.thoc.value = reg.getElementsByTagName("thor")[0].firstChild.nodeValue ;
}

function nuevaOC() {
    //== Genera los valores iniciales para crear un nuevo registro de compromiso de ED
    if (oped == "0") {
        alert("No se puede modificar hoja de compromisos") ;
        return ;
    }
    document.fcompoc.idcoc.value = "0" ;
    document.fcompoc.idtpc.value = "" ;
    document.fcompoc.nooc.value = "" ;
    document.fcompoc.desoc.value = "" ;
    document.fcompoc.thoc.value = "0" ;
    document.fcompoc.bloc.checked = false ;
    setVisibilidad(['GuardarComOC=inline']);
}

function compPE(op){
    //== Hace visible o onvisible la tabla con compromisos de docencia ED
    tp = '18' ;
    if (op == "1")
        setVisibilidad(['tabcpe=inline','acompe=inline','pcompe=none','ncompe=inline']);
    else
        setVisibilidad(['tabcpe=none','acompe=none','pcompe=inline','ncompe=none']);
    var tabla=document.getElementById('cuerpocpe');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
    document.fcomppe.idcpe.value = "0" ;
    document.fcomppe.nompe.value = "" ;
    document.fcomppe.nepe.value = "0" ;
    document.fcomppe.hvis.value = "0" ;
    document.fcomppe.hinf.value = "0" ;
    document.fcomppe.thpe.value = "0" ;
    document.fcomppe.blpe.checked = false ;
    var url = 'Compromiso?op=18';
    conectarMethod(url, muestraPE, 'POST');
}

function muestraPE() {
    var cuerpo,fila,nodo,columna, ident, su = 0.0 ;
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("listacompromisos")[0];
    var reg = lista.getElementsByTagName("compromiso");
    var elementos=["idcom","nombre","nsem","hc","had","thor"];
    cuerpo=document.getElementById('cuerpocpe');
    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 6; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j - 1);
            if (j == 1)
                columna.innerHTML="<a href='#' onclick='detCompromiso("+ident+"," + tp + ")'>"+nodo+"</a>"; 
            else 
                columna.innerHTML=nodo;
        }
        columna=fila.insertCell(j-1);
        if ((reg[i].getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") 
            columna.innerHTML="<a href='#' onclick='elimCompromiso("+ident+", " + tp + ")'><img src='img/eliminar.gif'/></a>"; 
        su = su + parseFloat(reg[i].getElementsByTagName("thor")[0].firstChild.nodeValue);
        document.fcomppe.shpe.value = su ;
    }
}

function EditarPE() {
    //== Activa los campos de la forma para edición de compromisos de clase
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("compromiso")[0];
    document.fcomppe.blpe.checked = true ;
    if ((reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") {
        setVisibilidad(['GuardarComPE=inline']);
        if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N")
            document.fcomppe.blpe.checked = false ;
    } else {
        setVisibilidad(['GuardarComPE=none']);
    }
    document.fcomppe.idcpe.value = reg.getElementsByTagName("idcom")[0].firstChild.nodeValue ;
    document.fcomppe.nompe.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
    document.fcomppe.nepe.value = reg.getElementsByTagName("nsem")[0].firstChild.nodeValue ;
    document.fcomppe.hvis.value = reg.getElementsByTagName("hc")[0].firstChild.nodeValue ;
    document.fcomppe.hinf.value = reg.getElementsByTagName("had")[0].firstChild.nodeValue ;
    document.fcomppe.thpe.value = reg.getElementsByTagName("thor")[0].firstChild.nodeValue ;
}

function guardarPE(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (oped == "0") {
        alert("No se puede modificar hoja de compromisos") ;
        return ;
    }
    var url = 'GrabarCompromiso?op=18&' + getValores(['idcpe','nompe','nepe','hvis','hinf']) +
    "&blq=" + document.fcomppe.blpe.checked ;
    respServlet = "compPE(1)" ;
    conectarMethod(url, muestraResultadoSP, 'POST');
}

function nuevaPE() {
    //== Genera los valores iniciales para crear un nuevo registro de compromiso de ED
    if (oped == "0") {
        alert("No se puede modificar hoja de compromisos") ;
        return ;
    }
    document.fcomppe.idcpe.value = "0" ;
    document.fcomppe.nompe.value = "" ;
    document.fcomppe.nepe.value = "0" ;
    document.fcomppe.hvis.value = "0" ;
    document.fcomppe.hinf.value = "0" ;
    document.fcomppe.thpe.value = "0" ;
    document.fcomppe.blpe.checked = false ;
    setVisibilidad(['GuardarComPE=inline']);
}

function compTG(op){
    //== Hace visible o onvisible la tabla con compromisos de docencia ED
    tp = '19' ;
    if (op == "1")
        setVisibilidad(['tabctg=inline','acomtg=inline','pcomtg=none','ncomtg=inline']);
    else
        setVisibilidad(['tabctg=none','acomtg=none','pcomtg=inline','ncomtg=none']);
    var tabla=document.getElementById('cuerpoctg');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
    document.fcomptg.idctg.value = "0" ;
    document.fcomptg.nomtg.value = "_" ;
    document.fcomptg.nivtg.value = "_" ;
    document.fcomptg.htg.value = "0" ;
    document.fcomptg.bltg.checked = false ;
    var url = 'Compromiso?op=19';
    conectarMethod(url, muestraTG, 'POST');
}

function muestraTG() {
    var cuerpo,fila,texto,nodo,link,columna, div, ident, su = 0.0 ;
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("listacompromisos")[0];
    var reg = lista.getElementsByTagName("compromiso");
    var elementos=["idcom","nombre","niv","hc"];
    cuerpo=document.getElementById('cuerpoctg');
    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 4; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j - 1);
            if (j == 1)
                columna.innerHTML="<a href='#' onclick='detCompromiso("+ident+"," + tp + ")'>"+nodo+"</a>"; 
            else 
                columna.innerHTML=nodo;
        }
        columna=fila.insertCell(j-1);
        if ((reg[i].getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") 
            columna.innerHTML="<a href='#' onclick='elimCompromiso("+ident+", " + tp + ")'><img src='img/eliminar.gif'/></a>"; 
        su = su + parseFloat(reg[i].getElementsByTagName("thor")[0].firstChild.nodeValue);
        document.fcomptg.shtg.value = su ;
    }
}

function EditarTG() {
    //== Activa los campos de la forma para edición de compromisos de clase
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("compromiso")[0];
    document.fcomptg.bltg.checked = true ;
    if ((reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N" || tpusu == "1") && oped == "1") {
        setVisibilidad(['GuardarComTG=inline']);
        if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N")
            document.fcomptg.bltg.checked = false ;
    } else {
        setVisibilidad(['GuardarComTG=none']);
    }
    document.fcomptg.idctg.value = reg.getElementsByTagName("idcom")[0].firstChild.nodeValue ;
    document.fcomptg.nomtg.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
    document.fcomptg.nivtg.value = reg.getElementsByTagName("niv")[0].firstChild.nodeValue ;
    document.fcomptg.htg.value = reg.getElementsByTagName("hc")[0].firstChild.nodeValue ;
}

function guardarTG(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if(!isDiligenciado(['nomtg'],['Descripción'])){
        return;
    }
    if (oped == "0") {
        alert("No se puede modificar hoja de compromisos") ;
        return ;
    }
    if (document.fcomptg.nivtg.value!= "PRE" && document.fcomptg.nivtg.value!= "POST") {
        alert("El nivel del trabajo de grado debe ser PRE o POST") ;
        return ;
    }
    var url = 'GrabarCompromiso?op=19&' + getValores(['idctg','nomtg','nivtg','htg']) +
    "&blq=" + document.fcomptg.bltg.checked ;
    respServlet = "compTG(1)" ;
    conectarMethod(url, muestraResultadoSP, 'POST');
}

function nuevaTG() {
    //== Genera los valores iniciales para crear un nuevo registro de compromiso de ED
    if (oped == "0") {
        alert("No se puede modificar hoja de compromisos") ;
        return ;
    }
    document.fcomptg.idctg.value = "0" ;
    document.fcomptg.nomtg.value = "" ;
    document.fcomptg.nivtg.value = "PRE" ;
    document.fcomptg.htg.value = "0" ;
    document.fcomptg.bltg.checked = false ;
    setVisibilidad(['GuardarComTG=inline']);
}

function detCompromiso(idc, op){
    //== Invoca la acción para traer desde la BD toda la información detallada
    tp = op ;
    var url = 'Compromiso?op=' + op + '&idc=' + idc ;
    if (op == "1" || op == "2")
        conectarMethod(url, EditarClase, 'GET');
    else if (op == "3" || op == "4" || op == "5")
        conectarMethod(url, EditarED, 'GET');
    else if (op == "6")
        conectarMethod(url, EditarOC, 'GET');
    else if (op == "18")
        conectarMethod(url, EditarPE, 'GET');
    else
        conectarMethod(url, EditarTG, 'GET');
}

function elimCompromiso(id, op){
    //== Invoca el servlet para eliminar la experiencia correspondiente
    if (oped == "0") {
        alert("No se puede modificar hoja de compromisos") ;
        return ;
    }
    var ret = confirm ("¿Realmente desea eliminar este registro Laboral?") ;
    if (ret) {
        var url = 'GrabarCompromiso?idc=' + id;
        if (op == "1" ||op == "2" )
            respServlet = "compDocencia(1, " + op + ")" ;
        else if (op == "3" || op == "4" || op == "5" )
            respServlet = "compED(1, " + op + ")" ;
        else if (op == "6")
            respServlet = "compOC(1)" ;
        else if (op == "18")
            respServlet = "compPE(1)" ;
        else if (op == "19")
            respServlet = "compTG(1)" ;
        conectarMethod(url, muestraResultadoSP, 'GET');
    }
}

function SelecccionarEmp(){
    //== Invoca el servlet para cam,biar el empleado por el seleccionado
    var url = 'selEmpleado?ide=' + document.selprof.selemp.value ;
    if (tpusu == "1")
        setVisibilidad(['confcomp=inline']);
    conectarMethod(url, muestraResultado, 'POST');
}

function ConfirmarHoja(){
    //== Invoca el servlet para confirmar hoja de compromisos del empleado seleccionado
    if (oped == "0") {
        alert("No se puede modificar hoja de compromisos") ;
        return ;
    }
    var ret = confirm ("¿Realmente desea Confirmar la Hoja de Compromiso ?") ;
    if (ret) {
        var url = 'GrabarCompromiso?idc=0&' ;
        conectarMethod(url, muestraResultado, 'GET');
    }
}