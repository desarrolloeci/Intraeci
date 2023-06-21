//====  Funciones para procesos de las relaciones con terceros: Membresias y Distinciones
//== Distinciones
function verDistinciones(){
    setVisibilidad(['tabperf=none','tabest=none','tablab=none','tabidi=none','tabpub=none','tabdis=inline','tabmem=none','tabpro=none','tabdoc=none']);
    var tabla=document.getElementById('cuerpodis');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
    setEditar(['nombred=1','razon=1','anio=1','institd=1','descri=1','paisd=1','blqd=1']);
    document.fdistin.iddis.value = "" ;
    document.fdistin.nombred.value = "" ;
    document.fdistin.razon.value = "" ;
    document.fdistin.anio.value = "" ;
    document.fdistin.institd.value = "" ;
    document.fdistin.descri.value = "" ;
    document.fdistin.paisd.value = "" ;
    document.fdistin.blqd.checked = false ;
    setVisibilidad(['GuardarDis=none']);
    var url = 'Distincion';
    conectarMethod(url, muestraDistincion, 'POST');
}

function muestraDistincion() {
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("distinciones")[0];
    var reg = lista.getElementsByTagName("distincion");
    var elementos=["iddis","anio","nombre","pais","instit"];
    var cuerpo=document.getElementById('cuerpodis'),fila, nodo, columna, ident;

    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 5; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j - 1);
            if (j == 2)
                columna.innerHTML="<a href='#' onclick='detDistincion("+ident+")'>"+nodo+"</a>";
            else 
                columna.innerHTML=nodo;
        }
        columna=fila.insertCell(j-1);
        if (reg[i].getElementsByTagName("blq")[0].firstChild.nodeValue == "N") 
            columna.innerHTML="<a href='#' onclick='elimDistincion("+ident+")'><img src='img/eliminar.gif'/></a>";
    }
}

function detDistincion(iddis){
    //== Invoca la acción para traer desde la BD toda la información de un estudio seleccionado
    //== desde la tabla de estuduos del empleado, para poder editar la información.
    var url = 'Distincion?iddis=' + iddis ;
    conectarMethod(url, EditarDistincion, 'GET');
}

function EditarDistincion() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['nombred=1','razon=1','anio=1','institd=1','descri=1','paisd=1','blqd=1']);
    setVisibilidad(['GuardarDis=none']);
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("distincion")[0];
    if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N") {
        setEditar(['nombred=','razon=','anio=','institd=','descri=','paisd=','blqd=']);
        setVisibilidad(['GuardarDis=inline']);
        document.fdistin.blqd.checked = false ;
    } else
        document.fdistin.blqd.checked = true ;
    document.fdistin.iddis.value = reg.getElementsByTagName("iddis")[0].firstChild.nodeValue ;
    document.fdistin.nombred.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
    document.fdistin.razon.value = reg.getElementsByTagName("razon")[0].firstChild.nodeValue ;
    document.fdistin.anio.value = reg.getElementsByTagName("anio")[0].firstChild.nodeValue ;
    document.fdistin.institd.value = reg.getElementsByTagName("instit")[0].firstChild.nodeValue ;
    document.fdistin.descri.value = reg.getElementsByTagName("descrip")[0].firstChild.nodeValue ;
    document.fdistin.paisd.value = reg.getElementsByTagName("pais")[0].firstChild.nodeValue ;
}

function nuevaDistincion() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['nombred=','razon=','anio=','institd=','descri=','paisd=','blqd=']);
    document.fdistin.iddis.value = "0" ;
    document.fdistin.nombred.value = "_" ;
    document.fdistin.razon.value = "_" ;
    document.fdistin.anio.value = "" ;
    document.fdistin.institd.value = "_" ;
    document.fdistin.descri.value = "_" ;
    document.fdistin.paisd.value = "_" ;
    document.fdistin.blqd.checked = false ;
    setVisibilidad(['GuardarDis=inline']);
}

function guardarDistincion(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    var a = parseInt(document.fdistin.anio.value) ;
    var d = new Date() ;
    if (!(a <= d.getFullYear()) || a < 1950 ) {
        alert('El año de la distinción no cumple los parámetros') ;
        return ;
    }
    var url = 'GrabarDistincion?' + getValores(['iddis','nombred','razon','anio','institd','descri','paisd']) +
             "&blqd=" + document.fdistin.blqd.checked;
    respServlet = "verDistinciones";
    conectarMethod(url,muestraResultado,'POST');
}

function elimDistincion(id){
    //== Invoca el servlet para eliminar la experiencia correspondiente
    var ret = confirm("¿Realmente desea eliminar este registro de Distinción?") ;
    if (ret) {
        var url = 'GrabarDistincion?iddis=' + id;
        respServlet = "verDistinciones";
        conectarMethod(url,muestraResultado,'GET');
    }
}

