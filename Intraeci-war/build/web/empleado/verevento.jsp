<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
                 javax.rmi.PortableRemoteObject, 
                 login.InicioProfRemoteBusiness, 
                 login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
response.setHeader("Cache-Control","no-cache");
String nombre = "";
String func = "insertar";
String sel;
if (empleado.getIdProf().equals(""))
    nombre = empleado.getNomemp();
else
    nombre = empleado.getNomProf();
String idd = request.getParameter("idd");
Vector infovec = new Vector(), tmp;
for(int ct = 0; ct<30; ct++){
    infovec.add("");
}
inicio.conectaEJB conEjb = new inicio.conectaEJB();
BDintraeci.BDadministrativoRemoteBusiness bdadm = conEjb.lookupBDadministrativoBean();
if(idd != null){
    infovec = bdadm.getdespDistincion(idd);
    func = "actualizar";
}
%>
<html>
<head>
<title>Eventos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
a:hover{color:#3366CC; }
a{color: blue;}
a:link, a:visited { text-decoration: none }
</style>
<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
<script language="JavaScript" src="jscript/calendario.js"></script>
<script language="JavaScript" src="jscript/overlib_mini.js"></script>
<script language="JavaScript" src="jscript/gen_validatorv31.js" type="text/javascript"></script>
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<body background="img/fondo.gif" onLoad="preloadImg()">
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
        <jsp:param name="doblenc" value="inicio" />
        <jsp:param name="titulo" value="Eventos" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
  <tr class="textocom">
    <td height="22"> 
    <div align="center">
	  Informaci&oacute;n de evento<br>
	<form method="POST" action="GuardaEmpleado" name="form1"> 
    <table width="100%" border="0" class="textocom">
      <tr>
        <td width="30%"><b>Nombre *</b></td>
        <td width="60%">
          <input name="zznombre" type="text" id="zznombre" value="<%=infovec.elementAt(1)%>" size="50" maxlength="70" class="campotext">
          </td>
      </tr>
      <tr>
        <td><b>Tipo *</b></td>
        <td>
          <input name="zztipo" type="text" id="zztipo" value="<%=infovec.elementAt(2)%>" size="50" maxlength="50" class="campotext">
          </td>
      </tr>
      <tr>
        <td><b>Ciudad *</b></td>
        <td>
          <input name="zzciu_eve" type="text" id="zzciu_eve" value="<%=infovec.elementAt(3)%>" size="50" maxlength="30" class="campotext">
          </td>
      </tr>
      <tr>
        <td><b>Pais *</b></td>
        <td>
          <input name="zzpai_eve" type="text" id="zzpai_eve" value="<%=infovec.elementAt(4)%>" size="50" maxlength="30" class="campotext">
          </td>
      </tr>
      <tr>
        <td><b>A&ntilde;o *</b></td>
        <td>
          <input name="zzfecha" type="text" id="zzfecha" value="<%=infovec.elementAt(5)%>" size="50" maxlength="6" class="campotext">
           </td>
      </tr>
      <tr>
        <td><b>Tipo documento</b></td>
        <td>
          <input name="zztip_doc" type="text" id="zztip_doc" value="<%=infovec.elementAt(6)%>" size="50" maxlength="30" class="campotext">
        </td>
      </tr>
      <tr>
        <td valign="top"><b>T&iacute;tulo ponencia</b></td>
        <td>
          <input name="zztit_pon" type="text" id="zztit_pon" value="<%=infovec.elementAt(7)%>" size="50" maxlength="80" class="campotext">
          </td>
      </tr>
    </table>
      <p align="center">
      <input name="idd" type="hidden" id="idd" value="<%=infovec.elementAt(0)%>">
      <input name="idusr" type="hidden" id="idusr" value="<%=empleado.getDocumProf()%>">
      <input name="tipidusr" type="hidden" id="tipidusr" value="num_id">
      <input name="tabla" type="hidden" id="tabla" value="eve_cies">
      <input name="tipidd" type="hidden" id="tipidd" value="codigo">
      <input name="entidad" type="hidden" id="entidad" value="eve_cies">
      <input name="funcion" type="hidden" id="funcion" value="<%=func%>">
      <input name="reqsend" type="hidden" id="reqsend" value="Eventos">
      <input type="submit" name="bi" value="Guardar">
      </p>
    </form>
	</div></td>
  </tr>
  <tr>
    <td>
	<div align="right">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="Eventos" />
	    </jsp:include>
      </div>
	</td>
  </tr>
</table>
  <div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
<p>&nbsp;</p>
<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
  var frmvalidator  = new Validator("form1");
  frmvalidator.EnableMsgsTogether();
  frmvalidator.addValidation("zznombre","req","Ingrese nombre");
  frmvalidator.addValidation("zztipo","req","Ingrese tipo");
  frmvalidator.addValidation("zzciu_eve","req","Ingrese ciudad");
  frmvalidator.addValidation("zzpai_eve","req", "Ingrese pais");
  frmvalidator.addValidation("zzfecha","req","Ingrese año");
  frmvalidator.addValidation("zzfecha","numeric", "Año: solo numeros");
</script>
</body>
</html>

