//=== Funciones del empleado
function editarEmpleado() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    setEditar(['facrh1=','facrh2=','libmil=','clalib=','dimlib=','dir=','tel=','cel=']);
    respEmpleado = true ;
    setVisibilidad(['guardarEmp=inline','editarEmp=none']);
}

function guardarEmpleado(){
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    var rh = 'P' ;
    if (document.fempleado.facrh2.checked)
        rh = 'N' ;
    var url = 'grabarEmpleado?' + getValores(['eciv','tsan','libmil','clalib','dimlib','dir','tel','ciud','cel']) +
          '&facrh=' + rh ;
    respServlet = "verEmpleado";
    conectarMethod(url,muestraResultado,'POST');
}

function verEmpleado(){
    setVisibilidad(['tabperf=none','tabest=none','tablab=none','tabidi=none','tabpub=none','tabdis=none','tabmem=none','tabpro=none','tabdoc=none']);
    setEditar(['facrh1=1','facrh2=1','libmil=1','clalib=1','dimlib=1','dir=1','tel=1','cel=1']);
    setVisibilidad(['guardarEmp=none','editarEmp=inline']);
    respEmpleado = false ;
}

function listaECivil(){
    var Datos=new Array(7);
    Datos[0]="Soltero=1";
    Datos[1]="Casado=2";
    Datos[2]="Viudo=3";
    Datos[3]="Separado=4";
    Datos[4]="UniónLibre=5";
    Datos[5]="Religioso=6";
    Datos[6]="Otro=7";
    return Datos;
}

function listaTSangre(){
    var Datos=new Array(4);
    Datos[0]="A=A";
    Datos[1]="B=B";
    Datos[2]="O=O";
    Datos[3]="AB=AB";
    return Datos;
}

//====  Funciones para procesos del manejo de experiencia en Docencia

function verDocencia(){
    setVisibilidad(['tabperf=none','tabest=none','tablab=none','tabidi=none','tabpub=none','tabdis=none','tabmem=none','tabpro=none','tabdoc=inline']);
    var tabla=document.getElementById('cuerpodoc');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
    var url = 'Docencia';
    conectarMethod(url,muestraDocencia, 'POST');
}

function muestraDocencia() {
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("listadocencia")[0];
    var reg = lista.getElementsByTagName("asignatura");
    var elementos=["periodo","asig","grp","cant","gan","per","cancel"];
    var cuerpo=document.getElementById('cuerpodoc'),fila,texto,nodo,url,columna,div;

    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        for(var j = 0; j < 7; j++){
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j);
            columna.innerHTML=nodo;
        }
    }
}

function verPerfilEmp(){
    setVisibilidad(['tabperf=inline','tabest=none','tablab=none','tabidi=none','tabpub=none','tabdis=none','tabmem=none','tabpro=none','tabdoc=none']);
    var url = 'PerfilEmp';
    conectarMethod(url,EditarPerfilEmp, 'GET');
}

function EditarPerfilEmp() {
    //== Activa los campos de la forma para edición de un estudio y llena los valores de estos
    //== Con lo traído desde la base de datos para el estudio seleccionado
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    document.fperfil.perf.value = xmldoc.getElementsByTagName("perfil")[0].firstChild.nodeValue ;
}

function guardarPerfilEmp() {
    //== Invoca el servlet para guardar el estudio contenido en la forma de edición
    var url = 'PerfilEmp?' + getValores(['perf'])  ;
    conectarMethod(url, muestraResultado, 'POST');
}

function verCompromisos(op, ed){
    var Datos=[];
    window.showModalDialog('HCompromisos?opc='+op+'&ed='+ed,Datos,"dialogHeight:850px;dialogWidth:950px;dialogLeft"+window.height/2+"px;dialogTop:"+window.width/2+"px");
}

function verEvaluacion(op, ed){
    var Datos=[];
    window.showModalDialog('HEvaluacion?opc='+op+'&ed='+ed,Datos,"dialogHeight:850px;dialogWidth:950px;dialogLeft"+window.height/2+"px;dialogTop:"+window.width/2+"px");
}

