
var http_request = false;
var respServlet='';


function conectarX(url,funcion){
    // Obtener la instancia del objeto XMLHttpRequest
    http_request = false;
    if (window.XMLHttpRequest) { // Mozilla, Safari,...
        http_request = new XMLHttpRequest();
        if (http_request.overrideMimeType) {
            http_request.overrideMimeType('text/xml');
        }
    } else if (window.ActiveXObject) { // IE
        try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
        }
    }
    if (!http_request) {
        alert('No se Instanciado el Objeto XMLHttpRequest');
        return false;
    }

    //Preparar funcion de respuesta
    http_request.onreadystatechange = funcion;

    //Enviar Peticion
    http_request.open('POST', url, false);
    http_request.send(null);
    return false;
}

function conectarMethod(url, funcion, met){
    // Obtener la instancia del objeto XMLHttpRequest
    http_request = false;
    if (window.XMLHttpRequest) { // Mozilla, Safari,...
        http_request = new XMLHttpRequest();
        if (http_request.overrideMimeType) {
            http_request.overrideMimeType('text/xml');
        }
    } else if (window.ActiveXObject) { // IE
        try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
        }
    }
    if (!http_request) {
        alert('No se Instanciado el Objeto XMLHttpRequest');
        return false;
    }
    
    //Preparar funcion de respuesta
    http_request.onreadystatechange = funcion;

    //Enviar Peticion
    http_request.open(met, url, true);
    http_request.send(null);
    return false;
}

function conectarSendParam(url, met, param, paramData){
    var paramRequest;
    // Obtener la instancia del objeto XMLHttpRequest
    http_request = false;
    if (window.XMLHttpRequest) {// IE7+, Firefox, Chrome, Opera, Safari
        http_request = new XMLHttpRequest();
    } else {// IE6, IE5
        try { http_request = new ActiveXObject('Microsoft.XMLHTTP');
        } catch (err) { try { http_request = new ActiveXObject('Msxml2.XMLHTTP');
            } catch (err) {
                alert('No se Instanciado el Objeto XMLHttpRequest');
                return false;
            }
        }
    }
    http_request.onreadystatechange=function() {
        if (http_request.readyState==4 && http_request.status==200) {
            var respTemp = http_request.responseText.toString();
            if (respTemp != '') {
                alert(respTemp);
                window.close();
                return false;
            }
            window.open('exportExcel','_blank','top=5,left=5,height=200,width=500,status=0,toolbar=0,location=0,menubar=0,scrollbars=0');
        }
    }
    
    
    paramRequest = param + '=' + paramData;
    //Enviar Peticion
    http_request.open(met, url, true);
    http_request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    http_request.send(paramRequest);
    return false;
}

function muestraResultado() {
    if(http_request.readyState == 4) {
        if(http_request.status == 200) {
            var xmldoc = http_request.responseXML;
            var respuesta=xmldoc.getElementsByTagName("resultado")[0];
            var resul=respuesta.getElementsByTagName("valor")[0].firstChild.nodeValue;
            alert(resul);
            if(respuesta.getElementsByTagName("dato")[0]!=null){//if(resul=="Operación Exitosa"){
                eval(respServlet+"("+respuesta.getElementsByTagName("dato")[0].firstChild.nodeValue+");");                
            }
        }
    }
}

function muestraResultadoSP() {
    if(http_request.readyState == 4) {
        if(http_request.status == 200) {
            var xmldoc = http_request.responseXML;
            var respuesta=xmldoc.getElementsByTagName("resultado")[0];
            var resul=respuesta.getElementsByTagName("valor")[0].firstChild.nodeValue;
            alert(resul);
            if(resul=='Operación Exitosa'){
                eval(respServlet+";");
            }
        }
    }
}

function opcionesModal(idCampoExt, idCampoInt, Datos, respLink){
    if (!respLink) return false;
    
    var campoInt=document.getElementById(idCampoInt);
    var campoExt=document.getElementById(idCampoExt);
    
    Datos[Datos.length] = campoInt.value + " -> " + campoExt.value;
    var largo = 30 + (25*Datos.length);
    
    if (window.addEventListener) {
        var myWindow = window.open("html/Proyectos/Estados.html", "_blank", "width=200px, height=" + largo + "px,left=" + window.height/2 + "px, top=" + window.width/2 + "px");
        myWindow.dialogArguments = Datos;
        myWindow.addEventListener('closeOptModal', function() { 
            Datos = myWindow.returnValue;
            if (Datos[2] == "Ok") {
                campoInt.value=Datos[0];
                campoExt.value=Datos[1];
            }
        });
        return false;
    }
    
    window.showModalDialog("html/Proyectos/Estados.html",Datos,"dialogHeight:"+largo+"px;dialogWidth:200px;dialogLeft"+window.height/2+"px;dialogTop:"+window.width/2+"px");

    if (Datos[2] == "Ok") {
        campoInt.value=Datos[0];
        campoExt.value=Datos[1];
    }
    
    return false;
}

