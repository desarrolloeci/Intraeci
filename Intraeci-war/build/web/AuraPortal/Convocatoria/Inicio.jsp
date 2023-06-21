<%-- 
    Document   : Inicio
    Created on : 7/09/2011, 09:19:56 AM
    Author     : Juan Pablo Garcia
--%>

<%@page import="inicio.conectaEJB"%>
<%@page import="BDintraeci.ConvocatoriaRemote"%>
<%@page import="login.InicioProfRemoteBusiness"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            ConvocatoriaRemote convocatoria = (ConvocatoriaRemote) session.getAttribute("convocatoria");
            if (convocatoria == null) {
                conectaEJB conEjb = new conectaEJB();
                convocatoria = conEjb.lookupConvocatoriaRemote("75107740", "-1");
                session.setAttribute("convocatoria", convocatoria);
            }
%>
<html>
    <head>
        <title>Convocatoria</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script type="text/javascript" src="jscript/conectar.js"></script>          
        <script type="text/javascript" src="jscript/Convocatorias/inicio.js"></script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondo.gif">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezadoProye">
            <jsp:param name="parametro" value="Juan Pablo" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="Sistema de Convocatoria" />
        </jsp:include>
        <div align="center" id="formulario">
            <table width="600px" border="1" cellspacing="0" class="tabla" >
                <tr>
                    <td colspan="2"><div align="left">Nombre:</div></td> <td colspan="2">                      <div align="left">
                            <input type="text" name="nombre"  id="nombre" size="35"/>
                        </div></td>
                </tr>
                <tr>
                    <td colspan="2"><div align="left">Descripción: </div></td>
                    <td colspan="2"><div align="left">
                            <textarea cols="32" rows="3" name="descrip"  id="descrip"></textarea>
                        </div></td>
                </tr>
                <tr>
                    <td width="25%"><div align="left">Fecha Inicio (dd/mm/aaaa):</div></td>
                    <td width="25%" ><div align="left">
                            <input type="text" name="fecIni" id="fecIni" />
                        </div></td>
                    <td width="25%"><div align="left">Fecha Fin (dd/mm/aaaa):</div></td>
                    <td width="25%"><div align="left">
                            <input type="text" name="fecFin"  id="fecFin"/>
                        </div></td>
                </tr>
                <tr>
                    <td width="25%"><div align="left">Tipo:</div></td>
                    <td width="25%" ><div align="left">
                            <input disabled="true" type="text" size="15" name="estf" id="tipo"/><a href="#" onClick="return getTipo();"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                        </div></td>
                    <td width="25%" align="left"><div id="titAsig" style="display: none;">Asignatura:</div></td>
                    <td width="25%" align="left">
                        <div align="left" id="camAsig" style="display: none;">
                            <input disabled="true" type="text" size="17" name="resp" id="nomAsig"/><input disabled="true" type="hidden" name="gerInt" id="idAsig"/><a href="#" onClick="return consultasModal('nomAsig','idAsig',true,'2');"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="25%"><div align="left">Periodo Académico:</div></td>
                    <td width="25%" ><div align="left">
                            <input disabled="true" type="text" size="15" name="perAcad" id="perAcad"/><a href="#" onClick="return opcionesModal('perAcad','perAcad',['2012-1','2012-2'],true);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                        </div></td>
                        <td colspan="2" width="50%" align="left">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div align="center"><input id="crear" type="submit" value="Crear" class="boton" onclick="accionCrearConvocatoria();"/></div></td>
                </tr>
            </table>
        </div>
        <div align="center">
            <label id="mensaje" style="display: none;">El proceso de convocatoria ha iniciado correctamente.</label>
        </div>
    </body>
</html>
