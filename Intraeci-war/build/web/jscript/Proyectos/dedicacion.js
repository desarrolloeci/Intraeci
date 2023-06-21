var idEnt=0;

function accionEditarRecurso(id){
    if(linkRecurso){
        textToInput(['horTotRecurI'+id+'=horTotRecurT'+id, 'fecIniRecurI'+id+'=fecIniRecurT'+id, 'fecFinRecurI'+id+'=fecFinRecurT'+id]);
        setVisibilidad(['editarRecurso'+id+'=none','guardarRecurso'+id+'=inline']);
    }
    return false;
}

function accionGuardarRecurso(id){
    var fechaIni=document.getElementById('fecIniRecurI'+id).value;
    var fechaFin=document.getElementById('fecFinRecurI'+id).value;
    if(!(validaFecha(fechaIni)&&(validaFecha(fechaFin))&&(difFecha(fechaIni, fechaFin)))){
        return false;
    }
    var url = 'grabarDedicacion?tp=1&id='+id+'&'+getValores(['horTotRecurI'+id,'semRecurI'+id,'fecIniRecurI'+id,'fecFinRecurI'+id]);
    respServlet="despGrabarRecurso";
    conectarX(url,muestraResultado);
    return false;
}

function despGrabarRecurso(id){
    inputToText(['horTotRecurT'+id+'=horTotRecurI'+id, 'fecIniRecurT'+id+'=fecIniRecurI'+id,'fecFinRecurT'+id+'=fecFinRecurI'+id]);
    setVisibilidad(['editarRecurso'+id+'=inline','guardarRecurso'+id+'=none']);
}

function accionEliminarRecurso(id){
    if(linkRecurso){
        if(confirm('Desea eliminar la dedicación')){
            var url = 'grabarDedicacion?tp=3&id='+id;
            respServlet="despEliminarRecurso";
            conectarX(url,muestraResultado);
        }
    }
    return false;
}

function despEliminarRecurso(id){
    document.getElementById('cuerpoRecurso').removeChild(document.getElementById('filaRecurso'+id));
}

function accionNuevoRecurso(){
    setVisibilidad(['camposNueRecur=inline','crearRecurso=inline','nuevoRecurso=none']);
}

function accionCrearRecurso(){
    if(!isDiligenciado(['recurInt','uniRecurInt','horTotRecur','semRecur','fecIniRecur','fecFinRecur'], ['Recurso','Unidad','HorTot','#Sem','Inicio','Fin'])){
        return false;
    }
    var fechaIni=document.getElementById('fecIniRecur').value;
    var fechaFin=document.getElementById('fecFinRecur').value;
    if(!(validaFecha(fechaIni)&&(validaFecha(fechaFin))&&(difFecha(fechaIni, fechaFin)))){
        return false;
    }
    if(!isNumero(['horTotRecur','semRecur'], ['HorTot','#Sem'])){
        return false;
    }
    var url = 'grabarDedicacion?tp=2&idEnt='+ idEnt + '&'+getValores(['recurInt','uniRecurInt','horTotRecur','semRecur','fecIniRecur','fecFinRecur']);
    respServlet="despCrearRecurso";
    conectarX(url,muestraResultado);
    return false;
}

function despCrearRecurso(idN){
    var cuerpo=document.getElementById('cuerpoRecurso'), fila, columna;
    fila=cuerpo.insertRow(0);
    fila.setAttribute("id", "filaRecurso"+idN);
    columna=fila.insertCell(0);
    columna.innerHTML="<a id='editarRecurso"+idN+"' href='#' onclick='accionEditarRecurso("+idN+");'><img alt='Editar' src='img/editar.gif'/></a><a id='guardarRecurso"+idN+"' style='display: none;' href='#' onclick='accionGuardarRecurso("+idN+");'><img alt='Guardar' src='img/guardar.gif'/></a>";
    columna=fila.insertCell(1);
    columna.innerHTML="<div id='recursoT"+idN+"'>"+document.getElementById('recurExt').value+"</div>";
    columna=fila.insertCell(2);
    columna.innerHTML="<div id='uniRecurT"+idN+"'>"+document.getElementById('uniRecurExt').value+"</div>";
    columna=fila.insertCell(3);
    columna.innerHTML="<div id='horTotRecurT"+idN+"'>"+document.getElementById('horTotRecur').value+"</div><input id='horTotRecurI"+idN+"' size='12' type='text' style='display: none;'/><input id='semRecurI"+idN+"' type='hidden' value='0'/>";
    columna=fila.insertCell(4);
    columna.innerHTML="<div id='fecIniRecurT"+idN+"'>"+document.getElementById('fecIniRecur').value+"</div><input id='fecIniRecurI"+idN+"' size='12' type='text' style='display: none;'/>";
    columna=fila.insertCell(5);
    columna.innerHTML="<div id='fecFinRecurT"+idN+"'>"+document.getElementById('fecFinRecur').value+"</div><input id='fecFinRecurI"+idN+"' size='12' type='text' style='display: none;'/>";
    columna=fila.insertCell(6);
    columna.innerHTML="<a id='eliminarRecurso"+idN+"' href='#' onclick='accionEliminarRecurso("+idN+");'><img alt='Eliminar' src='img/eliminar.gif'/></a>";    
    setValorInput(['recurExt=','recurInt=','uniRecurExt=','uniRecurInt=','horTotRecur=','fecIniRecur=','fecFinRecur=']);
    setVisibilidad(['camposNueRecur=none','crearRecurso=none','nuevoRecurso=inline','recurExt=inline','uniRecurExt=inline','horTotRecur=inline','semRecur=inline','fecIniRecur=inline','fecFinRecur=inline','editarRecurso'+idN+'=inline','eliminarRecurso'+idN+'=inline']);
}

