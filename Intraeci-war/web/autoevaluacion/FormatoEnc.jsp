<%-- 
    Document   : FormatoEnc
    Created on : 11/03/2013, 04:47:07 PM
    Author     : Lucero
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.text.*, java.net.*;" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties,java.lang.reflect.Array " %>

<%HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            session.setAttribute("loginex", empleado.getUsrExchange());
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
            String cedula = empleado.getIdemp();
            //String cedula = request.getParameter("cedula");
            Vector Datos = admin.DatosEncuestas(cedula);
            String dato = "";%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Encuestas Autoevaluación con fines de Acreditación Institucional</title>
    </head>
    <body>
        <% if (Datos.size() > 0) {
                       // String iden = new String (Datos.elementAt(1).toString());
                       // String flag1 = new String (Datos.elementAt(2).toString());
                       // String iden2 = new String(Datos.elementAt(3).toString());
                      //  String flag2 = new String (Datos.elementAt(4).toString());
                       // String prog = new String (Datos.elementAt(5).toString());%>
        <table width="98%" border="1" cellspacing="0" cellpadding="0">

            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>

                <%Vector preguntas = admin.PreguntasEnc("12");%>
<% for (int i = 0; i <= preguntas.size(); i++) {

                     Vector pregunta = (Vector) preguntas.elementAt(i);%>
                <td width="11%" align="center"><%=pregunta.elementAt(6)%></td>
                <td width="11%" align="center"><%=pregunta.elementAt(7)%></td>
                <td width="11%" align="center"><%=pregunta.elementAt(8)%></td>
                <td width="11%" align="center"><%=pregunta.elementAt(9)%></td>
                <% if (pregunta.elementAt(4).equals("5")) {%>
                <td width="11%" align="center"><%=preguntas.elementAt(10)%></td>
                <%} else if (pregunta.elementAt(4).equals("6")) {%>
                <td width="11%" align="center"><%=preguntas.elementAt(11)%></td>
                <%}%>
            </tr>


            <tr>
                <td rowspan="2" width="2%"><%=pregunta.elementAt(0)%><%=pregunta.elementAt(2)%></td>
                <td rowspan="2" width="38%"><%=pregunta.elementAt(3)%></td>
                <%for (int p = 1; p <= 4; p++) {%>

                <td width="17%">
<!--.substring(0, 1)-->
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P<%=i%>" value="<%=pregunta.elementAt(5)%>">
                        </font></div>
                </td>
                <%}%>
            </tr>

            <%}%>

        </table>
        <%} else {%>
        <center> Gracias por su participación.</center>
        <center><h2><a href="../intraeci/salir"> Salir </a></h2></center>
        <%}%>

        <h1>&nbsp;</h1>
        <h1 align="center">&nbsp;</h1>
        <div align="center"></div>
    </body>
</html>
