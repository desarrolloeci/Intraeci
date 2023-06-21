<%-- 
    Document   : listado
    Created on : 21/08/2012, 02:49:32 PM
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
    //String cedula = request.getParameter("cedula");
    //CAMBIAR PARA INTERSEMESTRALES
    //empleado.getPerHorario()/"2020-I"
    Vector Datos = admin.Eventoprof(cedula, empleado.getPerHorario());

%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Inscritos</title>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">

    </head>
    <body>
 <div class="container">
            <p class="textocom" align="center">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>

        <% if (Datos.size() <= 0) {
               out.println("<center>No hay datos disponibles para el usuario</center>");
           } else {%>
        <div align="center">
            Seleccione el curso que desea consultar:
            <form name="form1" method="post" action="ListaCurso">
                <table width="60%" border="1" class="textocom">
                    <tr>
                        <td width="87%">
                            <div align="center">Curso(s)</div>
                        </td>
                        <td width="13%"><div align="center">Seleccione</div></td>
                    </tr>
                    <% for (int i = 0; i < Datos.size(); i++) {
                            Vector curso = (Vector) Datos.elementAt(i);%>
                    <tr>
                        <td width="87%"><%=curso.elementAt(0)%></td>
                        <td width="13%"> <div align="center">
                                <input type="radio" name="curso" value="<%=curso.elementAt(0)%>*<%=curso.elementAt(1)%>*<%=curso.elementAt(2)%>"></div>
                        </td>
                    </tr>

                    <%}%>
                   
                </table>
                    
                    
                            <div align="center">
                                <input type="submit" name="Submit" value="Consultar">
                            </div>
                        
        </div>
        <h1 align="center"></h1>
    </form>

    <%}%>
    
    <table width="100%" border="0" id="tablaboton" align="center">
            <tr>
                <td>
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="Inscripcion" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
        </div>
</body>
</html>