function empleadosModal(idEmpleadoExt, idEmpleadoInt, idCCExt, idCCInt, respLink) {
    if (!respLink) return false;
    
    var Datos=[];
    
    if (window.addEventListener) {
        var myWindow = window.open("listEmpleados", "_blank", "width=635px, height=400px,left=" + window.height/2 + "px, top=" + window.width/2 + "px");
        myWindow.dialogArguments = Datos;
        myWindow.addEventListener('closeEmpModal', function() { 
            Datos = myWindow.returnValue;
            if (Datos.length == 4) {
                document.getElementById(idEmpleadoExt).value=Datos[0];
                document.getElementById(idEmpleadoInt).value=Datos[1];
                if (idCCExt != "0") {
                    document.getElementById(idCCExt).value=Datos[2];
                    document.getElementById(idCCInt).value=Datos[3];
                }
            }
        });
        return false;
    } else {
        window.showModalDialog("listEmpleados",Datos,"dialogHeight:400px;dialogWidth:635px;dialogLeft"+window.height/2+"px;dialogTop:"+window.width/2+"px");
    }

    if (Datos.length == 4) {
        document.getElementById(idEmpleadoExt).value=Datos[0];
        document.getElementById(idEmpleadoInt).value=Datos[1];
        if (idCCExt != "0") {
            document.getElementById(idCCExt).value=Datos[2];
            document.getElementById(idCCInt).value=Datos[3];
        }
    }
}

function centroCostosModal(idCCExt,idCCInt,respLink){
    if(respLink){
        var Datos=[];
        window.showModalDialog("listCentroCostos",Datos,"dialogHeight:400px;dialogWidth:635px;dialogLeft"+window.height/2+"px;dialogTop:"+window.width/2+"px");
        if(Datos.length==2)
        {
            document.getElementById(idCCExt).value=Datos[0];
            document.getElementById(idCCInt).value=Datos[1];
        }
    }
    return false;
}

function consultasModal(idExt,idInt,respLink,opcion){
    if(respLink){
        var Datos=[];
        Datos[0] = opcion ;

        window.showModalDialog('getLista',Datos,"dialogHeight:400px;dialogWidth:635px;dialogLeft"+window.height/2+"px;dialogTop:"+window.width/2+"px");
        if(Datos.length==2) {
            document.getElementById(idExt).value=Datos[0];
            document.getElementById(idInt).value=Datos[1];
        }
    }
    return false;
}

function comentarioModal(){
    var Datos=[];
    window.showModalDialog('Comentario',Datos,"dialogHeight:400px;dialogWidth:635px;dialogLeft"+window.height/2+"px;dialogTop:"+window.width/2+"px");
    return false;
}

function inputToText(Datos){
    var datos=new Array(),j=0;
    for(var i=0;i<Datos.length;i++){
        var textInput =Datos[i].split("=");
        document.getElementById(textInput[0]).innerHTML=document.getElementById(textInput[1]).value;
        datos[j]=textInput[1]+'=none';
        datos[j+1]=textInput[0]+'=inline';
        j=j+2;
    }
    setVisibilidad(datos);    
}

function textToInput(Datos){
    var datos=new Array(),j=0;
    for(var i=0;i<Datos.length;i++){
        var inputText =Datos[i].split("=");
        document.getElementById(inputText[0]).value=document.getElementById(inputText[1]).innerHTML;        
        datos[j]=inputText[1]+'=none';
        datos[j+1]=inputText[0]+'=inline';
        j=j+2;
    }
    setVisibilidad(datos);
}

function setValorInput(Datos){
    for(var i=0;i<Datos.length;i++){
        var idXValor =Datos[i].split("=");        
        document.getElementById(idXValor[0]).value=idXValor[1];
    }
}

function setCamposResXML(resXML, idCampos, nomEtiqueta){
    for(var i=0;i<idCampos.length;i++){
        document.getElementById(idCampos[i]).value=resXML.getElementsByTagName(nomEtiqueta[i])[0].firstChild.nodeValue;
    }
}

function setValorText(Datos){
    for(var i=0;i<Datos.length;i++){
        var idXValor =Datos[i].split("=");
        document.getElementById(idXValor[0]).innerHTML=document.getElementById(idXValor[1]).value;
    }
}

function setEditar(Datos){
    for(var i=0;i<Datos.length;i++){
        var idXValor =Datos[i].split("=");        
        document.getElementById(idXValor[0]).disabled=Boolean(idXValor[1]);
    }
}

