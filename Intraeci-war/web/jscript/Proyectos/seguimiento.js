var href;
var respLinkF=false;
var respLinkE=false;
var tipoS='';

function accionEditarSegui(tipo){
    setReadOnly(['ress'+tipo+'=','ing'+tipo+'=','inv'+tipo+'=','gper'+tipo+'=','otrg'+tipo+'=','aciTom'+tipo+'=','sopor'+tipo+'=']);
    if(tipo=='E')setReadOnly(['obsvDirE=']);
    setVisibilidad(['guardar'+tipo+'=inline','editar'+tipo+'=none']);
    eval('respLink'+tipo+'=true;');
    defineColorXEdicion();
}

function accionGrabarSegui(tipo) {
    tipoS=tipo;
    //Invoca el llamado a guardar seg?n par?metro
    if (!validaFecha(document.getElementById('fecs'+tipo).value)) return false;
    if (!isNumero(['ing'+tipo,'gper'+tipo,'otrg'+tipo,'inv'+tipo], ['Ingresos','GastPers','Otros G','Inversión'])) return false;
    if (document.getElementById('avanceInt'+tipo).value=='_' ||
        document.getElementById('estsInt'+tipo).value=='_' ||
        document.getElementById('ress'+tipo).value=='_' ||
        document.getElementById('alertaInt'+tipo).value=='_' ||
        (tipo == 'E' && (document.getElementById('aciTom'+tipo).value=='_' || document.getElementById('sopor'+tipo).value=='_' || document.getElementById('obsvDir'+tipo).value=='_'))) {
            alert('Alguno(s) de los campos no esta(n) diligenciados correctamente.');
            return false;
    }

    if (!isDiligenciado(['ress'+tipo,'estsInt'+tipo,'alertaInt'+tipo,'aciTom'+tipo,'sopor'+tipo,'avanceInt'+tipo,'obsvDir'+tipo],
                        ['Resultado','Estado','Nivel de alerta','Acciones a tomar','Soporte','Observaciones'])) 
                            return false;
                            
    var url='Grabar?tipo='+tipoS+'&tp=1&'+getValores(['etas'+tipo,'ress'+tipo,'estsInt'+tipo,'alertaInt'+tipo,'ing'+tipo,'gper'+tipo,'otrg'+tipo,'inv'+tipo,'aciTom'+tipo,'sopor'+tipo,'avanceInt'+tipo,'obsvDir'+tipo]);
    respServlet="despGrabarSegui";
    conectarX(url,muestraResultado);
    return false;
}

function despGrabarSegui(){
    eval('respLink'+tipoS+'=false;');
    setReadOnly(['otrg'+tipoS+'=1','ress'+tipoS+'=1','ing'+tipoS+'=1','inv'+tipoS+'=1','gper'+tipoS+'=1','fecs'+tipoS+'=1','aciTom'+tipoS+'=1','sopor'+tipoS+'=1','obsvDir'+tipoS+'=1']);
    setVisibilidad(['guardar'+tipoS+'=none','editar'+tipoS+'=inline']);
    setColor();
    var id=document.getElementById('ident'+tipoS).value;
    var fecha = new Date();
    setValorInput(['fecs'+tipoS+'='+fecha.getDate()+'/'+(fecha.getMonth()+1)+'/'+fecha.getFullYear()]);
    setValorText(['avance'+id+'=avanceExt'+tipoS,'estado'+id+'=estsInt'+tipoS,'fecha'+id+'=fecs'+tipoS]);
    defineColorXEdicion();
}

function accionEditarObsvDir(){
    setReadOnly(['obsvDirF=']);
    setVisibilidad(['guardarObsvDir=inline','editarObsvDir=none']);
    defineColorXEdicion();
}

function accionGrabarObsvDir(){
    if (!isDiligenciado(['obsvDirF'], ['Observaciones'])) return false;
    var url='Grabar?tp=5&obsvDir='+document.getElementById('obsvDirF').value;
    respServlet="despGrabarObsvDir";
    conectarX(url,muestraResultado);
    return false;
}

function despGrabarObsvDir(){
    setReadOnly(['obsvDirF=1']);
    setVisibilidad(['guardarObsvDir=none','editarObsvDir=inline']);
    defineColorXEdicion();
}

