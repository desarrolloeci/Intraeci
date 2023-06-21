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
Vector inftipproinv = bdadm.TipoCodigo("tipoProInv");
if(idd != null){
    infovec = bdadm.getdespInvestigacion(idd);
    func = "actualizar";
}
%>
<html>
<head>
<title>Investigaciones</title>
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
        <jsp:param name="titulo" value="Investigaciones" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
  <tr class="textocom">
    <td height="22"> 
    <div align="center">
	  Investigaci&oacute;n<br>
	<form method="POST" action="GuardaEmpleado" name="form1">
        <table width="100%" border="0" class="textocom">
          <tr> 
              <td valign="top"><b>Descripci&oacute;n *</b></td>
              <td> 
                <textarea name="zzdes" cols="30" rows="6" id="zzdes"><%=infovec.elementAt(1)%></textarea>
              </td>
            </tr>
            <tr> 
              <td><b>T&iacute;tulo *</b></td>
              <td> 
                <input name="zztitulo" type="text" id="zztitulo" value="<%=infovec.elementAt(2)%>" size="50" maxlength="200">
              </td>
            </tr>
            <tr>
              <td><b> Dependencia *</b></td>
              <td> 
                <input name="zzdep" type="text" id="zzdep" value="<%=infovec.elementAt(3)%>" size="50" maxlength="20">
              </td>
            </tr>
          <tr>
            <td width="30%"><b>Fecha inicio</b></td>
            <td width="70%">
              <input type="text" name="zzfec_ini" size="14" id="zzfec_ini" maxlength="10" onFocus="this.blur()" class="campotext" value="<%=infovec.elementAt(4)%>">
        <a href="javascript:show_calendar('form1.zzfec_ini'); document.form1.zzfec_ini.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha'); return true;" onMouseOut="window.status=''; nd();  return true;">
        <img src="img/calendar.gif" width=16 height=16 border=0></a></td>
          </tr>
          <tr>
            <td><b>Fecha fin</b></td>
            <td>
              <input type="text" name="zzfec_fin" size="14" id="zzfec_fin" maxlength="10" onFocus="this.blur()" class="campotext" value="<%=infovec.elementAt(5)%>">
        <a href="javascript:show_calendar('form1.zzfec_fin'); document.form1.zzfec_fin.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha'); return true;" onMouseOut="window.status=''; nd();  return true;">
        <img src="img/calendar.gif" width=16 height=16 border=0></a>                        </td>
          </tr>
          <tr>
            <td><b>&Aacute;rea de conocimiento *</b></td>
            <td>
              <input name="zzcam_con" type="text" id="zzcam_con" value="<%=infovec.elementAt(6)%>" size="50" maxlength="30">                        </td>
          </tr>
          <tr>
            <td><b>Fuente de financiaci&oacute;n *</b></td>
            <td>
              <input name="zzfue_fin" type="text" id="zzfue_fin" value="<%=infovec.elementAt(7)%>" size="50" maxlength="200">                        </td>
          </tr>
          <tr>
            <td><b>Instituci&oacute;n *</b></td>
            <td>
              <input name="zzinstitucion" type="text" id="zzinstitucion" value="<%=infovec.elementAt(8)%>" size="50" maxlength="50">                        </td>
          </tr>
          <tr>
            <td><b>Valor</b></td>
            <td>
              <input name="zzvalor" type="text" id="zzvalor" value="<%=infovec.elementAt(9)%>" size="50" maxlength="20">                        </td>
          </tr>
          <tr>
            <td><b>Resultados</b></td>
            <td>
              <input name="zzres" type="text" id="zzres" value="<%=infovec.elementAt(10)%>" size="50" maxlength="250">                        </td>
          </tr>
          <tr>
            <td><b>Tipo</b></td>
            <td><select name="zztipo" id="zztipo">
              <%for ( int i = 0 ; i < inftipproinv.size() ; i++ ){
                Vector infoTipProInv = (Vector)inftipproinv.elementAt(i) ;
                if(infovec.elementAt(11).equals(infoTipProInv.elementAt(0))){%>
                    <option value="<%=infoTipProInv.elementAt(0)%>" selected> <%=infoTipProInv.elementAt(1)%></option>
                <%}else{%>
                    <option value="<%=infoTipProInv.elementAt(0)%>"> <%=infoTipProInv.elementAt(1)%></option>
              <%}}%>
                        </select> </td>
          </tr>
        </table>
        <p align="center">
          <input name="idd" type="hidden" id="idd" value="<%=infovec.elementAt(0)%>">
          <input name="idusr" type="hidden" id="idusr" value="<%=empleado.getDocumProf()%>">
          <input name="tipidusr" type="hidden" id="tipidusr" value="num_id">
          <input name="tabla" type="hidden" id="tabla" value="pro_invs"> 
          <input name="tipidd" type="hidden" id="tipidd" value="codigo"> 
          <input name="entidad" type="hidden" id="entidad" value="pro_invs"> 
          <input name="funcion" type="hidden" id="funcion" value="<%=func%>">
          <input name="reqsend" type="hidden" id="reqsend" value="Investigaciones">
          <input type="submit" name="bi" value="Guardar">
          </p>
	    </form>
	</div></td>
  </tr>
  <tr>
    <td>
	<div align="right">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="Investigaciones" />
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
  frmvalidator.addValidation("zzdes","req","Ingrese descripcion");
  frmvalidator.addValidation("zzdes","maxlen=500");
  frmvalidator.addValidation("zztitulo","req","Ingrese titulo");
  frmvalidator.addValidation("zzdep","req","Ingrese departamento");
  frmvalidator.addValidation("zzcam_con","req","Ingrese area de conocimiento");
  frmvalidator.addValidation("zzfue_fin","req", "Ingrese fuente de financiacion");
  frmvalidator.addValidation("zzinstitucion","req", "Ingrese institucion");
</script>
</body>
</html>