function setReadOnly(Datos){
    for(var i=0;i<Datos.length;i++){
        var idXValor =Datos[i].split("=");
        document.getElementById(idXValor[0]).readOnly=Boolean(idXValor[1]);
    }
}

function setVisibilidad(Datos){
    for(var i=0;i<Datos.length;i++){
        var idXValor =Datos[i].split("=");
        document.getElementById(idXValor[0]).style.display=idXValor[1];
    }
}

function isDiligenciado(Campos,Mensajes){
    var respuesta="Campos obligatorios: \n";
    for(var i=0;i<Campos.length;i++){        
        if(document.getElementById(Campos[i]).value==""){
            respuesta=respuesta+"   - "+Mensajes[i]+"\n";
        }
    }
    if(respuesta.length==22){
        return true
    }else{
        alert(respuesta);
        return false
    }
}

function isNumero(Campos,Mensajes){
    var respuesta="Campos numéricos: \n", num;
    for(var i=0;i<Campos.length;i++){
        num=document.getElementById(Campos[i]).value.replace(/[,']/g, "");
        if(isNaN(num)){
            respuesta=respuesta+"   - "+Mensajes[i]+"\n";
        }
    }
    if(respuesta.length==19){
        return true
    }else{
        alert(respuesta);
        return false
    }
}

function getValores(Datos){
    var resul=Datos[0]+"="+document.getElementById(Datos[0]).value,val;
    for(var i=1;i<Datos.length;i++){
        val=document.getElementById(Datos[i]).value;
        if(!isNaN(val.replace(/[,']/g, ""))){
            val=val.replace(/[,']/g, "");
        }
        resul=resul+"&"+Datos[i]+"="+val;
    }
    resul=resul.replace(/[%]/g, "_");
    resul=resul.replace(/[\n]/g, "'<mas>char(10)<mas>'");
    return resul;
}

function validaFecha(valor){
    var dias=[31,28,31,30,31,30,31,31,30,31,30,31];
    var patron=/^([1-9]|([0][1-9])|([1-2][0-9])|([3][0-1]))[/]([1-9]|([0][1-9])|([1][0-2]))[/](\d{4})$/;
    //var patron=/^((\d{1,2}\/){2}\d{4})$/;
    if(!(valor.search(patron)==-1)){
        var dma=valor.split("/");
        if(parseInt(dma[0])>dias[parseInt(dma[1])-1]){
            alert("Fecha incorrecta (dd/mm/aaaa)");
            return false;
        }else if(parseInt(dma[1])>12){
            alert("Fecha incorrecta (dd/mm/aaaa)");
            return false;
        }
        return true;
    }else{
        alert("Fecha incorrecta (dd/mm/aaaa)");
        return false;
    }
}

function difFecha(fechaMenor,fechaMayor){
    var dmaMenor=fechaMenor.split("/");
    var dmaMayor=fechaMayor.split("/");
    if(parseInt(dmaMenor[2],10)<=parseInt(dmaMayor[2],10)){
        if(parseInt(dmaMenor[2],10)==parseInt(dmaMayor[2],10)){
            if(parseInt(dmaMenor[1],10)<=parseInt(dmaMayor[1],10)){
                if(parseInt(dmaMenor[1],10)==parseInt(dmaMayor[1],10)){
                    if(parseInt(dmaMenor[0],10)<=parseInt(dmaMayor[0],10)){
                        return true;
                    }
                }else{
                    return true;
                }
            }
        }else{
            return true;
        }
    }
    alert("Diferencia de fechas incorrecta.");
    return false;
}

function difEnMeses(fechaMenor,fechaMayor){
    var dmaMenor=fechaMenor.split("/");
    var dmaMayor=fechaMayor.split("/");
    return ((parseInt(dmaMayor[2],10)-parseInt(dmaMenor[2],10))*12)+parseInt(dmaMayor[1],10)-parseInt(dmaMenor[1],10);
}

function devuelveValorxSigla(sigla,opciones){
    var valorSigla;
    for(var i=0;i<opciones.length;i++){
        valorSigla=opciones[i].split("=");
        if(valorSigla[1]==sigla)return valorSigla[0];
    }
    return '_';
}

function defineColorXEdicion(){
    var tipos=['input','textarea'];
    var entradas;
    var entrada;
    for(var i=0;i<tipos.length;i++){
        entradas=document.getElementsByTagName(tipos[i]);
        for(var j=0;j<entradas.length;j++){
            entrada=entradas[j];
            if(entrada.type=='text' || entrada.type=='textarea'){
                if(entrada.readOnly){
                    entrada.style.background='#DDDDDD';
                }else{
                    entrada.style.background='#FFFFFF';
                }
            }
        }
    }
}