<%@ page import="java.util.*,java.awt.*,java.io.*,java.text.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%  
    response.setHeader("Cache-Control","no-cache"); 
    String desde = request.getParameter("desde");
    String hasta = request.getParameter("hasta");
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    //Fecha actual
    SimpleDateFormat formatter = new SimpleDateFormat ("dd-MM-yyyy");
    Date currentTime_1 = new Date();
    String dateString = formatter.format(currentTime_1);
    String texto[]=new String[20];
    int l;
    /*StringTokenizer st = new StringTokenizer(desde, "-");
    l=0;             
    while (st.hasMoreTokens()) { 
        texto[l]=st.nextToken();
        l=l+1;  
    }
    String fdesde = (String) texto[2]+"-"+ (String) texto[1]+"-"+ (String) texto[0];
    String texto1[]=new String[20];
    int m;
    StringTokenizer st1 = new StringTokenizer(hasta, "-");
    m=0;             
    while (st1.hasMoreTokens()) { 
        texto1[m]=st1.nextToken();
        m=m+1;   
    }
    String fhasta = (String) texto1[2]+"-"+ (String) texto1[1]+"-"+ (String) texto1[0];*/
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

</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="100%" border="0" align="center">
  <tr> 
    <td align="center" valign="top" colspan="2" height="96"> 
<% 
 Vector consulta = admin.getConReserva(desde, hasta); 
 if (consulta.size() > 0){%>
      <form name=form1>
        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Solicitudes 
          de reservas encontradas para estas fechas:</font></p>
        <table width="98%" border="1" cellspacing="0" cellpadding="0">
          <tr bgcolor="#E6E6E6"> 
            <td width="6%"> 
              <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">Cod_Salon</font></b></font></div>
            </td>
            <td width="9%"> 
              <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">Fecha 
                de uso</font></b></font></div>
            </td>
            <td width="3%"> 
              <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">Hora_Ini</font></b></font></div>
            </td>
            <td width="3%"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">Hora_Fin</font></b></font></td>
            <td width="6%"> 
              <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">dia</font></b></font></div>
            </td>
            <td width="17%"> 
              <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">Profesor</font></b></font></div>
            </td>
            <td width="17%"> 
              <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">Descipci&oacute;n</font></b></font></div>
            </td>
          </tr>
<% 
    String dia = "", asig = "", idensal = "" ;
    for ( int i=0 ;  i < consulta.size() ;  i++ ){
        Vector consul = (Vector)consulta.elementAt(i); 
        if (consul.elementAt(3).equals("1"))
            dia="Lunes";
        if (consul.elementAt(3).equals("2"))
            dia="Martes";
        if (consul.elementAt(3).equals("3"))
            dia="Miércoles";					
        if (consul.elementAt(3).equals("4"))
            dia="Jueves";	
        if (consul.elementAt(3).equals("5"))
            dia="Viernes";	
        if (consul.elementAt(3).equals("6"))
            dia="Sabado";	
				  %>
          <tr> 
            <td width="6%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=consul.elementAt(0)%></font></td>
            <td width="7%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=consul.elementAt(1)%></font></td>
            <td width="4%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=consul.elementAt(2)%></font></td>
            <td width="4%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=consul.elementAt(7)%></font></td>
            <td width="6%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=dia%></font></td>
            <%if (consul.elementAt(4).equals("No disponible")){%>
            <td width="17%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;</font></td>
            <% } else { %>
            <td width="17%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=consul.elementAt(4)%></font></td>
            <%}%>
            <%if (consul.elementAt(6).equals("No disponible") || consul.elementAt(6).equals("")) {%>
            <td width="17%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;</font></td>
            <%} else {%>
            <td width="22%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=consul.elementAt(6)%></font></td>
            <%}%>
          </tr>
  <%}%>
        </table>
		<br><center><INPUT type=button name=print value="Imprimir" onClick="javascript:window.print()"></center><br>
      </form>
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

