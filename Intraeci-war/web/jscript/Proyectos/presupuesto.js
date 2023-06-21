var href;
var exportTable;
var respCdps = false;

function setInitial(id) {
    id = id || 0;
    //Esconde las tablas
    setVisibilidad(['tPresupuesto=none','btnExportar=none','rPres=none','resultDiv_Resume=none','loadingText=block']);/*'desconv0=none','desconv1=none']);*/
    
    //Muestra el texto informativo
    if (id==0) {
        setLoadingText('Cargando datos...');
    } else if (id==1) {
        setLoadingText('Cargando datos, el sistema está calculando las Apropiaciones y Ejecuciones, está operación puede tardar un minuto...');
    }
    
    //Limpia las tablas
    limpiartabla('cpresupuesto');
    limpiartabla('crpres');
    
    //Indica que hay consultas existentes
    respCdps = true;
}

function limpiartabla(tab) {
    var tabla = document.getElementById(tab);
    var filas = tabla.rows;
    var tam = filas.length;
    for(var i = 0; i < tam; i++)
        tabla.deleteRow(0);
}

function checkErrors(xmlDoc) {
    //Verificamos si el sistema ha proporcionado algun error
    var xmlErr = xmlDoc.getElementsByTagName('error');
    if (xmlErr.length > 0) {
        setLists('-', true, true)
        setLoadingText(xmlErr[0].childNodes[0].nodeValue);
        alert(xmlErr[0].childNodes[0].nodeValue);
        window.close();
        return true;
    }
    return false;
}

function setLoadingText(txt) {
    var x = document.getElementById('loadingP');
    x.innerHTML = txt;
}

function setLists(value, chkCen, chkRub) {
    var lisCen;
    var optElem;
    
    value = value || '';
    chkCen = chkCen || false;
    chkRub = chkRub || false;
    
    lisCen = document.getElementById('lcen');
    lisRub = document.getElementById('lrubro');
    
    //Limpia las listas de Centros y Rubros
    if (chkCen) while (lisCen.options.length > 0) lisCen.remove(0);
    if (chkRub) while (lisRub.options.length > 0) lisRub.remove(0);
    
    if (value == '') return;
    
    //Creamos y ubicamos para las listas el valor asignado.
    if (chkCen) {
        optElem = document.createElement('option');
        optElem.setAttribute('value', '0');
        optElem.innerHTML = value;
        lisCen.appendChild(optElem);
    }
    if (chkRub) {
        optElem = document.createElement('option');
        optElem.setAttribute('value', '0');
        optElem.innerHTML = value;
        lisRub.appendChild(optElem);
    }
}

function cargarLista(id) {
    var vig;
    var cen;
    vig = document.getElementById('vig').selectedIndex == '0'?'2022':'2023';
    cen = document.getElementById('lcen').value;
    
    setInitial();
    
    if (id == '0') {
        
        //Limpiamos las listas y ponemos el texto "Cargando..." en la lista de Centros
        setLists('Cargando...', true, false);
        setLists('-', false, true);

        //Enviamos a través del POST para obtener los Centros que maneja el Usuario
        conectarX('listaRubros?tipo=0&vig=' + vig, listaCentros);
        
    } else {
        
        //Limpiamos la lista de  y ponemos el texto "Cargando..."
        setLists('Cargando...', false, true);

        //Enviamos a través del POST para obtener los Rubros del Centro seleccionado
        conectarX('listaRubros?tipo=1&vig=' + vig + '&cen=' +  cen, listaRubros);
    }
}

function listaCentros() {
    //Verificamos que la respuestá esté lista y esté Ok
    if (http_request.readyState != 4) return;
    
    //Indica que NO hay consultas existentes
    respCdps = false;
    
    if (http_request.status != 200) return;

    //Vaciamos la lista
    setLists('',true, false);
    
    //Obtenemos el resultado del POST en una variable registro
    var xmlDoc = http_request.responseXML;
    
    //Verificamos si el sistema ha proporcionado algun error
    if (checkErrors(xmlDoc)) return false;
    
    var reg = xmlDoc.getElementsByTagName('lista')[0].getElementsByTagName('item');
    
    if (reg.length > 0) {
        var optElem;
        var fillList;

        //Agregamos los centros a la lista
        fillList = document.getElementById('lcen');

        for (var i=0; i < reg.length; i++) {
            optElem = document.createElement('option');
            optElem.setAttribute('value', reg[i].getElementsByTagName('cod')[0].firstChild.nodeValue);
            optElem.innerHTML = reg[i].getElementsByTagName('nom')[0].firstChild.nodeValue;

            fillList.appendChild(optElem);
        }
        cargarLista('1');
        setLoadingText('Consulta de Centros realizada.');
    } else {
        setLists('-',true, true);
        setLoadingText('No se encontraron Centros para el año asignado.');
    }
}

