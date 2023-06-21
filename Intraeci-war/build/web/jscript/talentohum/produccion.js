//====  Funciones para procesos de las publicaciones
function verPublicacion(){
    setVisibilidad(['tabperf=none','tabest=none','tablab=none','tabidi=none','tabpub=inline','tabdis=none','tabmem=none','tabpro=none','tabdoc=none']);
    var tabla=document.getElementById('cuerpopub');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
    setEditar(['fec=1','arpub=1','titpub=1','edic=1','tmayor=1','edit=1','ciudpub=1','paispub=1']);
    document.fpublic.idpub.value = "" ;
    document.fpublic.tipo.value = "" ;
    document.fpublic.fec.value = "" ;
    document.fpublic.arpub.value = "" ;
    document.fpublic.titpub.value = "" ;
    document.fpublic.edic.value = "" ;
    document.fpublic.tmayor.value = "" ;
    document.fpublic.edit.value = "" ;
    document.fpublic.ciudpub.value = "" ;
    document.fpublic.paispub.value = "" ;
    setVisibilidad(['GuardarPub=none']);
    respPub = false ;
    var url = 'Publicaciones';
    conectarMethod(url, muestraPublicacion, 'POST');
}

function muestraPublicacion() {
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("lispublicaciones")[0];
    var reg = lista.getElementsByTagName("publicacion");
    var elementos=["idpub","tipo","titulo","fecha","area"];
    var cuerpo=document.getElementById('cuerpopub'),fila, nodo, columna, ident;

    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 5; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j - 1);
            if (j == 2)
                columna.innerHTML="<a href='#' onclick='detPublicacion("+ident+")'>"+nodo+"</a>";
            else 
                columna.innerHTML=nodo;
        }
        columna=fila.insertCell(j-1);
        columna.innerHTML="<a href='#' onclick='elimPublicacion("+ident+")'><img src='img/eliminar.gif'/></a>";
    }
}

function detPublicacion(idpub){
    //== Invoca la acción para traer desde la BD toda la información de un estudio seleccionado
    //== desde la tabla de estuduos del empleado, para poder editar la información.
    var url = 'Publicaciones?idpub=' + idpub ;
    conectarMethod(url, EditarPublicacion, 'GET');
}

function EditarPublicacion() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['fec=','arpub=','titpub=','edic=','tmayor=','edit=','ciudpub=','paispub=']);
    respPub = true ;
    setVisibilidad(['GuardarPub=inline']);
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("publicacion")[0];
    document.fpublic.idpub.value = reg.getElementsByTagName("idpub")[0].firstChild.nodeValue ;
    document.fpublic.tipo.value = reg.getElementsByTagName("tipo")[0].firstChild.nodeValue ;
    document.fpublic.fec.value = reg.getElementsByTagName("fecha")[0].firstChild.nodeValue ;
    document.fpublic.arpub.value = reg.getElementsByTagName("area")[0].firstChild.nodeValue ;
    document.fpublic.titpub.value = reg.getElementsByTagName("titulo")[0].firstChild.nodeValue ;
    document.fpublic.edic.value = reg.getElementsByTagName("edicion")[0].firstChild.nodeValue ;
    document.fpublic.tmayor.value = reg.getElementsByTagName("tmayor")[0].firstChild.nodeValue ;
    document.fpublic.edit.value = reg.getElementsByTagName("editor")[0].firstChild.nodeValue ;
    document.fpublic.ciudpub.value = reg.getElementsByTagName("ciudad")[0].firstChild.nodeValue ;
    document.fpublic.paispub.value = reg.getElementsByTagName("pais")[0].firstChild.nodeValue ;
}

function nuevaPublicacion() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['fec=','arpub=','titpub=','edic=','tmayor=','edit=','ciudpub=','paispub=']);
    document.fpublic.idpub.value = "0" ;
    document.fpublic.tipo.value = "Artículo" ;
    document.fpublic.fec.value = "" ;
    document.fpublic.arpub.value = "Otra" ;
    document.fpublic.titpub.value = "_" ;
    document.fpublic.edic.value = "_" ;
    document.fpublic.tmayor.value = "NA" ;
    document.fpublic.edit.value = "NA" ;
    document.fpublic.ciudpub.value = "Bogotá" ;
    document.fpublic.paispub.value = "Colombia" ;
    setVisibilidad(['GuardarPub=inline']);
    respPub = true ;
}

