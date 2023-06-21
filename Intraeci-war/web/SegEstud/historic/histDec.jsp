<%-- 
    Document   : histDec
    Created on : 4/03/2016, 04:19:17 PM
    Author     : Mario Mart�nez
--%>

<%@page contentType="application/vnd.ms-excel" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Vector, java.text.SimpleDateFormat, java.util.Calendar"%>

<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Connection", "close");

    session = request.getSession(false);
    String usuario = (String) session.getAttribute("usuario");

    if (!(usuario != null && !usuario.equals(""))) {
        response.sendRedirect("cerrar?msg=4");
    }
    
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();

    if (admin == null) {
        response.sendRedirect("cerrar?msg=4");
    }

    login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");

    if (empleado == null) {
        response.sendRedirect("cerrar?msg=4");
    }

    int idDpto = (Integer) session.getAttribute("departamento");
    String codEmp = empleado.getIdemp();
    String perAcad = empleado.getPeriodo();

    /* Codigo para sacar el tipo de empleado y enviarlo a la consulta, dentro de la forma como se arma la consulta 
     * se definen los perfiles dependiendo del tipo (las consultas que puede ver y las que no).
     * Sin embargo, si se llegan a crear m�s tipos de empleados, se debe crear una tabla, y definir sobre esta tabla
     * el ID del tipo, su nombre, y definir qu� otros tipos puede leer.
     */
    int rolEmp = 0;
    Vector access = (Vector) admin.getSegEstEmpAdmitido(codEmp).elementAt(0);
    if (Integer.parseInt((String) access.elementAt(0)) > 0) rolEmp = Integer.parseInt((String) access.elementAt(2));

    Vector ret = admin.getHistConsultasDecCompl(idDpto, perAcad, rolEmp);
    
    if (ret.size() <= 0) {
        response.setHeader("Content-Type", "text/html");
        %>
            <script>
                alert('No se han encontrado consultas.');
                window.close();
            </script>
        <%
        return;
    }
    
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd h mm a");
    Calendar today = Calendar.getInstance();
    
    df.setTimeZone(today.getTimeZone());
    
    String tDate = df.format(today.getTime());
    
    response.setHeader("Content-Type", "application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment; filename=\"Hist�rico de Consultas - " + tDate + ".xls\"");
%>

<table border="1">
    <thead>
        <tr>
            <th>Fecha</th>
            <th>Profesor</th>
            <th>Estudiante</th>
            <th>Carn�</th>
            <th>Programa</th>
            <th>Semestre</th>
            <th>Tipo</th>
            <th>Asignatura</th>
            <th>Remitido</th>
            <th>Tem�tica</th>
            <th>Observaciones</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (int i = 0; i < ret.size(); i++) {
                Vector linea = (Vector) ret.elementAt(i);
        %>
        <tr>
            <td><%=linea.elementAt(0).toString()%></td>
            <td><%=linea.elementAt(1).toString()%></td>
            <td><%=linea.elementAt(2).toString()%></td>
            <td><%=linea.elementAt(3).toString()%></td>
            <td><%=linea.elementAt(4).toString()%></td>
            <td><%=linea.elementAt(5).toString()%></td>
            <td><%=linea.elementAt(6).toString()%></td>
            <td><%=linea.elementAt(7).toString()%></td>
            <td><%=linea.elementAt(8).toString()%></td>
            <td><%=linea.elementAt(9).toString()%></td>
            <td><%=linea.elementAt(10).toString()%></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
