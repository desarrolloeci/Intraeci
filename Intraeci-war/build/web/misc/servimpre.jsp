<%@ include file="../secure.jsp" %>
<%@ page import="javax.naming.*, 
                 javax.rmi.PortableRemoteObject, 
                 login.InicioProfRemoteBusiness, 
                 login.InicioProfRemoteHome,
                 java.text.*,
                 java.util.*"%>

<%
    HttpSession sesion;
    response.setHeader("Cache-Control","no-cache"); 
    login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness)session.getAttribute("empleado");
    empleado.setPath("correo");
    String loginex = session.getAttribute("loginex").toString();
    eci.BackupAdmin lista = new eci.BackupAdmin(loginex, empleado.getPath());
%>
<html> 
<head>
<title>Servicio de Impresión</title> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"> 
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head> 
<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
<!--
    function validar(){
	if(document.getElementById("tipo").value == "inst")
		document.getElementById("codigo").style.visibility='visible';
	else
		document.getElementById("codigo").style.visibility='hidden';	
    }
    
    function ocultar(){
        if(document.getElementById("tipo").value == "inst")
            document.getElementById("codigo").style.visibility='visible';
        else    
            document.getElementById("codigo").style.visibility='hidden';
    }
-->
</script>
<body background="img/fondo.gif" onLoad="preloadImg();ocultar();MM_preloadImages('img/atachmenta.gif')">
<p class="textocom">&nbsp;</p>
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
	<jsp:param name="doblenc" value="inicio" />
        <jsp:param name="titulo" value="Servicio de Impresión" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
  <tr class="textocom">
    <td height="22"> 
    <div align="center"> 
	<form name="form1" method="post" action="enviarCorreoImpresion">
        <table width="550" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom"> 
              <tr> 
                <td width="20%" valign="top">
                    <div align="right"><strong>De:&nbsp;&nbsp;&nbsp;</strong></div> 
                </td>
                <td colspan="2" valign="top">&nbsp;&nbsp;<%=empleado.getUsrname()%>@escuelaing.edu.co</td>
              </tr>
              <tr>
                <td width="20%" valign="top"><div align="right"><strong>Asunto:&nbsp;&nbsp;&nbsp;</strong></div></td>
                <td colspan="2" valign="top">&nbsp;&nbsp;Servicio de Impresión: <%=empleado.getNomemp()%></td>
              </tr>
              <tr>
                <td valign="top"><div align="right"><strong>Texto:&nbsp;&nbsp;&nbsp;
                </strong></div></td>
                <td colspan="2" valign="top"><textarea name="texto" cols="50" rows="5" class="campotext" id="texto"></textarea></td>
              </tr>
              <tr valign="middle">
                <td height="50" colspan="3"><div align="center"><a href="Backup?on=n&spath=correo&anterior=ServicioImpresion" onMouseOver="MM_swapImage('ImageAta','','img/atachmenta.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="img/atachment.gif" name="ImageAta" width="100" height="25" border="0" id="ImageAta"></a></div></td>
              </tr>
              <tr>
                <td height="30" valign="top"><div align="right"><strong>Archivos&nbsp;&nbsp;&nbsp;<br>Adjuntos:&nbsp;&nbsp;&nbsp;</strong></div></td>
                <td height="30" colspan="2" valign="top">
                &nbsp;
<%
      for (int i=0 ; i < lista.nArchivos() ; i++ ){
%>
            &nbsp;<%=lista.nomArchivo(i)%> - <%=lista.tamarch(i)%> Kb<br>      <%
      }
%>
                </td>
              </tr>
              <tr>
                <td height="30" valign="top"><div align="right"><strong>No. P&aacute;ginas:&nbsp;&nbsp;&nbsp;</strong></div></td>
                <td colspan="2" valign="top"><input name="numpag" type="text" size="6" maxlength="5" class="campotext" id="numpag"></td>
              </tr>
              <tr>
                <td height="30" valign="top"><div align="right"><strong>No. Copias:&nbsp;&nbsp;&nbsp;</strong></div></td>
                <td colspan="2" valign="top"><input name="numcopias" type="text" size="6" maxlength="5" class="campotext" id="numcopias"></td>
              </tr>
              <tr>
                <td width="20%" height="30" valign="top"><div align="right"><strong>Tipo:&nbsp;&nbsp;&nbsp;</strong></div></td>
                <td width="20%" valign="top">
                    <select name="tipo" class="campotext" id="tipo" onChange="javascript: validar()">
                    <option value="personal" selected>Personal</option>
                    <option value="inst">Institucional</option>
                </select></td>
                <td width="60%" valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" id="codigo" class="textocom">
                  <tr>
                    <td width="30%"><div align="right"><strong>Codigo:&nbsp;&nbsp;&nbsp;</strong></div></td>
                    <td width="70%"><input name="codimpre" type="text" size="6" maxlength="6" class="campotext" id="codimpre"></td>
                  </tr>
                </table></td>
              </tr>
              <tr align="center" valign="middle">
                <td colspan="3" valign="middle"><div align="center">
                    <p>
					<input name="userimpre" type="hidden" id="userimpre" value="<%=empleado.getUsrname()%>">
					<input name="bi" type="submit" class="boton" id="bi" value="Enviar Correo" onClick="javascript: return validar();">
                      </p>
                </div></td>
              </tr>
        </table> 
		</form>
      </div>
    </td>
  </tr>
  <tr class="textocom">
    <td height="22">
	<div align="right">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="Menu" />
	    </jsp:include>
      </div>
	</td>
  </tr>
</table>
</body> 
</html> 