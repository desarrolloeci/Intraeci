<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
        response.setHeader("Cache-Control", "no-cache");
        String nombre = "";
        PrintWriter aout = response.getWriter();
//Profesor prof = new Profesor(IdProf) ;getIdProf
        if (empleado.getIdProf().equals("")) {
            nombre = empleado.getNomemp();
        } else {
            nombre = empleado.getNomProf();
        }
//Fecha actual
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        Date currentTime_1 = new Date();
        String dateString = formatter.format(currentTime_1);
%>
<html>
<head>
    <title>Reservas</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <style type="text/css">
        a:hover{color:#3366CC; }
        a{color: blue;}
        a:link, a:visited { text-decoration: none }
    </style>
    <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
    <link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<body background="img/fondo.gif" onLoad="preloadImg()">
<jsp:include page="encabezado">
    <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
    <jsp:param name="doblenc" value="inicio" />
    <jsp:param name="titulo" value="Solicitud de reserva de salones" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
<tr class="textocom">
<td height="22"> 
<div align="center">
<br>
<form name="formulario" method="post" action="">
<table width="161" border="0" class="textocom">
<tr>
<td width="155" height="25">
<div align="left"><strong><a href="ReservarSalones"><font size="2">1.
Solicitar reserva</font></font></a></strong></div></td>    
</tr>
<tr>
    <td height="25"><div align="left"><strong><a href="CancelarReserva?cancons=cancelar"><font size="2">2. Cancelar reserva</font></a><font size="3">
    </font></strong></div></td>
</tr>
<tr>
    <td height="25"><div align="left"><strong><a href="CancelarReserva?cancons=consulta"><font size="2">3. Consultar reserva</font></a></strong></div></td>
</tr><tr>
    <td height="25"><div align="left"><strong><a href="ReservaAuditorio"><font size="2">4.
    Reservar Auditorio</font></a></strong></div></td>
</tr>
<tr>
    <td height="25"><div align="left"><strong><a href="" onclick="window.open('documentos/comunicado.pdf','','width=800,height=600, toolbar=yes,scrollbars=yes,location=yes,directories=yes,status=yes,menubar=yes,resizable=yes');return false"><font size="2">5. Leer Instructivo</font></a></strong></div></td>
</tr>
</table>
</form>
</div></td>
</tr>
<tr>
    <td>
        <div align="right">
            <jsp:include page="piepag">
                <jsp:param name="anterior" value="Menu" />
            </jsp:include>
        </div>
    </td>
</tr>
</table>

<p>&nbsp;</p></body>
</html>

