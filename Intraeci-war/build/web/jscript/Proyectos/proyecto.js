
function accionNuevoProye(){
    respLink=true;
    setReadOnly(['nombre=','fecIni=','fecFin=','objetivo=','justificacion=']);
    setVisibilidad(['nuevaFase=none','editarProye=none', 'guardarProye=none','crearProye=inline']);
    setValorInput(['id=','estado=','nombre=','fecIni=','fecFin=','objetivo=','justificacion=','tipo=','nomResponsable=','nomGerente=','dur=','uniDirExt=','areaPresupExt=']);
    var tabla=document.getElementById('tablaf');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 1; i < tam-1; i++){
        tabla.deleteRow(1);
    }
    defineColorXEdicion();
}

function accionCrearProye(){
    if(!isDiligenciado(['nombre','tipo','fecIni','fecFin','objetivo','justificacion','nomResponsable','nomGerente','uniDirExt','areaPresupExt'],['Nombre','Tipo','Fecha Inicio','Fecha Fin','Objetivo','Justificación','Responsable','Gerente','Unidad de dirección','Área presupuestal'])){
        return false;
    }
    var fechaIni=document.getElementById('fecIni').value;
    var fechaFin=document.getElementById('fecFin').value;
    if(!(validaFecha(fechaIni)&&(validaFecha(fechaFin))&&(difFecha(fechaIni, fechaFin)))){
        return false;
    }
    var url = 'grabarProyecto?tp=2&dur='+difEnMeses(fechaIni, fechaFin)+'&'+getValores(['estado','nombre','tipo','fecIni','fecFin','objetivo','justificacion','idResponsable','idGerente','uniDirInt','areaPresupInt']);
    respServlet="despCrearProyecto";
    conectarX(url,muestraResultado);    
    return false;
}

function despCrearProyecto(idN){
    var cuerpo=document.getElementById('cuerpoProye');
    var fila=cuerpo.insertRow(0);
    var text=document.createTextNode(document.getElementById('nombre').value);
    var link=document.createElement("a");
    link.setAttribute("href", "#");
    link.onclick= function(){
        eval("verproyecto('"+idN+"');");
    }
    link.appendChild(text);    
    var columnaA=fila.insertCell(0);
    columnaA.appendChild(link);
    text=document.createTextNode(document.getElementById('estado').value);
    var columnaB=fila.insertCell(1);
    columnaB.setAttribute("id", idN);
    columnaB.appendChild(text);
    fila.appendChild(columnaA);
    fila.appendChild(columnaB);
    cuerpo.appendChild(fila);
    setEditar(['editarProye=1'])
    setReadOnly(['nombre=1','fecIni=1','fecFin=1','objetivo=1','justificacion=1']);
    setVisibilidad(['editarProye=inline', 'guardarProye=none','crearProye=none']);
    defineColorXEdicion();
    respLink=false;
}

function accionEditarProye(){
    setReadOnly(['nombre=','fecIni=','fecFin=','objetivo=','justificacion=']);
    setVisibilidad(['editarProye=none', 'guardarProye=inline']);
    defineColorXEdicion();
    respLink=true;
}

function accionGuardarProye(){
    var fechaIni=document.getElementById('fecIni').value;
    var fechaFin=document.getElementById('fecFin').value;
    if(!(validaFecha(fechaIni)&&(validaFecha(fechaFin))&&(difFecha(fechaIni, fechaFin)))){
        return false;
    }
    respServlet="despGuardarProye";
    var url = 'grabarProyecto?tp=1&dur='+difEnMeses(fechaIni, fechaFin)+'&'+getValores(['estado','nombre','fecIni','fecFin','objetivo','justificacion','idResponsable','idGerente','tipo','uniDirInt','areaPresupInt']);
    conectarX(url,muestraResultado);
    return false;
}

function despGuardarProye(){
    setReadOnly(['nombre=1','fecIni=1','fecFin=1','objetivo=1','justificacion=1']);
    setVisibilidad(['editarProye=inline', 'guardarProye=none']);
    defineColorXEdicion();
    respLink=false;
}

function verproyecto(idp){
    setReadOnly(['nombre=1','fecIni=1','fecFin=1','objetivo=1','justificacion=1']);
    setVisibilidad(['editarProye=inline', 'guardarProye=none','crearProye=none']);
    var tabla=document.getElementById('tablaf');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 1; i < tam-1; i++){
        tabla.deleteRow(1);
    }
    //Realizar Peticion
    var url = 'listaProyectos?idp='+idp;
    conectarX(url,muestraProyecto);
}

