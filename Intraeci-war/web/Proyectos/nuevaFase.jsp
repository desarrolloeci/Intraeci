<%-- 
    Document   : nuevaFase
    Created on : 11/08/2011, 10:05:40 AM
    Author     : Juan Pablo Garcia
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ include file="../secure.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            response.setHeader("Cache-Control", "no-cache");
            login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");
            String titulo = new String("Sistema de Proyectos");
            String nombreProye = request.getParameter("nomProye");
            String idProye = request.getParameter("idProye");
%>
<html>
    <head>
        <title>Menu Fases</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script type="text/javascript" src="jscript/Proyectos/fase.js"></script>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
        <script type="text/javascript"  language="javascript">

            function cargarAcciones(){
                document.getElementById('crearFase').onclick=accionCrearFase;
            }

        </script>
    </head>
    <body background="img/fondoblanco.gif" onload="cargarAcciones();">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezadoProye">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>        
        <table width="800px" border="0" align="left" cellspacing="0">
            <tr align="center">
                <td width="100%">
                    <div align="center" style="text-align: left;">
                        <table width="100%" border="1" class="tabla" id="tabla"  align="left">
                            <thead>
                                <tr>
                                    <th colspan="2"><div align="center"><strong>Nueva Fase</strong></div></th>
                                </tr>
                            </thead>
                            <tr><td><strong>Proyecto</strong></td>
                                <td><strong><%=nombreProye%></strong></td>
                            </tr>
                            <tr><td><strong>Nombre: </strong></td>
                                <td>
                                    <input  type="text" size="80" name="nomf" id="nomFase"/>
                                </td>
                            </tr>
                            <tr><td><strong>Numero: </strong></td>
                                <td>
                                    <input  type="text" size="20" name="numf" id="numFase"/></td>
                            </tr>
                            <!--tr><td><strong>Estado</strong></td>
                                <td><input  type="text" disabled="true" size="20" name="estf" id="estFase"/><a href="#" onClick="return opcionesModal('estFase','estFase',getEstados(),true);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                                </td>
                            </tr-->
                            <tr><td><strong>Hace parte del Plan de Acción Institucional vigente?: </strong></td>
                                <td><input  type="text" disabled="true" size="20" name="cont" id="contFase"/><a href="#" onClick="return opcionesModal('contFase','contFase',['SI=SI','NO=NO'],true);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                                    <strong></strong></td>
                            </tr>
                            <tr><td><strong>Descripción</strong></td>
                                <td><textarea rows="3" cols="50"  name="descf" id="descFase"></textarea></td>
                            </tr>
                            <tr><td><strong>CCosto</strong></td>
                                <td><input  type="text" disabled="true" size="25" name="ccosf" id="ccosfExt"/><input disabled="true" type="hidden" name="respE" id="ccosfInt"/><a href="#" id="imgRecur" onClick="return centroCostosModal('ccosfExt','ccosfInt',true);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                            </tr>
                            <tr><td><strong>Año </strong><input  type="text" size="10" name="anf" id="anFase"/></td>
                                <td><strong>Desde(mes-día)
                                        <input  type="text" size="5" name="mif" id="miFase"/>-
                                        <input  type="text" size="5" name="dif" id="diFase"/>
                                        Hasta(mes-día)</strong>
                                    <input  type="text" size="5" name="mff" id="mfFase"/>-
                                    <input  type="text" size="5" name="dff" id="dfFase"/></td>
                            </tr>
                            <tr><td><strong>Gastos</strong></td>
                                <td><strong>Per. Externo
                                        <input  type="text" size="20" name="gpf" id="gpFase"/>
                                        Otr. Gastos</strong>
                                    <input  type="text" size="20" name="ogf" id="ogFase"/></td>
                            </tr>
                            <tr><td><strong>Inversión</strong></td>
                                <td><input  type="text" size="20" name="invf" id="invFase"/></td>
                            </tr>
                            <tr><td><strong>Ingresos</strong></td>
                                <td><input  type="text" size="20" name="ingf" id="ingFase"/></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div align="center">                                        
                                        <input name="idProye" id="idProye" value="<%=idProye%>" type="hidden"/>
                                        <input id="crearFase" value="Crear" type="button" class="boton"/>
                                        <input id="cancFase" value="Cancelar" type="button" class="boton" onclick="history.back();"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div align="center"><jsp:include page="piepag">
                            <jsp:param name="anterior" value="Menu" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>
