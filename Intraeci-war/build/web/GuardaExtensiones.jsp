<%-- 
    Document   : GuardaExtensiones
    Created on : 7/04/2015, 11:50:20 AM
    Author     : Lucero
--%>

<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%@ include file="secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.text.*, java.net.*;" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties,java.lang.reflect.Array " %>
<% HttpSession sesion;

    response.setHeader("Cache-Control", "no-cache");
    session.setAttribute("loginex", empleado.getUsrExchange());
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    String cedula = empleado.getIdemp();
    String nombres = request.getParameter("nombres");
    String centro = request.getParameter("centro");
    String extension = request.getParameter("extension");
    String telefono = request.getParameter("telefono");
    String bloque = request.getParameter("bloque");

    String texto[] = new String[2];
    int i = 0;
    StringTokenizer st = new StringTokenizer(nombres, "-");
    while (st.hasMoreTokens()) {
        texto[i] = st.nextToken();
        i = i + 1;
    }
    String nombre = texto[0];
    String doc = texto[1];
    
    Vector validar = admin.Validaext(nombre, extension);
    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Guardar Extensiones</title>
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="Inscripción a cursos Periodo Intermedio" />
        </jsp:include>
        <%
        if (validar.size()>0){
        out.println("<center>Su nombre y su extensión ya se encuentran en nuestra base de datos.</center>");
    } else {
        int Datos = admin.GuardaExt(usuario, doc, nombre, centro, extension, telefono, bloque);%>
        <h2> 
            <%if (Datos > 0) {%>
            <center> Los datos han sido guardados correctamente</center>
            <br>
            <%} else {%>
            <center>Hubo un error al guardar los datos.  Por vafor verifique que haya ingresado todos los datos requeridos.</center>
            <br>
            <%}
    }%>
        </h2>
    <center>
        <jsp:include page="piepag">
            <jsp:param name="anterior" value="Menu" />
        </jsp:include>
    </center>
</body>
</html>
