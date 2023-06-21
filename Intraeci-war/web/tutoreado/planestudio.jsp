<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
javax.rmi.PortableRemoteObject, 
login.InicioProfRemoteBusiness, 
login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%  
response.setHeader("Cache-Control","no-cache");
String  IdEst = request.getParameter("carnet");
String spar, color;
PrintWriter oout = response.getWriter() ;
inicio.conectaEJB conEjb = new inicio.conectaEJB();
BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
int indice, linea, sem, tmp,  par, n, dp;
%>

<html>
    <head>
        <title>Plan de estudios</title>
           <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <%
        out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
        out.println("<!-- ");
        out.println("function openPop(pagename){");
        out.println("window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=350,width=550')} ");
        out.println("//-->");
        out.println("</SCRIPT>");
        %>
        
    </head>
    <body bgcolor="#FFFFFF" text="#000000">
        <div class="container">
        <table width="640" border="0" cellpadding="0" align="center" cellspacing="0"  class="textocom">
            
<tr>     
<td width="100%" valign="top"> 
<jsp:include page="encabezado" flush="true">
    <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
    <jsp:param name="doblenc" value="inicio" />
    <jsp:param name="headerImg" value="banner.jpg" />
</jsp:include>
        
        <% Vector plan = profesor.despDetallePlan(IdEst) ;
        
        dp = 1 ;
        int lon = plan.size();
        
        Vector Detalleplan= (Vector)plan.elementAt(1);
        
        if (plan.size() <= 0)
            out.println("No hay datos en la consulta");
        else {
            if (((String)Detalleplan.elementAt(7)).equals("No disponible"))
                dp= 0;  
        %>
        
        <font color="FFOOOO"> ESTUDIANTE:</FONT> <%=Detalleplan.elementAt(6)%><br> 
        <font color="FFOOOO"> PROGRAMA :</FONT>  <%=Detalleplan.elementAt(4)%> 
        <p>El número entre paréntesis corresponde al número de créditos de la asignatura.
        </p>
        <table border="1" cellspacing="0" width="100%" class="textocom">
        <tr> 
        <% for (indice = 1; indice <= 11; indice++){
          if (indice == 1) {%>
                         <td> Nivelatorio </td>
                        <% } else {%>
                             <td>&nbsp
                                 </td>
                        <%}
                      //  out.println("<td>" + (new Integer(indice)).toString() + "</td>");
                    }
                
        linea = 0 ;
        sem = 11 ;
        %>
        
        
        <%for (indice = 0; indice < plan.size(); indice++) {
        
        Vector Detalle = (Vector) plan.elementAt(indice);%>
        
        <%tmp = (new Integer((String) Detalle.elementAt(2))).intValue() ;
        
        if ( linea != tmp) {
        for (; sem <= 10; sem++) 
        out.println("<td>&nbsp</td>");
        out.println("</tr><tr>") ;				
        linea = tmp ;
        sem = 0 ;
        }
        tmp = (new Integer((String) Detalle.elementAt(3))).intValue() ;
        String ident = ((String) Detalle.elementAt(0)) ;
        
        for (; sem < tmp; sem++) 
        out.println("<td> &nbsp</td>");
        
        Vector idasig = profesor.despidasig(IdEst, ident, 1 );
        
        int longi = idasig.size();
        color = new String("#000000") ;
        spar = new String("3") ;
        
        if (longi >0)
        color = new String("#009933") ;
        else {
        Vector asig = profesor.despasig(IdEst, ident);
        int longitud = asig.size();
        if (longitud > 0) {
        spar = new String("4") ;
        color = new String("#3366FF") ;
        }  
        }
        %>
        
        
        <% out.println("<td><B><a href=\"JavaScript:openPop('Prerrequisitos?carnet="+IdEst+"&ident="+ident+"&spar="+spar+"' " + ") " + "\" > <font color=\""+ color + "\">" + Detalle.elementAt(1) + "</font></B></td>");
        sem++ ; 
        %>
        
        
        <%}
        
       for (; sem <= 10; sem++)
            out.println("<td> &nbsp</td>");
        out.println("</tr></table><br>") ;%>
 <%}%>
        
        
        <%Vector Datos = profesor.datosEst(IdEst);
        String idplan= (String)Datos.elementAt(5);
        Vector creditos = profesor.despCreditos(IdEst, idplan);  %>
        <b>Total de créditos aprobados:</b>
        
        <%=creditos.elementAt(0)%>
        
        <%if (dp == 1){
            out.println("<a href=\"plandoble"  + "\" > <center><b>VER DOBLE PLAN</b> </center></font></a>");
        } else {%>
        <div align="right"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="salir">CERRAR 
        SESION </a></font></b></font></div>
        <%}%>
        </td>
</tr>
<tr> 
    <td valign="top" height="12"> 
        <div align="center">	   
            <jsp:include page="piepag">
                <jsp:param name="anterior" value="Tutor" />
            </jsp:include>
        </div>
    </td>
    
</tr>
</table>
        </div>
    </body>
</html>
