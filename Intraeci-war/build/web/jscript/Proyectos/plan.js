
    var href;
    function planes(){
        //Limpiar Tabla
        document.getElementById('buscar').style.visibility='hidden';
        var tablaDesarrollo,tablaAccion,tablaIntervencion,tablaMejoramiento,tablaInvestigacion;
        
            tablaDesarrollo=document.getElementById('tablaDesarrollo');
            tablaAccion=document.getElementById('tablaAccion');
            tablaIntervencion=document.getElementById('tablaIntervencion');
            tablaMejoramiento=document.getElementById('tablaMejoramiento');
            tablaInvestigacion=document.getElementById('tablaInvestigacion');
        var filasDesarrollo,filasAccion,filasIntervencion,filasMejoramiento,filasInvestigacion;
        filasDesarrollo= tablaDesarrollo.rows;
        filasAccion= tablaAccion.rows;
        filasIntervencion= tablaIntervencion.rows;
        filasMejoramiento= tablaMejoramiento.rows;
        filasInvestigacion= tablaInvestigacion.rows;
        var tamDesarrollo,tamAccion,tamIntervencion,tamMejoramiento,tamInvestigacion;        
        tamDesarrollo=filasDesarrollo.length;
        tamAccion=filasAccion.length;
        tamIntervencion=filasIntervencion.length;
        tamMejoramiento=filasMejoramiento.length;
        tamInvestigacion=filasInvestigacion.length;
        setVisibilidad(['TiposP=inline']);
        for(var i = 1; i < tamDesarrollo; i++){
            tablaDesarrollo.deleteRow(1);
           
        }
        for(var i = 1; i < tamAccion; i++){
            
            tablaAccion.deleteRow(1);
            
        }
        for(var i = 1; i < tamIntervencion; i++){
           
            tablaIntervencion.deleteRow(1);
            
        }
        for(var i = 1; i < tamMejoramiento; i++){
            
            tablaMejoramiento.deleteRow(1);
            
        }
        for(var i = 1; i < tamInvestigacion; i++){
            
            tablaInvestigacion.deleteRow(1);
        }
        
        //Realizar Peticion
        var url = 'listaPlanes';
        conectarX(url,muestraPlanes);
        
    }

    function muestraPlanes() {
        if(http_request.readyState == 4) {
            if(http_request.status == 200) {
                var xmldoc = http_request.responseXML;
                var lista = xmldoc.getElementsByTagName("listaplanes")[0];
                var reg = lista.getElementsByTagName("plan");
                var elementos=["nombre","unidad","inicio","fin","Opción","id","tipo"];
                var cuerpo=document.getElementById('cuerpo'),fila,texto,nodo,url,link,columna,div,tipo;
                var iplan = 0 ;

                for(var i = 0; i < reg.length;i++){
                    tipo=reg[i].getElementsByTagName(elementos[6])[0].firstChild.nodeValue;
                    if(tipo == "M"){
                        cuerpo=document.getElementById('cuerpoMejoramiento')
                    }
                    else{
                        if(tipo == "A"){
                            cuerpo=document.getElementById('cuerpoAccion')
                        }
                        else{
                            if(tipo=="I"){
                                cuerpo=document.getElementById('cuerpoIntervencion')
                            }else{
                                if(tipo=="D"){
                                    cuerpo=document.getElementById('cuerpoDesarrollo')
                                }else{
                                    cuerpo=document.getElementById('cuerpoInvestigacion')
                                }
                           
                            }
                        }
                    }
                    fila=cuerpo.insertRow(0);
                    iplan = reg[i].getElementsByTagName(elementos[5])[0].firstChild.nodeValue;
                    for(var j = 0; j <= 4; j++){
                        
                        if (j < 4 ) {
                            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
                        }
                        columna=fila.insertCell(j);
                        div=document.createElement("div");
                        if( j > 1 ){
                            div.setAttribute("align", "center");
                        }else{
                            div.setAttribute("align", "left");
                        }
                        /*if (j == 0){
                            link=document.createElement("a");
                            link.setAttribute("id", nodo);
                            link.setAttribute("href", "#");
                            link.setAttribute("onclick", "cuentas("+nodo+")");
                            texto=document.createTextNode("Detalle");
                            link.appendChild(texto);
                            div.appendChild(link);
                            columna.appendChild(div);
                        }else */if (j == 4){
                            link=document.createElement("a");
                            link.setAttribute("href", "Proyectos?idPlan="+iplan);
                            texto=document.createTextNode("Proyectos");
                            link.appendChild(texto);
                            div.appendChild(link);
                            columna.appendChild(div);
                        }else {
                            texto=document.createTextNode(nodo);
                            div.appendChild(texto);
                            columna.appendChild(div);
                        }
                    }
                }
                document.getElementById('buscar').style.visibility='visible'
            }
        }
    }
    
function verplanesmejoramiento()
{
    setVisibilidad(['TipoAccion=none', 'TipoDesarrollo=none','TipoIntervencion=none','TipoMejoramiento=inline','TipoInvestigacion=none']);
}
function verplanesAccion()
{
     setVisibilidad(['TipoAccion=inline', 'TipoDesarrollo=none','TipoIntervencion=none','TipoMejoramiento=none','TipoInvestigacion=none']);
}
function verplanesIntervencion()
{
    setVisibilidad(['TipoAccion=none', 'TipoDesarrollo=none','TipoIntervencion=inline','TipoMejoramiento=none','TipoInvestigacion=none']);
}
function verplanesDesarrollo()
{
     setVisibilidad(['TipoAccion=none', 'TipoDesarrollo=inline','TipoIntervencion=none','TipoMejoramiento=none','TipoInvestigacion=none']);
}
function verplanesInvestigacion()
{
     setVisibilidad(['TipoAccion=none', 'TipoDesarrollo=none','TipoIntervencion=none','TipoMejoramiento=none','TipoInvestigacion=inline']);
}