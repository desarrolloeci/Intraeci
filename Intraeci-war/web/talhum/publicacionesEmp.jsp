<%-- 
    Document   : publicacionesEmp
    Created on : 02-dic-2019, 10:13:11
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
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    EmpleadoRemote emp = conEjb.lookupEmpleadoRemote();
    try{
        emp.inicializar(request.getParameter("cod_emp").toString().trim());
    }
    catch (Exception ex){
        emp.inicializar(((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getIdemp());
    }
    session.setAttribute("emp", emp );
    HashMap datos = emp.datosGenerales() ;
    String id_emp=(String) datos.get("cod_emp");
    HashMap[] publicaciones= emp.getPublicacionesERP(id_emp);
%>
<html>
    <head>
        <title>Publicaciones</title>
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
                %>alert("La información de publicación fue guardada satisfactoriamente.");<%
            }else if(respuesta!=null && respuesta.equals("0")){
                %>alert("Hubo un error al intentar registrar su información, revise los datos ingresados");<%
            }
        %>
            function EliminarPublicacion(publicacion){
              document.location.href = '${pageContext.request.contextPath}/EliminarPublicacion?cod_emp='+<%=id_emp%>+'&publicacion='+document.getElementById(publicacion).innerHTML;
              
                    
                }
        </script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondoblanco.gif">
        <form name="publicaciones" method="post" action="PublicacionesEmpleado">
            <table border="1" class="tabla" id="tabla1" align="center" width="70%">
                <thead>
                    <th colspan="10"><div align="center"><strong>Publicaciones del Empleado</strong></div></th>
                </thead>
                <tr>
                    <td><strong>Descripción de la Publicación</strong></td>
                </tr>
            <%
                for (HashMap pub : publicaciones) {
                    int cont =0;
                    String publicacion=pub.get("publicacion").toString();
                    %>
                    <tr>
                        <td><textarea disabled="" id="<%=cont%>"><%=publicacion%></textarea> <button type="button" onclick="EliminarPublicacion(<%=cont%>);" >Eliminar</button></td>
                    </tr>
                    <%
                    cont=cont+1;
                }
            %>
                <tr>
                    <th colspan="10"><div align="center"><strong>Nueva Publicación</strong></div></th>
                </tr>
                <tr>
                    <td colspan="4"><strong>Descripción de la Publicación</strong></td>
                </tr>
                <tr>
                    <input type="hidden" name="cod_emp" id="cod_emp" value="<%=id_emp%>"/>
                    <td colspan="4"><textarea style="width: 90%" name="publicacion" id="publicacion" required=""></textarea></td>
                </tr>
                 <tr>
                     <td colspan="4">
                        Formato de publicaciones:   (por favor siga este formato, utilice el carácter / para separar los datos de la publicación esto es indispensable para la adecuada visualización de la misma).
                        <br><br>
                        <strong><i>Titulo de la publicación/Editorial o publicador/año de publicación o ISBN</i></strong>
                    </td>
                </tr>
            </table>
            <input type="submit" name="guarda_pub" id="guarda_exp" value="Guardar Publicación"/>
            <br>
            <input type="button" name="volver" id="volver" onclick="window.close()" value="Volver"/>
        </form>
    </body>
</html>
