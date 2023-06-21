<%-- 
    Document   : InformeExcel
    Created on : 9/08/2016, 04:51:46 PM
    Author     : Lucero
--%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%

    response.setHeader("Cache-Control", "no-cache");
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    String carnet = request.getParameter("carnet");
    String periodo = empleado.getTercio();
    String programa = new String();
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment; filename=\"InformeConsejerias.xls\"");

%>

<table width="750" border="1" align="center" class="textoimpre">
    <tr>
        <td width="110">ESTUDIANTE</td>
        <td width="36">CARNE</td>
        <td width="36">EMAIL</td>
        <td width="45">PROG</td>
        <td width="196">OBSERVACION</td>
        <td width="23">TERCIO</td>
        <td width="50">ASIG.</td>
        <td width="50">NOTA1</td>
        <td width="50">NOTA2</td>
        <td width="50">NOTA3</td>
        <td width="50">NOTA_LAB</td>
        <td width="50">NOTA5</td>
    </tr>
    <%Vector datos = profesor.InformeAconsejados(empleado.getPerHorario(), empleado.getIdProf());
        for (int n = 0; n < datos.size(); n++) {
            Vector campo = (Vector) datos.elementAt(n);%>

    <tr>
        <td width="110"><%=campo.elementAt(1)%></td>
        <td width="36"><%=campo.elementAt(0)%></td>
        <td width="36"><%=campo.elementAt(13)%>@mail.escuelaing.edu.co</td>
        <%if (campo.elementAt(12).equals("15")) {
                programa = "ISIS";
            }
            if (campo.elementAt(12).equals("13")) {
                programa = "ICIV";
            }
            if (campo.elementAt(12).equals("14")) {
                programa = "IELE";
            }
            if (campo.elementAt(12).equals("16")) {
                programa = "IIND";
            }
            if (campo.elementAt(12).equals("17")) {
                programa = "IELC";
            }
            if (campo.elementAt(12).equals("18")) {
                programa = "ECON";
            }
            if (campo.elementAt(12).equals("19")) {
                programa = "ADMI";
            }
            if (campo.elementAt(12).equals("20")) {
                programa = "MATE";
            }
            if (campo.elementAt(12).equals("260")) {
                programa = "IMEC";
            }
            if (campo.elementAt(12).equals("262")) {
                programa = "IBIO";
            }%>
        <td width="45"><%=programa%></td>
        <td width="196"><%=campo.elementAt(2)%></td>
        <td width="33"><%=campo.elementAt(3)%></td>
        <td width="50"><%=campo.elementAt(5)%></td>
        <td width="52"><%=campo.elementAt(7)%></td>
        <td width="52"><%=campo.elementAt(8)%></td>
        <td width="52"><%=campo.elementAt(9)%></td>
        <td width="52"><%=campo.elementAt(11)%></td>
        <td width="52"><%=campo.elementAt(10)%></td>

    </tr>
    <%}%>
</table>
