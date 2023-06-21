<%-- 
    Document   : ImpresionListado
    Created on : 30/05/2013, 11:56:53 AM
    Author     : Lucero
--%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<%HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            session.setAttribute("loginex", empleado.getUsrExchange());
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
            String cedula = empleado.getIdemp();
            String curso = request.getParameter("curso");
            String nombre = request.getParameter("nombre");
            String id = request.getParameter("id");
            String rbopciones = request.getParameter("rbopciones");
            String formato = request.getParameter("formato");
            Vector Datos = admin.InscritosEvento(id);
            if ((formato != null) && (formato.equals("excel"))) {
                response.setContentType("application/vnd.ms-excel");
            }
            //out.println(nombre);
            //  out.println(id);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Inscritos Cursos</title>
         <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
    <script language="JavaScript" type="text/JavaScript">
        <!--
        function impresion(){
            document.getElementById("tablaboton").style.visibility='hidden';
            window.print();
            window.close();
        }
        -->
    </script>
    <%
        if (!((formato != null) && (formato.equals("excel")))) {
    %>
    <link href="css/comun.css" rel="stylesheet" type="text/css">
    <%        }
    %>

    </head>
    <body>
        <table width="75%" border="1" class="textocom">
            <tr>
                <td><%=nombre%>
                </td>
            </tr>
            <tr>
                <td>
                    <div align="center"><b>Nombres</b></div>
                </td>
                <td>
                     <div align="center"><b>Correo</b></div>
                   </td>
                <td>
                    <div align="center"><b>V&iacute;nculo</b></div>
                </td>
            </tr>
            <% String nombres = new String();
                        for (int i = 0; i < Datos.size(); i++) {
                            Vector inscrito = (Vector) Datos.elementAt(i);
                            String vinculo = (inscrito.elementAt(4).toString());
                            if (vinculo.equals("EMP") || (vinculo.equals("PROF"))) {
                                nombres = (inscrito.elementAt(1).toString() + " " + inscrito.elementAt(2).toString() + " " + inscrito.elementAt(3).toString());
                            } else {
                                nombres = inscrito.elementAt(1).toString();
                            }%>
            <tr>
                <td><%=nombres%></td>
                 <td><%=inscrito.elementAt(5)%></td>
                <td><%=inscrito.elementAt(4)%></td>
            </tr>
            <%}%>
            <tr>
        </table>
    </body>
</html>
