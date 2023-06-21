<%@ page import="java.util.*,java.awt.*,java.io.*,java.text.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%  
    response.setHeader("Cache-Control","no-cache"); 
    String desde = request.getParameter("desde");
    String hasta = request.getParameter("hasta");
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();

    SimpleDateFormat formatter = new SimpleDateFormat ("dd-MM-yyyy");
    Date currentTime_1 = new Date();
    String dateString = formatter.format(currentTime_1);
    String texto[]=new String[20];
    Vector equip = new Vector();
    int j;
    equip.addElement("Sonido");
    equip.addElement("Banderas");
    equip.addElement("Atril");
    equip.addElement("Música Ambiental");
    equip.addElement("Himno Nacional");
    equip.addElement("Video Beam");
    equip.addElement("CPU");
    equip.addElement("Proyector");
    equip.addElement("Telón");
    %>

<html>
<head>
<title>Reservas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<style type="text/css">
<!--
#fecha {
	font-family: Tahoma, Verdana, Arial;
	font-size: 12px;
	color: #000000;
}
-->

<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>

<style type="text/css">
<!--
.comun {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="100%" border="0" align="center">
  <tr> 
    <td align="center" valign="top" colspan="2" height="96"> 
<% 
 int i;
 Vector consulta = admin.getConsAudit(desde, hasta); 
 if (consulta.size() > 0){
%>
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Solicitudes
             de reservas del auditorio encontradas para estas fechas: <%=desde%> - <%=hasta%></font></p>
<%
        for(i=0;i<consulta.size();i++){
            Vector consul = (Vector)consulta.elementAt(i); %>
        <table width="100%" border="1" cellpadding="0" cellspacing="0" class="comun">
          <tr>
            <td width="10%" bgcolor="#E6E6E6"><div align="center"><font color="#000000"><strong>Fec_uso</strong></font></div></td>
            <td width="10%" bgcolor="#E6E6E6"><div align="center"><font color="#000000"><strong>H_ini</strong></font></div></td>
            <td width="10%" bgcolor="#E6E6E6"><div align="center"><font color="#000000"><strong>H_fin</strong></font></div></td>
            <td width="10%" bgcolor="#E6E6E6"><div align="center"><font color="#000000"><strong>Dia</strong></font></div></td>
            <td width="30%" bgcolor="#E6E6E6"><div align="center"><font color="#000000"><strong>Profesor</strong></font></div></td>
            <td width="30%" bgcolor="#E6E6E6"><div align="center"><font color="#000000"><strong>Descripci&oacute;n</strong></font></div></td>
          </tr>
          <tr>
            <td width="10%"><div align="center"><%=consul.elementAt(1)%></div></td>
            <td width="10%"><div align="center"><%=consul.elementAt(2)%></div></td>
            <td width="10%"><div align="center"><%=consul.elementAt(7)%></div></td>
            <td width="10%"><div align="center"><%=consul.elementAt(3)%></div></td>
            <td width="30%"><div align="center"><%=consul.elementAt(4)%></div></td>
            <td width="30%" rowspan="3">
                <div align="center"><%=consul.elementAt(6)%>
                </div></td></tr>
          <tr>
            <td width="10%"><div align="center"><strong>Equipos</strong></div></td>
            <td width="10%"><div align="center"><strong>No. Mic</strong></div></td>
            <td width="10%"><div align="center"><strong>No. Puestos</strong></div></td>
            <td width="10%"><div align="center"><strong>Asistentes</strong></div></td>
            <td width="30%"><div align="center"><strong>Actividad</strong></div></td>
          </tr>
<%
                String req = consul.elementAt(8).toString();
          %>
          <tr>
            <td width="10%"><div align="center">
<%
                for(j=0;j<9;j++){
                    if(req.charAt(j) == '1')
                        out.println(equip.elementAt(j) + "<br>");
                }%>            
            </div></td>
            <td width="10%"><div align="center">
                <%=consul.elementAt(10)%>
            </div></td>
            <td width="10%"><div align="center">
                <%=consul.elementAt(9)%></div></td>
            <td width="10%"><div align="center">
                <%=consul.elementAt(11)%></div></td>
            <td width="30%"><div align="center">
                <%
                if(consul.elementAt(12).toString().equals("A"))
                    out.println("Académica");
                if(consul.elementAt(12).toString().equals("U"))
                    out.println("Cultural");
                if(consul.elementAt(12).toString().equals("S"))
                    out.println("Social");%></div></td>
          </tr>
          <tr>
            <td colspan="6"><div align="center">
              <hr>
            </div></td>
          </tr>
      </table>
<%
        }%>        
        <br>
        <center><INPUT type=button name=print value="Imprimir" onClick="javascript:window.print()"></center><br>
      <%} else {%>
      <font face="Verdana, Arial, Helvetica, sans-serif" size="2">No se encontro 
      ninguna solicitud de reserva para estas Fechas</font> 
      <%			}	  

%>
  
    </td>
  </tr>
 
</table>
<p>&nbsp;</p>
</body>
</html>