function guardarPublicacion(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (document.fpublic.titpub.value.length < 2) {
        alert("La publicación debe tener un título válido") ;
        return ;
    }
    if (document.fpublic.fec.value.length != 7 || document.fpublic.fec.value.substring(4,5) != "/" ) {
        alert("La fecha de publicación debe ser en el formato solicitado: aaaa/mm") ;
        return ;
    }
    if (document.fpublic.arpub.value.length < 2) {
        alert("Debe seleccionar el área de la publicación") ;
        return ;
    }
    if (document.fpublic.edit.value.length < 1 || document.fpublic.edit.value == " " ) {
        alert("Si la publicación tiene ISBN/ISSN regístrelo, de lo contrario registre un NA") ;
        return ;
    }
    var url = 'GrabarPublicacion?' + getValores(['idpub','tipo','fec','arpub','titpub','edic','tmayor','edit','ciudpub','paispub']) ;
    respServlet = "verPublicacion";
    conectarMethod(url,muestraResultado,'POST');
}

function elimPublicacion(id){
    //== Invoca el servlet para eliminar la experiencia correspondiente
    var ret = confirm("¿Realmente desea eliminar este registro de Publicación?") ;
    if (ret) {
        var url = 'GrabarPublicacion?idpub=' + id;
        respServlet = "verPublicacion";
        conectarMethod(url,muestraResultado,'GET');
    }
}

function listaTiposP(){
    var Datos=new Array(4);
    Datos[0]="Artículo=Artículo";
    Datos[1]="Capítulo=Capítulo";
    Datos[2]="Libro=Libro";
    Datos[3]="Otro=Otro";
    return Datos;
}

function listaAreasP(){
    var Datos=new Array(9);
    Datos[0]="Ingenierías=Ingenierías";
    Datos[1]="C.Naturales=C.Naturales";
    Datos[2]="Matemáticas=Matemáticas";
    Datos[3]="Humanidades=Humanidades";
    Datos[4]="Salud=Salud";
    Datos[5]="Derecho=Derecho";
    Datos[6]="Economía=Economía";
    Datos[7]="Administración=Administración";
    Datos[8]="Otra=Otra";
    return Datos;
}

//== Otros tipos de Producción
function verProduccion(){
    setVisibilidad(['tabperf=none','tabest=none','tablab=none','tabidi=none','tabpub=none','tabdis=none','tabmem=none','tabpro=inline','tabdoc=none']);
    var tabla=document.getElementById('cuerpopro');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
    setEditar(['titp=1','objp=1','orgp=1','refp=1','paisp=1','finip=1','ffinp=1','blqp=1']);
    document.fproducto.idpro.value = "" ;
    document.fproducto.titp.value = "" ;
    document.fproducto.tipp.value = "" ;
    document.fproducto.objp.value = "" ;
    document.fproducto.orgp.value = "" ;
    document.fproducto.paisp.value = "" ;
    document.fproducto.refp.value = "" ;
    document.fproducto.finip.value = "" ;
    document.fproducto.ffinp.value = "" ;
    document.fproducto.rolp.value = "" ;
    document.fproducto.blqp.checked = false ;
    setVisibilidad(['GuardarPro=none']);
    respProd = false ;
    var url = 'Produccion';
    conectarMethod(url, muestraProduccion, 'POST');
}

function muestraProduccion() {
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("produccion")[0];
    var reg = lista.getElementsByTagName("producto");
    var elementos=["idpro","tipo", "nombre","periodo"];
    var cuerpo=document.getElementById('cuerpopro'),fila, nodo, columna, ident;

    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 4; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j - 1);
            if (j == 2)
                columna.innerHTML="<a href='#' onclick='detProducto("+ident+")'>"+nodo+"</a>";
            else 
                columna.innerHTML=nodo;
        }
        columna=fila.insertCell(j-1);
        if (reg[i].getElementsByTagName("blq")[0].firstChild.nodeValue == "N") 
            columna.innerHTML="<a href='#' onclick='elimProducto("+ident+")'><img src='img/eliminar.gif'/></a>";
    }
}

function detProducto(idpro){
    //== Invoca la acción para traer desde la BD toda la información de un estudio seleccionado
    //== desde la tabla de estuduos del empleado, para poder editar la información.
    var url = 'Produccion?idpro=' + idpro ;
    conectarMethod(url, EditarProducto, 'GET');
}