function muestraProyecto() {
    if(http_request.readyState == 4) {
        if(http_request.status == 200) {
            var ifase = 0 ;
            var elementos = ["idf","nombre","estado","descrip","anio","inicio","fin","ingresos","gastos","inver","idest"] ;
            var cuerpo = document.getElementById('cuerpo'),fila,texto,nodo,url,link,columna,div,estado,permiso;
            var xmldoc = http_request.responseXML;
            var reg = xmldoc.getElementsByTagName("proyecto")[0];
            document.dproy.idp.value = reg.getElementsByTagName("id")[0].firstChild.nodeValue ;
            document.dproy.plan.value = reg.getElementsByTagName("plan")[0].firstChild.nodeValue ;
            document.dproy.estado.value = reg.getElementsByTagName("estado")[0].firstChild.nodeValue ;
            document.dproy.nom.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
            document.dproy.fini.value = reg.getElementsByTagName("inicio")[0].firstChild.nodeValue ;
            document.dproy.ffin.value = reg.getElementsByTagName("fin")[0].firstChild.nodeValue ;
            document.dproy.dur.value = reg.getElementsByTagName("duracion")[0].firstChild.nodeValue ;
            document.dproy.tipo.value = reg.getElementsByTagName("tipo")[0].firstChild.nodeValue ;
            document.dproy.obj.value = reg.getElementsByTagName("objetivo")[0].firstChild.nodeValue ;
            document.dproy.just.value = reg.getElementsByTagName("justif")[0].firstChild.nodeValue ;
            document.dproy.resp.value = reg.getElementsByTagName("nomResp")[0].firstChild.nodeValue ;
            document.dproy.ger.value = reg.getElementsByTagName("nomGerente")[0].firstChild.nodeValue ;
            document.dFase.nomProye.value = reg.getElementsByTagName("nombre")[0].firstChild.nodeValue ;
            document.dFase.idProye.value = reg.getElementsByTagName("id")[0].firstChild.nodeValue ;
            document.getElementById("idResponsable").value = reg.getElementsByTagName("idResp")[0].firstChild.nodeValue ;
            document.getElementById("idGerente").value = reg.getElementsByTagName("idGerente")[0].firstChild.nodeValue ;
            document.getElementById("uniDirExt").value = reg.getElementsByTagName("nomUnidad")[0].firstChild.nodeValue ;
            document.getElementById("uniDirInt").value = reg.getElementsByTagName("idUnidad")[0].firstChild.nodeValue ;
            document.getElementById("areaPresupExt").value = reg.getElementsByTagName("nomArea")[0].firstChild.nodeValue ;
            document.getElementById("areaPresupInt").value = reg.getElementsByTagName("idArea")[0].firstChild.nodeValue ;
            permiso=reg.getElementsByTagName("permiso")[0].firstChild.nodeValue;
            if(permiso=="1"){
                setEditar(['editarProye=']);
                setVisibilidad(['nuevaFase=inline'])
            }else if(permiso=="0"){
                setEditar(['editarProye=1']);
                setVisibilidad(['nuevaFase=none']);
            }else if(permiso=="2"){
                setEditar(['editarProye=1']);
                setVisibilidad(['nuevaFase=inline']);
            }
            respLink=false;
            var lisfases = reg.getElementsByTagName("listafases")[0];
            var lista = lisfases.getElementsByTagName("fase") ;
            //==Mostrar lista de Fases
            for(var i = 0; i < lista.length; i++){
                fila=cuerpo.insertRow(0);
                ifase = lista[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue;
                estado=lista[i].getElementsByTagName(elementos[10])[0].firstChild.nodeValue;
                for(var j = 1; j <= 6; j++){
                    nodo=lista[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
                    columna=fila.insertCell(j - 1);
                    div=document.createElement("div");
                    div.setAttribute("align", "left");
                    if (j == 1){
                        link=document.createElement("a");
                        url="MenuFase?idFase="+ifase;
                        if(permiso=="0" && estado!="6" && estado!="7"){                            
                            url="javascript:alert('Permisos insuficientes');";
                        }
                        link.setAttribute("href", url);
                        texto=document.createTextNode(nodo);
                        link.appendChild(texto);
                        div.appendChild(link);
                        columna.appendChild(div);
                    } else {
                        texto=document.createTextNode(nodo);
                        div.appendChild(texto);
                        columna.appendChild(div);
                    }
                }
            }
        }
    }
    defineColorXEdicion();
}

function getEstados(){
    var Datos=new Array(5);    
    Datos[0]="Aprobado=Aprobado";
    Datos[1]="Suspendido=Suspendido";
    Datos[2]="Pospuesto=Pospuesto";
    Datos[3]="Cancelado=Cancelado";
    Datos[4]="Terminado=Terminado";
    return Datos;
}
/*
function getTipo(){
    var Datos=new Array(4);
    Datos[0]="Desarrollo=Desarrollo";
    Datos[1]="Mejoramiento=Mejoramiento";
    Datos[2]="Intervención=Intervención";
    Datos[3]="Interno=Interno";
    return Datos;
}*/
function getTipo(){
    var Datos=new Array(2);
    Datos[0]="Proyecto=Proyecto";
    Datos[1]="Acción de Mejoramiento=Acción de Mejoramiento";
    return Datos;
}