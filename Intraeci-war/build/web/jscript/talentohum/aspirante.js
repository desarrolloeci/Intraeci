//=== Funciones del aspirante
function verregistro() {
    setVisibilidad(['tabreg=inline','tablogin=none']);
}

function Registrarse() {
    var patron=/^\d+$/;
    if(document.faspirante.idAsp.value.search(patron)==-1){
        alert("El documento debe ser numérico.");
        return ;
    }
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (document.faspirante.idAsp.value != document.faspirante.cidAsp.value) {
        alert("Verifique el número del documento de Identidad") ;
        return ;
    }
    var url = 'GrabarAspirante?' + getValores(['idAsp','ape1','ape2','nomasp','emAsp']) ;
    respServlet = "Aspirante" ;
    conectarMethod(url, muestraResultado, 'POST');
    setVisibilidad(['tabreg=none','tablogin=inline']);
}

function guardarAspirante() {
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (!validaFecha(document.fempleado.fnac.value))
        return ;
    if (document.fempleado.gen.value != "F" && document.fempleado.gen.value != "M") {
        alert("El genero debe ser F (Femenino) o M (Masculino)") ;
        return ;
    }
    var rh = 'P' ;
    if (document.fempleado.facrh2.checked)
        rh = 'N' ;
    if (document.fempleado.dir.value.indexOf('#') >= 0) {
        alert("La dirección no debe llevar el signo #, use No.") ;
        return ;
    }
    var url = 'GrabarAspirante?op=1&' + getValores(['tdoc','fnac','ciunac','eciv','tsan','libmil','clalib','dimlib','dir','tel','cel',
            'ciud','gen','email']) + '&facrh=' + rh ;
    respServlet = "verAspirante" ;
    conectarMethod(url, muestraResultado, 'GET');
}

function Ingresar() {
    var url = 'getAspirante?op=1&' + getValores(['docing','emaing']) ;
    conectarMethod(url, EditarAspirante, 'GET');
}

function EditarAspirante() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    if (http_request.readyState != 4) 
        return ;
    if (http_request.status != 200) 
        return ;
    var xmldoc = http_request.responseXML;
    var reg = xmldoc.getElementsByTagName("aspirante")[0];
    if (reg.getElementsByTagName("doc")[0].firstChild.nodeValue == "null" ) {
    //== NO Trajo los datos del Aspirante
        alert("Compruebe el documento y/o el correo") ;
        return ;
    }
    setVisibilidad(['tabla1=inline','tabreg=none','tablogin=none']);
    setEditar(['fnac=','gen','facrh1=','facrh2=','libmil=','clalib=','dimlib=','ciud=','dir=','tel=','cel=','email=']);
    setVisibilidad(['guardarEmp=inline','editarEmp=none']);
    respAspir = true ;
    document.fempleado.idEmp.value = reg.getElementsByTagName("doc")[0].firstChild.nodeValue ;
    document.fempleado.tdoc.value = reg.getElementsByTagName("tdoc")[0].firstChild.nodeValue ;
    document.fempleado.tpdoc.value =
            devuelveValorxSigla(reg.getElementsByTagName("tdoc")[0].firstChild.nodeValue, listaTDoc());
    document.fempleado.fnac.value = reg.getElementsByTagName("fnac")[0].firstChild.nodeValue ;
    document.fempleado.ciunac.value = reg.getElementsByTagName("ciunac")[0].firstChild.nodeValue ;
    document.fempleado.nciunac.value = reg.getElementsByTagName("nciunac")[0].firstChild.nodeValue ;
    document.fempleado.gen.value = reg.getElementsByTagName("genero")[0].firstChild.nodeValue ;
    document.fempleado.nomEmp.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
    document.fempleado.eciv.value = reg.getElementsByTagName("eciv")[0].firstChild.nodeValue ;
    document.fempleado.estciv.value = 
            devuelveValorxSigla(reg.getElementsByTagName("eciv")[0].firstChild.nodeValue, listaECivil());
    document.fempleado.tsan.value = reg.getElementsByTagName("tpsan")[0].firstChild.nodeValue ;
    document.fempleado.libmil.value = reg.getElementsByTagName("libmil")[0].firstChild.nodeValue ;
    document.fempleado.clalib.value = reg.getElementsByTagName("clamil")[0].firstChild.nodeValue ;
    document.fempleado.dimlib.value = reg.getElementsByTagName("dismil")[0].firstChild.nodeValue ;
    document.fempleado.dir.value = reg.getElementsByTagName("dirres")[0].firstChild.nodeValue ;
    document.fempleado.tel.value = reg.getElementsByTagName("telres")[0].firstChild.nodeValue ;
    document.fempleado.cel.value = reg.getElementsByTagName("celular")[0].firstChild.nodeValue ;
    document.fempleado.ciud.value = reg.getElementsByTagName("ciures")[0].firstChild.nodeValue ;
    document.fempleado.cciud.value = reg.getElementsByTagName("nomciu")[0].firstChild.nodeValue ;
    document.fempleado.email.value = reg.getElementsByTagName("email")[0].firstChild.nodeValue ;
    if (reg.getElementsByTagName("frh")[0].firstChild.nodeValue == "+") {
        document.fempleado.facrh1.checked = true ;
        document.fempleado.facrh2.checked = false ;
    } else {
        document.fempleado.facrh1.checked = false ;
        document.fempleado.facrh2.checked = true ;
    }
}

