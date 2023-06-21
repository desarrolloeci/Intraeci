<%@ include file="../secure.jsp" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.HashMap"%>
<%@page import="BDintraeci.BDproyectoRemote"%>
<%@page import="java.util.ArrayList"%>
<%
            response.setHeader("Cache-Control", "no-cache");
            login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");
            String titulo = "Sistema de Proyectos";
            BDproyectoRemote proyecto = (BDproyectoRemote) session.getAttribute("proyecto");
            if (proyecto == null) {
                inicio.conectaEJB conEjb = new inicio.conectaEJB();
                proyecto = conEjb.lookupBDproyectoRemote();
                proyecto.inicializar(empleado.getIdemp());
                session.setAttribute("proyecto", proyecto);
            }
%>
<html>
    <head>

        <title>Menu Planes</title>
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
        <div align="center"><%if (proyecto.getPerDir().size() != 0) {%><!input type="submit" value="Proyectos y fases a aprobar" onclick="window.location='listProyPents';" class="boton"/><%}%></div><br>
        <div align="center"><font color="#000000"><strong>Planes en Sistema -- <input id="buscar" value="Buscar Planes" type="submit" class="boton" onclick="planes();"></strong></font></div>
        <br>        
        <div style="width: 100%;height: 200px; overflow: auto; display:none" name="TiposP" id="TiposP">
            <table width="70%" border="0" class="tabla" id="tiposplan" align="center">                
                    <tr>                        
                        <th width="100%"><div align="left"><strong>Tipo de proyecto</strong></div></th>                        
                    </tr>
                    <tr>                        
                        <td width="200" height="20" bgcolor="FFFFFF"  > <%--onMouseOver="this.style.backgroundColor='#CCCCFF'"  onMouseOut=" this.style.backgroundColor='#FFFFFF'"--%>
                                                                                                   
                                                         <a onclick="verplanesmejoramiento();" onmouseover="this.style.cursor='pointer'">                                                    
                                                       <font id="ta" color="#000000">Planes de Mejoramiento</font></a>
                                               </td>                      
                    </tr>
                    <tr>                        
                        <td width="200" height="20" bgcolor="FFFFFF"  > <%--onMouseOver="this.style.backgroundColor='#CCCCFF'"  onMouseOut=" this.style.backgroundColor='#FFFFFF'"--%>
                                                <div align="left">                                                    
                                                         <a onclick="verplanesAccion();" onmouseover="this.style.cursor='pointer'">                                                    
                                                       <font id="ta" color="#000000">Planes de Acción</font></a></div>
                                            </td>                        
                    </tr>
                    <tr>                        
                        <td width="200" height="20" bgcolor="FFFFFF" class="menuprueba" > <%--onMouseOver="this.style.backgroundColor='#CCCCFF'"  onMouseOut=" this.style.backgroundColor='#FFFFFF'"--%>
                                                <div align="left">                                                    
                                                         <a onclick="verplanesIntervencion();" onmouseover="this.style.cursor='pointer'">                                                    
                                                       <font id="ta" color="#000000">Planes de Intervención</font></a></div>
                                            </td>                        
                    </tr>
                    <tr>                        
                        <td width="200" height="20" bgcolor="FFFFFF" class="menuprueba" > <%--onMouseOver="this.style.backgroundColor='#CCCCFF'"  onMouseOut=" this.style.backgroundColor='#FFFFFF'"--%>
                                                <div align="left">                                                    
                                                         <a onclick="verplanesDesarrollo();" onmouseover="this.style.cursor='pointer'">                                                    
                                                       <font id="ta" color="#000000">Planes de Desarrollo</font></a></div>
                                            </td>                        
                    </tr>
                    <tr>                        
                        <td width="200" height="20" bgcolor="FFFFFF" class="menuprueba" > <%--onMouseOver="this.style.backgroundColor='#CCCCFF'"  onMouseOut=" this.style.backgroundColor='#FFFFFF'"--%>
                                                <div align="left">                                                    
                                                         <a onclick="verplanesInvestigacion();" onmouseover="this.style.cursor='pointer'">                                                    
                                                       <font id="ta" color="#000000">Planes de Investigación</font></a></div>
                                            </td>                        
                    </tr>   
               
            </table>
        </div>
        <div style="width: 100%;height: 200px; overflow: auto; display:none" name="TipoAccion" id="TipoAccion">
            <table width="70%" border="1" class="tabla" id="tablaAccion" align="center">
                <thead>
                    <tr>                        
                        <th width="30%"><div align="center"><strong>Nombre a</strong></div></th>
                        <th width="30%"><div align="center"><strong>Unidad</strong></div></th>
                        <th width="10%"><div align="center"><strong>Inicio</strong></div></th>
                        <th width="10%"><div align="center"><strong>Fin</strong></div></th>
                        <th width="4%"><div align="center"><strong>Opción</strong></div></th>
                    </tr>
                </thead>
                <tbody id="cuerpoAccion">
                </tbody>
            </table>
        </div>
        <div style="width: 100%;height: 200px; overflow: auto; display:none" name="TipoDesarrollo" id="TipoDesarrollo" >
            <table width="70%" border="1" class="tabla" id="tablaDesarrollo" align="center">
                <thead>
                    <tr>                        
                        <th width="30%"><div align="center"><strong>Nombre d</strong></div></th>
                        <th width="30%"><div align="center"><strong>Unidad</strong></div></th>
                        <th width="10%"><div align="center"><strong>Inicio</strong></div></th>
                        <th width="10%"><div align="center"><strong>Fin</strong></div></th>
                        <th width="4%"><div align="center"><strong>Opción</strong></div></th>
                    </tr>
                </thead>
                <tbody id="cuerpoDesarrollo">
                </tbody>
            </table>
        </div>
        <div style="width: 100%;height: 200px; overflow: auto; display:none" name="TipoIntervencion" id="TipoIntervencion" >
            <table width="70%" border="1" class="tabla" id="tablaIntervencion" align="center">
                <thead>
                    <tr>                        
                        <th width="30%"><div align="center"><strong>Nombre iv</strong></div></th>
                        <th width="30%"><div align="center"><strong>Unidad</strong></div></th>
                        <th width="10%"><div align="center"><strong>Inicio</strong></div></th>
                        <th width="10%"><div align="center"><strong>Fin</strong></div></th>
                        <th width="4%"><div align="center"><strong>Opción</strong></div></th>
                    </tr>
                </thead>
                <tbody id="cuerpoIntervencion">
                </tbody>
            </table>
        </div>
        <div style="width: 100%;height: 200px; overflow: auto; display:none" name="TipoMejoramiento" id="TipoMejoramiento">
            <table width="70%" border="1" class="tabla" id="tablaMejoramiento" align="center">
                <thead>
                    <tr>                        
                        <th width="30%"><div align="center"><strong>Nombre</strong></div></th>
                        <th width="30%"><div align="center"><strong>Unidad</strong></div></th>
                        <th width="10%"><div align="center"><strong>Inicio</strong></div></th>
                        <th width="10%"><div align="center"><strong>Fin</strong></div></th>
                        <th width="4%"><div align="center"><strong>Opción</strong></div></th>
                    </tr>
                </thead>
                <tbody id="cuerpoMejoramiento">
                </tbody>
            </table>
        </div>
        <div style="width: 100%;height: 200px; overflow: auto; display:none" name="TipoInvestigacion" id="TipoInvestigacion" >
            <table width="70%" border="1" class="tabla" id="tablaInvestigacion" align="center">
                <thead>
                    <tr>                        
                        <th width="30%"><div align="center"><strong>Nombre</strong></div></th>
                        <th width="30%"><div align="center"><strong>Unidad</strong></div></th>
                        <th width="10%"><div align="center"><strong>Inicio</strong></div></th>
                        <th width="10%"><div align="center"><strong>Fin</strong></div></th>
                        <th width="4%"><div align="center"><strong>Opción</strong></div></th>
                    </tr>
                </thead>
                <tbody id="cuerpoInvestigacion">
                </tbody>
            </table>
        </div>
        <br>
        <div align="center"><font color="#000000"><strong>Lista de Seguimientos a Editar</strong></font></div>
        <br>
        <div style="width: 100%;height: 250px; overflow: auto;">
            <table width="70%" border="1" class="tabla" id="tabla" align="center">
                <thead>
                    <tr>
                        <th width="20%"><div align="center"><strong>Plan</strong></div></th>
                        <th width="25%"><div align="center"><strong>Proyecto</strong></div></th>
                        <th width="20%"><div align="center"><strong>Fase</strong></div></th>
                        <th width="15%"><div align="center"><strong>Seguimiento</strong></div></th>
                    </tr>
                </thead>
                <tbody id="cuerpoResumen">
                    <%for (HashMap resumEntre : proyecto.getResumenSegui()) {%>
                    <tr>
                        <td><div align="center"><%=resumEntre.get("nompl")%></div></td>
                        <td><div align="center"><%=resumEntre.get("nompr")%></div></td>
                        <td><div align="center"><%=resumEntre.get("nomfase")%></div></td>
                        <td><div align="center"><a id='verSegui' href='MenuSeguimiento?idp=<%=resumEntre.get("id")%>&nombre=<%=resumEntre.get("nomfase")%>-<%=resumEntre.get("nompr")%>'>Ver Seguimiento</a></div></td>
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