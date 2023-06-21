<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
                 javax.rmi.PortableRemoteObject, 
                 login.InicioProfRemoteBusiness, 
                 login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<% 
    HttpSession sesion;
    response.setHeader("Cache-Control","no-cache"); 
    PrintWriter aout = response.getWriter() ;
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    Vector entrevista = profesor.getentrevista(empleado.getDocumProf(), empleado.getPerHorario());
    %>


<html>
<head>
<title>Consulta Entrevistas Posgrado</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/comun.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

   <table width="580" border="0" cellpadding="0" align="center" cellspacing="0" class="textoimpre">
        <tr> 
        <td width="8" height="42"></td>
        <td width="564" height="42"> 
        <table width="100%" border="0" align="center" class="textoimpre">
            <tr> 
            <td height="37" rowspan="2" align="left" valign="top" width="14%"> 
                <div align="left"><b><img src="img/LogEci.gif" width="72" height="74"></b></div>
            </td>
            <td height="33" width="86%"> 
             <div align="center"><b>ESCUELA 
              COLOMBIANA DE INGENIERIA</b></div>
            </td>
            </tr>
            <tr> 
             <td width="86%" height="55" valign="top"> 
                 <div align="center"><b>Servicios 
                 a Profesores - Entrevistas</b></div>
            </td>
            </tr>
            <tr> 
            <td height="6" colspan="2"> 
                <div><b>Nombre: 
                &nbsp;<%=empleado.getNomProf()%> </b></div>
            </td>
            </tr>
            <tr>             
          <td align="center" valign="top" colspan="2"> <br>
		  <%if((entrevista.size()) > 0){%>
            <table width="99%" border="1" cellspacing="0" cellpadding="0" class="textoimpre">
              <tr bgcolor="#C5201A"> 
                <td width="41%" bgcolor="#C5201A"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Estudiante</font></b></td>
                <td width="15%"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Fecha 
                  de <br>
                  Entrevista</font></b></td>
                <td width="13%"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Hora 
                  </font></b></td>
                <td width="31%"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#FFFFFF">Lugar</font></b></td>
              </tr>
              <%for (int j = 0; j < entrevista.size(); j ++) {
            Vector datosentrev=(Vector)entrevista.elementAt(j);                            
	    %>
              <tr> 
                <td width="41%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=datosentrev.elementAt(3)%></font></td>
                <td width="15%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=datosentrev.elementAt(1)%></font></td>
                <td width="13%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=datosentrev.elementAt(2)%></font></td>
                <td width="31%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=datosentrev.elementAt(4)%></font></td>
              </tr>
              <%}%>
            </table>
            <br>
			<%} else {%>
      			
            <p><b> <font face="Verdana, Arial, Helvetica, sans-serif" size="3">Usted 
              no tiene informaci&oacute;n registrada para este proceso</font></b> <br>&nbsp;
			<%}%>
          </td>
            </tr>
            <tr> 
             <td valign="top" colspan="2"> 
             <div align="right"></div>
             <div align="right"> 
              
            </div>
          </td>
        </tr>
      </table>
    </td>
    <td width="8" height="42" align="right"></td>
  </tr>
 <!--<tr> 
    <td width="8"><img src="img/abaIzq.gif" width="24" height="24"></td>
    <td width="564" valign="bottom"><img src="img/punto.gif" width="564" height="2.5"></td>
    <td width="8"><img src="img/abaDer.gif" width="24" height="24"></td>
  </tr>-->
</table>

  
</body>
</html>

