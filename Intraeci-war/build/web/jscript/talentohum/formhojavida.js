var nomImpDoc;

//== Funciones para la administración interna
function lisconvoca() {
    //== Limplia la tabla de detalle visible en el momento y alista el despliegue
    //== de la tabla resumen de estudios del empleado
    setVisibilidad(['hojavida=none', 'imprimir=none']);
    var tabla=document.getElementById('cuerpoconva');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++){
        tabla.deleteRow(0);
    }
    var url = 'getVarios?op=4';
    conectarMethod(url,muestraconvadm, 'POST');
         
    return false;
}
function Publiconvoca() {
    //== Limplia la tabla de detalle visible en el momento y alista el despliegue
    //== de la tabla resumen de estudios del empleado
    //setVisibilidad(['hojavida=none', 'imprimir=none']);
    var tabla=document.getElementById('cuerpopubconv');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++){
        tabla.deleteRow(0);
    }
    var url = 'SetNewConv';
    conectarMethod(url,muestranewConv, 'POST');
    return false;
}
function PublicarConv(oper) {
    if (!isDiligenciado(['FecIni', 'FecFin', 'NomNew', 'DscripNew', 'RespNew', 'DirNew', 'periodoNew', 'TipoNeww'],
            ['Fecha Inicial', 'Fecha Final', 'Nombre de la convocatoria', 'Descripción de la convocatoria', 'Persona Responsable', 'Director del área', 'Periodo', 'Tipo de Convocatoria']))
        return;
    if (!validaFecha(document.getElementById("FecIni").value) || !validaFecha(document.getElementById("FecFin").value))
        return;
    
    var idConv = document.getElementById('idConv').innerHTML;
    if (idConv == null || isNaN(idConv) || idConv == '') idConv = -1;
    
    var url = 'publicNewConv?oper=' + oper + '&idconv=' + idConv + '&' + getValores(['FecIni', 'FecFin', 'NomNew', 'DscripNew', 'RespNew', 'DirNew', 'periodoNew','TipoNeww']);
    conectarMethod(url,muestraResultadoConv, 'POST');
    return false;

}

function ResumenAspirantes() {
    var idConv = document.getElementById('idConv').innerHTML;
    if (idConv == null || isNaN(idConv) || idConv == '') return false;

    var tmp = window.open("resumenAsp?idconv=" + idConv, "", "status=1, scrollbars=1, menubar=1");
    tmp.window.focus();
    tmp.document.close();
}

function muestraResultadoConv() {
    if (http_request.readyState != 4) return;
    if (http_request.status != 200) return
    
    var xmldoc = http_request.responseXML;
    var respuesta = xmldoc.getElementsByTagName("resultado")[0];
    var resul = respuesta.getElementsByTagName("valor")[0].firstChild.nodeValue;
    
    alert(resul);
    lisconvoca();
    
    if (respuesta.getElementsByTagName("dato")[0] != null) {
        eval(respServlet+"("+respuesta.getElementsByTagName("dato")[0].firstChild.nodeValue+");");                
    }
}

