<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
                 javax.rmi.PortableRemoteObject, 
                 login.InicioProfRemoteBusiness, 
                 login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<%  
    response.setHeader("Cache-Control","no-cache"); 
    //Fecha actual
    String error = request.getParameter("error");
    String fecuso = new String(""), dia = new String(""), capac = new String(""),
            descr = new String(""), msj = new String(""), ndia = new String("");
    if(error != null){
        if(error.equals("formaerror")){
            fecuso = new String((String)session.getAttribute("fecuso"));
            ndia = new String((String)session.getAttribute("ndia"));
            dia = new String((String)session.getAttribute("dia"));
            capac = new String((String)session.getAttribute("capac"));
            descr = new String((String)session.getAttribute("descr"));
            msj = "No existen recursos disponibles para esta solicitud<br>modifíquela y envíela nuevamente";
        }
    }
        
    SimpleDateFormat formatter = new SimpleDateFormat ("dd-MM-yyyy");
    Date currentTime_1 = new Date();
    String dateString = formatter.format(currentTime_1);
    //Secuencia de solicitud de reserva de salon
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    Vector asignaturas = profesor.getAsignaturas(empleado.getPeriodo(), empleado.getIdProf());
    String  sec = admin.getSecuencia();
    session = request.getSession(true);	
    session.setAttribute("sec", sec);
%>

<html>
<head>
<title>Solicitud de Salones</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
#fecha {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #990000;
	font-weight: bold;
}

