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
PrintWriter aout = response.getWriter() ;
String sel;
if (empleado.getIdProf().equals(""))
    nombre = empleado.getNomemp();
else
    nombre = empleado.getNomProf();
//Fecha actual
String idd = request.getParameter("idd");
Vector infovec = new Vector(), tmp;
for(int ct = 0; ct<30; ct++){
    infovec.add("");
}
if(idd != null){
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness bdadm = conEjb.lookupBDadministrativoBean();
    infovec = bdadm.despEstudiosFormales(idd);
    func = "actualizar";
}
Hashtable ht = new Hashtable();
ht.put("01","POSTDOCTORADO" );
ht.put("02","DOCTORADO" );
ht.put("03","MAESTRIA" );
ht.put("04","ESPECIALIZACI&Oacute;N" );
ht.put("05","PROFESIONAL" );
ht.put("06","LICENCIATURA" );
ht.put("07","TECN&Oacute;LOGO" );
ht.put("08","T&Eacute;CNICO" );
String[] kht = {"01", "02", "03", "04", "05", "06", "07", "08"};
%>
<html>
<head>
<title>Nuevo Formal</title>
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
        <jsp:param name="titulo" value="Estudios Formales" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
  <tr class="textocom">
    <td height="22"> 
    <div align="center">
	  Estudio Formal<br>
	<form method="POST" action="GuardaEmpleado" name="form1">
        <table width="100%" border="0" class="textocom">
          <tr>
            <td width="30%"><b>Nivel
              de Formaci&oacute;n *</b></td>
            <td width="70%">
              <select name="zzniv_for" id="zzniv_for" class="campotext">
                <%
                if(ht.get(infovec.elementAt(2)) != null){%>
                    <option value="<%=infovec.elementAt(2)%>" selected><%=ht.get(infovec.elementAt(2))%></option>
                <%}
                for(int j=0; j<ht.size(); j++){%>
                    <option value="<%=kht[j]%>"><%=ht.get(kht[j])%></option>
                <%}%>
              </select>
              </td>
          </tr>
          <tr>
            <td><b>Programa Acad&eacute;mico *</b></td>
            <td>
              <input name="zzpro_aca" type="text" id="zzpro_aca" value="<%=infovec.elementAt(3)%>"  class="campotext" size="50" maxlength="100">
            </td>
          </tr>
          <tr>
            <td><b>&Aacute;rea de Conocimiento *</b></td>
            <td>
              <input name="zzare_con" type="text" id="zzare_con" value="<%=infovec.elementAt(4)%>"  class="campotext"  size="50" maxlength="30">
              </td>
          </tr>
          <tr>
            <td><b>Duraci&oacute;n *</b></td>
            <td>
              <input name="zzdur" type="text" id="zzdur" value="<%=infovec.elementAt(5)%>" class="campotext" size="20" maxlength="15">
            </td>
          </tr>
          <tr>
            <td><b>T&iacute;tulo</b></td>
            <td>
              <input name="zztitulo" type="text" id="zztitulo" value="<%=infovec.elementAt(6)%>" class="campotext" size="50" maxlength="50">
            </td>
          </tr>
          <tr>
            <td><b>Fec.inicio</b></td>
            <td>
              <input type="text" name="zzfec_ini" size="14" id="zzfec_ini" maxlength="10" onFocus="this.blur()" class="campotext" value="<%=infovec.elementAt(7)%>">
        <a href="javascript:show_calendar('form1.zzfec_ini'); document.form1.zzfec_ini.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha'); return true;" onMouseOut="window.status=''; nd();  return true;">
        <img src="img/calendar.gif" width=16 height=16 border=0></a>
             </td>
          </tr>
          <tr>
            <td><b>Fec.fin</b></td>
            <td>
              <input type="text" name="zzfec_fin" size="14" id="zzfec_fin" maxlength="10" onFocus="this.blur()" class="campotext" value="<%=infovec.elementAt(8)%>">
        <a href="javascript:show_calendar('form1.zzfec_fin'); document.form1.zzfec_fin.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha'); return true;" onMouseOut="window.status=''; nd();  return true;">
        <img src="img/calendar.gif" width=16 height=16 border=0></a>
            </td>
          </tr>
          <tr>
            <td><b>Fec.grado</b></td>
            <td>
              <input type="text" name="zzfec_gra" size="14" id="zzfec_gra" maxlength="10" onFocus="this.blur()" class="campotext" value="<%=infovec.elementAt(9)%>">
        <a href="javascript:show_calendar('form1.zzfec_gra'); document.form1.zzfec_gra.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha'); return true;" onMouseOut="window.status=''; nd();  return true;">
        <img src="img/calendar.gif" width=16 height=16 border=0></a>
            </td>
          </tr>
          <tr>
            <td><b>Instituci&oacute;n *</b></td>
            <td>
              <input name="zzins" type="text" id="zzins" value="<%=infovec.elementAt(10)%>" class="campotext" size="50" maxlength="50">
            </td>
          </tr>
          <tr>
            <td><b>Ciudad *</b></td>
            <td>
              <input name="zzciu" type="text" id="zzciu" value="<%=infovec.elementAt(11)%>" class="campotext" size="50" maxlength="30">
            </td>
          </tr>
          <tr>
            <td><b>Pa&iacute;s *</b></td>
            <td>
              <input name="zzpais" type="text" id="zzpais" value="<%=infovec.elementAt(12)%>" class="campotext" size="50" maxlength="30">
            </td>
          </tr>
          <tr>
            <td><b>Estudio Finalizado</b></td>
            <td>
              <select name="zztermino" id="zztermino" class="campotext">
              <%
              sel = "";
              if(infovec.elementAt(12).equals("S"))
                  sel = "selected";
              %>
                <option value="S" <%=sel%>>Si</option>
              <%
              sel = "";
              if(infovec.elementAt(12).equals("N"))
                  sel = "selected";
              %>
                <option value="N" <%=sel%>>No</option>
              </select>
              </td>
          </tr>
          <tr>
            <td><b>Papeles que Certifican</b></td>
            <td>
              <select name="zzpaps_resp" id="zzpaps_resp" class="campotext">
                <%
              sel = "";
              if(infovec.elementAt(13).equals("S"))
                  sel = "selected";
              %>
                <option value="S" <%=sel%>>Si</option>
              <%
              sel = "";
              if(infovec.elementAt(13).equals("N"))
                  sel = "selected";
              %>
                <option value="N" <%=sel%>>No</option>
              </select>
              </td>
          </tr>
        </table>
        <p align="center"><b><font face="Arial, Helvetica, sans-serif" size="2"><i><b>
          <input name="idd" type="hidden" id="idd" value="<%=infovec.elementAt(0)%>">
          <input name="idusr" type="hidden" id="idusr" value="<%=empleado.getDocumProf()%>">
          <input name="tipidusr" type="hidden" id="tipidusr" value="num_id">
          <input name="tabla" type="hidden" id="tabla" value="est_fors"> 
          <input name="tipidd" type="hidden" id="tipidd" value="codigo"> 
          <input name="entidad" type="hidden" id="entidad" value="est_fors"> 
          <input name="funcion" type="hidden" id="funcion" value="<%=func%>">
          <input name="reqsend" type="hidden" id="reqsend" value="EstudiosFormales"> 
          <input type="submit" name="bi" value="Guardar">
          </b></i></font></b></p>

	    </form>
	</div></td>
  </tr>
  <tr>
    <td>
	<div align="right">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="EstudiosFormales" />
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
  frmvalidator.addValidation("zzpro_aca","req","Ingrese programa academico");
  frmvalidator.addValidation("zzare_con","req","Ingrese area de conocimiento");
  frmvalidator.addValidation("zzdur","req","Ingrese duracion");
  frmvalidator.addValidation("zzins","req", "Ingrese institucion");
  frmvalidator.addValidation("zzciu","req","Ingrese ciudad");
  frmvalidator.addValidation("zzpais","req","Ingrese pais");
</script>
</body>
</html>

