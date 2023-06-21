<%-- 
    Document   : listProyPents
    Created on : 15/09/2011, 11:55:56 AM
    Author     : Juan Pablo Garcia
--%>
<%@ include file="../secure.jsp" %>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BDintraeci.BDproyectoRemote"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%
                    response.setHeader("Cache-Control", "no-cache");
                    login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");
                    String titulo = "Sistema de Proyectos";
                    BDproyectoRemote proyecto = (BDproyectoRemote) session.getAttribute("proyecto");
        %>
        <title>Para aprobar</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="javascript" type="text/javascript" src="jscript/Proyectos/plan.js"></script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondoblanco.gif">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezadoProye">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
        <div align="center"><font color="#990000"><strong>Lista de proyectos y fases para aprobar</strong></font></div>
        <br>
        <div style="width: 100%;height: 250px; overflow: auto;">
            <table width="70%" border="1" class="tabla" id="tabla" align="center">
                <thead>
                    <tr>
                        <th width="20%"><div align="center"><strong>id</strong></div></th>
                        <th width="25%"><div align="center"><strong>Nombre</strong></div></th>
                        <th width="25%"><div align="center"><strong>Tipo</strong></div></th>
                        <th width="25%"><div align="center"><strong>Estado</strong></div></th>
                        <th width="15%"><div align="center"><strong>Editar</strong></div></th>
                    </tr>
                </thead>
                <tbody id="cuerpoResumen">
                    <%for (HashMap descProy: proyecto.getProyToApro()) {%>
                    <tr>
                        <td><div align="center"><%=descProy.get("id")%></div></td>
                        <td><div align="center"><%=descProy.get("nombre")%></div></td>
                        <td><div align="center"><%=descProy.get("tipo")%></div></td>
                        <td><div align="center"><%=descProy.get("estado")%></div></td>
                        <td><div align="center"><a id="verProy" href="<%=descProy.get("url")%>">Ver</a></div></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
        <div align="center">
            <jsp:include page="piepag">
                <jsp:param name="anterior" value="Menu" />
            </jsp:include>
        </div>
    </body>
</html>