function verListSeguiEnt(idE){
    var tabla=document.getElementById('listSegEnt');
    var tam=(tabla.rows).length;
    for(var i = 0; i < tam; i++){
        tabla.deleteRow(0);
    }
    document.getElementById('tituloE').innerHTML=document.getElementById('ent'+idE).innerHTML;
    setValorInput(['identE=', 'corteE=', 'fecsE=', 'avanceExtE=', 'ressE=', 'estsExtE=', 'alertaExtE=', 'flimE=', 'movsE=', 'aciTomE=', 'soporE=', 'obsvDirE=', 'ingE=', 'invE=', 'gperE=', 'otrgE=']);
    setEditar(['editarE=1']);    
    restableceCampos('E');  
    
    var url = 'despSeguimiento?idEnt='+idE;   
    conectarMethod(url, muestraListSeguiEnt, 'GET');
    return false;
}

function muestraListSeguiEnt(){
    if(http_request.readyState == 4) {
        if(http_request.status == 200) {
            var xmldoc = http_request.responseXML;
            var listaE = (xmldoc.getElementsByTagName("listSeguimiento")[0]).getElementsByTagName("seguimiento");
            var cuerpo=document.getElementById('listSegEnt'), fila, columna, idE;
            for(var i=0; i<listaE.length; i++){
                idE=listaE[i].getElementsByTagName("id")[0].firstChild.nodeValue;
                fila=cuerpo.insertRow((cuerpo.rows).length);
                fila.id="fila"+idE;
                fila.bgColor=listaE[i].getElementsByTagName("color")[0].firstChild.nodeValue;
                columna=fila.insertCell(0);
                columna.innerHTML="<a href='#' onclick='return verSeguimiento("+idE+")'>"+listaE[i].getElementsByTagName("corte")[0].firstChild.nodeValue+"</a>"
                columna=fila.insertCell(1);
                columna.innerHTML=listaE[i].getElementsByTagName("avance")[0].firstChild.nodeValue+" %";
                columna.id="avance"+idE;
                columna=fila.insertCell(2);
                columna.innerHTML=listaE[i].getElementsByTagName("estado")[0].firstChild.nodeValue;
                columna.id="estado"+idE;
                columna=fila.insertCell(3);
                columna.innerHTML=listaE[i].getElementsByTagName("fecha")[0].firstChild.nodeValue;
                columna.id="fecha"+idE;
            }
            verSeguimiento(idE, "E");
        }
    }
}

function verSeguimiento(ids, tipo){
    if(arguments.length==1){
        tipo='E'
    }
    tipoS=tipo;    
    var cuerpo=document.getElementById('dedicacion');    
    var tam=(cuerpo.rows).length;
    for(var i = 1; i < tam; i++){
        cuerpo.deleteRow(0);
    }
    setVisibilidad(['camposNuevaDedi=none','nuevaDedi=inline','crearDedi=none','guardarObsvDir=none','editarObsvDir=inline','guardarDedi=none','editarDedi=inline'])
    var url = 'despSeguimiento?ids='+ids+'&tipo='+tipo;
    conectarX(url,muestraSeguimiento);
    return false;
}

