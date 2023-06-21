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
    emp.inicializar(((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getIdemp());
    session.setAttribute("emp", emp );
    HashMap datos = emp.datosGenerales() ;
    String id_emp=(String) datos.get("cod_emp");
    HashMap[] experienciaEmp = emp.getExperienciaEmpleadoERP(id_emp);
    HashMap[] areasExpERP = emp.getAreasExpERP();
    HashMap[] tiemposExpERP= emp.getTiemposExpERP();
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
                %>alert("La información de experiencia fue guardada satisfactoriamente.");<%
            }else if(respuesta!=null && respuesta.equals("0")){
                %>alert("Hubo un error al intentar registrar su información, revise los datos ingresados");<%
            }
        %>
        </script>
        <script type="text/javascript">
            function validaDatos(){
                var nombre_empresa=document.getElementById("nombre_empresa").value;
                var cargo=document.getElementById("cargo").value;
                var area_exp=document.getElementById("area_exp").value;
                var des_fun=document.getElementById("des_fun").value;
                var tpo_exp=document.getElementById("tpo_exp").value;
                var mot_ret=document.getElementById("mot_ret").value;
                var nom_jef=document.getElementById("nom_jef").value;
                var tel=document.getElementById("tel").value;
                var fec_in=document.getElementById("fec_in").value;
                var fec_out=document.getElementById("fec_out").value;
                
                if(nombre_empresa.length===0){
                    alert("El Nombre de Empresa no puede ser vacío");
                    return false;
                }else if(nombre_empresa.length>150){
                    alert("El Nombre de Empresa no puede superar los 150 caracteres");
                    return false;
                }else if(cargo.length===0){
                    alert("El Cargo no puede ser vacío");
                    return false;
                }else if(cargo.length>150){
                    alert("El Cargo no puede superar los 150 caracteres");
                    return false;
                }else if(des_fun.length===0){
                    alert("La Descripción de Funciones no puede ser vacía");
                    return false;
                }else if(nom_jef.length===0){
                    alert("El Nombre del Jefe no puede ser vacío");
                    return false;
                }else if(nom_jef.length>100){
                    alert("El Nombre del Jefe no puede superar los 100 caracteres");
                    return false;
                }else if(tel.length===0){
                    alert("El Número de Teléfono no puede ser vacío");
                    return false;
                }else if(tel.length>15){
                    alert("El Número de Teléfono no puede superar los 15 carateres");
                    return false;
                }
                return true;
            }
              function EliminarExperiencia(nom_empr){
              document.location.href = '${pageContext.request.contextPath}/EliminarExperiencia?cod_emp='+<%=id_emp%>+'&nom_empr='+nom_empr;
              
                    
                }
        </script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondoblanco.gif">
        <form name="experiencia" method="post" action="GuardarExperienciaLaboralERP">
            <table border="1" class="tabla" id="tabla1" align="center" width="70%">
                <thead>
                    <th colspan="10"><div align="center"><strong>Experiencia Empleados</strong></div></th>
                </thead>
                <tr>
                    <td><strong>Nombre de la empresa</strong></td>
                    <td><strong>Cargo</strong></td>
                    <td><strong>Área</strong></td>
                    <td><strong>Funciones</strong></td>
                    <td><strong>Duración</strong></td>
                    <td><strong>Motivo del Retiro</strong></td>
                    <td><strong>Nombre del Jefe</strong></td>
                    <td><strong>Teléfono</strong></td>
                    <td><strong>Fecha de Ingreso</strong></td>
                    <td><strong>Fecha de Terminación</strong></td>
                     <td><strong>Eliminar</strong></td>
                </tr>
            <%
                for (HashMap exp : experienciaEmp) {
                    %>
                    <tr>
                        <td><%=exp.get("nombre_empresa")%></td>
                        <td><%=exp.get("nombre_cargo")%></td>
                        <td><%=exp.get("area_experiencia")%></td>
                        <td><%=exp.get("descripcion_funciones")%></td>
                        <td><%=exp.get("duracion")%></td>
                        <td><%=exp.get("motivo_retiro")%></td>
                        <td><%=exp.get("jefe")%></td>
                        <td><%=exp.get("telefono")%></td>
                        <td><%=exp.get("ingreso")%></td>
                        <td><%=exp.get("terminacion")%></td>
                        <td><button type="button" onclick="EliminarExperiencia('<%=exp.get("nombre_empresa")%>');" >Eliminar</button> </td>
                    </tr>
                    <%
                }
            %>
                <tr>
                    <th colspan="10"><div align="center"><strong>Nueva Experiencia</strong></div></th>
                </tr>
                <tr>
                    <td><strong>Nombre de la empresa</strong></td>
                    <td><strong>Cargo</strong></td>
                    <td><strong>Área</strong></td>
                    <td><strong>Funciones</strong></td>
                    <td><strong>Duración</strong></td>
                    <td><strong>Motivo del Retiro</strong></td>
                    <td><strong>Nombre del Jefe</strong></td>
                    <td><strong>Teléfono</strong></td>
                    <td><strong>Fecha de Ingreso</strong></td>
                    <td><strong>Fecha de Terminación</strong></td>
                </tr>
                <tr>
                    <input type="hidden" name="cod_emp" id="cod_emp" value="<%=id_emp%>"/>
                    <td><input type="text" name="nombre_empresa" id="nombre_empresa" required="" pattern="[0-9a-zA-Z ]{1,500}"/></td>
                    <td><input type="text" name="cargo" id="cargo" required="" pattern="[0-9a-zA-Z ]{1,500}"/></td>
                    <td>
                        <select name="area_exp" id="area_exp">
                            <%
                            for (HashMap area : areasExpERP) {  
                            %>
                            <option value="<%=area.get("codigo")%>"><%=area.get("descripcion")%></option>
                            <%
                            }
                            %>
                        </select>
                    </td>
                    <td><textarea name="des_fun" id="des_fun" required=""></textarea></td>
                    <td>
                        <select name="tpo_exp" id="tpo_exp">
                            <%
                            for (HashMap tpo : tiemposExpERP) {  
                            %>
                            <option value="<%=tpo.get("codigo")%>"><%=tpo.get("descripcion")%></option>
                            <%
                            }
                            %>
                        </select>
                    </td>
                    <td><textarea name="mot_ret" id="mot_ret" required=""></textarea></td>
                    <td><input type="text" name="nom_jef" id="nom_jef" required=""/></td>
                    <td><input type="tel" name="tel" id="tel" required=""/></td>
                    <td><input type="date" name="fec_in" id="fec_in" required=""/></td>
                    <td><input type="date" name="fec_out" id="fec_out" required=""/></td>
                </tr>
            </table>
            <input type="submit" name="guarda_exp" id="guarda_exp" value="Guardar Experiencia"/>
            <br>
            <input type="button" name="volver" id="volver" onclick="window.close()" value="Volver"/>
        </form>
    </body>
</html>
