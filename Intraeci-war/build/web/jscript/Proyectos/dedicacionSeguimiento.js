var respLinkD=false;

function accionEditarDedi(){
    setVisibilidad(['guardarDedi=inline','editarDedi=none']);
    var cuerpo=document.getElementById('dedicacion');
    var entradas=cuerpo.getElementsByTagName('input');    
    for(var i=0;i<entradas.length;i++){
        entradas[i].readOnly=false;
    }
    setReadOnly(['recurExt=1']);
    defineColorXEdicion();
}

function accionGrabarDedi(){
    var cuerpo=document.getElementById('dedicacion');
    var entradas=cuerpo.getElementsByTagName('input');
    var url='Grabar?tp=4&listaDedicacion=';
    for(var i=0;i<entradas.length-3;i++){
        if(isNumero([entradas[i].id], ['Horas'])){
            url=url + entradas[i].id + '_' + entradas[i].value + '-';
        }else{
            return false;
        }
    }
    respServlet="despGrabarDedi";
    conectarX(url,muestraResultado);
    return false;
}

function despGrabarDedi(){
    setVisibilidad(['guardarDedi=none','editarDedi=inline']);
    var cuerpo=document.getElementById('dedicacion');
    var entradas=cuerpo.getElementsByTagName('input');    
    for(var i=0;i<entradas.length;i++){
        entradas[i].readOnly=true;
    }    
    defineColorXEdicion();
}

function accionEliminarRecurso(id){
    if(respLinkD){
        if(confirm('Desea eliminar la dedicación')){
            var url = 'Grabar?tp=7&id='+id;
            respServlet="despEliminarRecurso";
            conectarX(url,muestraResultado);
        }
    }
    return false;
}

function despEliminarRecurso(id){
    document.getElementById('dedicacion').removeChild(document.getElementById('ded'+id));
}

function accionNuevaDedi(){    
    setVisibilidad(['camposNuevaDedi=inline','crearDedi=inline','nuevaDedi=none']);
}

function accionCrearDedi(){
    if(!isDiligenciado(['recurInt'], ['Personal'])){
        return false;
    }
    var url = 'Grabar?tp=6&'+getValores(['recurInt']);
    respServlet="despCrearDedi";
    conectarX(url,muestraResultado);
    return false;
}

function despCrearDedi(idN){
    var cuerpo=document.getElementById('dedicacion'), fila;
    fila=cuerpo.insertRow(0);
    fila.setAttribute("id", "ded"+idN);
    (fila.insertCell(0)).innerHTML=document.getElementById('recurExt').value;
    (fila.insertCell(1)).innerHTML="<input readonly id='"+idN+"' value='0'/>";
    (fila.insertCell(2)).innerHTML="<a onclick='return accionEliminarRecurso("+idN+");' href='#'><img src='img/eliminar.gif' alt='Eliminar'><a/>";
    setValorInput(['recurExt=','recurInt=','uniRecurExt=']);
    setVisibilidad(['camposNuevaDedi=none','crearDedi=none','nuevaDedi=inline']);
    defineColorXEdicion();
}