function muestranewConv(){
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;    
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("Administradores")[0];
    var reg = lista.getElementsByTagName("administrador");
    var cuerpo = document.getElementById('cuerpopubconv'),fila,nodo;
    var columna, idadm;

    
        fila = cuerpo.insertRow(0);
        idadm = reg[0].getElementsByTagName("adm")[0].firstChild.nodeValue;
        
        if(idadm == '1'){
        
        //== Celda que describe la convocatoria
        //nodo=reg[0].getElementsByTagName("nom")[0].firstChild.nodeValue;
       setVisibilidad(['NewConvoca=inline']);
       columna=fila.insertCell(0);
        columna.innerHTML = "<table align='left'>" +
                "<tr>" +
                "  <td align='left'>" +
                "  Nombre de la Convocatoria:" +
                "</td>" +
                " <td align='left'>" +
                " <input type='text' name='NomNew' id='NomNew' type='text' size='60'>" +
                "</td> " +
                "</tr>" +
                "<tr>" +
                "<td align='left'>" +
                "   Descripcion de la convocatoria:" +
                "</td>" +
                " <td align='left'>" +
                "      <textarea rows='3' cols='65' name='DscripNew' id='DscripNew'></textarea>" +
                "   </td> " +
                "</tr>" +
                "<tr>" +
                "<td align='left'>" +
                "   Tipo de la convocatoria:" +
                "</td>" +
                " <td align='left'>" +
                "<select name='TipoNew' id='TipoNew'>" +
                "<option value='Catedra'>Catedra" +
                "<option value='Planta'>Planta" +
                "</select>" +
                "   </td> " +
                "</tr>" +
                "<tr>" +
                "<td align='left'>" +
                "   Periodo:" +
                "</td>" +
                " <td align='left'>" +
                "<select name='periodoNew' id='periodoNew'>" +
                "<option value='2015-1'>2015-1</option>" +
                "<option value='2015-2'>2015-2</option>" +
                "<option value='2016-1'>2016-1</option>" +
                "<option value='2016-2'>2016-2</option>" +
                "</select>" +
                "</td> " +
                "</tr>" +
                " <tr>" +
                "<td align='left'>" +
                "    Persona Responsable:" +
                " </td>" +
                " <td align='left'>" +
                "<input disabled='true'  type='hidden' readonly size='20' name='resp' id='RespNew'/>" +
                "<input disabled='true' size='60' type='text' name='respE' id='recurInt'/>" +
                "<a href='#' id='imgRecur' onClick='return empleadosModal(\"recurInt\",\"RespNew\",\"0\",\"0\",true);'>" +
                "<img ALIGN='MIDDLE' alt=''src='img/selector.gif'/>" +
                "</a>" +
                "   </td> " +
                "</tr>" +
                "<tr><td align='left'><input type='submit' value='Publicar' name='EnvSolicitud' onclick= 'PublicarConv();'/></td></tr>"
        " </table>";
        
  
                
                
                                       
             
        }
        /*for (var j = 1; j <= 4; j++ ) {
            nodo=reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j);
            columna.innerHTML=nodo;
        }*/
}

function muestraconvadm() {
    // Despliega la tabla de las convocatorias
    if (http_request.readyState != 4)
        return ;
    if(http_request.status != 200)
        return ;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("convocatorias")[0];
    var reg = lista.getElementsByTagName("convoca");
    var cuerpo = document.getElementById('cuerpoconva'),fila,texto,nodo, link;
    var columna, ident;

    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName("idcon")[0].firstChild.nodeValue;
        //== Celda que describe la convocatoria
        nodo=reg[i].getElementsByTagName("descon")[0].firstChild.nodeValue;
        columna=fila.insertCell(0);
        columna.innerHTML="<a onclick=\"detConvoca(5," + ident + "); glowThis(this);\">"+nodo+"</a>";
        //== Celda que describe la convocatoria
        nodo=reg[i].getElementsByTagName("fecha")[0].firstChild.nodeValue;
        columna=fila.insertCell(1);
        columna.innerHTML=nodo;
    }
    //Publiconvoca();
}