//== Membresías
function verMembresia(){
    setVisibilidad(['tabperf=none','tabest=none','tablab=none','tabidi=none','tabpub=none','tabdis=none','tabmem=inline','tabpro=none','tabdoc=none']);
    var tabla=document.getElementById('cuerpomem');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
    setEditar(['nombrem=1','tipm=1','paism=1','catm=1','fdesm=1','fhasm=1','blqm=1']);
    document.fmembresia.idmem.value = "" ;
    document.fmembresia.nombrem.value = "" ;
    document.fmembresia.tipm.value = "" ;
    document.fmembresia.paism.value = "" ;
    document.fmembresia.catm.value = "" ;
    document.fmembresia.fdesm.value = "dd/mm/aaaa" ;
    document.fmembresia.fhasm.value = "dd/mm/aaaa" ;
    document.fmembresia.blqm.checked = false ;
    setVisibilidad(['GuardarMem=none']);
    respMem = false ;
    var url = 'Membresia';
    conectarMethod(url, muestraMembresia, 'POST');
}

function muestraMembresia() {
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("listamem")[0];
    var reg = lista.getElementsByTagName("membresia");
    var elementos=["idmem","pais", "nombre","periodo"];
    var cuerpo=document.getElementById('cuerpomem'), fila, nodo, columna, ident;

    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 4; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j - 1);
            if (j == 2)
                columna.innerHTML="<a href='#' onclick='detMembresia("+ident+")'>"+nodo+"</a>";
            else 
                columna.innerHTML=nodo;
        }
        columna=fila.insertCell(j-1);
        if (reg[i].getElementsByTagName("blq")[0].firstChild.nodeValue == "N")
            columna.innerHTML="<a href='#' onclick='elimMembresia("+ident+")'><img src='img/eliminar.gif'/></a>";
    }
}

function detMembresia(idmem){
    //== Invoca la acción para traer desde la BD toda la información de un estudio seleccionado
    //== desde la tabla de estuduos del empleado, para poder editar la información.
    var url = 'Membresia?idmem=' + idmem ;
    conectarMethod(url, EditarMembresia, 'GET');
}

function EditarMembresia() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['nombrem=1','tipm=1','paism=1','catm=1','fdesm=1','fhasm=1','blqm=1']);
    setVisibilidad(['GuardarMem=none']);
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("membresia")[0];
    if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N") {
        setEditar(['nombrem=','paism=','fdesm=','fhasm=','blqm=']);
        setVisibilidad(['GuardarMem=inline']);
        document.fmembresia.blqm.checked = false ;
        respMem = true ;
    } else {
        document.fmembresia.blqm.checked = true ;
        respMem = false ;
    }
    document.fmembresia.idmem.value = reg.getElementsByTagName("idmem")[0].firstChild.nodeValue ;
    document.fmembresia.nombrem.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
    document.fmembresia.tipm.value = reg.getElementsByTagName("tipo")[0].firstChild.nodeValue ;
    document.fmembresia.paism.value = reg.getElementsByTagName("pais")[0].firstChild.nodeValue ;
    document.fmembresia.catm.value = reg.getElementsByTagName("categoria")[0].firstChild.nodeValue ;
    document.fmembresia.fdesm.value = reg.getElementsByTagName("feci")[0].firstChild.nodeValue ;
    document.fmembresia.fhasm.value = reg.getElementsByTagName("fecr")[0].firstChild.nodeValue ;
}

function nuevaMembresia() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['nombrem=','paism=','fdesm=','fhasm=','blqm=']);
    document.fmembresia.idmem.value = "0" ;
    document.fmembresia.nombrem.value = "_" ;
    document.fmembresia.tipm.value = "Científica" ;
    document.fmembresia.paism.value = "Colombia" ;
    document.fmembresia.catm.value = "Afiliado" ;
    document.fmembresia.fdesm.value = "dd/mm/aaaa" ;
    document.fmembresia.fhasm.value = "dd/mm/aaaa" ;
    document.fmembresia.blqm.checked = false ;
    setVisibilidad(['GuardarMem=inline']);
    respMem = true ;
}

function guardarMembresia(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (!validaFecha(document.fmembresia.fdesm.value))
        return ;
    var url = 'GrabarMembresia?' + getValores(['idmem','nombrem','tipm','paism','catm','fdesm','fhasm']) +
             "&blqm=" + document.fmembresia.blqm.checked;
    respServlet = "verMembresia";
    conectarMethod(url,muestraResultado,'POST');
}

function elimMembresia(id){
    //== Invoca el servlet para eliminar la experiencia correspondiente
    var ret = confirm("¿Realmente desea eliminar este registro de Membrecía?") ;
    if (ret) {
        var url = 'GrabarMembresia?idmem=' + id;
        respServlet = "verMembresia";
        conectarMethod(url,muestraResultado,'GET');
    }
}

function listaCatMem(){
    var Datos=new Array(7);
    Datos[0]="Afiliado=Afiliado";
    Datos[1]="Directivo=Directivo";
    Datos[2]="Fundador=Fundador";
    Datos[3]="Asociado=Asociado";
    Datos[4]="Vitalicio=Vitalicio";
    Datos[5]="Honorario=Honorario";
    Datos[6]="Otro=Otro";
    return Datos;
}

function listaTMem(){
    var Datos=new Array(3);
    Datos[0]="Científica=Científica";
    Datos[1]="Gremial=Gremial";
    Datos[2]="Otro=Otro";
    return Datos;
}
