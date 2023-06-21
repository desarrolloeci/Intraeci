<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
javax.rmi.PortableRemoteObject, 
login.InicioProfRemoteBusiness, 
login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>


<%  
response.setHeader("Cache-Control","no-cache");
//String nombre = new String((String)session.getAttribute("nombre"));
String ident = request.getParameter("ident");
String carnet = request.getParameter("carnet");
String spar = request.getParameter("spar");
PrintWriter oout = response.getWriter() ;
inicio.conectaEJB conEjb = new inicio.conectaEJB();
BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
Vector Datos=profesor.despInfAsi(carnet, ident);
int i, indice, a, n;
%>

<html>
    <head>
        <title>Servicios Academicos - Plan de estudios</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            <!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

            -->
        </style>
    </head>
    
    <body bgcolor="#FFFFFF" text="#000000">
        
        
        <% Vector dato= (Vector)Datos.elementAt(0);
        out.println("<b><font color=\"#800000\">Datos de asignatura:</font></b>" + dato.elementAt(0) );
        out.println("<br>");
        out.println("<b><font color=\"#800000\">Para el estudiante:</font></b>" + dato.elementAt(1)  );
        out.println("<p>");
        
        if (spar.equals("4")){
            Vector Registro= profesor.despRegistro(carnet, ident);
            out.println("<b><center><u><font color=\"#800000\">Información de Registro actual</center></u></b></font>");
            out.println("<br>");
            for (a =0; a < Registro.size(); a++) {
                Vector regactual = (Vector) Registro.elementAt(a);
        %>
        <table border="1" width="500">
            <tr>
                <td>Asignatura</td>
                <td>Nota 1</td>
                <td>Nota 2</td>
                <td>Nota 3</td>
                <td>Nota_Lab</td>
                <td>Clave</td>
                
            </tr>
            <tr>
                <td><%=regactual.elementAt(0)%></td>
                <td><%=regactual.elementAt(1)%></td>
                <td><%=regactual.elementAt(2)%></td>
                <td><%=regactual.elementAt(3)%></td>
                <td><%=regactual.elementAt(4)%></td>
                <td><%=regactual.elementAt(5)%></td>
                
            </tr>
        </table>
        <br>
        <br>
        <%}
        }
        %>
        
        
        <% Vector Biblia=profesor.despBiblia(carnet, ident);
        
        out.println("<b><center><u><font color=\"#800000\">Información de Historia Académica</center></u></b></font>");
        out.println("<br>");
        if (Biblia.size()<=0){
            out.println("No se encontraron registros en la Bases de Datos");
            out.println("<br>");
        }else
        %>
        <table border="1" width="500">
            <tr>
                <td>Asignatura</td>
                <td>Periodo</td>
                <td>Nota </td>
                <td>Clave</td>
                
            </tr>
            
            <% for (n =0; n < Biblia.size(); n++) {
            Vector historia = (Vector) Biblia.elementAt(n);
            
            %>
            
            <tr>
            <tr>
                <td><%=historia.elementAt(0)%></td>
                <td><%=historia.elementAt(1)%></td>
                <td><%=historia.elementAt(2)%></td>
                <td><%=historia.elementAt(3)%></td>
            </tr>
            
            <%}%>
            
        </table>
        <br>
        <br>
        <%
        Vector prerreq = profesor.despPrerreq(carnet, ident) ;out.println("<b><center><u><font color=\"#800000\">Prerrequisitos en el plan</center></u></b></font>");
        out.println("<br>");
        if (prerreq.size()<=0){
            out.println("No se encontraron registros en la Bases de Datos");
            out.println("<br>");
        }else
            for (indice = 0; indice < prerreq.size(); indice++) {
            Vector requisito = (Vector) prerreq.elementAt(indice);
        %>
        <table border="1" width="500">
            <tr>
                <td><%=requisito.elementAt(0)%></td>
            </tr>
        </table>
        
        <% }
        out.println("<br>");
        out.println("<br>");
        %>
        <%
        Vector Correq = profesor.despCorreq(carnet, ident);
        out.println("<b><center><u><font color=\"#800000\">Correquisitos en el plan</center></u></b></font>");
        out.println("<br>");
        if (Correq.size()<=0){
            out.println("No se encontraron registros en la Bases de Datos");
            out.println("<br>");
        }else
            for (i =0; i < Correq.size(); i++) {
            Vector Correquisito = (Vector) Correq.elementAt(i);
        %>
        
        <table border="1" width="500">
            <tr>
                <td><%=Correquisito.elementAt(0)%></td>
            </tr>
        </table>
        
        <%
            }
        out.println("<br>");
        out.println("<br>");
        out.println("<FORM>");
        out.println("<center><INPUT Type='button' Value='Close' onClick='window.close()'>");
        out.println("</center>");
        out.println("</FORM>");
        %>
        
        
    </body>
</html>