function aspirConv() {
    // Despliega la tabla de los participantes
    if (http_request.readyState != 4) return ;
    if (http_request.status != 200) return ;
    
    var elementos=["nom","fecha","genero","fnac","estado"];
    var xmldoc = http_request.responseXML;
    
    xmldoc = xmldoc.getElementsByTagName('convocatoria')[0];
    
    var lista = xmldoc.getElementsByTagName("participantes")[0];
    var infoConv = xmldoc.getElementsByTagName("infoConv")[0];
    
    var reg = lista.getElementsByTagName("participa");
    var cuerpo = document.getElementById('cuerpoconvp'),fila,texto,nodo, link;
    var columna, ident, idpar;
    
    var btnEdit = document.admpublicconvo.EditConv;
    
    if (btnEdit != null) {
        document.admpublicconvo.EditConv.disabled = false;
        document.admpublicconvo.EditConv.className = 'boton';
    }
    
    var resAsp = document.admpublicconvo.ResAsp;
    
    if (resAsp != null) {
        resAsp.disabled = false;
        resAsp.className = 'boton';
    }
    
    document.getElementById('idConv').innerHTML = infoConv.getElementsByTagName('idcon')[0].firstChild.nodeValue;
    document.admpublicconvo.NomNew.value = infoConv.getElementsByTagName('nom')[0].firstChild.nodeValue;
    document.admpublicconvo.FecIni.value = infoConv.getElementsByTagName('fini')[0].firstChild.nodeValue;
    document.admpublicconvo.FecFin.value = infoConv.getElementsByTagName('ffin')[0].firstChild.nodeValue;
    document.admpublicconvo.DscripNew.value = infoConv.getElementsByTagName('desc')[0].firstChild.nodeValue;
    document.admpublicconvo.TipoNew.value = infoConv.getElementsByTagName('tipo')[0].firstChild.nodeValue;
    
    var periodo = document.admpublicconvo.periodoNew;
    var per = infoConv.getElementsByTagName('per')[0].firstChild.nodeValue;
    var i = 0;
    
    for (i = 0; i < periodo.length; i++) {
        if (periodo[i].disabled == true) periodo.remove(i);
    }
    
    for (i = 0; i < periodo.length; i++) {
        if (periodo[i].value == per) {
            periodo.selectedIndex = i;
            break;
        }
    }
    
    if (i == periodo.length) {
        var option = document.createElement('option');
        option.text = per;
        option.setAttributeNode(document.createAttribute('value'));
        option.setAttribute('value', per);
        option.setAttributeNode(document.createAttribute('disabled'));
        option.setAttribute('disabled', 'true');
        option.setAttributeNode(document.createAttribute('selected'));
        option.setAttribute('selected', 'true');
        periodo.add(option, 0);
    }
    
    document.admpublicconvo.resp.value = infoConv.getElementsByTagName('convAdm')[0].firstChild.nodeValue;
    document.admpublicconvo.respE.value = infoConv.getElementsByTagName('nomAdm')[0].firstChild.nodeValue;
    document.admpublicconvo.dir.value = infoConv.getElementsByTagName('convDir')[0].firstChild.nodeValue;
    document.admpublicconvo.dirE.value = infoConv.getElementsByTagName('nomDir')[0].firstChild.nodeValue;
    
    for(var i = 0; i < reg.length;i++){
        fila = cuerpo.insertRow(0);
        ident = reg[i].getElementsByTagName("idp")[0].firstChild.nodeValue;
        idpar = reg[i].getElementsByTagName("idpar")[0].firstChild.nodeValue;
        //== Celda que describe la convocatoria
        nodo=reg[i].getElementsByTagName("nom")[0].firstChild.nodeValue;
        columna=fila.insertCell(0);
        columna.innerHTML =  reg.length - i;
        columna=fila.insertCell(1);
        columna.innerHTML = "<a onclick=\"hojavida(" + ident + "," + idpar + "); glowThis(this);\">" + nodo + "</a>";
        for (var j = 1; j <= 4; j++ ) {
            nodo = reg[i].getElementsByTagName(elementos[j])[0].firstChild.nodeValue;
            columna=fila.insertCell(j+1);
            columna.innerHTML=nodo;
        }
    }
}

function hojavida(idasp, idpar) {
    //== Limplia la tabla de detalle visible en el momento y alista el despliegue
    //== de la tabla resumen de estudios del empleado
    setVisibilidad(['hojavida=table', 'imprimir=inline', 'hvLink=none']);
    var tabla=document.getElementById('cuerpohojavida');
    var filas=tabla.rows;
    var tam=filas.length;
    for(var i = 0; i < tam; i++){
        tabla.deleteRow(0);
    }
    var url = 'impHojaVida?idp=' + idasp + "&par=" + idpar;
    conectarMethod(url,muestrahojavida, 'POST');
    return false;
}

function checkURL(URL) {
    conectarMethod(URL, function() {
        if (http_request.readyState != 4) return;
        if (http_request.status != 200) return;
        var hvLink = document.getElementById('hvLink');
        hvLink.href = URL;
        hvLink.style.display = 'inline';
    }, 'HEAD');
}

