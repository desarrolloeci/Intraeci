function cargarconvoca() {
    //== Limplia la tabla de detalle visible en el momento y alista el despliegue
    //== de la tabla resumen de estudios del empleado
    document.getElementById("desconv").value = "" ;
    var tabla=document.getElementById('cuerpoconva');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++){
        tabla.deleteRow(0);
    }
    tabla=document.getElementById('cuerpoconvp');
    filas=tabla.rows;
    tam=filas.length;
    for(i = 0; i < tam; i++){
        tabla.deleteRow(0);
    }
    var url = 'getVarios?op=1';
    conectarMethod(url,muestraconvActivos, 'POST');
    return false;
}

function muestraconvActivos() {
    // Despliega la tabla resumen de los estudios del empleado activo
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("convocatorias")[0];
    var reg = lista.getElementsByTagName("convoca");
    var cuerpo = document.getElementById('cuerpoconva'),fila, nodo;
    var columna, ident;

    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName("idcon")[0].firstChild.nodeValue;
        //== Celda que describe la convocatoria
        nodo=reg[i].getElementsByTagName("descon")[0].firstChild.nodeValue;
        columna=fila.insertCell(0);
        columna.innerHTML="<a href='#' onclick='detConvoca(101,"+ident+")'>"+nodo+"</a>";
        //== Celda que describe la convocatoria
        nodo=reg[i].getElementsByTagName("fecha")[0].firstChild.nodeValue;
        columna=fila.insertCell(1);
        columna.innerHTML=nodo;
        //== Celda para check de inscripcion de la convoca
        columna=fila.insertCell(2);
        columna.innerHTML="<input type='checkbox' name='insc"+ident+"' value='"+ident+"'/>";
    }
    conectarMethod('getVarios?op=2',muestraconvParticipa, 'POST');
}

function muestraconvParticipa() {
    //== Despliega la tabla resumen de los estudios del empleado activo
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("convocatorias")[0];
    var reg = lista.getElementsByTagName("convoca");
    var cuerpo = document.getElementById('cuerpoconvp'),fila, nodo;
    var columna, ident;

    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName("idpar")[0].firstChild.nodeValue;
        //== Celda que describe la convocatoria
        nodo=reg[i].getElementsByTagName("descon")[0].firstChild.nodeValue;
        columna=fila.insertCell(0);
        columna.innerHTML="<a href='#' onclick='detConvoca(102,"+ident+")'>"+nodo+"</a>";
        //== Celda que describe la fecha
        nodo=reg[i].getElementsByTagName("fecha")[0].firstChild.nodeValue;
        columna=fila.insertCell(1);
        columna.innerHTML=nodo;
        //== Celda que describe lel estado
        nodo=reg[i].getElementsByTagName("estado")[0].firstChild.nodeValue;
        columna=fila.insertCell(2);
        columna.innerHTML=nodo;
        //== Celda para check de inscripcion de la convoca
        columna=fila.insertCell(3);
        columna.innerHTML="<input type='checkbox' name='desinsc"+ident+"' value='"+ident+"'/>";
    }
    http_request=null;
}

function inscConvoca(op){
    //== Invoca el servlet para inscribir o desincribir al aspirante en convocatoria
    var j = 0;
    var url = 'partConvoca?oper=' + op ;
    var oper = "insc" ;
    var convs = document.finscribe.getElementsByTagName("input") ;
    if (op == "2") {
        oper = "desinsc" ;
        convs = document.fdesincribe.getElementsByTagName("input") ;
    }
    for (var i = 0; i < convs.length; i++ )
        if (convs[i].name.indexOf(oper, 0) >= 0 && convs[i].checked)  {
            url = url + "&" + oper + j + "=" + convs[i].value ;
            j++ ;
        }
    if (j == 0) {
        alert("No hay movimientos para realizar") ;
        return false;
    }
    url = url + "&nc=" + j ;
    respServlet = "cargarconvoca" ;
    conectarMethod(url, muestraResultado, 'GET');
    return false;
}

function detConvoca(op, id){
    var url = 'getVarios?op=' + op + "&id=" + id ;
    if (op == "5") {
        var tabla=document.getElementById('cuerpoconvp');
        var filas=tabla.rows;
        var tam=filas.length;
        for(var i = 0; i < tam; i++)
            tabla.deleteRow(0);
        conectarMethod(url, aspirConv, 'POST');
    }
    else
        conectarMethod(url, EditarConvoca, 'GET');
    return false;
}

function EditarConvoca() {
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var val = xmldoc.getElementsByTagName("convocatoria")[0].firstChild.nodeValue ;
    document.getElementById("desconv").value = val ;
}