function muestraSeguimiento() {
    if(http_request.readyState == 4) {
        if(http_request.status == 200) {
            var xmldoc = http_request.responseXML;
            var reg = xmldoc.getElementsByTagName("seguimiento")[0];
            var ban; 
            setCamposResXML(reg, ['ident'+tipoS,'corte'+tipoS,'fecs'+tipoS,'avanceInt'+tipoS,'estsExt'+tipoS, 'estsInt'+tipoS, 'ress'+tipoS, 'alertaInt'+tipoS,'ing'+tipoS,'inv'+tipoS,'gper'+tipoS,'otrg'+tipoS,'flim'+tipoS,'movs'+tipoS,'aciTom'+tipoS,'sopor'+tipoS,'obsvDir'+tipoS,'costInt'+tipoS]
                , ['id','periodo','fecha','avance','estado','estado','resultado','alerta','ingresos','inversion','gasper','otrgastos','feclim','nmovs','acciones','soporte','obsvDir', 'costInt']);
            document.getElementById('avanceExt'+tipoS).value=reg.getElementsByTagName('avance')[0].firstChild.nodeValue + " %";
            document.getElementById('alertaExt'+tipoS).value=devuelveValorxSigla(reg.getElementsByTagName('alerta')[0].firstChild.nodeValue, getSemaforo());
            document.getElementById('tituloD').innerHTML='Dedicación '+ document.getElementById('titulo'+tipoS).innerHTML + ' - ' + document.getElementById('corte'+tipoS).value;
            
                    +reg.getElementsByTagName('id')[0].firstChild.nodeValue+'&idseg=<%=proyecto.getIdFase()%>&nombre=<%=request.getParameter("nombre")%>\'><input class=\'inputlargo\' type=\'file\' name=\'RutEmp\'id=\'RutEmp\'><input id=\'subFor1\' value=\'Enviar Pdf\' type=\'submit\'/></form>';
            var nodoDedicacion = reg.getElementsByTagName("listaDedicacion")[0];
            var listaDedicacion = nodoDedicacion.getElementsByTagName("dedicacion");
            var cuerpo = document.getElementById("dedicacion"), fila, columna, idD;
            for(var i = 0; i < listaDedicacion.length; i++){
                idD=listaDedicacion[i].getElementsByTagName("idDed")[0].firstChild.nodeValue;
                fila=cuerpo.insertRow(0);
                fila.setAttribute("id", "ded"+idD);
                (fila.insertCell(0)).innerHTML=listaDedicacion[i].getElementsByTagName("recurso")[0].firstChild.nodeValue;
                (fila.insertCell(1)).innerHTML="<input readonly id='"+idD+"' value='"+listaDedicacion[i].getElementsByTagName("horas")[0].firstChild.nodeValue+"'/>";
                (fila.insertCell(2)).innerHTML="<a onclick='return accionEliminarRecurso("+idD+");' href='#'><img src='img/eliminar.gif' alt='Eliminar'><a/>";
            }
            if(reg.getElementsByTagName("permisoGer")[0].firstChild.nodeValue=="1"){
                setEditar(['editar'+tipoS+'=','editarDedi=','nuevaDedi=']);
                respLinkD=true;
            }else{
                setEditar(['editar'+tipoS+'=1','editarDedi=1','nuevaDedi=1']);
                respLinkD=false;
            }
            if(reg.getElementsByTagName("permisoDir")[0].firstChild.nodeValue=="1" && tipoS=='F'){
                setEditar(['editarObsvDir=']);
            }else{
                setEditar(['editarObsvDir=1']);
            }
            restableceCampos(tipoS);
        }
    }
}

function setColor(){
    var Campo=document.getElementById('fila'+document.getElementById('ident'+tipoS).value);
    var color=document.getElementById('alertaInt'+tipoS).value;
    if(color=='A'){
        Campo.bgColor='#FFFF66';
    }else if(color=='R'){
        Campo.bgColor='#CC0000';
    }else if(color=='A'){
        Campo.bgColor='#00CC00';
    }else{
        Campo.bgColor='#FFFFFF';
    }
}

function getSemaforo(){
    var Datos=new Array(3);    
    Datos[0]="Controlado: Sin Problemas o Leves=V";
    Datos[1]="En Atención: Problemas Potenciales=A";
    Datos[2]="Crítico: Con Problemas=R";
    return Datos;
}
/*
function getEstados(){
    var Datos=new Array(6);
    Datos[0]="Pendiente=Pendiente";
    Datos[1]="A tiempo=A tiempo";
    Datos[2]="Atrasado=Atrasado"
    Datos[3]="Suspendido=Suspendido";
    Datos[4]="Cancelado=Cancelado";
    Datos[5]="Ejecutado=Ejecutado";
    return Datos;
}
*/
function getEstados(){
    var Datos=new Array(6);
    Datos[0]="Ejecutado=Ejecutado";
    Datos[1]="A tiempo=A tiempo";
    Datos[2]="Atrasado=Atrasado"
    Datos[3]="Cancelado: detenido para siempre=Cancelado";
    Datos[4]="Suspendido: detenido por algún tiempo=Suspendido";
    Datos[5]="Pendiente Inicio=Pendiente Inicio";
    return Datos;
}

function getEtapa(){
    var Datos=new Array(5);
    Datos[0]="Planeación=Planeación";
    Datos[1]="Diseño=Diseño";
    Datos[2]="Construcción=Construcción";
    Datos[3]="Entrega=Entrega";
    Datos[4]="Terminado=Terminado";
    return Datos;
}

function restableceCampos(tipo){
    eval('respLink'+tipo+'=false;');
    setReadOnly(['otrg'+tipo+'=1','ress'+tipo+'=1','ing'+tipo+'=1','inv'+tipo+'=1','gper'+tipo+'=1','fecs'+tipo+'=1','aciTom'+tipo+'=1','sopor'+tipo+'=1','obsvDir'+tipo+'=1']);
    setVisibilidad(['guardar'+tipo+'=none','editar'+tipo+'=inline']);
    defineColorXEdicion();
}