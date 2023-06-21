<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
                 javax.rmi.PortableRemoteObject, 
                 login.InicioProfRemoteBusiness, 
                 login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
response.setHeader("Cache-Control","no-cache");
String nombre = "";
String sel;
String func = "insertar";
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
Vector infsociedades = bdadm.getLissociedades();
if(idd != null){
    infovec = bdadm.getdespSociedad(idd);
    func = "actualizar";
}
%>
<html>
<head>
<title>Sociedades</title>
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
        <jsp:param name="titulo" value="Sociedades" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
  <tr class="textocom">
    <td height="22"> 
    <div align="center">
	  Sociedades<br>
	<form method="POST" action="GuardaEmpleado" name="form1">
        <table width="100%" border="0" class="textocom">
          <tr>
            <td width="30%"><b>Sociedad cient&iacute;fica</b></td>
            <td width="70%">
            <select name="zzcod_soc_cie" id="zzcod_soc_cie">
                  <%for ( int i = 0 ; i < infsociedades.size() ; i++ ){
                    Vector infoSociedades = (Vector)infsociedades.elementAt(i) ;
                    if(infovec.elementAt(1).equals(infoSociedades.elementAt(0))){%>
                        <option value="<%=infoSociedades.elementAt(0)%>" selected> <%=infoSociedades.elementAt(1)%></option>
                    <%}else{%>
                        <option value="<%=infoSociedades.elementAt(0)%>"> <%=infoSociedades.elementAt(1)%></option>
                  <%}}%>
                </select>            </td>
          </tr>
          <tr>
            <td><b>Fecha</b></td>
            <td>
              <input type="text" name="zzfecha" size="14" id="zzfecha" maxlength="10" onFocus="this.blur()" class="campotext" value="<%=infovec.elementAt(2)%>">
        <a href="javascript:show_calendar('form1.zzfecha'); document.form1.zzfecha.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha'); return true;" onMouseOut="window.status=''; nd();  return true;">
        <img src="img/calendar.gif" width=16 height=16 border=0></a></td>
          </tr>
          <tr>
            <td><b>Fec.fin</b></td>
            <td>
              <input type="text" name="zzfec_fin" size="14" id="zzfec_fin" maxlength="10" onFocus="this.blur()" class="campotext" value="<%=infovec.elementAt(4)%>">
        <a href="javascript:show_calendar('form1.zzfec_fin'); document.form1.zzfec_fin.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha'); return true;" onMouseOut="window.status=''; nd();  return true;">
        <img src="img/calendar.gif" width=16 height=16 border=0></a>                        </td>
          </tr>
          <tr>
            <td><b>Categor&iacute;a</b></td>
            <td>
              <input name="zzcat" type="text" id="zzcat" value="<%=infovec.elementAt(3)%>" size="50" maxlength="30">                        </td>
          </tr>
          <tr>
            <td><b>N&uacute;mero acta</b></td>
            <td>
              <input name="zznum_acta" type="text" id="zznum_acta" value="<%=infovec.elementAt(5)%>" size="50" maxlength="10">                        </td>
          </tr>
          <tr>
            <td><b>Otro</b></td>
            <td>
              <input name="zzotro" type="text" id="zzotro" value="<%=infovec.elementAt(6)%>" size="50" maxlength="30">                        </td>
          </tr>
        </table>
        <p align="center">
          <input name="idd" type="hidden" id="idd" value="<%=infovec.elementAt(0)%>">
          <input name="idusr" type="hidden" id="idusr" value="<%=empleado.getDocumProf()%>">
          <input name="tipidusr" type="hidden" id="tipidd" value="num_id">
          <input name="tabla" type="hidden" id="tabla" value="inscripciones"> 
          <input name="tipidd" type="hidden" id="tipidd" value="codigo"> 
          <input name="entidad" type="hidden" id="entidad" value="inscripciones"> 
          <input name="funcion" type="hidden" id="funcion" value="<%=func%>">
          <input name="reqsend" type="hidden" id="reqsend" value="Sociedades">
          <input type="submit" name="bi" value="Guardar">
          </p>
	    </form>
	</div></td>
  </tr>
  <tr>
    <td>
	<div align="right">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="Sociedades" />
	    </jsp:include>
      </div>
	</td>
  </tr>
</table>
  <div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
<p>&nbsp;</p></body>
</html>