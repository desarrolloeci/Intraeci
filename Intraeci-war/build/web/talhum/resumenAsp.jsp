<%-- 
    Document   : Resumen de aspirantes de una convocatoria
    Created on : 12/07/2016, 09:36:00 AM
    Author     : Mario Martínez
--%>

<%@page import="BDintraeci.EmpleadoRemote, java.util.HashMap, java.util.Calendar, java.text.SimpleDateFormat"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Connection", "close");
    response.setCharacterEncoding("ISO-8859-1");
    
    HttpSession sesion = request.getSession(false);
     
    if (sesion == null) {
        %>
            <script>
                alert("El usuario no está autenticado o su sesión ha finalizado.");
                window.location = 'http://www.escuelaing.edu.co';
            </script>
        <%
        return;
    }
    
    EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");

    if (emp == null) {
        %>
            <script>
                alert("El usuario no está autenticado o su sesión ha finalizado.");
                window.location = 'http://www.escuelaing.edu.co';
            </script>
        <%
        return;
    }
    
    String idConv = request.getParameter("idconv");
    
    boolean isAdmin = emp.IsAdmConvoca() == 1?true:false;
    
    boolean isPermisos = emp.IsPermisosConvoca(idConv) == 1?true:false;
    
    if (!isPermisos && !isAdmin) {
        %>
            <script>
                alert("Usted no está autorizado para obtener este resumen.");
                window.history.back();
            </script>
        <%
        return;
    }
    
    HashMap[] infos = emp.resumenAspirantes(idConv);
    
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd h mm a");
    Calendar today = Calendar.getInstance();
    
    df.setTimeZone(today.getTimeZone());
    
    String tDate = df.format(today.getTime());
    
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment; filename=\"Resumen de aspirantes - Convocatoria No. " + idConv + " - " + tDate + ".xls\"");
%>
<table>
    <tr>
        <td style="background: #C0504D; color: #FFFFFF; font-weight: bold; width: 270px;">Aspirante</td>
        <td style="background: #C0504D; color: #FFFFFF; font-weight: bold; width: 126px;">Teléfono</td>
        <td style="background: #C0504D; color: #FFFFFF; font-weight: bold; width: 126px;">Celular</td>
        <td style="background: #C0504D; color: #FFFFFF; font-weight: bold; width: 217px;">Email</td>
        <td style="background: #C0504D; color: #FFFFFF; font-weight: bold; width: 105px;">Idiomas</td>
        <td style="background: #C0504D; color: #FFFFFF; font-weight: bold; width: 633px;">Estudios</td>
        <td style="background: #C0504D; color: #FFFFFF; font-weight: bold; width: 707px;">Experiencia Laboral</td>
        <td style="background: #C0504D; color: #FFFFFF; font-weight: bold; width: 917px;">Publicaciones</td>
    </tr>
    <%
        for (HashMap info: infos) {
    %>
    <tr>
        <td style="border: 1px solid #E0E0E0; border-bottom: 1px solid #C0504D; border-top: 0px; vertical-align: top;"><%=info.get("Aspirante")%></td>
        <td style="border: 1px solid #E0E0E0; border-bottom: 1px solid #C0504D; border-top: 0px; vertical-align: top;"><%=info.get("Telefono")%></td>
        <td style="border: 1px solid #E0E0E0; border-bottom: 1px solid #C0504D; border-top: 0px; vertical-align: top;"><%=info.get("Celular")%></td>
        <td style="border: 1px solid #E0E0E0; border-bottom: 1px solid #C0504D; border-top: 0px; vertical-align: top;"><%=info.get("Email")%></td>
        <td style="border: 1px solid #E0E0E0; border-bottom: 1px solid #C0504D; border-top: 0px; vertical-align: top;"><%=((String) info.get("Idiomas")).replace("[salto]", "<br style=\"mso-data-placement: same-cell;\" />")%></td>
        <td style="border: 1px solid #E0E0E0; border-bottom: 1px solid #C0504D; border-top: 0px; vertical-align: top;"><%=((String) info.get("Estudios")).replace("[salto]", "<br style=\"mso-data-placement: same-cell;\" />")%></td>
        <td style="border: 1px solid #E0E0E0; border-bottom: 1px solid #C0504D; border-top: 0px; vertical-align: top;"><%=((String) info.get("Experiencia Laboral")).replace("[salto]", "<br style=\"mso-data-placement: same-cell;\" />")%></td>
        <td style="border: 1px solid #E0E0E0; border-bottom: 1px solid #C0504D; border-top: 0px; vertical-align: top;"><%=((String) info.get("Publicaciones")).replace("[salto]", "<br style=\"mso-data-placement: same-cell;\" />")%></td>
    </tr>
    <%
        }
    %>
</table>