function verPerfil(){
    setVisibilidad(['tabperf=inline','tabest=none','tablab=none','tabidi=none','tabpub=none','tabdis=none','tabmem=none','tabpro=none','tabdoc=none']);
    var url = 'getAspirante?op=2';
    conectarMethod(url,EditarPerfil, 'GET');
}

function EditarPerfil() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    document.fperfil.perf.value = xmldoc.getElementsByTagName("perfil")[0].firstChild.nodeValue ;
}

function guardarPerfil() {
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    if (document.fperfil.perf.value == "" ) {
        alert("El perfil debe estar contenido") ;
        return ;
    }
    var url = 'GrabarAspirante?op=2&' + getValores(['perf'])  ;
    conectarMethod(url, muestraResultado, 'GET');
}

function cargarpdf() {
    //== Invoca el servlet para subir al servidor el archivo pdf del aspirante
    var url = 'SubirArchivo?op=2&' + getValores(['perf'])  ;
    conectarMethod(url, muestraResultado, 'GET');
}

function validar(archivo){
    var b = archivo.split('.');
    if(b[b.length-1] == 'pdf'){
        var nomar=document.fempleado.arcupload.value;
        var x = archivo.split('\\');
        nomar=x[x.length-1];
        document.formulario.action='FileUpload?on=n&spath=correo&fpath=<%=ruta%>&nombre=<%=nombre%>&doc=<%=doc%>&ref=<%=ref%>&carnet=<%=datos.elementAt(0)%>&nomestud=<%=datos.elementAt(2)%>&tipocargue=<%=tipocargue%>&estado=<%=datos.elementAt(5)%>&na='+nomar;
        return true;
    }
    else{
        alert('Error: El archivo debe ser .pdf');
        return false;
    }
}

function listaTDoc(){
    var Datos=new Array(3);
    Datos[0]="CC=01";
    Datos[1]="CE=02";
    Datos[2]="PA=03";
    return Datos;
}

function verConvocatoria(){
    var Datos=[];
    window.showModalDialog('ConvocAsp',Datos,"dialogHeight:540px;dialogWidth:850px;dialogLeft"+window.height/2+"px;dialogTop:"+window.width/2+"px");
}

function admConvocatoria(){
    var Datos=[];
    window.showModalDialog('AdminConvoca',Datos,"dialogHeight:785px;dialogWidth:910px;dialogLeft"+window.height/2+"px;dialogTop:"+window.width/2+"px");
}

function verConvocatoriaP(){
    var Datos=[];
    window.showModalDialog('ListaConvocas',Datos,"dialogHeight:540px;dialogWidth:650px;dialogLeft"+window.height/2+"px;dialogTop:"+window.width/2+"px");
}

function listarconvoca() {
    //== Limplia la tabla de detalle visible en el momento y alista el despliegue
    //== de la tabla resumen de estudios del empleado
    var tabla=document.getElementById('cuerpoconva');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++){
        tabla.deleteRow(0);
    }
    var url = 'getVarios?op=3';
    conectarMethod(url,muestraconv, 'POST');
    return false;
}

function muestraconv() {
    // Despliega la tabla de convocatorioas activas
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("convocatorias")[0];
    var reg = lista.getElementsByTagName("convoca");
    var cuerpo = document.getElementById('cuerpoconva'),fila, nodo;
    var columna;

    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        //== Celda que describe la convocatoria
        nodo=reg[i].getElementsByTagName("descon")[0].firstChild.nodeValue;
        nodo = nodo + ". " + reg[i].getElementsByTagName("otrinf")[0].firstChild.nodeValue;
        columna=fila.insertCell(0);
        columna.innerHTML=nodo;
        //== Celda que describe la fecha límite convocatoria
        nodo=reg[i].getElementsByTagName("fecha")[0].firstChild.nodeValue;
        columna=fila.insertCell(1);
        columna.innerHTML=nodo;
    }
}

function subirArc(){
    var Datos=[];
    window.showModalDialog('Upfile?res=Anexar archivo pdf con hoja de vida y copia de diplomas',Datos,"dialogHeight:200px;dialogWidth:600px;dialogLeft"+window.height/2+"px;dialogTop:"+window.width/2+"px");
}

