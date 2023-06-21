<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@include file="../secure.jsp" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="login.InicioProfRemoteBusiness"%>
<%@page import="java.util.HashMap"%>
<%@page import="BDintraeci.BDproyectoRemote"%>
<%@page import="proyectos.grabarDedicacion"%>
<%@page import="proyectos.grabarFase"%>
<%@page import="proyectos.grabarEntregable"%>
<%!int numA = 0;

    public int getNumA() {
        numA = numA + 1;
        return numA;
    }%>
<%
            BDproyectoRemote proyecto = (BDproyectoRemote) session.getAttribute("proyecto");
            String titulo = new String("Sistema de Proyectos");
            String idFase = request.getParameter("idFase"), visib = "inline;", idProye = request.getParameter("idProye"), funCar = "";
            HashMap fase = proyecto.getFase(idFase);
            NumberFormat numFormat = NumberFormat.getInstance(Locale.US);
            if (idProye != null) {
                visib = "none;";
                proyecto.setIdProyecto(idProye);
                proyecto.setNivelFase(request.getParameter("idUniDir"));
                funCar = "accionEditarFase(); casoGuardar= 1;setVisibilidad(['comen=inline']);";
            }
%>
<html>
    <head>
        <title>Menu Fases</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1; no-cache">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script type="text/javascript" src="jscript/Proyectos/fase.js"></script>
        <script type="text/javascript" src="jscript/Proyectos/entregable.js"></script>
        <script type="text/javascript" src="jscript/Proyectos/dedicacion.js"></script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
        <script type="text/javascript"  language="javascript">
            var href;
            var casoGuardar = 0;
            var respLinkEnt=false;
            var respLinkFase=false;
            var linkRecurso=false;
            var permiso=<%=fase.get("permisos")%>;

            function cargarAcciones(){
                if(permiso=="1"){
                    linkRecurso=true;
                    setEditar(['editarFase=','nuevoRecurso=','nuevoEnt=']);
                }
                if(permiso!="1" && permiso!="2"){
                    setVisibilidad(['comen=none']);
                }
                document.getElementById('editarEntre').onclick=accionEditarEnt;
                document.getElementById('guardarEntre').onclick=accionGuardarEnt;
                document.getElementById('editarFase').onclick=accionEditarFase;
                document.getElementById('guardarFase').onclick=accionGuardarFase;
                document.getElementById('nuevoRecurso').onclick=accionNuevoRecurso;
                document.getElementById('crearRecurso').onclick=accionCrearRecurso;
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
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
        <table width="1100" border="0" align="center" cellspacing="0">
            <tr> <td width="50%" valign="top">
                    <table border="1" class="tabla" id="tabla1" align="left">
                        <thead>
                            <tr>
                                <th colspan="2"><div align="center"><strong>Información Fase</strong></div></th>
                            </tr>
                        </thead>
                        <form name="ffase">
                            <tr>
                                <td colspan="2">Id. Interno: <%=fase.get("idfa")%></td>
                            </tr>
                            <tr><td width="30%"><strong>Proyecto</strong></td>
                                <td><strong><%=fase.get("nompr")%></strong></td>
                            </tr>
                            <tr><td><strong>Fase </strong></td>
                                <td><input readonly type="text" size="50" name="nomf" id="nomFase" value="<%=fase.get("nomfase")%>"/>
                                    <input readonly type="text" size="2" name="numf" id="numFase" value="<%=fase.get("numfase")%>"/></td>
                            </tr>
                            <tr><td><strong>Estado</strong></td>
                                <td><input readonly type="text" size="50" name="estf" value="<%=fase.get("estfas")%>" id="estFase"/><a href="#" onClick="return opcionesModal('estFase','estFase',respLinkFase);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <strong>Hace parte del Plan de Acción Institucional vigente?: &nbsp;</strong>
                                    <input readonly type="text" size="3" name="cont" value="<%=fase.get("conpa")%>"/>
                                </td>
                            </tr>
                            <tr><td><strong>Descripción</strong></td>
                                <td><textarea rows="3" cols="40" readonly name="descf" id="descFase"><%=fase.get("descfa")%></textarea></td>
                            </tr>
                            <tr><td><strong>CCosto</strong></td>
                                <td><input readonly type="text" size="45" name="ccosf" value="<%=fase.get("centroCosto")%>" id="ccosfExt"/><input type="hidden" value="<%=fase.get("idcen")%>" id="ccosfInt"/><a href="#" onClick="return centroCostosModal('ccosfExt','ccosfInt',respLinkFase);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                            </tr>
                            <tr><td><strong>Año </strong><input readonly type="text" size="5" name="anf" id="anFase" value="<%=fase.get("anfa")%>"/></td>
                                <td><strong>Desde(mes-día)
                                        <input readonly type="text" size="2" name="mif" id="miFase" value="<%=fase.get("mifa")%>"/>-
                                        <input readonly type="text" size="3" name="dif" id="diFase" value="<%=fase.get("difa")%>"/>
                                        Hasta(mes-día)</strong>
                                    <input readonly type="text" size="2" name="mff" id="mfFase" value="<%=fase.get("mffa")%>"/>-
                                    <input readonly type="text" size="3" name="dff" id="dfFase" value="<%=fase.get("dffa")%>"/></td>
                            </tr>
                            <tr>
                                <td><strong>GastPers Interno.:</strong></td> <td colspan="3"><input readonly type="text" size="20" id="costIntFase" value="<%=numFormat.format(Float.parseFloat(fase.get("costInt").toString()))%>"/></td>
                            </tr>
                            <tr>
                                <td><strong>Gastos</strong></td>
                                <td><strong>Per. Externo<input readonly type="text" size="12" name="gpf" id="gpFase" value="<%=numFormat.format(Float.parseFloat(fase.get("tgaspe").toString()))%>"/>
                                        Otr. Gastos</strong>
                                    <input readonly type="text" size="12" name="ogf" id="ogFase" value="<%=numFormat.format(Float.parseFloat(fase.get("otrgas").toString()))%>"/></td>
                            </tr>
                            <tr><td><strong>Inversión</strong></td>
                                <td><input readonly type="text" size="12" name="invf" id="invFase" value="<%=numFormat.format(Float.parseFloat(fase.get("invest").toString()))%>"/></td>
                            </tr>
                            <tr><td><strong>Ingresos</strong></td>
                                <td><input readonly type="text" size="12" name="ingf" id="ingFase" value="<%=numFormat.format(Float.parseFloat(fase.get("ting").toString()))%>"/>
                                    <input style="display: <%=visib%>" id="editarFase" disabled="true" value="Editar Fase" type="button" class="boton"/>
                                    <input id="guardarFase" value="Guardar" style="display: none;" type="button" class="boton"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a style="display: <%=visib%>" id="verSeguiFase" href='MenuSeguimiento?idp=<%=fase.get("idfa")%>&nombre=<%=fase.get("nomfase")%>'><h3>Ver Seguimiento</h3></a>
                                </td>
                                <td>
                                    <a href="#" onclick="javascript: accionMostrarRecurso(0, <%=getNumA()%>);">Ver Dedicación</a>
                                </td>
                            </tr>
                            <%if (idProye != null) {%>
                            <tr>
                                <td colspan="2">
                                    <div align="center">
                                        <input type="submit" value="En Revisión" class="boton" onclick="return enviaResp(0);"/>
                                        <input type="submit" value="Avalar" class="boton" onclick="return enviaResp(1);"/>
                                        <input type="submit" value="Posponer" class="boton" onclick="return enviaResp(2);"/>
                                        <input type="submit" value="Cancelar" class="boton" onclick="return enviaResp(3);"/>
                                    </div>
                                </td>
                            </tr>
                            <%}%>
                            <tr>
                                <td colspan="4">
                                    <div align="center">
                                        <input id="comen" value="Agregar comentario" type="button" class="boton" onclick="return comentarioModal();"/>
                                    </div>
                                </td>
                            </tr>
                        </form>
                    </table>
                </td>
                <td valign="top" width="50%">
                    <div style="height: 327px; overflow: auto;">
                        <table width="100%" border="1" class="tabla" id="tablad" align="center">
                            <thead>
                                <tr><td colspan="8"><strong id="tituloR">Recursos de Personal Interno (Fase)</strong></tr>
                                <tr>
                                    <th width="5%">&nbsp;</th>
                                    <th width="36%"><div align="center"><strong>Recurso</strong></div></th>
                                    <th width="15%"><div align="center"><strong>Unidad</strong></div></th>
                                    <th width="13%"><div align="center"><strong>HorTot</strong></div></th>
                                    <!--th width="10%"><div align="center"><strong>#Sem</strong></div></th-->
                                    <th width="13%"><div align="center"><strong>Inicio</strong><br><div style="font: 80% sans-serif; ">(dd/mm/aaaa)</div></div></th>
                                    <th width="13%"><div align="center"><strong>Fin</strong><br><div style="font: 80% sans-serif; ">(dd/mm/aaaa)</div></div></th>
                                    <th width="5%">&nbsp;</th>
                                </tr></thead>
                            <tbody id="cuerpoRecurso">
                                <%
                                            for (HashMap dedicacion : proyecto.getLisDedicacion("0")) {
                                %>
                                <tr id="filaRecurso<%=dedicacion.get("iddfa")%>">
                                    <td><a id="editarRecurso<%=dedicacion.get("iddfa")%>" href="#" onclick="accionEditarRecurso(<%=dedicacion.get("iddfa")%>);"><img alt="Editar" src="img/editar.gif" /></a><a id="guardarRecurso<%=dedicacion.get("iddfa")%>" style="display: none;" href="#" onclick="accionGuardarRecurso(<%=dedicacion.get("iddfa")%>);"><img alt="Guardar" src="img/guardar.gif" /></a></td>
                                    <td><div id="recursoT<%=dedicacion.get("iddfa")%>"><%=dedicacion.get("nombres")%></div></td>
                                    <td> <div id="uniRecurT<%=dedicacion.get("iddfa")%>"><%=dedicacion.get("nom_cco")%></div></td>
                                    <td> <div id="horTotRecurT<%=dedicacion.get("iddfa")%>"><%=dedicacion.get("thor")%></div><input id="horTotRecurI<%=dedicacion.get("iddfa")%>" size="12" name="" type="text" style="display: none;"/>
                                        <!--td> <div id="semRecurT< %=dedicacion.get("iddfa")%>">< %=dedicacion.get("nsem")%></div--><input id="semRecurI<%=dedicacion.get("iddfa")%>" type="hidden" value="0"/></td>
                                    <td> <div id="fecIniRecurT<%=dedicacion.get("iddfa")%>"><%=dedicacion.get("Inicio")%></div><input id="fecIniRecurI<%=dedicacion.get("iddfa")%>" size="12" name="" type="text" style="display: none;"/></td>
                                    <td> <div id="fecFinRecurT<%=dedicacion.get("iddfa")%>"><%=dedicacion.get("Fin")%></div><input id="fecFinRecurI<%=dedicacion.get("iddfa")%>" size="12" name="" type="text" style="display: none;"/></td>
                                    <td><a id="eliminarRecurso<%=dedicacion.get("iddfa")%>" href="#" onclick="accionEliminarRecurso(<%=dedicacion.get("iddfa")%>);"><img alt="Eliminar" src="img/eliminar.gif" /></a></td>
                                </tr>
                                <%
                                            }/* Del ciclo de recorrido de dedicaciones */
                                %>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="7">
                                        <table width="100%" border="0"  id="camposNueRecur" style="display: none;">
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td><input type="text" readonly size="20" name="resp" id="recurExt"/><input disabled="true" type="hidden" name="respE" id="recurInt"/><a href="#" id="imgRecur" onClick="return empleadosModal('recurExt','recurInt','uniRecurExt','uniRecurInt',true);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                                <td><input id="uniRecurExt" readonly size="10" name="" type="text"/><input id="uniRecurInt" size="12" name="" type="hidden"/></td>
                                                <td><input id="horTotRecur" size="8" name="" type="text"/><input id="semRecur" type="hidden" value="0"/></td>
                                                <td><input id="fecIniRecur" size="8" name="" type="text"/></td>
                                                <td><input id="fecFinRecur" size="8" name="" type="text"/></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="7"><div align="center"><input id="nuevoRecurso" value="Nuevo" disabled="true" type="button" class="boton"/><input id="crearRecurso" value="Crear" style="display: none;" type="button" class="boton"/></div></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td width="50%" valign="top">
                    <div style="display: <%=visib%>">
                        <table border="1" class="tabla" id="tablae" align="left" width="100%">
                            <thead><tr>
                                    <th><div align="center"><strong>Entregables de la Fase</strong>
                                        </div></th></thead>
                            <tbody id="cuerpoEntregables">
                                <%                                    if (idProye == null) {
                                                for (HashMap entrega : proyecto.getLisEntregas()) {
                                %>
                                <tr><td><a href="#" onclick="return verentregable(<%=entrega.get("ident")%>)"><%=entrega.get("noment")%></a></td>
                                </tr>
                                <%
                                                }  /* Del ciclo de entregables */
                                            }
                                %>
                            </tbody>
                        </table>
                    </div>
                </td>
                <td valign="top" width="50%">
                    <form name="fentregable" style="display: <%=visib%>">
                        <table width="100%" border="1" class="tabla" id="tablaent" align="left" vertical-align:top>
                            <thead>
                                <tr>
                                    <th colspan="4"><div align="center"><strong>Información de Entregable</strong></div></th>
                                </tr>
                            </thead>
                            <tr>
                                <td><input readonly type="text" size="5" name="ident" id="idEnt"/></td>
                                <td colspan="3"><input readonly type="text" size="60" name="noment" id="nomEnt"/></td>
                            </tr>
                            <tr><td colspan="4">Gerente: <input readonly type="text" size="50" name="resp" id="respExt"/><input disabled="true" type="hidden" name="respE" id="respInt"/><a href="#" id="imgResp" onClick="return empleadosModal('respExt','respInt','0','0',respLinkEnt);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td></tr>
                            <tr><td colspan="4">CCosto: <input readonly type="text" size="50" name="ccosE" id="ccoseExt"/><input type="hidden" id="ccoseInt"/><a href="#" onClick="return centroCostosModal('ccoseExt','ccoseInt',respLinkEnt);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                            </tr>
                            <tr>
                                <td>Fecha</td>
                                <td colspan="3">Desde: <input readonly type="text" size="12" name="fini" id="fecIniEnt"/>
                                    Hasta: <input readonly type="text" size="12" name="ffin" id="fecFinEnt"/></td>
                            </tr>
                            <tr><td>Descripción</td>
                                <td colspan="3"><textarea readonly rows="3" cols="50" name="descent" id="descEnt"></textarea></td>
                            </tr>
                            <tr>
                                <td>Estado</td>
                                <td colspan="3">
                                    <input readonly type="text" size="15" name="estent" id="estEnt"/><a href="#" onClick="return opcionesModal('estEnt','estEnt',getEstadosEnt(),respLinkEnt);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><strong>GastPers Interno.:</strong><input readonly type="text" size="10" id="costIntEnt"/></td>
                            </tr>
                            <tr>
                                <td><strong>Per. Externo: </strong><input readonly type="text" size="10" name="gpE" id="gpEntre"/></td>
                                <td><strong>Otr. Gastos: </strong><input readonly type="text" size="10" name="ogE" id="ogEntre"/></td>
                                <td><strong>Inversión: </strong><input readonly type="text" size="10" name="invE" id="invEntre"/></td>
                                <td><strong>Ingresos: </strong><input readonly type="text" size="10" name="ingE" id="ingEntre"/></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div align="center"><input id="editarEntre" value="Editar Entregable" disabled="true" type="button" class="boton"/></div>
                                    <div align="center"><input id="guardarEntre" value="Guardar" style="display: none;" type="button" class="boton"/></div>
                                </td>
                                <td colspan="2">
                                    <div align="center"><input id="nuevoEnt" disabled="true" type="submit" value="Nuevo Entregable" onClick="return accionNuevoEnt();" class="boton"></div>
                                    <div align="center"><input id="crearEnt" type="submit" value="Crear Entregable" style="display: none;" onClick=" return accionCrearEnt();" class="boton"></div>
                                </td>
                            </tr>
                        </table></form>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="Proyectos"/>
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>