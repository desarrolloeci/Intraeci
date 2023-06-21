<%-- 
    Document   : Informe
    Created on : 8/08/2016, 02:46:48 PM
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
    HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    PrintWriter oout = response.getWriter();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    String carnet = request.getParameter("carnet");
    String periodo = empleado.getTercio();
    String idasig = request.getParameter("idasig");
    String peri = request.getParameter("per");
    String tercio = request.getParameter("tercio");
    String idgrupo = request.getParameter("idgrupo");
    String codg = request.getParameter("codg");
    String nota = request.getParameter("nota");
    String falla = request.getParameter("falla");
    String nombre = request.getParameter("nombre");
    String nomasig = request.getParameter("nomasig");
    String codasig = request.getParameter("codasig");
    String programa = new String();
    Vector datosEst = profesor.datosEst(carnet);
    int per = Integer.valueOf(periodo).intValue();
    int tipo = 2;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Informe - Tutores</title>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <script language="JavaScript" type="text/JavaScript">

            function enviarexcel(){
            document.formulario.action = "InformeExcel?formato=excel";
            return true;
            }

        </script>

    </head>
    <body>
        <div class="container">
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
            <form name="formulario" method="post" action="" onsubmit="return enviarexcel();">
                <input type="hidden" name="docu" value="<%=empleado.getDocumProf()%>">
                <input type="hidden" name="peri" value="<%=empleado.getPerHorario()%>">
                <input type="hidden" name="carnet" value="<%=carnet%>">
                <input type="hidden" name="peri" value="<%=peri%>">
                <input type="hidden" name="idasig" value="0">
                <input type="hidden" name="idgrupo" value="0">
                <input type="hidden" name="tercio" value="0">
                <input type="hidden" name="codg" value="0">
                <input type="hidden" name="nota" value="<%=nota%>">
                <input type="hidden" name="falla" value="<%=falla%>">
                <input type="hidden" name="nomasig" value="<%=nomasig%>">
                <input type="hidden" name="codasig" value="<%=codasig%>">
                <br>

                <p>&nbsp;</p>
                <center><input type="submit" name="Submit5" value="Exportar Listado a Excel" class="boton"></center>
                <table width="819" border="1" align="center" class="textoimpre">
                    <tr>
                        <td width="120"><b>ESTUDIANTE</b></td>
                        <td width="36"><b>CARNE</b></td>
                        <td width="42"><b>EMAIL</b></td>
                        <td width="45"><b>PROG</b></td>
                        <td width="224"><b>OBSERVACION</b></td>
                        <td width="33"><b>TERCIO</b></td>
                        <td width="50"><b>ASIG.</b></td>
                        <td width="50"><b>NOTA1</b></td>
                        <td width="50"><b>NOTA2</b></td>
                        <td width="50"><b>NOTA3</b></td>
                        <td width="50"><b>NOTA_LAB</b></td>
                        <td width="50"><b>NOTA5</b></td>
                        
                    </tr>
                    <%Vector datos = profesor.InformeAconsejados(empleado.getPerHorario(), empleado.getIdProf());
                        for (int n = 0; n < datos.size(); n++) {
                            Vector campo = (Vector) datos.elementAt(n);%>

                    <tr>
                        <td width="120"><%=campo.elementAt(1)%></td>
                        <td width="36"><%=campo.elementAt(0)%></td>
                         <td width="42"><%=campo.elementAt(13)%>@mail.escuelaing.edu.co</td>
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
                        <td width="224"><%=campo.elementAt(2)%></td>
                        <td width="33"><%=campo.elementAt(3)%></td>
                        <td width="50"><%=campo.elementAt(5)%></td>
                        <td width="50">
                            <% if (campo.elementAt(7).equals("No disponible") || campo.elementAt(7).equals("0")) {%>
                            &nbsp;
                            <% } else {%>
                            <%=campo.elementAt(7)%>
                            <%}%></td>
                        <td width="50">
                            <% if (campo.elementAt(8).equals("No disponible") || campo.elementAt(8).equals("0")) {%>
                            &nbsp;
                            <% } else {%>
                            <%=campo.elementAt(8)%> <%}%></td>

                        <td width="50">
                            <% if (campo.elementAt(9).equals("No disponible") || campo.elementAt(9).equals("0")) {%>
                            &nbsp;
                            <% } else {%>
                            <%=campo.elementAt(9)%><%}%></td>

                        <td width="50">
                            <% if (campo.elementAt(11).equals("No disponible") || campo.elementAt(11).equals("0")) {%>
                            &nbsp;
                            <% } else {%>
                            <%=campo.elementAt(11)%><%}%></td>

                        <td width="50">
                            <% if (campo.elementAt(10).equals("No disponible") || campo.elementAt(10).equals("0")) {%>
                            &nbsp;
                            <% } else {%>
                            <%=campo.elementAt(10)%><%}%></td>

                    </tr>
                    <%}%>
                </table>
            </form>

        </div>
    </body>
</html>