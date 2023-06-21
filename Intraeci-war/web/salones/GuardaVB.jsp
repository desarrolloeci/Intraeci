<%-- 
    Document   : GuardaVB
    Created on : 25/08/2017, 09:48:33 AM
    Author     : lucero.rodriguez
--%>

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
    int datosVB=0;
    if (empleado.getIdProf().equals("")) {
        nombre = empleado.getNomemp();
    } else {
        nombre = empleado.getNomProf();
    }
//Fecha actual
    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
    Date currentTime_1 = new Date();
    String dateString = formatter.format(currentTime_1);
    HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    Vector horario = profesor.getHorarioVideoBeam(empleado.getIdProf(), empleado.getPerHorario());

    String valor;
    String cadena = new String("video");
    for (int i = 0; i < horario.size(); i++) {

        valor = String.valueOf(i);
        String variable = (String) cadena.concat(valor);
        String dato = request.getParameter(variable);
        String texto[] = new String[20];
        StringTokenizer st = new StringTokenizer(dato, "-");
        int t = 0;
        while (st.hasMoreTokens()) {
            texto[t] = st.nextToken();
            t = t + 1;
        }

        String uso = texto[0];
        String idsal = texto[1];
        datosVB = profesor.UsoVideoBeam(uso, idsal);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Solicitud Video Beam</title>
    </head>
    <body>
    <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>

        <%if (datosVB > 0) {%>
    <center> La información ha sido guardatos en nuestra Base de datos</center>
        <%} else {%>
    <center> La información no pudo ser guardada en nuestra Base de datos</center>
        <%}%>
    <div align="center">
    <table>
                <tr>
                    <td colspan="4"> 
                        <div align="center">
                            <jsp:include page="piepag"> 
                                <jsp:param name="anterior" value="Menu" />
                            </jsp:include>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

</body>
</html>
