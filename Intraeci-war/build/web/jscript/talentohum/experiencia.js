//====  Funciones para procesos de la experiencia laboral

function verExperiencia(){
    setVisibilidad(['tabperf=none','tabest=none','tablab=inline','tabidi=none','tabpub=none','tabdis=none','tabmem=none','tabpro=none','tabdoc=none']);
    var tabla=document.getElementById('cuerpolab');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
    setEditar(['empresa=1','tcargo=1','cargo=1','nivel=1','fdesde=1','fhasta=1','blqel=1']);
    document.fexperiencia.idhis.value = "" ;
    document.fexperiencia.empresa.value = "" ;
    document.fexperiencia.tcargo.value = "" ;
    document.fexperiencia.cargo.value = "" ;
    document.fexperiencia.nivel.value = "" ;
    document.fexperiencia.fdesde.value = "" ;
    document.fexperiencia.fhasta.value = "" ;
    document.fexperiencia.blqel.checked = false ;
    setVisibilidad(['GuardarExper=none']);
    respExper = false ;
    var url = 'Experiencia';
    conectarMethod(url, muestraExperiencia, 'POST');
}

function muestraExperiencia() {
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("listalaboral")[0];
    var reg = lista.getElementsByTagName("historia");
    var elementos=["idhis","tcargo","organizacion","periodo"];
    var cuerpo=document.getElementById('cuerpolab'), fila, nodo, columna, ident;

    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 4; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j - 1);
            if (j == 2)
                columna.innerHTML="<a href='#' onclick='detExperiencia("+ident+")'>"+nodo+"</a>";
            else 
                columna.innerHTML=nodo;
        }
        columna=fila.insertCell(j-1);
        if (reg[i].getElementsByTagName("blq")[0].firstChild.nodeValue == "N") {
            columna.innerHTML="<a href='#' onclick='elimExperiencia("+ident+")'><img src='img/eliminar.gif'/></a>";
        }
    }
}

function detExperiencia(idhis){
    //== Invoca la acción para traer desde la BD toda la información de un estudio seleccionado
    //== desde la tabla de estuduos del empleado, para poder editar la información.
    var url = 'Experiencia?idhis=' + idhis ;
    conectarMethod(url, EditarExperiencia, 'GET');
}

function EditarExperiencia() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['empresa=1','cargo=1','fdesde=1','fhasta=1','blqel=1']);
    setVisibilidad(['GuardarExper=none']);
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("historia")[0];
    if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N") {
        setEditar(['empresa=','cargo=','fdesde=','fhasta=','blqel=']);
        setVisibilidad(['GuardarExper=inline']);
        document.fexperiencia.blqel.checked = false ;
        respExper = true ;
    } else {
        document.fexperiencia.blqel.checked = true ;
        respExper = false ;
    }
    document.fexperiencia.idhis.value = reg.getElementsByTagName("idhis")[0].firstChild.nodeValue ;
    document.fexperiencia.empresa.value = reg.getElementsByTagName("organizacion")[0].firstChild.nodeValue ;
    document.fexperiencia.tcargo.value = reg.getElementsByTagName("tcargo")[0].firstChild.nodeValue ;
    document.fexperiencia.cargo.value = reg.getElementsByTagName("cargo")[0].firstChild.nodeValue ;
    document.fexperiencia.nivel.value = reg.getElementsByTagName("niveld")[0].firstChild.nodeValue ;
    document.fexperiencia.fdesde.value = reg.getElementsByTagName("fini")[0].firstChild.nodeValue ;
    document.fexperiencia.fhasta.value = reg.getElementsByTagName("ffin")[0].firstChild.nodeValue ;
}

function nuevaExperiencia() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['empresa=','cargo=','fdesde=','fhasta=','blqel=']);
    document.fexperiencia.idhis.value = "0" ;
    document.fexperiencia.empresa.value = "_" ;
    document.fexperiencia.tcargo.value = "_" ;
    document.fexperiencia.cargo.value = "_" ;
    document.fexperiencia.nivel.value = "_" ;
    document.fexperiencia.fdesde.value = "dd/mm/aaaa" ;
    document.fexperiencia.fhasta.value = "dd/mm/aaaa" ;
    document.fexperiencia.blqel.checked = false ;
    setVisibilidad(['GuardarExper=inline']);
    respExper = true ;
}

function guardarExperiencia(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (!validaFecha(document.fexperiencia.fdesde.value)) 
        return ;
    if (document.fexperiencia.cargo.value.length < 2 ) {
        alert("Debe indicar el cargo ocupado") ;
        return ;
    }
    if (document.fexperiencia.empresa.value.length < 2 ) {
        alert("Debe indicar la empresa") ;
        return ;
    }
    if (document.fexperiencia.tcargo.value.length < 2  ) {
        alert("Debe selecconar el tipo de cargo ocupado") ;
        return ;
    }
    var url = 'GrabarExperiencia?' + getValores(['idhis','empresa','fdesde','fhasta','cargo','tcargo','nivel']) +
             "&blqel=" + document.fexperiencia.blqel.checked ;
    respServlet = "verExperiencia" ;
    conectarMethod(url, muestraResultado, 'POST');
}

function elimExperiencia(id){
    //== Invoca el servlet para eliminar la experiencia correspondiente
    var ret = confirm ("¿Realmente desea eliminar este registro Laboral?") ;
    if (ret) {
        var url = 'GrabarExperiencia?idhis=' + id;
        respServlet = "verExperiencia" ;
        conectarMethod(url, muestraResultado, 'GET');
    }
}

function listaTCargos(){
    var Datos=new Array(5);
    Datos[0]="Administrativo=Administrativo";
    Datos[1]="Directivo=Directivo";
    Datos[2]="Académico=Académico";
    Datos[3]="Profesional=Profesional";
    Datos[4]="Operario=Operario";
    Datos[5]="Otro=Otro";
    return Datos;
}
