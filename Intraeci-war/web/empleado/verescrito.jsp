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
Vector inftipescrito = bdadm.TipoCodigo("tipoEscrito");
if(idd != null){
    infovec = bdadm.getdespEscrito(idd);
    func = "actualizar";
}
%>
<html>
<head>
<title>Escritos</title>
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
        <jsp:param name="titulo" value="Escritos" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
  <tr class="textocom">
    <td height="22"> 
    <div align="center">
	  Escritos<br>
	<form method="POST" action="GuardaEmpleado" name="form1">
        <table width="100%" border="0" class="textocom">
          <tr>
            <td width="30%"><b>Tipo</b></td>
            <td width="70%">
            <select name="zztipo" id="zztipo">
    <%for ( int i = 0 ; i < inftipescrito.size() ; i++ ){
            Vector infoTipoEscrito = (Vector)inftipescrito.elementAt(i) ;
            if(infovec.elementAt(1).equals(infoTipoEscrito.elementAt(0))){%>
                <option value="<%=infoTipoEscrito.elementAt(0)%>" selected> <%=infoTipoEscrito.elementAt(1)%></option>
            <%}else{%>
                <option value="<%=infoTipoEscrito.elementAt(0)%>"> <%=infoTipoEscrito.elementAt(1)%></option>
          <%}}%>
              </select>           </td>
          </tr>
          <tr>
            <td><b>T&iacute;tulo *</b></td>
            <td>
              <input name="zztitulo" type="text" id="zztitulo" value="<%=infovec.elementAt(2)%>" size="50" maxlength="150">                        </td>
          </tr>
          <tr>
            <td><b>T&iacute;tulo mayor </b></td>
            <td>
              <input name="zztit_may" type="text" id="zztit_may" value="<%=infovec.elementAt(3)%>" size="50" maxlength="100">                        </td>
          </tr>
          <tr>
            <td><b>&Aacute;rea de conocimiento *</b></td>
            <td>
              <input name="zzare_con" type="text" id="zzare_con" value="<%=infovec.elementAt(4)%>" size="50" maxlength="30">                        </td>
          </tr>
          <tr>
            <td><b>Fecha</b></td>
            <td>
              <input type="text" name="zzfecha" size="14" id="zzfecha" maxlength="10" onFocus="this.blur()" class="campotext" value="<%=infovec.elementAt(5)%>">
        <a href="javascript:show_calendar('form1.zzfecha'); document.form1.zzfecha.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha'); return true;" onMouseOut="window.status=''; nd();  return true;">
        <img src="img/calendar.gif" width=16 height=16 border=0></a></td>
          </tr>
          <tr>
            <td><b>Edici&oacute;n *</b></td>
            <td>
              <input name="zzedicion" type="text" id="zzedicion" value="<%=infovec.elementAt(6)%>" size="50" maxlength="5">                        </td>
          </tr>
          <tr>
            <td><b>Editorial *</b></td>
            <td>
              <input name="zzeditorial" type="text" id="zzeditorial" value="<%=infovec.elementAt(7)%>" size="50" maxlength="60">                        </td>
          </tr>
          <tr>
            <td><b>Ciudad *</b></td>
            <td>
              <input name="zzciudad" type="text" id="zzciudad" value="<%=infovec.elementAt(8)%>" size="50" maxlength="30">                        </td>
          </tr>
          <tr>
            <td><b>Pa&iacute;s *</b></td>
            <td>
              <input name="zzpais" type="text" id="zzpais" value="<%=infovec.elementAt(9)%>" size="50" maxlength="30">                        </td>
          </tr>
        </table>
        <p align="center">
          <input name="idd" type="hidden" id="idd" value="<%=infovec.elementAt(0)%>">
          <input name="idusr" type="hidden" id="idusr" value="<%=empleado.getDocumProf()%>">
          <input name="tipidusr" type="hidden" id="tipidusr" value="num_id">
          <input name="tabla" type="hidden" id="tabla" value="escritos">
          <input name="tipidd" type="hidden" id="tipidd" value="codigo"> 
          <input name="entidad" type="hidden" id="entidad" value="escritos">
          <input name="funcion" type="hidden" id="funcion" value="<%=func%>">
          <input name="reqsend" type="hidden" id="reqsend" value="Escritos">
          <input type="submit" name="bi" value="Guardar">
          </p>
	    </form>
	</div></td>
  </tr>
  <tr>
    <td>
	<div align="right">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="Escritos" />
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
  frmvalidator.addValidation("zztitulo","req","Ingrese titulo");
  frmvalidator.addValidation("zzare_con","req","Ingrese area conocimiento");
  frmvalidator.addValidation("zzedicion","req","Ingrese edicion");
  frmvalidator.addValidation("zzeditorial","req","Ingrese editorial");
  frmvalidator.addValidation("zzciudad","req","Ingrese ciudad");
  frmvalidator.addValidation("zzpais","req","Ingrese pais");
</script>
</body>
</html>