a:hover{color:#3366CC; }
a{color: blue;}
a:link, a:visited { text-decoration: none }
.texto {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
<script language="JavaScript" src="jscript/solaudit.js"></script>
<script language="JavaScript" src="jscript/calendario.js"></script>
<script language="JavaScript" src="jscript/overlib_mini.js"></script>
<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<body  onLoad="preloadImg()">
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
	<jsp:param name="doblenc" value="inicio" />
        <jsp:param name="titulo" value="Solicitud de salones" />
</jsp:include>
<table width="640" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
    <tr>             
      <td align="center" valign="top">
         <form name="form1" method="post" action="ResAuditorio" onSubmit="return comprueba();" >
           <input type="hidden" name="ndia" value="<%=ndia%>">
           <font color="#990000" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><%=msj%>
           </strong></font>           
           <table width="100%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                <tr> 
                  <td colspan="2"><b><font size="2">N&uacute;mero: 
                    <font color="#990000"><%=sec%></font></font> </b></td>
                  <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fecha 
                    actual:</b> 
                    <script>fecha()</script>
                    </font></td>
                </tr>
                <tr> 
                  <td width="23%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fecha 
                    Utilizaci&oacute;n:</b> </font></td>
                  <td width="20%"> 
                    <input type="text" name="fecha" size="14" maxlength="10" onfocus="this.blur()" class="campotext" value="<%=fecuso%>">
                    <a href="javascript:show_calendar('form1.fecha'); document.form1.fecha.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha de solicitud de reserva.'); return true;" onMouseOut="window.status=''; nd();  return true;"> 
                    <img src="img/calendar.gif" width=16 height=16 border=0></a></td>
                  <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>D&iacute;a 
                    utilizaci&oacute;n: 
                    <input type="text" name="dia" size="9" maxlength="9" onfocus="this.blur()" class="campotext" value="<%=dia%>">
                    </b> 
                    <script>
                        /**
                        <!--
                        function doIt() {
                                var cad = document.form1.fecha.value; 
                                var i;
                                var aux1="";
                                var ja = new Array(); 
                                ja = cad.split("-"); 
                                //var dia =parseInt(ja[1]) - 1;
                                var dia = ja[1]-1;						
                                var fechaAux = new Date(ja[2], dia, ja[0]);						
                                aux1 = Dia_semana(fechaAux.getDay());		
                                //var dia = parseInt(fechaAux.getDay()) +  1;
                                var dia = parseInt(fechaAux.getDay());
                                document.form1.dia.value=aux1;												
                                document.form1.ndia.value=dia;
                                //document.write (Dia_semana(fechaAux.getDay()) )						
                        }
			-->
                        */
                    </script>
                    </font>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Hora
                        inicio:</b> 
                      <select name="hini" class="campotext" id="hini">
<%
                  for(int h=7; h<20; h++){%>
                        <option value="<%=h%>"><%=h%></option>
                 <%}
%>
                  </select>
                  : 
                  <select name="mini" class="campotext" id="mini">
                        <option value="00" selected>00</option>
                        <option value="30">30</option>
                  </select>
</font></td>
                  <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Hora
                        Final:</b>
                      <select name="hfin" class="campotext" id="hfin">
                          <%
                  for(int h=8; h<20; h++){%>
                        <option value="<%=h%>"><%=h%></option>
                 <%}
%>
                  </select>
:
<select name="mfin" class="campotext" id="mfin">
                        <option value="00" selected>00</option>
                        <option value="30">30</option>
</select>
                  </font></td>
                </tr>
                <tr>
                  <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><strong>Actividad
                      a realizar:
                        <select name="tipo" class="campotext" id="tipo">
                          <option value="A">Acad&eacute;mica
                          <option value="U">Cultural
                          <option value="S">Social                          
                        </select>
                  </strong></font></td>
                  <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><strong>N&uacute;mero
                        de asistentes:
                        <input name="cap" type="text" class="campotext" id="cap" size="5" maxlength="3">
(Max. 340)                </strong></font></td>
                </tr>
                <tr> 
                  <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" color="#CC0000"><b><font size="2">Caracter&iacute;sticas</font></b></font></td>
                </tr>
                <tr> 
                  <td colspan="2"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input name="uno" type="checkbox" id="uno" value="1">
                  Sonido</font></td>
                  <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                  <input name="asig" type="text" id="asig" size="3" maxlength="2" class="campotext">
N&uacute;mero Micr&oacute;fonos</font> (Mesa, Inalambrico, Atril)</td>
                </tr>
                <tr> 
                  <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input name="dos" type="checkbox" id="dos" value="1">
                  Banderas</font></td>
                  <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input name="seis" type="checkbox" id="seis" value="1">
Video Beam</font></td>
                </tr>
                <tr> 
                  <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input name="tres" type="checkbox" id="tres" value="1">
                  Atril</font></td>
                  <td width="57%" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <input name="siete" type="checkbox" id="siete" value="1">
CPU</font></td>
                </tr>
                <tr> 
                  <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input name="cuatro" type="checkbox" id="cuatro" value="1">
                  M&uacute;sica Ambiental</font></td>
                  <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <input name="ocho" type="checkbox" id="ocho" value="1">
Proyector</font></td>
                </tr>
                <tr> 
                  <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                    <input name="idgrp" type="text" id="idgrp" size="3" maxlength="2" class="campotext">
                  No. Puestos Mesa en Escenario</font></td>
                  <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <input name="nueve" type="checkbox" id="nueve" value="1">
Tel&oacute;n</font></td>
                </tr>
                <tr> 
                  <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                    <input name="cinco" type="checkbox" id="cinco" value="1">
Himno (Nacional, ECI)</font></td>
                  <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></td>
                </tr>
                <tr> 
                  <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#CC0000"><strong>Observaciones</strong></font></td>
                </tr>
                <tr> 
                  <td colspan="3"><div align="center">
                    <p>
                      <textarea name="descr" cols="80" rows="5" class="campotext" id="descr"></textarea>
                </p>
                    <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Por favor especificar el himno y los micr&oacute;fonos que desea
                      utilizar si es su caso.</font></p>
                  </div></td>
                </tr>
                <tr> 
                  <td colspan="3"><div align="center">
                    <input name="req" type="hidden" id="req">
</div></td>
                </tr>
                <tr> 
                  <td colspan="3"> 
                    <div align="center"> 
                      <input type="submit" name="Submit" value="Solicitar Reserva" class="boton">
                    </div>
                  </td>
                </tr>
           </table>
        </form>	
          </td>
            </tr>
		<tr>
                    <td>
			<div align="right">
				<jsp:include page="piepag">
				  <jsp:param name="anterior" value="SolicitudSalones" />
				</jsp:include>
			  </div>
                    </td>
                 </tr>
            </table>
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>	 
<p>&nbsp;</p></body>
</html>