function muestrahojavida() {
    // Despliega la tabla de las convocatorias
    if (http_request.readyState != 4) return;
    if (http_request.status != 200) return;
    var xmldoc = http_request.responseXML;
    var lista = xmldoc.getElementsByTagName("hojavida")[0];
    var reg = lista.getElementsByTagName("estpart");
    var nom = lista.getElementsByTagName("generales")[0].getElementsByTagName("nombre")[0].firstChild.nodeValue;
    
    var ieCheck = (document.querySelector)?true:false;

    setEditar(['obsp=']);
    respEstPart = true ;    
    
    //Datos de selección del aspirante
    document.getElementById('nomAspirante').innerHTML = nom;
    document.admpartconvo.idpart.value = reg[0].getElementsByTagName("idpar")[0].firstChild.nodeValue;
    document.admpartconvo.estpart.value = reg[0].getElementsByTagName("estad")[0].firstChild.nodeValue;
    document.admpartconvo.obsp.value = reg[0].getElementsByTagName("obs")[0].firstChild.nodeValue;
    //document.admpartconvo.mensaje.value = reg[0].getElementsByTagName("mensaje")[0].firstChild.nodeValue;
    //document.admpartconvo.razon.value = reg[0].getElementsByTagName("razon")[0].firstChild.nodeValue;

    var cuerpo = document.getElementById('cuerpohojavida'), fila, nodo;
    var columna, idasp;
    var nRow = 0;
    var itemRow0 = '20%';
    var itemRow1 = '80%';
    var tblRow0 = '40%';
    var tblRow1 = '10%';
    var tblRow2 = '50%';
    
    //Datos generales
    reg = lista.getElementsByTagName("generales");
    
    var nomAspirante = reg[0].getElementsByTagName("nombre")[0].firstChild.nodeValue;
    var docAspirante = reg[0].getElementsByTagName("doc")[0].firstChild.nodeValue;
    
    nomImpDoc = nomAspirante + ' - ' + docAspirante;
    
    fila = cuerpo.insertRow(nRow++);
    columna = fila.insertCell(0);
    columna.className = 'nomAsp';
    columna.setAttribute('colSpan', '3');
    columna.innerHTML = nomAspirante.replace(' _ ', ' ');
    
    
    fila = cuerpo.insertRow(nRow++);
    
    columna = fila.insertCell(0);
    columna.style.width = tblRow0;
    columna.innerHTML = '';
    
    columna = fila.insertCell(1);
    columna.style.width = tblRow1;
    columna.style.textAlign = 'left';
    columna.innerHTML = 'Documento:';
    
    columna = fila.insertCell(2);
    columna.style.width = tblRow2;
    columna.style.textAlign = 'left';
    nodo = docAspirante;
    columna.innerHTML = nodo;
    checkURL('../../doc_escuela_conv/doc' + nodo + '.pdf');
    
    
    fila = cuerpo.insertRow(nRow++);
    
    columna = fila.insertCell(0);
    columna.style.width = tblRow0;
    
    columna = fila.insertCell(1);
    columna.style.width = tblRow1;
    columna.style.textAlign = 'left';
    columna.innerHTML = 'Nacimiento:';
    
    columna = fila.insertCell(2);
    columna.style.width = tblRow2;
    columna.style.textAlign = 'left';
    columna.innerHTML = reg[0].getElementsByTagName("fnac")[0].firstChild.nodeValue;
    
    
    fila = cuerpo.insertRow(nRow++);
    
    columna = fila.insertCell(0);
    columna.style.width = tblRow0;
    
    columna = fila.insertCell(1);
    columna.style.width = tblRow1;
    columna.style.textAlign = 'left';
    columna.innerHTML = 'Género:';
    
    columna = fila.insertCell(2);
    columna.style.width = tblRow2;
    columna.style.textAlign = 'left';
    nodo = reg[0].getElementsByTagName("genero")[0].firstChild.nodeValue;
    if (nodo == 'M') nodo = 'Masculino';
    if (nodo == 'F') nodo = 'Femenino';
    columna.innerHTML = nodo;
    
    
    fila = cuerpo.insertRow(nRow++);
    
    columna = fila.insertCell(0);
    columna.style.width = tblRow0;
    
    columna = fila.insertCell(1);
    columna.style.width = tblRow1;
    columna.style.textAlign = 'left';
    columna.innerHTML = 'Dirección:';
    
    columna = fila.insertCell(2);
    columna.style.width = tblRow2;
    columna.style.textAlign = 'left';
    columna.innerHTML = reg[0].getElementsByTagName("dirres")[0].firstChild.nodeValue;
    
    
    fila = cuerpo.insertRow(nRow++);
    
    columna = fila.insertCell(0);
    columna.style.width = tblRow0;
    
    columna = fila.insertCell(1);
    columna.style.width = tblRow1;
    columna.style.textAlign = 'left';
    columna.innerHTML = 'Teléfono:';
    
    columna = fila.insertCell(2);
    columna.style.width = tblRow2;
    columna.style.textAlign = 'left';
    columna.innerHTML = reg[0].getElementsByTagName("telres")[0].firstChild.nodeValue;
    
    
    fila = cuerpo.insertRow(nRow++);
    
    columna = fila.insertCell(0);
    columna.style.width = tblRow0;
    
    columna = fila.insertCell(1);
    columna.style.width = tblRow1;
    columna.style.textAlign = 'left';
    columna.innerHTML = 'Celular:';
    
    columna = fila.insertCell(2);
    columna.style.width = tblRow2;
    columna.style.textAlign = 'left';
    columna.innerHTML = reg[0].getElementsByTagName("celular")[0].firstChild.nodeValue;
    
    
    fila = cuerpo.insertRow(nRow++);
    
    columna = fila.insertCell(0);
    columna.style.width = tblRow0;
    
    columna = fila.insertCell(1);
    columna.style.width = tblRow1;
    columna.style.textAlign = 'left';
    columna.innerHTML = 'Correo electrónico:';
    
    columna = fila.insertCell(2);
    columna.style.width = tblRow2;
    columna.style.textAlign = 'left';
    columna.innerHTML = reg[0].getElementsByTagName("email")[0].firstChild.nodeValue;
    
    //Perfil Profesional
    fila = cuerpo.insertRow(nRow++);
    columna = fila.insertCell(0);
    columna.className = 'subTitle';
    columna.setAttribute('colSpan', '3');
    columna.innerHTML = 'Perfil profesional';
    
    fila = cuerpo.insertRow(nRow++);
    columna = fila.insertCell(0);
    columna.className = 'paragraph';
    columna.setAttribute('colSpan', '3');
    columna.style.padding = '1% 10% 1% 10%';
    columna.innerHTML = lista.getElementsByTagName("perfil")[0].firstChild.nodeValue;
    
    //Estudios
    reg = lista.getElementsByTagName("estudios")[0].getElementsByTagName("estudio");
    
    if (reg.length > 0) {
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.className = 'subTitle';
        columna.setAttribute('colSpan', '3');
        columna.innerHTML = 'Estudios';
        
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.setAttribute('colSpan', '3');
        ieCheck?columna.style.padding = '1% 10% 1% 10%':columna.style.padding = '1% 0% 1% 0%';
        ieCheck?columna.style.textAlign = 'right':columna.style.textAlign = 'center';
        nodo = '';
        for (var i = 0; i < reg.length; i++) {
            nodo += '<table class="elementoHV" style="width: ' + (ieCheck?'100':'80') + '%; text-align: left;">' +
                        '<tr>' +
                            '<td colspan="2" class="elementoTitle"> » ' + reg[i].getElementsByTagName('titulo')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Nivel de estudio: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('nivel')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Tarjeta profesional: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('tarprof')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Institución: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('universidad')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Fecha de grado: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('fgrado')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                    '</table>';
        }
        columna.innerHTML = nodo;
    }
    
    //Idiomas
    reg = lista.getElementsByTagName("idiomas")[0].getElementsByTagName("idioma");
    
    if (reg.length > 0) {
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.className = 'subTitle';
        columna.setAttribute('colSpan', '3');
        columna.innerHTML = 'Idiomas';
        
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.setAttribute('colSpan', '3');
        ieCheck?columna.style.padding = '1% 10% 1% 10%':columna.style.padding = '1% 0% 1% 0%';
        ieCheck?columna.style.textAlign = 'right':columna.style.textAlign = 'center';
        nodo = '';
        
        var nLee;
        var nEscribe;
        var nHabla;
        for (var i = 0; i < reg.length; i++) {
            
            switch(reg[i].getElementsByTagName('lee')[0].firstChild.nodeValue) {case 'B': nLee = 'Bueno';break; case 'R': nLee = 'Regular';break; default: nLee = 'Bajo';}
            switch(reg[i].getElementsByTagName('escribe')[0].firstChild.nodeValue) {case 'B': nEscribe = 'Bueno';break; case 'R': nEscribe = 'Regular';break; default: nEscribe = 'Bajo';}
            switch(reg[i].getElementsByTagName('habla')[0].firstChild.nodeValue) {case 'B': nHabla = 'Bueno';break; case 'R': nHabla = 'Regular';break; default: nHabla = 'Bajo';}
            nodo += '<table class="elementoHV" style="width: ' + (ieCheck?'100':'80') + '%; text-align: left;">' +
                        '<tr>' +
                            '<td colspan="2" class="elementoTitle"> » ' + reg[i].getElementsByTagName('lengua')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Lee: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + nLee + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Escribe: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + nEscribe + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Habla: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + nHabla + '</td>' +
                        '</tr>' +
                    '</table>';
        }
        columna.innerHTML = nodo;
    }
    
    //Experiencia Laboral
    reg = lista.getElementsByTagName("experiencias")[0].getElementsByTagName("experiencia");
    
    if (reg.length > 0) {
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.className = 'subTitle';
        columna.setAttribute('colSpan', '3');
        columna.innerHTML = 'Experiencia laboral';
        
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.setAttribute('colSpan', '3');
        ieCheck?columna.style.padding = '1% 10% 1% 10%':columna.style.padding = '1% 0% 1% 0%';
        ieCheck?columna.style.textAlign = 'right':columna.style.textAlign = 'center';
        nodo = '';
        for (var i = 0; i < reg.length; i++) {
            nodo += '<table class="elementoHV" style="width: ' + (ieCheck?'100':'80') + '%; text-align: left;">' +
                        '<tr>' +
                            '<td colspan="2" class="elementoTitle"> » ' + reg[i].getElementsByTagName('organizacion')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Tipo de cargo: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('tcargo')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Nombre del cargo: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('cargo')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Período: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('periodo')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                    '</table>';
        }
        columna.innerHTML = nodo;
    }
    
    //Publicaciones
    reg = lista.getElementsByTagName("escritos")[0].getElementsByTagName("escrito");
    
    if (reg.length > 0) {
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.className = 'subTitle';
        columna.setAttribute('colSpan', '3');
        columna.innerHTML = 'Publicaciones';
        
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.setAttribute('colSpan', '3');
        ieCheck?columna.style.padding = '1% 10% 1% 10%':columna.style.padding = '1% 0% 1% 0%';
        ieCheck?columna.style.textAlign = 'right':columna.style.textAlign = 'center';
        nodo = '';
        for (var i = 0; i < reg.length; i++) {
            nodo += '<table class="elementoHV" style="width: ' + (ieCheck?'100':'80') + '%; text-align: left;">' +
                        '<tr>' +
                            '<td colspan="2" class="elementoTitle"> » ' + reg[i].getElementsByTagName('titulo')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Título mayor: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('tmayor')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Tipo: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('tipo')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Área: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('area')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Edición / Editorial: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('edicion')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">ISBN / ISSN: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('isbn')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Fecha: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('fecha')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">País: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('pais')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Ciudad: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('ciudad')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                    '</table>';
        }
        columna.innerHTML = nodo;
    }
    
    //Membresias
    reg = lista.getElementsByTagName("membresias")[0].getElementsByTagName("membresia");
    
    if (reg.length > 0) {
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.className = 'subTitle';
        columna.setAttribute('colSpan', '3');
        columna.innerHTML = 'Membresias';
        
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.setAttribute('colSpan', '3');
        ieCheck?columna.style.padding = '1% 10% 1% 10%':columna.style.padding = '1% 0% 1% 0%';
        ieCheck?columna.style.textAlign = 'right':columna.style.textAlign = 'center';
        nodo = '';
        for (var i = 0; i < reg.length; i++) {
            nodo += '<table class="elementoHV" style="width: ' + (ieCheck?'100':'80') + '%; text-align: left;">' +
                        '<tr>' +
                            '<td colspan="2" class="elementoTitle"> » ' + reg[i].getElementsByTagName('organizacion')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Categoría membresía: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('cat')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Miembro desde: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('fing')[0].firstChild.nodeValue + '</td>' +
                        '</tr>';
            if (reg[i].getElementsByTagName('fret')[0].firstChild.nodeValue != 'Actualidad') {
                nodo +=     '<tr>' +
                                '<td style="width: ' + itemRow0 + ';">Miembro hasta: </td>' +
                                '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('fret')[0].firstChild.nodeValue + '</td>' +
                            '</tr>';
            }
            nodo += '</table>';
                    
        }
        columna.innerHTML = nodo;
    }
    
    //Distinciones
    reg = lista.getElementsByTagName("distinciones")[0].getElementsByTagName("distincion");
    
    if (reg.length > 0) {
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.className = 'subTitle';
        columna.setAttribute('colSpan', '3');
        columna.innerHTML = 'Distinciones';
        
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.setAttribute('colSpan', '3');
        ieCheck?columna.style.padding = '1% 10% 1% 10%':columna.style.padding = '1% 0% 1% 0%';
        ieCheck?columna.style.textAlign = 'right':columna.style.textAlign = 'center';
        nodo = '';
        for (var i = 0; i < reg.length; i++) {
            nodo += '<table class="elementoHV" style="width: ' + (ieCheck?'100':'80') + '%; text-align: left;">' +
                        '<tr>' +
                            '<td colspan="2" class="elementoTitle"> » ' + reg[i].getElementsByTagName('nombre')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Institución: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('institucion')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">País: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('pais')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Año: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('ano')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Descripción: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('desc')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                    '</table>';
                    
        }
        columna.innerHTML = nodo;
    }
    
    //Proyectos
    reg = lista.getElementsByTagName("proyectos")[0].getElementsByTagName("proyecto");
    
    if (reg.length > 0) {
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.className = 'subTitle';
        columna.setAttribute('colSpan', '3');
        columna.innerHTML = 'Proyectos';
        
        fila = cuerpo.insertRow(nRow++);
        columna = fila.insertCell(0);
        columna.setAttribute('colSpan', '3');
        ieCheck?columna.style.padding = '1% 10% 1% 10%':columna.style.padding = '1% 0% 1% 0%';
        ieCheck?columna.style.textAlign = 'right':columna.style.textAlign = 'center';
        nodo = '';
        for (var i = 0; i < reg.length; i++) {
            nodo += '<table class="elementoHV" style="width: ' + (ieCheck?'100':'80') + '%; text-align: left;">' +
                        '<tr>' +
                            '<td colspan="2" class="elementoTitle"> » ' + reg[i].getElementsByTagName('nombre')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Objetivo: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('objetivo')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Organización: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('organizacion')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">País: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('pais')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Tipo: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('tipo')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Rol: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('rol')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<td style="width: ' + itemRow0 + ';">Período: </td>' +
                            '<td style="width: ' + itemRow1 + ';">' + reg[i].getElementsByTagName('periodo')[0].firstChild.nodeValue + '</td>' +
                        '</tr>' +
                    '</table>';
                    
        }
        columna.innerHTML = nodo;
    }
}

