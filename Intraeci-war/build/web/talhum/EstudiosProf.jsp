<%-- 
    Document   : experiencia
    Created on : 13-nov-2019, 15:54:49
    Author     : andres.rojas
--%>

<%@page import="java.util.HashMap"%>
<%@page import="BDintraeci.EmpleadoRemote"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ include file="../secure.jsp" %>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache");
    String respuesta=request.getParameter("respuesta");
    String titulo = new String("Sistema de Talento Humano");            
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    EmpleadoRemote emp = conEjb.lookupEmpleadoRemote();
    emp.inicializar(request.getParameter("cod_emp"));
    session.setAttribute("emp", emp );
    HashMap datos = emp.datosGenerales() ;
    String id_emp=(String) datos.get("cod_emp");
    HashMap[] estudiosProf = emp.getEstudiosProfERP(id_emp);
    HashMap[] TiposEstudios = emp.getTiposEstudiosERP();
    HashMap[] Institutos= emp.getInstitutosERP();
%>
<html>
    <head>
        <title>Estudios</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script type="text/javascript" src="jscript/talentohum/empleado.js"></script>
        <script type="text/javascript" src="jscript/talentohum/aspirante.js"></script>
        <script type="text/javascript" src="jscript/talentohum/experiencia.js"></script>
        <script type="text/javascript" src="jscript/talentohum/estudios.js"></script>
        <script type="text/javascript" src="jscript/talentohum/idiomas.js"></script>
        <script type="text/javascript" src="jscript/talentohum/produccion.js"></script>
        <script type="text/javascript" src="jscript/talentohum/terceros.js"></script>
        
        <script type="text/javascript">
              function EliminarEstudioProf(nro_tar){
              document.location.href = '${pageContext.request.contextPath}/EliminarEstudiosProf?cod_emp='+<%=id_emp%>+'&nro_tar='+nro_tar;
              
                    
                }
        </script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondoblanco.gif">
        <form name="experiencia" method="post" action="GuardarEstudiosProfERP">
            <table border="1" class="tabla" id="tabla1" align="center" width="70%">
                <thead>
                    <th colspan="10"><div align="center"><strong>Experiencia Empleados</strong></div></th>
                </thead>
                <tr>
                    <td><strong>Estudio</strong></td>
                    <td><strong>Institución</strong></td>
                    <td><strong>Año de estudio</strong></td>
                    <td><strong>Fecha de grado</strong></td>
                    <td><strong>Tarjeta profesional</strong></td>
                     <td><strong>Eliminar</strong></td>
                </tr>
            <%
                for (HashMap est : estudiosProf) {
                    %>
                    <tr>
                        <td><%=est.get("nom_est")%></td>
                        <td><%=est.get("nom_ins")%></td>
                        <td><%=est.get("ano_est")%></td>
                        <td><%=est.get("fec_gra")%></td>
                        <td><%=est.get("nro_tar")%></td>
                        <td><button type="button" onclick="EliminarEstudioProf('<%=est.get("nro_tar")%>');" >Eliminar</button> </td>
                    </tr>
                    <%
                }
            %>
                <tr>
                    <th colspan="10"><div align="center"><strong>Nueva Experiencia</strong></div></th>
                </tr>
                <tr>
                    <td><strong>Estudio</strong></td>
                    <td><strong>Institución</strong></td>
                    <td><strong>Año de estudio</strong></td>
                    <td><strong>Fecha de grado</strong></td>
                    <td><strong>Tarjeta profesional</strong></td>
                </tr>
                <tr>
                    <input type="hidden" name="cod_emp" id="cod_emp" value="<%=id_emp%>"/>
                    <td><select name="Cboxestudios" id="Cboxestudios" required="" >
                <option value="">Seleccione</option>
                <%
                            for (HashMap estudio : TiposEstudios) {  
                            %>
                            <option value="<%=estudio.get("cod_est")%>"><%=estudio.get("nom_est")%></option>
                            <%
                            }
                            %>
            </select></td>
                    <td><select name="CboxInstituto" id="CboxInstituto" required="" >
                <option value="">Seleccione</option>
                <%
                            for (HashMap instituto : Institutos) {  
                            %>
                            <option value="<%=instituto.get("cod_ins")%>"><%=instituto.get("nom_ins")%></option>
                            <%
                            }
                            %>
            </select></td>
                    <td>
                        <input type="number" min="1000" max="9999" name="TextAno" id="TextAno" required="" />
                    </td>
                    <td> <input type="date" name="Textfecha" id="Textfecha" required="" /></td>
                    <td>
                        <input type="text" name="TextTarjeta" id="TextTarjeta" required="" pattern="[0-9a-zA-Z ]{1,50}"/>
                    </td>
                </tr>
            </table>
            <input type="submit" name="guarda_exp" id="guarda_exp" value="Guardar Estudios"/>
            <br>
            <input type="button" name="volver" id="volver" onclick="window.close()" value="Volver"/>
        </form>
    </body>
</html>
