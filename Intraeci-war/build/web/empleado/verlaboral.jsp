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
    infovec = bdadm.getdespExperiencia(idd);
    func = "actualizar";
}
Vector inftipoexp = bdadm.TipoCodigo("tipoExpLab");
Vector infdedica = bdadm.TipoCodigo("dedicacion");
Vector inftipprof = bdadm.TipoCodigo("tipprof");
Vector infCorrecto = bdadm.TipoCodigo("correcto");
%>
<html>
<head>
<title>Nueva Experiencia</title>
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
        <jsp:param name="titulo" value="Información Laboral" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
  <tr class="textocom">
    <td height="22"> 
    <div align="center">
	  Informaci&oacute;n Laboral<br>
	<form method="POST" action="GuardaEmpleado" name="form1"> 
    <table width="100%" border="0" class="textocom">
      <tr>
        <td width="40%"><b>Tipo</b></td>
        <td width="60%">
          <select name="zztipo" id="zztipo" class="campotext">
            <%for ( int i = 0 ; i < inftipoexp.size() ; i++ ){
            Vector infoTipoExp = (Vector)inftipoexp.elementAt(i);
            sel = "";
            if(infovec.elementAt(1).equals(infoTipoExp.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoTipoExp.elementAt(0)%>" <%=sel%>> <%=infoTipoExp.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
      <tr>
        <td><b>Fec.inicio</b></td>
        <td>
          <input type="text" name="zzfec_ini" size="14" id="zzfec_ini" maxlength="10" onFocus="this.blur()" class="campotext" value="<%=infovec.elementAt(2)%>">
        <a href="javascript:show_calendar('form1.zzfec_ini'); document.form1.zzfec_ini.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha'); return true;" onMouseOut="window.status=''; nd();  return true;">
        <img src="img/calendar.gif" width=16 height=16 border=0></a></td>
      </tr>
      <tr>
        <td><b>Fec.fin</b></td>
        <td>
          <input type="text" name="zzfec_fin" size="14" id="zzfec_fin" maxlength="10" onFocus="this.blur()" class="campotext" value="<%=infovec.elementAt(3)%>">
        <a href="javascript:show_calendar('form1.zzfec_fin'); document.form1.zzfec_fin.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha'); return true;" onMouseOut="window.status=''; nd();  return true;">
        <img src="img/calendar.gif" width=16 height=16 border=0></a></td>
      </tr>
      <tr>
        <td><b>Ultimo retiro</b></td>
        <td>
          <input type="text" name="zzult_ret" size="14" id="zzult_ret" maxlength="10" onFocus="this.blur()" class="campotext" value="<%=infovec.elementAt(4)%>">
        <a href="javascript:show_calendar('form1.zzult_ret'); document.form1.zzult_ret.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha'); return true;" onMouseOut="window.status=''; nd();  return true;">
        <img src="img/calendar.gif" width=16 height=16 border=0></a>
        </td>
      </tr>
      <tr>
        <td><b>Instituci&oacute;n *</b></td>
        <td>
          <input name="zzinstitucion" type="text" id="zzinstitucion" value="<%=infovec.elementAt(5)%>" size="50" maxlength="100" class="campotext">
          </td>
      </tr>
      <tr>
        <td><b>Tel&eacute;fono Instituci&oacute;n</b></td>
        <td>
          <input name="zztel_ins" type="text" id="zztel_ins" value="<%=infovec.elementAt(6)%>" size="50" maxlength="30" class="campotext">
          </td>
      </tr>
      <tr>
        <td><b>Direcci&oacute;n Instituci&oacute;n</b></td>
        <td>
          <input name="zzdir_ins" type="text" id="zzdir_ins" value="<%=infovec.elementAt(7)%>" size="50" maxlength="50" class="campotext">
          </td>
      </tr>
      <tr>
        <td><b>Pa&iacute;s Instituci&oacute;n *</b></td>
        <td>
          <input name="zzpai_ins" type="text" id="zzpai_ins" value="<%=infovec.elementAt(8)%>" size="50" maxlength="30" class="campotext">
              </td>
      </tr>
      <tr>
        <td><b>Ciudad Instituci&oacute;n *</b></td>
        <td>
          <input name="zzciu_ins" type="text" id="zzciu_ins" value="<%=infovec.elementAt(9)%>" size="50" maxlength="30" class="campotext">
              </td>
      </tr>
      <tr>
        <td><b>Cargo *</b></td>
        <td>
          <input name="zzcargo" type="text" id="zzcargo" value="<%=infovec.elementAt(10)%>" size="50" maxlength="80" class="campotext">
              </td>
      </tr>
      <tr>
        <td valign="top"><b>Departamento</b></td>
        <td>
          <input name="zzdepto" type="text" id="zzdepto" value="<%=infovec.elementAt(11)%>" size="50" maxlength="50" class="campotext">
              </td>
      </tr>
      <tr>
        <td valign="top"><b>Funciones Asignadas *</b></td>
        <td>
          <textarea name="zzfun_asi" cols="30" rows="5" id="zzfun_asi" class="campotext"><%=infovec.elementAt(12)%></textarea>
          </td>
      </tr>
      <tr>
        <td><b>Dedicaci&oacute;n</b></td>
        <td>
          <select name="zzdedica" id="zzdedica" class="campotext">
            <%for ( int i = 0 ; i < infdedica.size() ; i++ ){
            Vector infoDedica = (Vector)infdedica.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(13).equals(infoDedica.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoDedica.elementAt(0)%>" <%=sel%> > <%=infoDedica.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
      <tr>
        <td><b>Unidad Acad&eacute;mica</b></td>
        <td>
          <input name="zzuni_aca" type="text" id="zzuni_aca" value="<%=infovec.elementAt(14)%>" size="50" maxlength="30" class="campotext">
              </td>
      </tr>
      <tr>
        <td><b>Tipo Profesor</b></td>
        <td>
          <select name="zztip_pro" id="zztip_pro" class="campotext">
            <%for ( int i = 0 ; i < inftipprof.size() ; i++ ){
            Vector infoTipProf = (Vector)inftipprof.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(15).equals(infoTipProf.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoTipProf.elementAt(0)%>" <%=sel%>> <%=infoTipProf.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
      <tr>
        <td><b>Manejo de Personal</b></td>
        <td>
          <select name="zzman_per" id="zzman_per" class="campotext">
            <%for ( int i = 0 ; i < infCorrecto.size() ; i++ ){
            Vector infoCorrecto = (Vector)infCorrecto.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(16).equals(infoCorrecto.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoCorrecto.elementAt(0)%>" <%=sel%>> <%=infoCorrecto.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
      <tr>
        <td><b>Horas</b></td>
        <td>
          <input name="zzhoras" type="text" id="zzhoras" value="<%=infovec.elementAt(17)%>" size="50" maxlength="20" class="campotext">
              </td>
      </tr>
      <tr>
        <td><b>Implant&oacute; Docencia en Educaci&oacute;n
          B&aacute;sica</b></td>
        <td>
          <select name="zzniv_imp_doc_basica" id="zzniv_imp_doc_basica" class="campotext">
            <%for ( int i = 0 ; i < infCorrecto.size() ; i++ ){
            Vector infoCorrecto = (Vector)infCorrecto.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(18).equals(infoCorrecto.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoCorrecto.elementAt(0)%>" <%=sel%>> <%=infoCorrecto.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
      <tr>
        <td><b>Implant&oacute; Docencia en Pregrado
          T&eacute;cnico</b></td>
        <td>
          <select name="zzniv_imp_doc_pre_tecnico" id="zzniv_imp_doc_pre_tecnico" class="campotext">
            <%for ( int i = 0 ; i < infCorrecto.size() ; i++ ){
            Vector infoCorrecto = (Vector)infCorrecto.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(19).equals(infoCorrecto.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoCorrecto.elementAt(0)%>" <%=sel%>> <%=infoCorrecto.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
      <tr>
        <td><b>Implant&oacute; Docencia en Pregrado
          Tecnol&oacute;gico</b></td>
        <td>
          <select name="zzniv_imp_doc_pre_tecnologico" id="zzniv_imp_doc_pre_tecnologico" class="campotext">
            <%for ( int i = 0 ; i < infCorrecto.size() ; i++ ){
            Vector infoCorrecto = (Vector)infCorrecto.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(20).equals(infoCorrecto.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoCorrecto.elementAt(0)%>" <%=sel%>> <%=infoCorrecto.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
      <tr>
        <td><b>Implant&oacute; Docencia en Pregrado
          Profesional</b></td>
        <td>
          <select name="zzniv_imp_doc_pre_profesional" id="zzniv_imp_doc_pre_profesional" class="campotext">
            <%for ( int i = 0 ; i < infCorrecto.size() ; i++ ){
            Vector infoCorrecto = (Vector)infCorrecto.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(21).equals(infoCorrecto.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoCorrecto.elementAt(0)%>" <%=sel%>> <%=infoCorrecto.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
      <tr>
        <td><b>Implant&oacute; Docencia en Posgrado
          Maestr&iacute;a</b></td>
        <td>
          <select name="zzniv_imp_doc_pos_maestria" id="zzniv_imp_doc_pos_maestria" class="campotext">
            <%for ( int i = 0 ; i < infCorrecto.size() ; i++ ){
            Vector infoCorrecto = (Vector)infCorrecto.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(22).equals(infoCorrecto.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoCorrecto.elementAt(0)%>" <%=sel%>> <%=infoCorrecto.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
      <tr>
        <td><b>Implant&oacute; Docencia en Posgrado
          Doctorado</b></td>
        <td>
          <select name="zzniv_imp_doc_pos_doctorado" id="zzniv_imp_doc_pos_doctorado" class="campotext">
            <%for ( int i = 0 ; i < infCorrecto.size() ; i++ ){
            Vector infoCorrecto = (Vector)infCorrecto.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(23).equals(infoCorrecto.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoCorrecto.elementAt(0)%>" <%=sel%>> <%=infoCorrecto.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
      <tr>
        <td><b>Implant&oacute; Docencia en Posgrado
          Posdoctorado</b></td>
        <td>
          <select name="zzniv_imp_doc_pos_posdoctorado" id="zzniv_imp_doc_pos_posdoctorado" class="campotext">
            <%for ( int i = 0 ; i < infCorrecto.size() ; i++ ){
            Vector infoCorrecto = (Vector)infCorrecto.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(24).equals(infoCorrecto.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoCorrecto.elementAt(0)%>" <%=sel%>> <%=infoCorrecto.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
      <tr>
        <td><b>Implant&oacute; Docencia en Capacitaci&oacute;n
          Interna</b></td>
        <td>
          <select name="zzniv_imp_doc_cap_int" id="zzniv_imp_doc_cap_int" class="campotext">
            <%for ( int i = 0 ; i < infCorrecto.size() ; i++ ){
            Vector infoCorrecto = (Vector)infCorrecto.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(25).equals(infoCorrecto.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoCorrecto.elementAt(0)%>" <%=sel%>> <%=infoCorrecto.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
      <tr>
        <td><b>Implant&oacute; Docencia en Posgrado
          Especializaci&oacute;n</b></td>
        <td>
          <select name="zzniv_imp_doc_pos_esp" id="zzniv_imp_doc_pos_esp" class="campotext">
            <%for ( int i = 0 ; i < infCorrecto.size() ; i++ ){
            Vector infoCorrecto = (Vector)infCorrecto.elementAt(i) ;
            sel = "";
            if(infovec.elementAt(26).equals(infoCorrecto.elementAt(0)))
                sel = "selected";%>
            <option value="<%=infoCorrecto.elementAt(0)%>" <%=sel%>> <%=infoCorrecto.elementAt(1)%></option>
            <%}%>
          </select>                        </td>
      </tr>
    </table>
          <p align="center"><b><font face="Arial, Helvetica, sans-serif" size="2"><i><b>
          <input name="idd" type="hidden" id="idd" value="<%=infovec.elementAt(0)%>">
          <input name="idusr" type="hidden" id="idusr" value="<%=empleado.getDocumProf()%>">
          <input name="tipidusr" type="hidden" id="tipidusr" value="num_id">
          <input name="tabla" type="hidden" id="tabla" value="exp_labs">
          <input name="tipidd" type="hidden" id="tipidd" value="codigo"> 
          <input name="entidad" type="hidden" id="entidad" value="exp_labs">
          <input name="funcion" type="hidden" id="funcion" value="<%=func%>">
          <input name="reqsend" type="hidden" id="reqsend" value="InfoLaboral">
          <input type="submit" name="bi" value="Guardar">
          </b></i></font></b></p>
	    </form>
	</div></td>
  </tr>
  <tr>
    <td>
	<div align="right">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="InfoLaboral" />
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
  frmvalidator.addValidation("zzinstitucion","req","Ingrese institucion");
  frmvalidator.addValidation("zzcargo","req","Ingrese cargo");
  frmvalidator.addValidation("zzfun_asi","req","Ingrese funciones asignadas");
  frmvalidator.addValidation("zzfun_asi","maxlen=700");
  frmvalidator.addValidation("zzpai_ins","req", "Ingrese pais");
  frmvalidator.addValidation("zzciu_ins","req","Ingrese ciudad");
</script>
</body>
</html>