function imprimirHV() {
    var contenido = document.getElementById("impHojaVida");
    var tmp = window.open("AdminConvoca#", "Impresion", "status=1, scrollbars=1, menubar=1");
    //tmp.document.open();
    tmp.document.write('<head><title>Hoja de vida</title><link href="css/comunProye.css" rel="stylesheet" type="text/css"><link href="css/proyectos/convocatorias.css" rel="stylesheet" type="text/css"></head>');
    tmp.document.write(contenido.innerHTML);
    //tmp.document.title = nomImpDoc == null?'Imprimir Hoja de vida':nomImpDoc;
    tmp.window.focus();
    tmp.window.print();
    tmp.document.close();
}

function listaEstPart(){
    var Datos=new Array(6);
    Datos[0]="Inscrito=Inscrito" ;
    Datos[1]="Estudio=Estudio" ;
    Datos[2]="Entrevista=Entrevista" ;
    Datos[3]="Seleccionado=Seleccionado" ;
    Datos[4]="NoSeleccionado= NoSeleccionado" ;
    Datos[5]="Aplazado=Aplazado" ;
    return Datos;
}

function guardarAdmPart() {

    var url = "impHojaVida?" + getValores(['idpart','estpart','obsp'])
    //    respServlet = "cargarconvoca" ;
    conectarMethod(url, muestraResultado, 'GET');
    return false;

}