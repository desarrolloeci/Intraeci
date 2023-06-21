<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
javax.rmi.PortableRemoteObject,
login.InicioProfRemoteBusiness,
login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%
response.setHeader("Cache-Control","no-cache");
String  IdEst = request.getParameter("carnet");
String spar, color;
PrintWriter oout = response.getWriter() ;
inicio.conectaEJB conEjb = new inicio.conectaEJB();
BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
            int indice, linea, sem, tmp, par, n;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Doble Plan de estudios</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
        <link rel="stylesheet" href="css/comun.css" type="text/css" />
        <script language="JavaScript" type="text/JavaScript">
            <!--
        function openPop(pagename){
            window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=350,width=550')
        }
            //-->
        </script>
    </head>
    <body id="public">
        <div id="container">
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td>
                    
                    <jsp:include page="encabezado" flush="true">
                        <jsp:param name="anterior" value="menuServEstud" />
                    </jsp:include>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Plan de Estudios</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        <table border="1" cellspacing="0" width="100%" class="tabla">
        <tr> 
                        <%
            Vector plan = profesor.despDoblePlan(IdEst);
            int lon = plan.size();
            Vector Detalleplan = (Vector) plan.elementAt(1);
            if (plan.size() <= 0) {
                out.println("No hay datos en la consulta");
            } else {
                for (indice = 1; indice <= 10; indice++) {
                    out.println("<td>" + (new Integer(indice)).toString() + "</td>");

                }
                linea = 0;
                sem = 11;
                for (indice = 0; indice < plan.size(); indice++) {
                    Vector Detalle = (Vector) plan.elementAt(indice);
                    tmp = (new Integer((String) Detalle.elementAt(2))).intValue();
                    if (linea != tmp) {
                        for (; sem <= 10; sem++) {
                            out.println("<td> &nbsp</td>");
                        }
                        out.println("</tr><tr>");
                        linea = tmp;
                        sem = 1;
                    }
                    tmp = (new Integer((String) Detalle.elementAt(3))).intValue();
                    String ident = ((String) Detalle.elementAt(0));
                    for (; sem < tmp; sem++) {
                        out.println("<td>&nbsp</td>");
                    }
                    Vector idasig = profesor.despidasig(IdEst, ident, 2);
                    int longi = idasig.size();
                    color = new String("#000000");
                    spar = new String("3");
                    if (longi > 0) {
                        color = new String("#009933");
                    } else {
                        Vector asig = profesor.despidasig(IdEst, ident,2);
                        int longitud = asig.size();
                        if (longitud > 0) {
                            spar = new String("4");
                            color = new String("#3366FF");
                        }
                    }
                    out.println("<td><B><a href=\"JavaScript:openPop('prerreplan?ident=" + ident + "&spar=" + spar + "' " + ") " + "\" > <font color=\"" + color + "\">" + Detalle.elementAt(1) + "</font></B></td>");
                    sem++;
                }
                for (; sem <= 10; sem++) {
                    out.println("<td> &nbsp</td>");
                }
                out.println("</tr></table><br>");
            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td><div class="info" align="center">
                            &nbsp;
                        </div>
                        <div align="center" class="piepag">Escuela Colombiana de Ingeniería Julio Garavito
                <br>
                AK.45 No.205-59 (Autopista Norte) / Contact center: +57(1) 668 3600 / Línea Nacional Gratuita: 018000112668<br>
                Bogotá - Colombia
                    </div></td>
                </tr>
                <tr>
                    <td bgcolor="#EEEEEE"><img src="img/bottom.gif" alt="" width="770" height="10" id="bottom" /></td>
                </tr>
            </table>
        </div><!--container-->
    </body>
</html>
