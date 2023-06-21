<%-- 
    Document   : Participación en Convocatoria por el Aspirante
    Created on : 08/08/2015, 08:00:00 AM
    Author     : Mario Martínez
--%>
<%@page import="java.util.Calendar"%>
<%@page import="BDintraeci.EmpleadoRemote"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    EmpleadoRemote emp = conEjb.lookupEmpleadoRemote();
    emp.inicializar(((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getIdemp());
    session.setAttribute("emp", emp);
    
    boolean isAdm = (emp.IsAdmConvoca() == 1)?true:false;
   // boolean isAdm = true;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Administración de Convocatorias</title>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
        <link href="css/calendario.css" type="text/css" rel="stylesheet">
        <link href="css/proyectos/convocatorias.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="jscript/comun.js"></script>
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script type="text/javascript" src="jscript/talentohum/aspirante.js"></script>
        <script type="text/javascript" src="jscript/talentohum/convaspirante.js"></script>
        <script type="text/javascript" src="jscript/talentohum/formhojavida.js"></script>
        <script type="text/javascript" src="jscript/talentohum/admconvoca.js"></script>
        <script type="text/javascript" src="jscript/calendar.js"></script>
        <script type="text/javascript" src="jscript/calendar-es.js"></script>
        <script type="text/javascript" src="jscript/calendar-setup.js"></script>
    </head>
    <body onload="lisconvoca(); initCalendar();">
        <jsp:include page="encAspirante">
            <jsp:param name="parametro" value="" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="Administración Convocatorias" />
        </jsp:include>
        <table id="tabla" align="center">
            <tr style="height: 32px;">
                <td colspan="2" class="divTitle tblTitle">Información de Convocatorias</td>
            </tr>
            <tr style="height: auto;">
                <td style="width: 60%; padding: 0px 5px;">
                    <div class="divTitle">Convocatorias</div>
                    <div style="overflow: auto; height: 310px;">
                        <table id="tabconva">
                            <thead>
                            <th width="85%"><div align="center">Nombre de la convocatoria</div></th>
                            <th width="15%"><div align="center">Fecha Límite</div></th>
                            </thead>
                            <tbody id="cuerpoconva">
                            </tbody>
                        </table>
                    </div>
                </td>
                <td style="width: 40%; padding: 0px 20px;">
                    <form name="admpublicconvo" action ="">
                        <span style="font-weight: bold; text-decoration: underline;">Detalles de la convocatoria</span><br><br>
                        <span style="font-weight: bold;">ID: </span><span id="idConv"></span><br>
                        <span style="font-weight: bold;">Nombre: </span>
                        <input type="text" name="NomNew" id="NomNew" type="text" size="60" style="width: 70%;"><br>
                        <span style="font-weight: bold;">Fecha inicial: </span>
                        <input type='text' size='12' maxlength='10' name='FecIni' id='FecIni'<%=isAdm?"":" disabled"%> />
                        <%
                            if (isAdm) {
                        %>
                        <img src='img/calendario.png' width='16' height='16' border='0' title='Fecha Inicial' id='lanzador'>
                        <%
                            }
                        %><br>
                        <span style="font-weight: bold;">Fecha final: </span>
                        <input type='text' size='12' maxlength='10' name='FecFin' id='FecFin'<%=isAdm?"":" disabled"%> />
                        <%
                            if (isAdm) {
                        %>
                        <img src='img/calendario.png' width='16' height='16' border='0' title='Fecha Inicial' id='lanzador2'>
                        <%
                            }
                        %><br>
                        <span style="font-weight: bold;">Descripción de la convocatoria:</span><br>
                        <textarea rows="3" cols="85" name="DscripNew" id="DscripNew" style="width: 100%;"></textarea><br>
                        <span style="font-weight: bold;">Tipo de convocatoria:</span>
                        <select name="TipoNeww" id="TipoNeww"<%=isAdm?"":" disabled"%>>
                            <option value="Cátedra">Cátedra</option>
                            <option value="Planta">Planta</option>
                        </select><br>
                        <span style="font-weight: bold;">Período:</span>
                        <select name="periodoNew" id="periodoNew"<%=isAdm?"":" disabled"%>>
                            <%
                                Calendar dateNow = Calendar.getInstance();
                                int yearNow = dateNow.get(Calendar.YEAR);
                            %>
                            <option value="<%=yearNow%>-1"><%=yearNow%>-1</option>
                            <option value="<%=yearNow%>-2"><%=yearNow%>-2</option>
                            <option value="<%=yearNow+1%>-1"><%=yearNow+1%>-1</option>
                            <option value="<%=yearNow+1%>-2"><%=yearNow+1%>-2</option>
                        </select><br>
                        <span style="font-weight: bold;">Persona Responsable:</span><br>
                        <input id="RespNew" type="hidden" size="20" name="resp" disabled readonly />
                        <input id="recurInt" type="text" name="respE" size="60" style="width: 70%;" disabled />
                        <%
                            if (isAdm) {
                        %>
                        <a href="#" id="imgRecur" onclick="return empleadosModal('recurInt', 'RespNew', '0', '0', true);">
                            <img src="img/selector.gif" style="vertical-align: top;" />
                        </a>
                        <%
                            }
                        %><br>
                        <span style="font-weight: bold;">Director del área:</span><br>
                        <input id="DirNew" type="hidden" size="20" name="dir" disabled readonly />
                        <input id="dirInt" type="text" name="dirE" size="60" style="width: 70%;" disabled />
                        <%
                            if (isAdm) {
                        %>
                        <a href="#" id="imgDir" onclick="return empleadosModal('dirInt', 'DirNew', '0', '0', true);">
                            <img src="img/selector.gif"  style="vertical-align: top;" />
                        </a>
                        <%
                            }
                        %><br><br>
                        <%
                            if (isAdm) {
                        %>
                        <input type="button" class="boton_disabled" value="Editar convocatoria" name="EditConv" onclick="PublicarConv(1);" disabled />
                        <input type="button" class="boton" value="Publicar nueva convocatoria" name="EnvSolicitud" onclick="PublicarConv(0);"/>
                        <%
                            }
                        %>
                        <input type="button" class="boton_disabled" value="Resumen de aspirantes" name="ResAsp" onclick="ResumenAspirantes();" disabled />
                    </form>
                </td>
            </tr>
            <tr style="height: 211px;">
                <td style="width: 60%; padding: 0px 5px;">
                    <div class="divTitle">Aspirantes</div>
                    <div style="overflow: auto; height: 310px;">
                        <table id="tabconvp">
                            <thead>
                            <th width="2%"><div align="center"><strong>#</strong></div></th>
                            <th width="50%"><div align="center"><strong>Nombre del aspirante</strong></div></th>
                            <th width="16%"><div align="center"><strong>Fecha de Inscripción</strong></div></th>
                            <th width="12%"><div align="center"><strong>Género</strong></div></th>
                            <th width="15%"><div align="center"><strong>Fecha de Nacimiento</strong></div></th>
                            <th width="5%"><div align="center"><strong>Estado</strong></div></th>
                            </thead>
                            <tbody id="cuerpoconvp">
                            </tbody>
                        </table>
                    </div> 
                </td>
                <td style="width: 40%; padding: 0px 20px;">
                    <form name="admpartconvo" action="">
                        <input type="hidden" size="6" name="idpart" id="idpart"/>
                        <span style="font-weight: bold; text-decoration: underline;">Detalles de selección del aspirante</span><br><br>
                        <span style="font-weight: bold;">Nombre: </span><span id="nomAspirante"></span><br><br>
                        <span style="font-weight: bold;">Estado:</span>
                        <input disabled="true" type="text" size="20" name="estpart" id="estpart" style="width: 20%;"/>
                        <a href="#" onClick="return opcionesModal('estpart', 'estpart', listaEstPart(), respEstPart);">
                            <img src="img/selector.gif" style="vertical-align: top;" />
                        </a><br><br>
                        <span style="font-weight: bold;">Observación:</span><br>
                        <textarea disabled="true" rows="3" cols="55" name="obsp" id="obsp" style="width: 100%;"></textarea><br><br>
                        <%--<span style="font-weight: bold;">Razón Interna:</span><br>
                        <textarea disabled="true" rows="3" cols="65" name="razon" id="razon"></textarea><br>
                        <span style="font-weight: bold;">Mensaje:</span><br>
                        <input disabled="true" type="text" size="55" name="mensaje" id="mensaje"/><br><br>--%>
                        <input id="GuardarAdmPart" value="Guardar" type="button" class="boton" onclick="guardarAdmPart();"/>
                    </form>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center; padding: 1%;">
                    <div id="hvIcon">
                        <a id="imprimir" onclick="imprimirHV();" style="display: none;" onmouseover="this.style.opacity='0.5';" onmouseout="this.style.opacity='1';">Imprimir<img src="img/convocatorias/print.png" /></a>
                        <a id="hvLink" target="_blank" style="display: none;" onmouseover="this.style.opacity='0.5';" onmouseout="this.style.opacity='1';">Ver documento adjunto<img src="img/convocatorias/attach.png" /></a>
                    </div>
                    <div style="height: auto; width: 90%; margin: 0px auto;" id="impHojaVida">                    
                        <table id="hojavida" style="display: none;">
                            <thead>
                            <th colspan="3" style="font-weight: bold; color: #A70000; font-size: 14px;">Hoja de vida</th>
                            </thead>
                            <tbody id="cuerpohojavida">
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
    </table>
</body>
</html>