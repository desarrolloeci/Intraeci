<%-- 
    Document   : VistaSolicitud
    Created on : Oct 13, 2011, 10:00:26 AM
    Author     : Juan Pablo Garcia
--%>

<%@page import="java.util.HashMap"%>
<%@page import="BDintraeci.ConvocatoriaRemote"%>
<%@page import="inicio.conectaEJB"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            try {
                ConvocatoriaRemote convocatoria = (new conectaEJB()).lookupConvocatoriaRemote(request.getParameter("usuario"), request.getParameter("idConvocatoria"));
                HashMap datosConvocatoria = convocatoria.getConvocatoria();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Datos Convocatoria</title>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div align="center" id="formulario" style="position: absolute;  top: inherit;left: auto;">
            <table width="600px" border="1" cellspacing="0" class="tabla" >
                <tr>
                    <td><div align="left"><strong>Nombre:</strong></div></td> <td colspan="3"><div align="left"><%=datosConvocatoria.get("nombre")%></div></td>
                </tr>
                <tr>
                    <td><div align="left"><strong>Unidad:</strong></div></td> <td colspan="3"><div align="left"><%=datosConvocatoria.get("unidad")%></div></td>
                </tr>
                <tr>
                    <td><div align="left"><strong>Descripción:</strong></div></td>
                    <td colspan="3"><div align="left"><%=datosConvocatoria.get("descon")%></div></td>
                </tr>
                <tr>
                    <td width="25%"><div align="left"><strong>Fecha Inicio:</strong></div></td>
                    <td width="25%" ><div align="left"><%=datosConvocatoria.get("fini")%></div></td>
                    <td width="25%"><div align="left"><strong>Fecha Fin:</strong></div></td>
                    <td width="25%"><div align="left"><%=datosConvocatoria.get("ffin")%></div></td>
                </tr>
                <tr>
                    <td width="25%"><div align="left"><strong>Tipo:</strong></div></td>
                    <td width="25%"><div align="left"><%=datosConvocatoria.get("tipo")%></div></td>
                    <td width="25%"><div align="left"><strong>Periodo Académico:</strong></div></td>
                    <td width="25%" ><div align="left"><%=datosConvocatoria.get("peracad")%></div></td>
                </tr>
                <tr>
                    <td width="25%"><div align="left" id="titAsig"><strong>Asignatura:</strong></div></td>
                    <td width="25%" colspan="3"><div align="left" id="camAsig"><%=datosConvocatoria.get("asig")%></div></td>
                </tr>
            </table>
        </div>
    </body>
</html>
<%} catch (Exception e) {%>
Faltan datos. Vista no permitida.
<%}%>