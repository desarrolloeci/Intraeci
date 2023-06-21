//====  Funciones para procesos del manejo de lenguas del empleado

function verIdiomas(){
    setVisibilidad(['tabperf=none','tabest=none','tablab=none','tabidi=inline','tabpub=none','tabdis=none','tabmem=none','tabpro=none','tabdoc=none']);
    var tabla=document.getElementById('cuerpoidi');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
    setEditar(['certif=1','fcert=1','organ=1','punti=1','mlee=1','mesc=1','mhab=1','blqi=1']);
    document.fidioma.idlen.value = "" ;
    document.fidioma.lengua.value = "" ;
    document.fidioma.certif.value = "" ;
    document.fidioma.fcert.value = "" ;
    document.fidioma.organ.value = "" ;
    document.fidioma.punti.value = "" ;
    document.fidioma.mlee.value = "" ;
    document.fidioma.mesc.value = "" ;
    document.fidioma.mhab.value = "" ;
    document.fidioma.blqi.checked = false ;
    setVisibilidad(['GuardarIdi=none']);
    respIdi = false ;
    var url = 'IdiomasEmp';
    conectarMethod(url,muestraIdiomas, 'POST');
}

function muestraIdiomas() {
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("listaidiomas")[0];
    var reg = lista.getElementsByTagName("idioma");
    var elementos=["idlen","lengua","certif","lee","escribe","habla"];
    var cuerpo=document.getElementById('cuerpoidi'),fila, nodo, columna;

    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
        for(var j = 1; j < 6; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j - 1);
            if (j == 1)
                columna.innerHTML="<a href='#' onclick='detIdioma("+ident+")'>"+nodo+"</a>";
            else 
                columna.innerHTML=nodo;
        }
        columna=fila.insertCell(j-1);
        if (reg[i].getElementsByTagName("blq")[0].firstChild.nodeValue == "N") 
            columna.innerHTML="<a href='#' onclick='elimIdioma("+ident+")'><img src='img/eliminar.gif'/></a>";
    }
}

function detIdioma(idlen){
    //== Invoca la acción para traer desde la BD toda la información de un estudio seleccionado
    //== desde la tabla de estuduos del empleado, para poder editar la información.
    var url = 'IdiomasEmp?idlen=' + idlen ;
    conectarMethod(url, EditarIdioma, 'GET');
}

function EditarIdioma() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['certif=1','fcert=1','organ=1','punti=1','mlee=1','mesc=1','mhab=1','blqi=1']);
    setVisibilidad(['GuardarIdi=none']);
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("idioma")[0];
    if (reg.getElementsByTagName("blq")[0].firstChild.nodeValue == "N") {
        setEditar(['certif=','fcert=','organ=','punti=','mlee=','mesc=','mhab=','blqi=']);
        setVisibilidad(['GuardarIdi=inline']);
        document.fidioma.blqi.checked = false ;
        respIdi = true ;
    } else {
        document.fidioma.blqi.checked = true ;
        respIdi = false ;
    }
    document.fidioma.idlen.value = reg.getElementsByTagName("idlen")[0].firstChild.nodeValue ;
    document.fidioma.lengua.value = reg.getElementsByTagName("lengua")[0].firstChild.nodeValue ;
    document.fidioma.certif.value = reg.getElementsByTagName("certif")[0].firstChild.nodeValue ;
    document.fidioma.fcert.value = reg.getElementsByTagName("fecha")[0].firstChild.nodeValue ;
    document.fidioma.organ.value = reg.getElementsByTagName("organ")[0].firstChild.nodeValue ;
    document.fidioma.punti.value = reg.getElementsByTagName("punt")[0].firstChild.nodeValue ;
    document.fidioma.mlee.value = reg.getElementsByTagName("lee")[0].firstChild.nodeValue ;
    document.fidioma.mesc.value = reg.getElementsByTagName("escribe")[0].firstChild.nodeValue ;
    document.fidioma.mhab.value = reg.getElementsByTagName("habla")[0].firstChild.nodeValue ;
}

function nuevoIdioma() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['certif=','fcert=','organ=','punti=','mlee=','mesc=','mhab=','blqi=']);
    document.fidioma.idlen.value = "0" ;
    document.fidioma.lengua.value = "_" ;
    document.fidioma.certif.value = "NA" ;
    document.fidioma.organ.value = "NA" ;
    document.fidioma.fcert.value = "dd/mm/aaaa" ;
    document.fidioma.punti.value = "0" ;
    document.fidioma.mlee.value = "B" ;
    document.fidioma.mesc.value = "B" ;
    document.fidioma.mhab.value = "B" ;
    document.fidioma.blqi.checked = false ;
    setVisibilidad(['GuardarIdi=inline']);
    respIdi = true ;
}

function guardarIdioma(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (!validaFecha(document.fidioma.fcert.value))
        return ;
    if (!(document.fidioma.mlee.value == "B" || document.fidioma.mlee.value == "R" || document.fidioma.mlee.value == "E") ||
        !(document.fidioma.mesc.value == "B" || document.fidioma.mesc.value == "R" || document.fidioma.mesc.value == "E") ||
        !(document.fidioma.mhab.value == "B" || document.fidioma.mhab.value == "R" || document.fidioma.mhab.value == "E") ) {
        alert("Las niveles deben ser R:Regular B:Bueno E:Excelente") ;
        return
    }
    if (document.fidioma.lengua.value.length < 4 ) {
        alert("Debe selecconar una lengua") ;
        return ;    }
    if (document.fidioma.certif.value.length < 2 ) {
       document.fidioma.certif.value = "NA" ;
    }
    if (document.fidioma.organ.value.length < 2 ) {
       document.fidioma.organ.value = "NA" ;
    }
    if (document.fidioma.punti.value.length < 1 ) {
       document.fidioma.punti.value = "0" ;
    }
    var url = 'GrabarIdioma?' + getValores(['idlen','lengua','certif','organ','fcert','punti','mlee','mesc','mhab']) +
             "&blqi=" + document.fidioma.blqi.checked;
    respServlet = "verIdiomas";
    conectarMethod(url,muestraResultado,'POST');
}

function elimIdioma(id){
    //== Invoca el servlet para eliminar la experiencia correspondiente
    var ret = confirm("¿Realmente desea eliminar este registro de otro Idioma?") ;
    if (ret) {
        var url = 'GrabarIdioma?idlen=' + id;
        respServlet = "verIdiomas";
        conectarMethod(url,muestraResultado,'GET');
    }
}

function listaIdiomas(){
    var Datos=new Array(17);
    Datos[0]="Alemán=Alemán";
    Datos[1]="Arabe=Arabe";
    Datos[2]="Catalán=Catalán";
    Datos[3]="Chino=Chino";
    Datos[4]="Español=Español";
    Datos[5]="Finlandés=Finlandés";
    Datos[6]="Frances=Frances";
    Datos[7]="Griego=Griego";
    Datos[8]="Hebreo=Hebreo";
    Datos[9]="Holandés=Holandés";
    Datos[10]="Inglés=Inglés";
    Datos[11]="Italiano=Italiano";
    Datos[12]="Japonés=Japonés";
    Datos[13]="Latín=Latín";
    Datos[14]="Portugués=Portugués";
    Datos[15]="Ruso=Ruso";
    Datos[16]="Otro=Otro";
    return Datos;
}