function accionMostrarRecurso(ident, numA){
    numA=numA+1;
    var tabla=document.getElementById('cuerpoRecurso');
    var tam=(tabla.rows).length;          
    for(var i = 0; i < tam; i++){
        tabla.deleteRow(0);
    }
    var url = 'Fases?idEnt='+ident+'&numaA='+numA;
    idEnt=ident;
    conectarMethod(url, despMostrarRecurso, 'GET');
    return false;
}

function despMostrarRecurso(){
    if(http_request.readyState == 4) {
        if(http_request.status == 200) {
            var xmldoc = http_request.responseXML;
            var listaD = (xmldoc.getElementsByTagName("lisdedicacion")[0]).getElementsByTagName("dedicacion");          
            var cuerpo=document.getElementById('cuerpoRecurso'), fila, columna, idDed;
            for(var i=0; i<listaD.length; i++){
                idDed = listaD[i].getElementsByTagName("id")[0].firstChild.nodeValue;
                fila=cuerpo.insertRow(0);
                fila.setAttribute("id", "filaRecurso"+idDed);
                columna=fila.insertCell(0);
                columna.innerHTML="<a id='editarRecurso"+idDed+"' href='#' onclick='accionEditarRecurso("+idDed+");'><img alt='Editar' src='img/editar.gif'/></a><a id='guardarRecurso"+idDed+"' style='display: none;' href='#' onclick='accionGuardarRecurso("+idDed+");'><img alt='Guardar' src='img/guardar.gif'/></a>";
                columna=fila.insertCell(1);
                columna.innerHTML="<div id='recursoT"+idDed+"'>"+listaD[i].getElementsByTagName("nombre")[0].firstChild.nodeValue+"</div>";
                columna=fila.insertCell(2);
                columna.innerHTML="<div id='uniRecurT"+idDed+"'>"+listaD[i].getElementsByTagName("unidad")[0].firstChild.nodeValue+"</div>";
                columna=fila.insertCell(3);
                columna.innerHTML="<div id='horTotRecurT"+idDed+"'>"+listaD[i].getElementsByTagName("totalhoras")[0].firstChild.nodeValue+"</div><input id='horTotRecurI"+idDed+"' size='12' type='text' style='display: none;'/></div><input id='semRecurI"+idDed+"' type='hidden'/>";
                columna=fila.insertCell(4);
                columna.innerHTML="<div id='fecIniRecurT"+idDed+"'>"+listaD[i].getElementsByTagName("fecini")[0].firstChild.nodeValue+"</div><input id='fecIniRecurI"+idDed+"' size='12' type='text' style='display: none;'/>";
                columna=fila.insertCell(5);
                columna.innerHTML="<div id='fecFinRecurT"+idDed+"'>"+listaD[i].getElementsByTagName("fecfin")[0].firstChild.nodeValue+"</div><input id='fecFinRecurI"+idDed+"' size='12' type='text' style='display: none;'/>";
                columna=fila.insertCell(6);
                columna.innerHTML="<a id='eliminarRecurso"+idDed+"' href='#' onclick='accionEliminarRecurso("+idDed+");'><img alt='Eliminar' src='img/eliminar.gif'/></a>";                
            }
            if(idEnt==0){
                document.getElementById('tituloR').innerHTML="Recursos de Personal Interno (Fase)";
            }else{
                document.getElementById('tituloR').innerHTML="Recursos de Personal Interno ("+document.getElementById('nomEnt').value+")";
            }
        }
    }
}