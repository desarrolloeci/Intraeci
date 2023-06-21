<%-- 
    Document   : RedirectSalonesAlternancia
    Created on : 15-feb-2021, 12:15:36
    Author     : guspi
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
    </head>
    <%
        String usuario=request.getSession().getAttribute("usuario").toString();
    %>
    <body>
        <form name="clasesAlternancia" method="post" id="clasesAlternancia" action="http://10.1.3.131:8080/RegistrarPresencialidad/reporteprofesor.jsp">
            <input type="hidden" value="<%=usuario%>" name="usuario" id="usuario"/>
        </form>
    </body>
    <script>
        document.getElementById("clasesAlternancia").submit();
    </script>
</html>