function EditarProducto() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['titp=1','objp=1','orgp=1','refp=1','paisp=1','finip=1','ffinp=1','blqp=1']);
    setVisibilidad(['GuardarPro=none']);
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("producto")[0];
    if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N") {
        setEditar(['titp=','objp=','orgp=','refp=','paisp=','finip=','ffinp=','blqp=']);
        setVisibilidad(['GuardarPro=inline']);
        document.fproducto.blqp.checked = false ;
        respProd = true ;
    } else {
        document.fproducto.blqp.checked = true ;
        respProd = false ;
    }
    document.fproducto.idpro.value = reg.getElementsByTagName("idpro")[0].firstChild.nodeValue ;
    document.fproducto.titp.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
    document.fproducto.tipp.value = reg.getElementsByTagName("tipo")[0].firstChild.nodeValue ;
    document.fproducto.objp.value = reg.getElementsByTagName("objeto")[0].firstChild.nodeValue ;
    document.fproducto.orgp.value = reg.getElementsByTagName("organ")[0].firstChild.nodeValue ;
    document.fproducto.paisp.value = reg.getElementsByTagName("pais")[0].firstChild.nodeValue ;
    document.fproducto.rolp.value = reg.getElementsByTagName("rol")[0].firstChild.nodeValue ;
    document.fproducto.refp.value = reg.getElementsByTagName("ref")[0].firstChild.nodeValue ;
    document.fproducto.finip.value = reg.getElementsByTagName("fini")[0].firstChild.nodeValue ;
    document.fproducto.ffinp.value = reg.getElementsByTagName("ffin")[0].firstChild.nodeValue ;
}

function nuevoProducto() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['titp=','objp=','orgp=','refp=','paisp=','finip=','ffinp=','blqp=']);
    document.fproducto.idpro.value = "0" ;
    document.fproducto.titp.value = "_" ;
    document.fproducto.tipp.value = "Otro" ;
    document.fproducto.objp.value = "_" ;
    document.fproducto.orgp.value = "_" ;
    document.fproducto.paisp.value = "Colombia" ;
    document.fproducto.refp.value = "_" ;
    document.fproducto.finip.value = "dd/mm/aaaa" ;
    document.fproducto.ffinp.value = "dd/mm/aaaa" ;
    document.fproducto.rolp.value = "Participante" ;
    document.fproducto.blqp.checked = false ;
    setVisibilidad(['GuardarPro=inline']);
    respProd = true ;
}

function guardarProducto(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (!validaFecha(document.fproducto.finip.value))
        return ;
    var url = 'GrabarProducto?' + getValores(['idpro','titp','tipp','objp','orgp','paisp','refp','finip','ffinp','rolp']) +
             '&blqp=' + document.fproducto.blqp.checked;
    respServlet = "verProduccion";
    conectarMethod(url,muestraResultado,'POST');
}

function elimProducto(id){
    //== Invoca el servlet para eliminar la experiencia correspondiente
    var ret = confirm("¿Realmente desea eliminar este registro de Producción?") ;
    if (ret) {
        var url = 'GrabarProducto?idpro=' + id;
        respServlet = "verProduccion";
        conectarMethod(url,muestraResultado,'GET');
    }
}

function listaTProd(){
    var Datos=new Array(8);
    Datos[0]="Software=Software";
    Datos[1]="Consultoría=Consultoría";
    Datos[2]="Construcción=Construcción";
    Datos[3]="Vial=Vial";
    Datos[4]="Eléctrico=Eléctrico";
    Datos[5]="Patente=Patente";
    Datos[6]="Maquinaria=Maquinaria";
    Datos[7]="Otro=Otro";
    return Datos;
}

function listaRoles(){
    var Datos=new Array(9);
    Datos[0]="Director=Director";
    Datos[1]="JefeGrupo=JefeGrupo";
    Datos[2]="Asesor=Asesor";
    Datos[3]="Consultor=Consultor";
    Datos[4]="Analista=Analista";
    Datos[5]="Inventor=Inventor";
    Datos[6]="Patrocinador=Patrocinador";
    Datos[7]="Participante=Participante";
    Datos[8]="Otro=Otro";
    return Datos;
}


