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
    infovec = bdadm.getdespIdioma(idd);
    func = "actualizar";
}
Vector infidiomas = bdadm.getConsultaIdiomas();
Vector infconidiomas = bdadm.TipoCodigo("conIdioma");
%>
<html>
<head>
<title>Idiomas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
a:hover{color:#3366CC; }
a{color: blue;}
a:link, a:visited { text-decoration: none }
</style>
<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
<script language="JavaScript" src="jscript/calendario.js"></script>
<script language="JavaScript" src="jscript/overlib_mini.js"></script>
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
	  Informaci&oacute;n de Idioma<br>
	<form method="POST" action="GuardaEmpleado" name="form1"> 
    <table width="100%" border="0" class="textocom">
      <tr>
        <td width="30%"><b>Nombre</b></td>
        <td width="60%">
          <select name="zzcodigo" class="campotext">
			<%for ( int i = 0 ; i < infidiomas.size() ; i++ ){
            Vector infoIdiomas = (Vector)infidiomas.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(1).equals(infoIdiomas.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoIdiomas.elementAt(0)%>" <%=sel%>> <%=infoIdiomas.elementAt(1)%></option>
            <%}%>
          </select></td>
      </tr>
      <tr>
        <td><b>Lee</b></td>
        <td>
          <select name="zzlee" class="campotext">
			<%for ( int i = 0 ; i < infconidiomas.size() ; i++ ){
            Vector infoConIdiomas = (Vector)infconidiomas.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(3).equals(infoConIdiomas.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoConIdiomas.elementAt(0)%>" <%=sel%>>
            <%=infoConIdiomas.elementAt(1)%></option>
            <%}%>
          </select></td>
      </tr>
      <tr>
        <td><b>Escribe</b></td>
        <td>
          <select name="zzesc" class="campotext">
			<%for ( int i = 0 ; i < infconidiomas.size() ; i++ ){
            Vector infoConIdiomas = (Vector)infconidiomas.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(4).equals(infoConIdiomas.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoConIdiomas.elementAt(0)%>" <%=sel%>>
            <%=infoConIdiomas.elementAt(1)%></option>
            <%}%>
          </select></td>
      </tr>
      <tr>
        <td><b>Habla</b></td>
        <td>
          <select name="zzhab" class="campotext">
			<%for ( int i = 0 ; i < infconidiomas.size() ; i++ ){
            Vector infoConIdiomas = (Vector)infconidiomas.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(5).equals(infoConIdiomas.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoConIdiomas.elementAt(0)%>" <%=sel%>>
            <%=infoConIdiomas.elementAt(1)%></option>
            <%}%>
          </select></td>
      </tr>
    </table>
      <p align="center">
      <input name="idd" type="hidden" id="idd" value="<%=infovec.elementAt(0)%>">
      <input name="idusr" type="hidden" id="idusr" value="<%=empleado.getDocumProf()%>">
      <input name="tipidusr" type="hidden" id="tipidusr" value="num_id">
      <input name="tabla" type="hidden" id="tabla" value="idiomas">
      <input name="tipidd" type="hidden" id="tipidd" value="cod_sec">
      <input name="entidad" type="hidden" id="entidad" value="idiomas">
      <input name="funcion" type="hidden" id="funcion" value="<%=func%>">
      <input name="reqsend" type="hidden" id="reqsend" value="Idiomas">
      <input type="submit" name="bi" value="Guardar">
      </p>
    </form>
	</div></td>
  </tr>
  <tr>
    <td>
	<div align="right">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="Idiomas" />
	    </jsp:include>
      </div>
	</td>
  </tr>
</table>
  <div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
<p>&nbsp;</p></body>
</html>

