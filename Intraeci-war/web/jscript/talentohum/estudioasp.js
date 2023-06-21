//====  Funciones para procesos de los estudios del aspirante
function verEstudiosAsp(){
    //== Limplia la tabla de detalle visible en el momento y alista el despliegue
    //== de la tabla resumen de estudios del empleado
    setVisibilidad(['tabperf=none','tabest=inline','tablab=none','tabidi=none','tabpub=none','tabdis=none','tabmem=none','tabpro=none','tabdoc=none']);
    var tabla=document.getElementById('cuerpoestud');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
    setEditar(['titulo=1','fecgrad=1','nsem=1','ntarp=1','blqes=1']);
    document.festudios.idestud.value = "" ;
    document.festudios.titulo.value = "" ;
    document.festudios.fecgrad.value = "dd/mm/aaaa" ;
    document.festudios.instit.value = "" ;
    document.festudios.nsem.value = "" ;
    document.festudios.niv.value = "" ;
    document.festudios.ntarp.value = "NA" ;
    document.festudios.blqes.checked = false ;
    setVisibilidad(['GuardarEstud=none']);
    respEstud = false ;
    var url = 'EstudioAsp';
    conectarMethod(url,muestraEstudiosAsp, 'POST');
}

function muestraEstudiosAsp() {
    //== Despliega la tabla resumen de los estudios del empleado activo
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("listaestudios")[0];
    var reg = lista.getElementsByTagName("estudio");
    var elementos=["idest","nivel","titulo","universidad","fgrado"];
    var cuerpo = document.getElementById('cuerpoestud'),fila,texto,nodo,url;
    var columna, ident;

    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 5; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j-1);
            if (j == 2) 
                columna.innerHTML="<a href='#' onclick='detEstudioAsp("+ident+")'>"+nodo+"</a>";
            else 
                columna.innerHTML=nodo;
        }
        columna=fila.insertCell(j-1);
        if (reg[i].getElementsByTagName("blq")[0].firstChild.nodeValue == "N") 
            columna.innerHTML="<a href='#' onclick='elimEstudioAsp("+ident+")'><img src='img/eliminar.gif'/></a>";
    }
}

function detEstudioAsp(idest){
    //== Invoca la acción para traer desde la BD toda la información de un estudio seleccionado
    //== desde la tabla de estuduos del empleado, para poder editar la información.
    var url = 'EstudioAsp?idestud=' + idest ;
    conectarMethod(url, EditarEstudioAsp, 'GET');
}

function EditarEstudioAsp() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['titulo=1','fecgrad=1','nsem=1','ntarp=1','blqes=1']);
    setVisibilidad(['GuardarEstud=none']);
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("estudio")[0];
    if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N") {
        setEditar(['titulo=','fecgrad=','nsem=','ntarp=','blqes=']);
        setVisibilidad(['GuardarEstud=inline']);
        document.festudios.blqes.checked = false ;
        respEstud = true ;
    } else {
        document.festudios.blqes.checked = true ;
        respEstud = false ;
    }
    document.festudios.idestud.value = reg.getElementsByTagName("idest")[0].firstChild.nodeValue ;
    document.festudios.titulo.value = reg.getElementsByTagName("titulo")[0].firstChild.nodeValue ;
    document.festudios.fecgrad.value = reg.getElementsByTagName("fgrado")[0].firstChild.nodeValue ;
    document.festudios.instit.value = reg.getElementsByTagName("universidad")[0].firstChild.nodeValue ;
    document.festudios.cinstit.value = reg.getElementsByTagName("cuniv")[0].firstChild.nodeValue ;
    document.festudios.nsem.value = reg.getElementsByTagName("duracion")[0].firstChild.nodeValue ;
    document.festudios.cniv.value = reg.getElementsByTagName("nivel")[0].firstChild.nodeValue ;
    document.festudios.niv.value = devuelveValorxSigla(document.festudios.cniv.value,listaNivelEstud()) ;
    document.festudios.ntarp.value = reg.getElementsByTagName("tarprof")[0].firstChild.nodeValue ;
}

function guardarEstudioAsp(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (!validaFecha(document.festudios.fecgrad.value))
        return ;
    if (document.festudios.titulo.value.length < 2 ) {
        alert("Debe indicar el título obtenido") ;
        return ;
    }
    if (document.festudios.niv.value.length < 2 ) {
        alert("Debe seleccionar el tipo del estudio realizado") ;
        return ;
    }
    if (document.festudios.instit.value.length < 2 ) {
        alert("Debe seleccionar la Institución Universitaria. Use OTRA si no la encuentra") ;
        return ;
    }
    if (parseInt(document.festudios.nsem.value) < 1) {
        alert("Debe indicar el número de semestres") ;
        return ;
    }
    var url = 'GrabarEstudioAsp?' + getValores(['idestud','cinstit','titulo','fecgrad','nsem','ntarp','cniv']) +
               "&blqes=" + document.festudios.blqes.checked ;
    respServlet = "verEstudiosAsp";
    conectarMethod(url, muestraResultado, 'POST');
}

function nuevoEstudioAsp() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['titulo=','fecgrad=','nsem=','niv=','ntarp=','blqes=']);
    document.festudios.idestud.value = "0" ;
    document.festudios.titulo.value = "_" ;
    document.festudios.fecgrad.value = "dd/mm/aaaa" ;
    document.festudios.instit.value = "_" ;
    document.festudios.cinstit.value = "" ;
    document.festudios.nsem.value = "0" ;
    document.festudios.niv.value = "" ;
    document.festudios.ntarp.value = "NA" ;
    document.festudios.blqes.checked = false ;
    setVisibilidad(['GuardarEstud=inline']);
    respEstud = true ;
}

function elimEstudioAsp(id){
    //== Invoca el servlet para eliminar la experiencia correspondiente
    var ret = confirm ("¿Realmente desea eliminar este registro de Estudios?") ;
    if (ret) {
        var url = 'GrabarEstudioAsp?idestud=' + id;
        respServlet = "verEstudiosAsp" ;
        conectarMethod(url, muestraResultado, 'GET');
    }
}

function listaNivelEstud(){
    var Datos=new Array(11);
    Datos[0]="DOCTORADO=01" ;
    Datos[1]="MAESTRIA=02" ;
    Datos[2]="ESPECIALIZACION=03" ;
    Datos[3]="PROFESIONAL=04" ;
    Datos[4]="LICENCIADO=05" ;
    Datos[5]="TECNOLOGO=06" ;
    Datos[6]="TECNICO=07" ;
    Datos[7]="BACHILLERATO=08" ;
    Datos[8]="PRIMARIA=09" ;
    Datos[9]="OTRO=10" ;
    Datos[10]="CURSO=80" ;
    Datos[11]="DIPLOMADO=81" ;
    return Datos;
}



