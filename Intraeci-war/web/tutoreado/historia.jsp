<%-- 
    Document   : historia
    Created on : 24/04/2012, 08:51:48 AM
    Author     : lrodriguez
--%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%
        response.setHeader("Cache-Control", "no-cache");
//	String nombre = new String((String)session.getAttribute("nombre"));
        String carnet = request.getParameter("carnet");
//String ban = new String((String)session.getAttribute("ban"));
        PrintWriter oout = response.getWriter();
//        Estudiante est = new Estudiante(carnet,oout) ;
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        Vector period = profesor.getConsultaPeriodos(carnet);
        Vector datos = profesor.datosEst(carnet);
        Vector historia = profesor.Historia(carnet);
        String perAnt = "_", color = "black";
%>


<html>
<head>
    <title>Servicios Académicos - Información Académica</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link href="css/comun.css" rel="stylesheet" type="text/css">
    <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
    
</head>
<body bgcolor="#FFFFFF" text="#000000">
    <div class="container">
<table width="640" border="0" cellpadding="0" align="center" cellspacing="0"  class="textocom">
    <tr>
    <td width="640" valign="top">
    <jsp:include page="encabezado" flush="true">
        <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
        <jsp:param name="doblenc" value="inicio" />
       <jsp:param name="headerImg" value="banner.jpg" />
    </jsp:include>
      <table width="100%" border="0" align="center"  class="textocom">
        <tr> 
          <td> Nombre: <%=datos.elementAt(0)%> </td>
          <td> Programa: <%=datos.elementAt(1)%> </td>
          <td> Estado: <%=datos.elementAt(4)%> </td>
        </tr>
        <tr> 
          <td>Semestre: <%=datos.elementAt(3)%> </td>
          <td>Plan de estudios: <%=datos.elementAt(2)%> </td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>Correo: <%=datos.elementAt(8)%></td>
          <td>Celular: <%=datos.elementAt(9)%></td>
          <td>Tel_Res: <%=datos.elementAt(10)%></td>
        </tr>
        <tr> 
          <td>Clasificaci&oacute;n: <%=datos.elementAt(11)%> </td>
          <td>Colegio: <%=datos.elementAt(19)%> </td>
          <td>Ciudad:  <%=datos.elementAt(20)%></td>
        </tr>
        <tr> 
          <td>Matem&aacute;ticas: <%=datos.elementAt(15)%></td>
          <td>Lenguaje: <%=datos.elementAt(14)%></td>
          <td>F&iacute;sica: <%=datos.elementAt(12)%></td>
        </tr>
        <tr>
          <td>Filosof&iacute;a: <%=datos.elementAt(13)%></td>
          <td>Qu&iacute;mica: <%=datos.elementAt(16)%></td>
          <td>Biolog&iacute;a: <%=datos.elementAt(18)%></td>
        </tr>
       <tr>
          <td>Per.Ing: <%=datos.elementAt(21)%></td>
          <td>Carga máx: <%=datos.elementAt(22)%></td>
          <td></td>
        </tr>
      </table>
</table>
<p>&nbsp;</p>
<table width="100%" border="1" align="center"  class="textocom">
    <tr>
        <td><b>Periodo</b></td>
        <td><b>Anotaci&oacute;n</b></td>
        <td><b>Asignatura</b></td>
        <td><b>Nota Def.</b></td>
        <td><b>NP1</b></td>
        <td><b>NP2</b></td>
        <td><b>NP3</b></td>
        <td><b>NP4</b></td>
        <td><b>NP5</b></td>
    </tr>
    <% 
    for (int i = 0; i < historia.size(); i++) {
            Vector dato = (Vector) historia.elementAt(i);
            if (!dato.elementAt(0).toString().equals(perAnt)){
                perAnt = dato.elementAt(0).toString();%>
                <tr>
    <td  colspan="9"><hr size="2"></td>
  </tr>
                <%
            }%>
    <tr>
        <td><%=dato.elementAt(0)%></td>
        <% if (dato.elementAt(1).equals("No disponible") || (dato.elementAt(1).equals("                    "))) {%>
        <td>&nbsp;</td>
        <%} else {%>
        <td><%=dato.elementAt(1)%></td>
        <%}%>
        <td><%=dato.elementAt(2)%></td>
         <%if (dato.elementAt(3).equals("No disponible")) {%>
        <td>No.Disp</td>
        <%} else {%>
        <td><%=dato.elementAt(3)%></td>
         <%}%>
        <%if (dato.elementAt(4).equals("No disponible")) {%>
        <td>No.Disp</td>
        <%} else {%>
        <td><%=dato.elementAt(4)%></td>
        <%}%>
        <%if (dato.elementAt(5).equals("No disponible")) {%>
        <td>No.Disp</td>
        <%} else {%>
        <td><%=dato.elementAt(5)%></td>
        <%}%>
        <%if (dato.elementAt(6).equals("No disponible")) {%>
        <td>No.Disp</td>
        <%} else {%>
        <td><%=dato.elementAt(6)%></td>
        <%}%>
        <%if (dato.elementAt(7).equals("No disponible")) {%>
        <td>No.Disp</td>
        <%} else {%>
        <td><%=dato.elementAt(7)%></td>
        <%}%>
        <%if (dato.elementAt(8).equals("No disponible")) {%>
        <td>No.Disp</td>
        <%} else {%>

        <td><%=dato.elementAt(8)%></td>
    </tr>
    <%}
        }%>
</table>
<table width="100%">
    <tr>
    <td>
        <div align="center">
            <jsp:include page="piepag">
                <jsp:param name="anterior" value="Tutor" />
            </jsp:include>
        </div>
    </td>
</table>
<p>&nbsp;</p>
    </div>
</body>
</html>