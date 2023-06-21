function accionNuevoEnt(){
    respLinkEnt=true;
    setReadOnly(['nomEnt=','fecIniEnt=','fecFinEnt=','descEnt=','ingEntre=','gpEntre=','ogEntre=','invEntre=']);
    setVisibilidad(['editarEntre=none', 'guardarEntre=none','nuevoEnt=none','crearEnt=inline']);
    setValorInput(['respExt=', 'ccoseExt=','estEnt=','idEnt=','nomEnt=','fecIniEnt=','fecFinEnt=','descEnt=','ingEntre=','gpEntre=','ogEntre=','invEntre=','costIntEnt=']);
    defineColorXEdicion();
    return false;
}

function accionCrearEnt(){
    if(!isDiligenciado(['nomEnt','respInt','fecIniEnt','fecFinEnt','descEnt','estEnt','ingEntre','gpEntre','ogEntre','invEntre'],['Nombre','Responsable','Fecha Inicio','Fecha Fin','Descripción','Estado','Ingresos','Per. Externo','Otr. Gastos','Inversión'])){
        return false;
    }
    var fechaIni=document.getElementById('fecIniEnt').value;
    var fechaFin=document.getElementById('fecFinEnt').value;
    if(!(validaFecha(fechaIni)&&(validaFecha(fechaFin))&&(difFecha(fechaIni, fechaFin)))){
        return false;
    }
    var url = 'grabarEntregable?tp=2&'+getValores(['nomEnt','respInt','ccoseInt','fecIniEnt','fecFinEnt','descEnt','estEnt','ingEntre','gpEntre','ogEntre','invEntre']);
    respServlet="despCrearEnt";
    conectarX(url,muestraResultado);
    return false;
}

function despCrearEnt(idN){
    var cuerpo=document.getElementById('cuerpoEntregables');
    var fila=cuerpo.insertRow(0);
    var link=document.createElement("a");
    link.setAttribute("href", "#");
    link.onclick= function(){
        eval("verentregable('"+idN+"');");
    }
    link.appendChild(document.createTextNode(document.getElementById('nomEnt').value));
    var columna=fila.insertCell(0);
    columna.appendChild(link);
    fila.appendChild(columna);
    cuerpo.appendChild(fila);
    setVisibilidad(['editarEntre=inline', 'guardarEntre=none', 'nuevoEnt=inline', 'crearEnt=none']);
    setReadOnly(['editarEntre=true','nomEnt=true','fecIniEnt=true','fecFinEnt=true','descEnt=true']);
    respLinkEnt=false;
    defineColorXEdicion();
}

function accionEditarEnt(){
    setReadOnly(['nomEnt=','fecIniEnt=','fecFinEnt=','descEnt=','ingEntre=','gpEntre=','ogEntre=','invEntre=']);
    setVisibilidad(['editarEntre=none', 'guardarEntre=inline']);
    respLinkEnt=true;
    defineColorXEdicion();
    return false;
}

function accionGuardarEnt(){
    var fechaIni=document.getElementById('fecIniEnt').value;
    var fechaFin=document.getElementById('fecFinEnt').value;
    if(!(validaFecha(fechaIni)&&(validaFecha(fechaFin))&&(difFecha(fechaIni, fechaFin)))){
        return false;
    }
    respServlet="despGuardarEnt";
    var url = 'grabarEntregable?tp=1&'+getValores(['nomEnt','fecIniEnt','fecFinEnt','descEnt','estEnt','respInt','ccoseInt','ingEntre','gpEntre','ogEntre','invEntre']);
    conectarX(url,muestraResultado);
    return false;
}

function despGuardarEnt(){
    setVisibilidad(['editarEntre=inline', 'guardarEntre=none']);
    setReadOnly(['fecIniEnt=1','fecFinEnt=1','descEnt=1','nomEnt=1','ingEntre=1','gpEntre=1','ogEntre=1','invEntre=1']);
    defineColorXEdicion();
    respLinkEnt=false;
}

function verentregable(ide){
    //Realizar Peticion
    var url = 'Fases?ide='+ide;    
    conectarX(url,muestraentregable);
    return false;
}

function muestraentregable() {
    if(http_request.readyState == 4) {
        if(http_request.status == 200) {
            var xmldoc = http_request.responseXML;
            var reg = xmldoc.getElementsByTagName("entregable")[0];
            document.fentregable.ident.value = reg.getElementsByTagName("id")[0].firstChild.nodeValue ;
            document.fentregable.noment.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
            document.fentregable.estent.value = reg.getElementsByTagName("estado")[0].firstChild.nodeValue ;
            document.fentregable.descent.value = reg.getElementsByTagName("descrip")[0].firstChild.nodeValue ;
            document.fentregable.fini.value = reg.getElementsByTagName("inicio")[0].firstChild.nodeValue ;
            document.fentregable.ffin.value = reg.getElementsByTagName("fin")[0].firstChild.nodeValue ;
            document.getElementById('respExt').value = reg.getElementsByTagName("nomResp")[0].firstChild.nodeValue ;
            document.getElementById('respInt').value = reg.getElementsByTagName("idResp")[0].firstChild.nodeValue ;
            document.getElementById('ccoseExt').value = reg.getElementsByTagName("ccExt")[0].firstChild.nodeValue ;
            document.getElementById('ccoseInt').value = reg.getElementsByTagName("ccInt")[0].firstChild.nodeValue ;
            document.getElementById('ingEntre').value = reg.getElementsByTagName("ting")[0].firstChild.nodeValue ;
            document.getElementById('gpEntre').value = reg.getElementsByTagName("tgaspe")[0].firstChild.nodeValue ;
            document.getElementById('ogEntre').value = reg.getElementsByTagName("otrgas")[0].firstChild.nodeValue ;
            document.getElementById('invEntre').value = reg.getElementsByTagName("invest")[0].firstChild.nodeValue ;
            document.getElementById('costIntEnt').value = reg.getElementsByTagName("costInt")[0].firstChild.nodeValue ;
            setVisibilidad(['editarEntre=inline', 'guardarEntre=none', 'nuevoEnt=inline','crearEnt=none']);
            setReadOnly(['nomEnt=1','fecIniEnt=1','fecFinEnt=1','descEnt=1','ingEntre=1','gpEntre=1','ogEntre=1','invEntre=1']);
            defineColorXEdicion();
            respLinkEnt=false;
            if(reg.getElementsByTagName("permiso")[0].firstChild.nodeValue=="1"){
                setEditar(['editarEntre=']);
            }else{
                setEditar(['editarEntre=1']);
            }
            accionMostrarRecurso(reg.getElementsByTagName("id")[0].firstChild.nodeValue);
        }
    }
}