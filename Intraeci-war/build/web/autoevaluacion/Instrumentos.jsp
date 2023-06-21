<%-- 
    Document   : Instrumentos
    Created on : 10/10/2011, 05:05:49 PM
    Author     : lrodriguez
--%>

<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%      inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        HttpSession sesion;
        sesion = request.getSession(true);
        String cedula = request.getParameter("cedula");
        sesion.setAttribute("empleado", cedula);
        sesion.setAttribute("usuario", cedula);
        Vector Datos = admin.DatosEncuestas(cedula);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Encuestas Autoevaluación con fines de Acreditación Institucional</title>
    </head>
    <body>

        <% if (Datos.size() > 0) {
            String iden = Datos.elementAt(1).toString();
            String flag1 = Datos.elementAt(2).toString();
             String prog= Datos.elementAt(5).toString();
            if (iden.equals("141") && flag1.equals("0")) {
                response.sendRedirect("EPC-EsP?flag=1&prog="+prog);
            } else if (iden.equals("143") && flag1.equals("0")) {
                response.sendRedirect("EAD-EsP?flag=1&prog="+prog);
            }
             /*else if (iden.equals("14") && flag1.equals("0")) {
                response.sendRedirect("EPCE?flag=" + 1);
            }*/ else {%>
        <center>Usted ya diligenció la Encuesta, o no debe realizar este proceso, Gracias por su participación.</center>
        <center><h2><a href="../intraeci/salir"> Salir </a></h2></center>
        <%}
 } else {%>

        <center> Gracias por su participación.</center>
        <center><h2><a href="../intraeci/salir"> Salir </a></h2></center>
        <%}
        %>

        <!-- response.sendRedirect("Mensajes?idmsj=7");-->

        <h1>&nbsp;</h1>
        <h1 align="center">&nbsp;</h1>
        <div align="center"></div>
    </body>
</html>