function listaRubros() {
    //Verificamos que la respuestá esté lista y esté Ok
    if (http_request.readyState != 4) return;
    
    //Indica que NO hay consultas existentes
    respCdps = false;
    
    if (http_request.status != 200) return;
    
    //Vaciamos la lista
    setLists('',false, true);
    
    //Obtenemos el resultado del POST en una variable registro
    var xmlDoc = http_request.responseXML;
    
    //Verificamos si el sistema ha proporcionado algun error
    if (checkErrors(xmlDoc)) return false;
    
    var reg = xmlDoc.getElementsByTagName('lista')[0].getElementsByTagName('item');
    
    if (reg.length > 0) {
    
        var optElem;
        var fillList;

        //Agregamos los centros a la lista
        fillList = document.getElementById('lrubro');

        for (var i=0; i < reg.length; i++) {
            optElem = document.createElement('option');
            optElem.setAttribute('value', reg[i].getElementsByTagName('cod')[0].firstChild.nodeValue);
            optElem.innerHTML = reg[i].getElementsByTagName('nom')[0].firstChild.nodeValue;

            fillList.appendChild(optElem);
        }
        setLoadingText('Consulta de Rubros realizada.');
    } else {
        setLists('-',false, true);
        setLoadginText('No se encontraron Rubros');
    }
}

/*function rubros(){
    var vig, cen;
    vig = document.getElementById('vig').value;
    cen = document.getElementById('lcen').value;
         
    //Limpiamos la lista de  y ponemos el texto "Cargando..."
    setLists('Cargando...', false, true);

    //Enviamos a través del POST para obtener los Rubros del Centro seleccionado
    conectarX('listaRubros?tipo=2&vig=' + vig + '&cen=' +  cen, listaRubros);
}*/

/*function listaRubros() {
    if (http_request.readyState != 4) return;
    if (http_request.status != 200) return;
    
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("lista")[0];
    var reg = lista.getElementsByTagName("item");
    var elementos=["cod_rub","nom_rub","tp"];
    var rubros=document.getElementById('lrubro') ;
    var centros=document.getElementById('lcen') ;

    for(var i = 0; i < reg.length;i++){
        nopc = document.createElement("option");
        nopc.setAttribute("value", reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue);
        nopc.innerHTML = reg[i].getElementsByTagName(elementos[1])[0].firstChild.nodeValue ;
        if (reg[i].getElementsByTagName(elementos[2])[0].firstChild.nodeValue == '2')
            rubros.appendChild(nopc);
        else
            centros.appendChild(nopc);
    }
}*/

function cdps() {
    //Verifica que no hayan consultas existentes
    if (respCdps) return;
    
    //Define URL
    var vig = document.getElementById('vig').selectedIndex == '0'?'2022':'2023';
    var url = 'listaRubros?tipo=1&vig=' + vig + '&crub=' + document.getElementById('lrubro').value + '&ccen=' + document.getElementById('lcen').value;
    
    setInitial(1);
    
    //Envia la conexión AJAX para consultar el rubro
    conectarMethod(url,verCDPs, 'GET');
    
    
}

