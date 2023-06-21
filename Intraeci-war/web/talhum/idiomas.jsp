<%-- 
    Document   : idiomas
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
    emp.inicializar(((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getIdemp());
    session.setAttribute("emp", emp );
    HashMap datos = emp.datosGenerales() ;
    String id_emp=(String) datos.get("cod_emp");
    HashMap[] idiomasERP = emp.getIdiomasERP();
    HashMap[] califiIdiomasErp = emp.getCalifIdiomasERP();
    HashMap[] habilIdiomasErp = emp.getHabilIdiomasERP();
    
    HashMap[] idiomasEmp = emp.getIdiomasEmpERP(id_emp);
    
%>
<html>
    <head>
        <title>Hoja de Vida Personal</title>
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
        <%
            if(respuesta!=null && respuesta.equals("1")){
                %>alert("La información de idioma fue guardada satisfactoriamente.");<%
            }else if(respuesta!=null && respuesta.equals("0")){
                %>alert("Hubo un error al intentar registrar su información, revise los datos ingresados");<%
            }
        %>
        </script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondoblanco.gif">
        <form name="idiomas" method="post" action="GuardaIdiomaERP">
            <table border="1" class="tabla" id="tabla1" align="center" width="70%">
                <thead>
                    <th colspan="10"><div align="center"><strong>Idiomas Empleado</strong></div></th>
                </thead>
                <tr>
                    <td><strong>Idioma</strong></td>
                    <td><strong>Calificación en el Idioma</strong></td>
                    <td><strong>Habilidad en el Idioma</strong></td>
                </tr>
            <%
                for (HashMap idi : idiomasEmp) {
                    String descIdioma="";
                    String califIdioma="";
                    String habiliIdioma="";
                    for (HashMap idiERP : idiomasERP) {
                        if(idiERP.get("cod_idi").equals(idi.get("cod_idi"))){
                            descIdioma=(String) idiERP.get("nom_idi");
                        }
                    }
                    for (HashMap calidiERP : califiIdiomasErp) {
                        if(calidiERP.get("cod_calif").equals(idi.get("cod_calif"))){
                            califIdioma=(String) calidiERP.get("Txt_Calif");
                        }
                    }
                    for (HashMap habidiERP : habilIdiomasErp) {
                        if(habidiERP.get("Cod_habilidad").equals(idi.get("cod_hab"))){
                            habiliIdioma=(String) habidiERP.get("Des_habilidad");
                        }
                    }


                    %>
                    <tr>
                        <td><%=descIdioma%></td>
                        <td><%=califIdioma%></td>
                        <td><%=habiliIdioma%></td>
                    </tr>
                    <%
                }
            %>
                <tr>
                    <th colspan="10"><div align="center"><strong>Nuevo Idioma</strong></div></th>
                </tr>
                <tr>
                    <td><strong>Idioma</strong></td>
                    <td><strong>Calificación en el Idioma</strong></td>
                    <td><strong>Habilidad en el Idioma</strong></td>
                </tr>
                <tr>
                    <td>
                        <select name="cod_idi" id="cod_idi" required="">
                            <option value="">Seleccione</option>
                            <%
                            for (HashMap idioma : idiomasERP) {  
                                /**
                                Boolean ya_registrado = false;
                                for (HashMap idiEmp : idiomasEmp) {
                                    if(idioma.get("cod_idi").equals(idiEmp.get("cod_idi"))){
                                        ya_registrado=true;
                                    }
                                }
                                if(!ya_registrado){*/
                                    %>
                                    <option value="<%=idioma.get("cod_idi")%>"><%=idioma.get("nom_idi")%></option>
                                    <%
                                /**}*/
                            }
                            %>
                        </select>
                    </td>
                    <td>
                        <select name="cod_calif" id="cod_calif" required="">
                            <option value="">Seleccione</option>
                            <%
                            for (HashMap calif : califiIdiomasErp) {  
                                %>
                                <option value="<%=calif.get("cod_calif")%>"><%=calif.get("Txt_Calif")%></option>
                                <%
                            }
                            %>
                        </select>
                    </td>
                    <td>
                        <select name="cod_habil" id="cod_habil" required="">
                            <option value="">Seleccione</option>
                            <%
                            for (HashMap habil : habilIdiomasErp) {  
                                %>
                                <option value="<%=habil.get("Cod_habilidad")%>"><%=habil.get("Des_habilidad")%></option>
                                <%
                            }
                            %>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="hidden" id="cod_emp" name="cod_emp" value="<%=id_emp%>"/>
            <input type="submit" name="guarda_idi" id="guarda_idi" value="Guardar Idioma"/>
            <br>
            <input type="button" name="volver" id="volver" onclick="window.close()" value="Volver"/>
        </form>
    </body>
</html>
