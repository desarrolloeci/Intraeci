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
<title>Distinciones</title>
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
        <jsp:param name="titulo" value="Distinciones" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
  <tr class="textocom">
    <td height="22"> 
    <div align="center">
	  Informaci&oacute;n de distinci&oacute;n<br>
	<form method="POST" action="GuardaEmpleado" name="form1"> 
    <table width="100%" border="0" class="textocom">
      <tr>
        <td width="30%"><b>Nombre * </b></td>
        <td width="60%">
          <input name="zznombre" type="text" id="zznombre" value="<%=infovec.elementAt(1)%>" size="50" maxlength="100" class="campotext">
          </td>
      </tr>
      <tr>
        <td><b>Instituci&oacute;n * </b></td>
        <td>
          <input name="zzins_pre" type="text" id="zzins_pre" value="<%=infovec.elementAt(2)%>" size="50" maxlength="100" class="campotext">
          </td>
      </tr>
      <tr>
        <td><b>A&ntilde;o * </b></td>
        <td>
          <input name="zzaño" type="text" id="zzaño" value="<%=infovec.elementAt(3)%>" size="50" maxlength="4" class="campotext">
          </td>
      </tr>
      <tr>
        <td><b>Pais *</b></td>
        <td>
          <input name="zzpais" type="text" id="zzpais" value="<%=infovec.elementAt(4)%>" size="50" maxlength="50" class="campotext">
          </td>
      </tr>
      <tr>
        <td><b>Observaciones</b></td>
        <td>
          <input name="zzobs" type="text" id="zzobs" value="<%=infovec.elementAt(5)%>" size="50" maxlength="100" class="campotext">
           </td>
      </tr>
      <tr>
        <td><b>Obr.Pre.</b></td>
        <td>
          <input name="zzobr_pre" type="text" id="zzobr_pre" value="<%=infovec.elementAt(6)%>" size="50" maxlength="50" class="campotext">
        </td>
      </tr>
      <tr>
        <td valign="top"><b>Descripci&oacute;n</b></td>
        <td>
          <input name="zzdes" type="text" id="zzdes" value="<%=infovec.elementAt(7)%>" size="50" maxlength="100" class="campotext">
          </td>
      </tr>
    </table>
      <p align="center">
      <input name="idd" type="hidden" id="idd" value="<%=infovec.elementAt(0)%>">
      <input name="idusr" type="hidden" id="idusr" value="<%=empleado.getDocumProf()%>">
      <input name="tipidusr" type="hidden" id="tipidd" value="num_id">
      <input name="tabla" type="hidden" id="tabla" value="distinciones">
      <input name="tipidd" type="hidden" id="tipidd" value="codigo">
      <input name="entidad" type="hidden" id="entidad" value="distinciones">
      <input name="funcion" type="hidden" id="funcion" value="<%=func%>">
      <input name="reqsend" type="hidden" id="reqsend" value="Distinciones">
      <input type="submit" name="bi" value="Guardar">
      </p>
    </form>
	</div></td>
  </tr>
  <tr>
    <td>
	<div align="right">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="Distinciones" />
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
  frmvalidator.addValidation("zzins_pre","req","Ingrese institución");
  frmvalidator.addValidation("zzaño","req","Ingrese año");
  frmvalidator.addValidation("zzaño","numeric", "Año: solo números");
  frmvalidator.addValidation("zzpais","req","Ingrese país");
</script>
</body>
</html>