function verCDPs() {
    //Despliega la tabla de los CDPs para vigencia y rubro del responsable en sesión
    if(http_request.readyState != 4) return;
    
    //Indica que NO hay consultas existentes
    respCdps = false;
    
    if(http_request.status == 200) {
            
        var xmldoc = http_request.responseXML;
            
        //Verificamos si el sistema ha proporcionado algun error
        if (checkErrors(xmldoc)) return false;
            
        var lista = xmldoc.getElementsByTagName("listacdps")[0];
        var reg = lista.getElementsByTagName("cdp");
            
        if (reg.length > 0) {
            var elementos=["num","det","nom_prov","fec","val","est","rub"];
            var cuerpo = document.getElementById('cpresupuesto');
            var fila;
            var nodo;
            var apr0;
            var apr1;
            var apr2;
            var apr3;
            var apr4;
            var columna;
            var apr = 0;
            var eje = 0;
            var sol = 0;

            for(var i = 0; i < reg.length;i++) {
                if (reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue != "Apropia") fila = cuerpo.insertRow(0);

                for(var j = 0; j < 6; j++) {
                    nodo = reg[i].getElementsByTagName(elementos[j])[0].firstChild != null?reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue:'';

                    if (reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue != "Apropia") {
                        if (j == 4) nodo = formatear(nodo);

                        if (j == 5) {
                            if (nodo == '0')        nodo = 'Solicitado' ;
                            else if (nodo == '1')   nodo = 'Aprobado' ;
                            else                    nodo = 'Contabilizado' ;
                        }

                        columna = fila.insertCell(j);
                        columna.innerHTML = nodo;
                    } else {
                        if (j == 0) apr0 = nodo;
                        if (j == 1) apr1 = nodo;
                        if (j == 3) apr2 = nodo;
                        if (j == 4) apr3 = formatear(nodo);
                        if (j == 5) {
                            if (nodo == '0')        apr4 = 'Solicitado';
                            else if (nodo == '1')   apr4 = 'Aprobado';
                            else                    apr4 = 'Contabilizado';
                        }

                        document.getElementById('desconv0').innerHTML = 
                            '<table style="display: inline;">'
                                +'<tbody>'
                                +'<tr>'
                                    +'<td colspan="2" class="resultDiv_Red" style="text-align: center;">Apropiación Inicial por Rubro</td>'
                                +'</tr>'
                                +'<tr>'
                                    +'<td class="resultDiv_Black" style="text-align: left;">Descripción de la apropiación:</td>'
                                    +'<td class="resultDiv_Gray" style="text-align: left;">' + apr1 + '</td>'
                                +'</tr>'
                                +'<tr>'
                                    +'<td class="resultDiv_Black" style="text-align: left;">Fecha de la apropiación:</td>'
                                    +'<td class="resultDiv_Gray" style="text-align: left;">' + apr2 + '</td>'
                                +'</tr>'
                                +'<tr>'
                                    +'<td class="resultDiv_Black" style="text-align: left;">Valor de la apropiación:</a></td>'
                                    +'<td class="resultDiv_Gray" style="text-align: left;">$ ' + apr3 + '</td>'
                                +'</tr>'
                                +'<tr>'
                                    +'<td class="resultDiv_Black" style="text-align: left;">Estado de la apropiación:</td>'
                                    +'<td class="resultDiv_Gray" style="text-align: left;">' + apr4 + '</td>'
                                +'</tr>'
                                +'</tbody>'
                            +'</table>';
                    }
                }

                //Calcula los acumulados de presuúesto apropiado, ejecutado y solicitado
                nodo = reg[i].getElementsByTagName(elementos[4])[0].firstChild.nodeValue;
                if ( reg[i].getElementsByTagName(elementos[0])[0].firstChild.nodeValue == "Apropia" )
                    apr += parseFloat(nodo);
                else if ( reg[i].getElementsByTagName(elementos[5])[0].firstChild.nodeValue == "0" )
                    sol += parseFloat(nodo);
                else
                    eje += parseFloat(nodo);
            }
            document.getElementById('desconv1').innerHTML =
                    '<table style="display: inline;">'
                        +'<tbody>'
                        +'<tr>'
                            +'<td colspan="2" class="resultDiv_Red" style="text-align: center;">Totales</td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td class="resultDiv_Black" style="text-align: left;">Ejecutado:</td>'
                            +'<td class="resultDiv_Gray" style="text-align: left;">$ ' + formatear(eje) + '</td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td class="resultDiv_Black" style="text-align: left;">Solicitado:</td>'
                            +'<td class="resultDiv_Gray" style="text-align: left;">$ ' + formatear(sol) + '</td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td class="resultDiv_Black" style="text-align: left;">Total:</td>'
                            +'<td class="resultDiv_Gray" style="text-align: left;">$ ' + formatear(eje+sol) + '</td>'
                        +'</tr>'
                        /*+'<tr>'
                            +'<td class="resultDiv_Black" style="text-align: left;">Disponible:</td>'
                            +'<td class="resultDiv_Gray" style="text-align: left;">$ ' + formatear(apr-eje) + '</td>'
                        +'</tr>'*/
                        +'</tbody>'
                        +'</table>';

            setVisibilidad(['tPresupuesto=block','btnExportar=block','rPres=none','resultDiv_Resume=block','loadingText=none']);/*'desconv0=inline','desconv1=inline']);*/
            setLoadingText('No se ha realizado ninguna consulta.');
        } else {
            setLoadingText('La consulta no arrojó ningún resultado');
        }
    }
}

function respres(){
    //Verifica que no hayan consultas existentes
    if (respCdps) return;

    //Define URL
    var vig = document.getElementById('vig').selectedIndex == '0'?'2022':'2023';
    var url = 'listaRubros?tipo=2&vig=' + vig + '&ccen=' + document.getElementById('lcen').value;
    
    setInitial(1);
    
    //Envia la conexión AJAX para consultar el rubro
    conectarMethod(url,verPres, 'GET');
}

