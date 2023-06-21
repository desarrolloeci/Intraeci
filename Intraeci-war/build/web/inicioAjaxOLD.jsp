<%@page contentType="text/html"%>
<%@ page session="false" %>
<%  
 response.setHeader("Cache-Control","no-cache"); 
   // String usuario = (String)session.getAttribute("sro");
	//String isp ;

    //if (usuario != null && !usuario.equals("")) {
	//	isp = new String((String)session.getAttribute("isp"));
String nMsg = (String)request.getParameter("msg") ;
String mensaje = new String("") ;

if ( nMsg != null ) {
        if ( nMsg.equals("0") ){
            mensaje = "Falta alguno de los campos" ;
        }else if ( nMsg.equals("1") ){
            mensaje = "Usuario desconocido" ;
        }else if ( nMsg.equals("2") ){
            mensaje = "El usuario no se ha autenticado correctamente" ;
        }
        else if ( nMsg.equals("4") ){
            mensaje = "Sesion Cerrada" ;
        }else if ( nMsg.equals("5") ){
            mensaje = "Error del Servidor" ;
        }else if ( nMsg.equals("6") ){
            mensaje = "No ha iniciado Sesion" ;
        }else if ( nMsg.equals("7") ){
            mensaje = "<font color='#FF0000'>Ya existia una Sesion!</font> <i>Vuelva a autenticarse</i>" ;
        }else if(nMsg.equals("8")){
            HttpSession sesion = request.getSession();
            sesion.invalidate();
        }else if(nMsg.equals("9")){
            HttpSession sesion = request.getSession();
            sesion.invalidate();
            mensaje = "No se ha podido iniciar la sesión porque tiene bloqueadas las <br>ventanas " +
            "emergentes para este sitio, para continuar debe permitirlas para empleados.escuelaing.edu.co<br>" +
            "si no sabe como hacerlo haga <a href=\"html/manualintraeci.htm\">click AQUI</a>";
        }
    }
