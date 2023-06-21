<%-- 
    Document   : EliminacursoVice
    Created on : 3/08/2015, 03:36:55 PM
    Author     : Lucero
--%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,java.text.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter aout = response.getWriter();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date currentTime_1 = new Date();
        String dateString = formatter.format(currentTime_1);
        Date hoy = formatter.parse(dateString);
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        String curso = request.getParameter("curso");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Curso periodo intermedio</title>
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
        
        <table width="819" border="0" align="center">
            <tr>
                <td width="86%" height="41" align="center" valign="top"> <br>
                    <% 	String token[] = new String[500];
        int p = 0;
        /*   String checEli="";
        checEli = request.getParameter("checEli");

        if (!checEli.equals("null")) {
        p = 1;
        admin.eliminaCurso(checEli);
        } else {
        p = 0;
        }*/
        String[] checEli;
        checEli = request.getParameterValues("checEli");
        int longChec = checEli.length;
        for (int i = 0; i < longChec; i++) {
            if (checEli[i].compareTo("null") != 0) {
                StringTokenizer st = new StringTokenizer(checEli[i], "*");
                int k = 0;
                while (st.hasMoreTokens()) {
                    token[k] = st.nextToken();
                    k = k + 1;

                }
                p = 1;
                admin.eliminaCurso(token[0], empleado.getIdemp());
            } else {
                p = 0;
            }
        }

                    %>
                    <% if (p == 1) {%>
                    <form name=form1>
                        <input type="hidden" name="fecuso" value=<%=checEli%>>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                            <tr>
                                <td>
                                    <div align="center">
                                        <p>Usted ha cancelado la inscripción al curso:<b><!%=empleado.getNomemp()%></b>
                                        <b><%=token[1]%>.</b>
 <br>
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </form>
                    <%} else {%>
                    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><i><b>La solicitud de cancelación de inscripción al curso no fué realizada.</b></i></font></p>
                    <%}%>
                    <br>
                </td>
            </tr>
            <tr>
                <td>
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="InscritoVice" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
    <p>&nbsp;</p>
         </div>
         </body>
</html>