function verPres() {
    //== Despliega la tabla rde los CDPs para vigenic y rubro del responsable en sesión
    if (http_request.readyState != 4) return;
    
    //Indica que NO hay consultas existentes
    respCdps = false;
    
    if(http_request.status != 200) return;
    var xmldoc = http_request.responseXML;
    
    //Verificamos si el sistema ha proporcionado algun error
    if (checkErrors(xmldoc)) return false;
    
    var lista = xmldoc.getElementsByTagName("listacdps")[0];
    var reg = lista.getElementsByTagName("cdp");
    
    if (reg.length > 0) {

        var elementos = ["num","det","fec","val","est","rub"];
        var cuerpo = document.getElementById('crpres');
        var fila;
        var nodo = "ant";
        var columna;
        var columna3;
        var columna4;
        var disp = 0 ;

        for(var i = 0; i < reg.length; i++) {

            if (nodo != reg[i].getElementsByTagName(elementos[5])[0].firstChild.nodeValue ) {
                nodo = reg[i].getElementsByTagName(elementos[5])[0].firstChild.nodeValue ;
                fila = cuerpo.insertRow(0);
                columna = fila.insertCell(0);
                columna.innerHTML = reg[i].getElementsByTagName(elementos[5])[0].firstChild.nodeValue;
                columna = fila.insertCell(1);
                columna.innerHTML = reg[i].getElementsByTagName(elementos[1])[0].firstChild.nodeValue;

                if("Apropiado"==reg[i].getElementsByTagName(elementos[4])[0].firstChild.nodeValue){
                    columna = fila.insertCell(2);
                    columna.innerHTML = formatear(reg[i].getElementsByTagName(elementos[3])[0].firstChild.nodeValue) ;
                    columna3 = fila.insertCell(3);
                    columna4 = fila.insertCell(4);
                    disp = reg[i].getElementsByTagName(elementos[3])[0].firstChild.nodeValue ;
                    columna4.innerHTML = formatear(disp) ;
                } else{

                columna = fila.insertCell(2);
                columna = fila.insertCell(3);
                columna.innerHTML = formatear(reg[i].getElementsByTagName(elementos[3])[0].firstChild.nodeValue) ;
                disp = reg[i].getElementsByTagName(elementos[3])[0].firstChild.nodeValue ;
                columna = fila.insertCell(4);
                disp = 0 - reg[i].getElementsByTagName(elementos[3])[0].firstChild.nodeValue ;
                columna.innerHTML = formatear(disp) ;
                }
            } else {
                disp = disp - reg[i].getElementsByTagName(elementos[3])[0].firstChild.nodeValue ;
                //columna = fila.insertCell(3);
                columna3.innerHTML = formatear(reg[i].getElementsByTagName(elementos[3])[0].firstChild.nodeValue) ; 
                //columna = fila.insertCell(4);
                columna4.innerHTML = formatear(disp) ;
            }
        }
        setVisibilidad(['tPresupuesto=none','btnExportar=block','rPres=block','resultDiv_Resume=none','loadingText=none']);/*'desconv0=none','desconv1=none']);*/
        setLoadingText('No se ha realizado ninguna consulta.');

        document.getElementById('desconv0').innerHTML = "";
        document.getElementById('desconv1').innerHTML = "";
    } else {
        setLoadingText('La consulta no arrojó ningún resultado');
    }
}

function formatear(num) {
    num +='';
    var splitStr = num.split('.');
    var splitLeft = splitStr[0];
    var splitRight = splitStr.length > 1 ? '.' + splitStr[1] : '';
    var regx = /(\d+)(\d{3})/;
    while (regx.test(splitLeft)) {
        splitLeft = splitLeft.replace(regx, '$1' + '.' + '$2');
    }
    return splitLeft + splitRight;
}

function exportExcel() {
    //Obtiene el contenido de la tabla en código HTML
    if (document.getElementById('tPresupuesto').style.display == 'block') {
        var exportData = document.getElementById('tPresupuesto');
    } else if (document.getElementById('rPres').style.display == 'block') {
        var exportData = document.getElementById('rPres');
    } else {
        return false;
    }
    exportData = '<html><head><title>Exportando a Excel...</title></head><body onload="document.write("Después de realizar su descarga puede cerrar esta descarga."'
            + 'window.close()"><table border="1" style="border: 1px solid black;">' + exportData.innerHTML.toString()
            + '</table></body></html>';
    
    //Enviamos la tabla
    conectarSendParam('exportExcel','POST','exportData',encodeURIComponent(exportData));
}
