<%-- 
    Document   : RespuestaInscripcion
    Created on : 9/05/2012, 12:08:59 PM
    Author     : lrodriguez
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
            PrintWriter oout = response.getWriter();
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
            BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
            String nombres = request.getParameter("nombres");
          //  String apellido1 = request.getParameter("ape");
            String doc = request.getParameter("doc");
            String medio = "";
            String cupo = "";
            String apellido = "";
            String apellido2 = "";

            int med1 = 0;
            int respuesta = 0;
            String vinculo = request.getParameter("vinculo");
            String id_evento = "";

            if (doc.equals("")) {
                doc = empleado.getIdemp();
                vinculo = "EMP";
            } else if (!doc.equals("")) {
                doc = empleado.getIdemp();
            }


            Vector dato = new Vector();

            String token[] = new String[500];
            int p = 0;
            String[] checEli;
            checEli = request.getParameterValues("medio");
            int longChec = checEli.length;
            for (int i = 0; i < longChec; i++) {

                StringTokenizer st = new StringTokenizer(checEli[i], "-");
                int k = 0;
                while (st.hasMoreTokens()) {
                    token[k] = st.nextToken();
                    k = k + 1;

                }
                medio = token[0];
                cupo = token[1];
            }

            String token1[] = new String[500];
            int y = 0;
            String[] checEli1;
            checEli1 = request.getParameterValues("ape");
            int longChec1 = checEli1.length;
            for (int i = 0; i < longChec1; i++) {

                StringTokenizer st = new StringTokenizer(checEli1[i], " ");
                int k = 0;
                while (st.hasMoreTokens()) {
                    token1[k] = st.nextToken();
                    k = k + 1;

                }
                apellido = token1[0];
                apellido2 = token1[1];
            }

            Vector cupos = admin.CuposEventos(medio);
            String datoc = cupos.elementAt(0).toString();
            int total = Integer.parseInt(datoc);
            int total1 = Integer.parseInt(cupo);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Inscripción cursos Periodo intermedio</title>
         <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
    </head>
    <body>
        <div class="container">
            <p class="textocom" align="center">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>

        <% if (total < total1) {
                        int med = Integer.parseInt(medio);
                        Vector verifica = admin.VerificaEventos(medio, doc);
                        if (verifica.size() == 0) {
                            respuesta = admin.InscribeEvento(medio, doc, nombres, apellido,apellido2, vinculo);
                        }
        %>
        <%if (respuesta > 0) {%>
        <center>Su solicitud de inscripción al curso ha sido realizada.</center>
        <%} else {%>
        <center>Usted ya se encuentra inscrito a este curso.</center>
        <%}
         } else {%>
        <center>No hay cupo disponible.</center>
        <%}%>
        <table width="100%" border="0" id="tablaboton" align="center">
            <tr>
                <td>
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="Inscripcion" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
        </div>
    </body>
</html>