%>
<html>
<head>
<title>Inicio Intraeci</title>
<meta http-equiv="Content-Type" content="text/html;">
<!-- Fireworks MX Dreamweaver MX target.  Created Wed Aug 16 09:51:45 GMT-0500 (Hora est. del Pacífico de SA) 2006-->
<link href="css/comun.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="javascript">
<!--
            var verifwp;
            var pop;
            var mensaje;
            var http_request = false;
            function makeRequest(url) {
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
                    alert('Giving up :( Cannot create an XMLHTTP instance');
                    return false;
                }
                url = url + "usuario=" + document.getElementById("usuario").value + "&clave=" + document.getElementById("clave").value;
                //alert(url);
                http_request.onreadystatechange = alertContents;
                http_request.open('POST', url, true);
                http_request.send(null);

            }

            function alertContents() {

                if (http_request.readyState == 4) {
                    if (http_request.status == 200) {
                        var xmldoc = http_request.responseXML;
                        var root_node = xmldoc.getElementsByTagName('root').item(0);
                        if(root_node.firstChild.data != "OK"){
                            document.getElementById("msj").style.visibility='visible';
                            document.getElementById("msj").innerText = root_node.firstChild.data;
                            document.getElementById("msj").textContent = root_node.firstChild.data;
                            document.getElementById("tabla").style.visibility='visible';
                            document.getElementById("tabla2").style.visibility='visible';
                            document.getElementById("tabla3").style.visibility='visible';
                            document.getElementById("ppag").style.visibility='visible';
                            document.getElementById("cargando").style.visibility='hidden';
                        }    
                        else{
                            verifwp=window.open("Menu","servicioprofesores","toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=no,resizable=yes");
                            //setTimeout("resultado()",2000);
                            resultado();
                            if(mensaje=="No existe bloqueador")
                                window.location = "cerrar";
                            else
                                window.location = "inicio?msg=9";
                        }
                    } else {
                        alert('There was a problem with the request.' + http_request.status);
                    }
                }else{
                    document.getElementById("tabla").style.visibility='hidden';
                    document.getElementById("tabla2").style.visibility='hidden';
                    document.getElementById("tabla3").style.visibility='hidden';
                    document.getElementById("ppag").style.visibility='hidden';
                    document.getElementById("cargando").style.visibility='visible';
                    document.getElementById("msj").style.visibility='hidden';
                }

            }
            
            function prueba(){
                var dato = navigator.appName;
                alert(dato);
            }
            
            function resultado(){
                pop=(verifwp==null);
                mensaje=(pop)?"Existe bloqueador":"No existe bloqueador";
            }
 -->
        </script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function ventanaSecundaria (URL){ 
   //window.open(URL,"ventana1","width=800,height=600,scrollbars=yes") 
} 
//-->
</script>
</head>
<style type="text/css">
a{color: blue;}
a:hover{color:#3366CC; }
</style>
<body bgcolor="#ffffff" onload="ventanaSecundaria('http://www.escuelaing.edu.co/servicios/estudiantes/aiesec/pop_up_aiesec.htm')">
<div id="Layer1" style="position:absolute; left:5px; top:5px; width:115px; height:42px; z-index:1">
  <p>
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="100" height="20" class="visibleflash" id="cargando">
        <param name="movie" value="flash/cargando.swf">
        <param name="quality" value="high">
        <embed src="flash/cargando.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="100" height="20"></embed>
    </object>
</p>
</div>
<p>&nbsp;</p>
<table width="640" border="0" align="center" cellpadding="0" cellspacing="0" id="tabla">
  <!-- fwtable fwsrc="encabezado.png" fwbase="encabezadohtm.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
  <tr>
    <td><img src="img/spacer.gif" width="163" height="1" border="0" alt=""></td>
    <td><img src="img/spacer.gif" width="20" height="1" border="0" alt=""></td>
    <td><img src="img/spacer.gif" width="216" height="1" border="0" alt=""></td>
    <td><img src="img/spacer.gif" width="241" height="1" border="0" alt=""></td>
    <td><img src="img/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>
  <tr>
    <td><img name="encabezadohtm_r1_c1" src="img/encabezadohtm_r1_c1.gif" width="163" height="70" border="0" alt=""></td>
    <td><img name="encabezadohtm_r1_c2" src="img/encabezadohtm_r1_c2.gif" width="20" height="70" border="0" alt=""></td>
    <td><img name="encabezadohtm_r1_c3" src="img/encabezadohtm_r1_c3.gif" width="216" height="70" border="0" alt=""></td>
    <td><img name="encabezadohtm_r1_c4" src="img/encabezadohtm_r1_c4.gif" width="241" height="70" border="0" alt=""></td>
    <td><img src="spacer.gif" width="1" height="70" border="0" alt=""></td>
  </tr>
</table>
<P align="center" class="textocom"><font size=2><b><label id="msj"><%=mensaje%></label></b></font> 
<table width="600" border="0" align="center" id="tabla2">
  <tr>
    <td>
		
      <div align="center"></div>
    <fieldset><legend><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><font color="#666666">Bienvenido al Sistema</font></strong></font></legend>
  <table align=center border=0 bordercolor=white cellpadding=0 cellspacing=2 width=200>
    <tr> 
      <td align=left height="20" width="100" > 
      <div align="center" id="usr"><font color="#990000"><strong><font face="Arial" size="2">Usuario</font></strong></font></div></td>
      <td align=left height="20" width="100"> 
        <div align="left">
          <input name="usuario" id="usuario" maxlength="20" class="texto" size="12">
        </div>
      </td>
    </tr>
    <tr> 
      <td align=left height="20" width="100"> 
        <div align="center" id="psw"><font color="#990000"><strong><font face="Arial" size="2">Clave</font> 
      </strong></font></div></td>
      <td align=left height="20" width="100"> 
        <div align="left">
          <input name="clave" type="password" id="clave" maxlength="25" class="texto" size="12">
        </div>
      </td>
    </tr>
    <tr> 
      <td width="100" height="20" align=left valign="top"> 
        <div align="right">
          <input name="navegador" type="hidden" id="navegador" value="">
          <input id="aceptar" name="Aceptar" type="submit" value="Aceptar" title="Aceptar" tabindex="Yes"  class="boton"  onclick="makeRequest('LoginAjax?')"><font color="#FFFFFF">I</font></div>
      </td>
      <td width="100" height="20" align=left valign="top"> 
        <div align="left"> <font color="#FFFFFF">I</font>
			<input id="limpiar" name="Limpiar" type="reset" value="Limpiar" title="Limpiar"  class="boton">
        </div>
      </td>
    </tr>
  </table>
  <p align="center">
    
  </p>
    </fieldset>

	</td>
  </tr>
</table>
<table width="640" border="0" align="center"  id="tabla3">
  <tr>
    <td><img src="img/barrahor.gif" width="640" height="5"></td>
  </tr>
</table>
<div align="center" id="ppag"><font face="Arial, Helvetica, sans-serif" size="1" color="#990000"><b>AK
      45 No. 205-59 (km. 13 autopista Norte) / PBX: +57(1) 6683600 / Call center:
      
  +57(1) 6683622 / A.A. 14520<br>
  Bogot&aacute;, D.C. , Colombia</b></font><br>
</div>
</body>
</html>