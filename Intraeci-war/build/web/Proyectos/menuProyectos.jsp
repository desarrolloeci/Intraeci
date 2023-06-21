<%@ include file="../secure.jsp" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.HashMap"%>
<%@page import="login.InicioProfRemoteBusiness"%>
<%@page import="BDintraeci.BDproyectoRemote"%>
<%@page import="proyectos.grabarProyecto"%>

<%
            BDproyectoRemote proyecto = (BDproyectoRemote) session.getAttribute("proyecto");
            proyecto.setIdPlan(request.getParameter("idPlan"));
            String proyec = request.getParameter("idProye"), visib = "inline;", funCar = "";
            if (proyec != null) {
                visib = "none;";
                funCar = "verproyecto(" + proyec + ");";
            }
%>
<html>
    <head>
        <title>Menu Proyectos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script type="text/javascript" src="jscript/Proyectos/proyecto.js"></script>
        <script type="text/javascript" src="jscript/comun.js"></script>
        <script type="text/javascript"  language="javascript">
            var href;
            var respLink=false;
            function cargarAcciones(){
                document.getElementById('editarProye').onclick=accionEditarProye;
                document.getElementById('guardarProye').onclick=accionGuardarProye;
                defineColorXEdicion();
            <%=funCar%>
                }
        </script>
    </head>
    <body background="img/fondoblanco.gif" onload="cargarAcciones();">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezadoProye">
            <jsp:param name="parametro" value="<%=((InicioProfRemoteBusiness) session.getAttribute("empleado")).getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="Sistema de Proyectos" />
        </jsp:include>
        <table width="1100" border="0" align="center" cellspacing="0">
            <tr>
                <td width="45%" valign="top" style="display: <%=visib%>">
                    <div style="width: 100%; height: 375px; overflow: auto;">
                        <table border="1" class="tabla" id="tabla1" align="left">
                            <thead>
                                <tr>
                                    <th width="90%"><div align="center"><strong>Proyecto</strong></div></th>
                                    <th width="10%"><div align="center"><strong>Estado</strong></div></th>
                                </tr>
                            </thead>
                            <tbody id="cuerpoProye">
                                <%
                                            if (proyec == null) {
                                                for (HashMap resumProy : proyecto.getListaProyectos()) {
                                %>
                                <tr><td><a href="#" onclick="verproyecto(<%=resumProy.get("idpr")%>)"><%=resumProy.get("nompr")%></a></td>
                                    <td><%=resumProy.get("estpr")%></td>
                                </tr>
                                <%      }
                                            }      /*  Del ciclo de recorrido de lista de proyectos */
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div align="center">
                        <input id="nuevoProye" type="submit" value="Nuevo" onClick="accionNuevoProye();" class="boton">
                    </div>
                </td>
                <td valign="top">
                    <table border="1" class="tabla" id="tabla2" align="left">
                        <form name="dproy">
                            <tr>
                                <th colspan="4"><input readonly type="text" size="50" name="plan"/><strong>Proyecto: <input readonly type="text" size="7" name="idp" id="id"/>
                                        <input readonly type="text" size="20" name="estado" id="estado"/><%if (proyec != null) {%><a href="#" onClick="return opcionesModal('estado','estado',getEstados(),respLink);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a><%}%></strong>
                                </th>
                            </tr>
                            <tr><td colspan="2">Nombre:</td><td colspan="2"><input readonly type="text" size="75" name="nom" id="nombre"/></td></tr>
                            <tr><td colspan="1">Tipo</td><td colspan="1"><input readonly type="text" size="16" name="tipo" id="tipo"/><a href="#" onClick="return opcionesModal('tipo','tipo',getTipo(),respLink);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                <td colspan="1">Fechas:</td><td colspan="1">Inicio: <input readonly type="text" size="10" name="fini" id="fecIni"/>
                                    Fin: <input readonly type="text" size="10" name="ffin" id="fecFin"/> Duración (meses): <input readonly type="text" size="2" name="dur" id="dur"/></td></tr>
                            <tr><td colspan="2">Objetivo:</td><td colspan="2"><textarea readonly rows="4" cols="70" name="obj" id="objetivo"></textarea></td></tr>
                            <tr><td colspan="2">Justificación:</td><td colspan="2"><textarea readonly rows="4" cols="70" name="just" id="justificacion"></textarea></td></tr>
                            <tr><td colspan="2">Unidad de dirección: </td><td colspan="2"><input  type="text" readonly size="40" name="ccosf" id="uniDirExt"/><input readonly type="hidden" name="respE" id="uniDirInt"/><a href="#" onClick="return centroCostosModal('uniDirExt','uniDirInt',respLink);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td></tr>
                            <tr><td colspan="2">Dependencia: </td><td colspan="2"><input  type="text" readonly size="40" name="ccosf" id="areaPresupExt"/><input readonly type="hidden" name="respE" id="areaPresupInt"/><a href="#" onClick="return centroCostosModal('areaPresupExt','areaPresupInt',respLink);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td></tr>
                            <tr><td colspan="2">Responsable:</td><td colspan="2"><input readonly type="text" size="70" name="resp" id="nomResponsable"/><input readonly type="hidden" name="gerInt" id="idResponsable"/><a href="#" id="imgResp" onClick="return empleadosModal('nomResponsable','idResponsable','0','0',respLink);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td></tr>
                            <tr><td colspan="2">Gerente:</td><td colspan="2"><input readonly type="text" size="70" name="ger" id="nomGerente"/><input readonly type="hidden" name="gerInt" id="idGerente"/><a href="#" id="imgGer" onClick="return empleadosModal('nomGerente','idGerente','0','0',respLink);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td></tr>
                            <tr>
                                <td colspan="4">
                                    <div align="center">
                                        <input id="editarProye" disabled value="Editar Proyecto" type="button" class="boton"/>
                                        <input id="guardarProye" style="display: none;" value="Guardar" type="button" class="boton"/>
                                        <input id="crearProye" style="display: none;" type="submit" value="Crear" onClick="return accionCrearProye();" class="boton"/>
                                        <input id="idPlan" type="hidden" value="<%=proyecto.getIdPlan()%>" name="idPlan"/>
                                    </div>
                                </td>
                            </tr>
                            <%if (proyec != null) {%>
                            <tr>
                                <td colspan="4">
                                    <div align="center">
                                        <input id="comen" value="Agregar comentario" type="button" class="boton" onclick="return comentarioModal();"/>
                                    </div>
                                </td>
                            </tr>
                            <%}%>
                        </form>
                        <tr>
                            <td colspan="4">
                                <form action="nuevaFase" name="dFase" style="display: <%=visib%>">
                                    <table width="100%" border="1" class="tabla" id="tablaf" align="center">
                                        <thead><tr>
                                                <th width="15%"><div align="center"><strong>Fase</strong></div></th>
                                                <th width="15%"><div align="center"><strong>Estado</strong></div></th>
                                                <th width="40%"><div align="center"><strong>Descripción</strong></div></th>
                                                <th width="10%"><div align="center"><strong>Año</strong></div></th>
                                                <th width="10%"><div align="center"><strong>Inicio</strong></div></th>
                                                <th width="10%"><div align="center"><strong>Fin</strong></div></th>
                                                <!--th width="5%"><div align="center"><strong>Ingresos</strong></div></th>
                                                <th width="5%"><div align="center"><strong>Gastos</strong></div></th>
                                                <th width="5%"><div align="center"><strong>Inversión</strong></div></th-->
                                            </tr></thead>
                                        <tbody id="cuerpo">
                                        </tbody>
                                        <tfoot id="nuevaFase" style="display: none;">
                                            <tr>
                                                <td colspan="6">
                                                    <div align="center">
                                                        <input id="crearFase" name="crearFase" type="submit" value="Nueva Fase" class="boton"/>
                                                        <input name="nomProye" type="hidden" value=""/>
                                                        <input name="idProye" type="hidden" value=""/>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </form>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="InicioPlanes" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>