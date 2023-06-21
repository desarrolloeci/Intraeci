<%-- 
    Document   : votaciones
    Created on : 24/09/2014, 10:22:53 AM
    Author     : Lucero
--%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
         <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <title>Votaciones Profesores</title>
    </head>
    <body>
       <div class="container">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
             <jsp:param name="headerImg" value="banner.jpg" />
        </jsp:include>
  
<%
            HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
             inicio.conectaEJB conEjb = new inicio.conectaEJB();
             BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
             String indice = request.getParameter("indice");
             String clave="";
             if (false){
              clave = request.getParameter("clavenum");
              if (clave.equals("null") ||  clave.equals("")){
                  out.println("Por favor ingrese su clave numérica para realizar este proceso.");
                  
              } 
              
             }else{
              clave = empleado.getClanum();
             
             }
             
                 
            String idProf = empleado.getDocumProf();
                  
            Vector datos = profesor.desptarjeton(idProf);
            if (datos.size() > 0) {

            String vcd = ((String) datos.elementAt(0));
            String vca = ((String) datos.elementAt(1));
            String clavenum = ((String) datos.elementAt(4));
            String nombre = ((String) datos.elementAt(2));
            if (false) {%>
             <center>
            Su clave de registro no corresponde, o usted no ingresó su clave numérica. Por favor verifique e intente nuevamente.
             </center>
             <table width="819" border="0" align="center" cellspacing="0">
                  <tr>
                <td>
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="Menu" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
 </table>
            <%} else if (datos.size() <= 0) {
                out.println("<div align=\"center\"><strong><font color=\"#666666\" size=\"2\" face=\"Verdana, Arial, Helvetica, sans-serif\">Usted "
                        + "no puede realizar este proceso o la clave de registro no corresponde haga "
                        + "click <a href=\"http://empleados.escuelaing.edu.co/intraeci/\">AQUI</a> para volver e ingrese nuevamente su clave</font></strong></div>");

            } else {
                 out.println("<font color=\"666666\" size=\"2\" face=\"Verdana, Arial, Helvetica, sans-serif\"><strong><center><font color=\"FFOOOO\"> PROFESOR: </font>" + nombre);
            out.println("</center></strong></font>");
            out.println("<p>");
            out.println("</p>");
            out.println("<br>");
            out.println("<div align=\"center\" >");
                out.println("<table border=\"3\"  bordercolor=\"#B70404\" align=\"center\"  width=\"500\">");
                if (vcd.equals("0")) {
                    out.println("<form  method=\"post\" target=\"_top\" action=\"Tarjeton\" > ");
                    out.println("<INPUT type=\"hidden\" name=\"nomCrp\" value=\"vcd\">");
                    out.println("<INPUT type=\"hidden\" name=\"idCrp\" value=\"119\">");
                    out.println("<INPUT type=\"hidden\" name=\"cedula\" value=\" " + idProf + "\">");
                    out.println("<INPUT type=\"hidden\" name=\"clave\" value=\" " + clave + "\">");
                    out.println("<tr>");
                    out.println("  <td>");
                    out.println("      <p align=\"center\"><input type=\"submit\"  name=\"boton\" value=\"VCD\"  class=\"boton\"></p>");
                    out.println("  </td>");
                    out.println("  <td class=\"textocom\" valign=\"middle\">");
                    out.println("      <strong>CONSEJO DIRECTIVO</strong>");
                    out.println("  </td>");
                    out.println("</tr>");
                    out.println("</form>");
                }
                if (vca.equals("0")) {
                    out.println("<form  method=\"post\" target=\"_top\" action=\"Tarjeton\" > ");
                    out.println("<INPUT type=\"hidden\" name=\"nomCrp\" value=\"vca\">");
                    out.println("<INPUT type=\"hidden\" name=\"idCrp\" value=\"118\">");
                    out.println("<INPUT TYPE=\"hidden\" NAME=\"cedula\" VALUE=\" " + idProf + "\">");
                    out.println("<INPUT type=\"hidden\" name=\"clave\" value=\" " + clave + "\">");
                    out.println("<tr>");
                    out.println("  <td>");
                    out.println("      <p align=\"center\"><input type=\"submit\" name=\"boton\" value=\"VCA\" class=\"boton\"></p>");
                    out.println("  </td>");
                    out.println("  <td class=\"textocom\" valign=\"middle\">");
                    out.println("      <strong>CONSEJO ACADEMICO</strong>");
                    out.println("  </td>");
                    out.println("</tr>");
                    out.println("</form>");
                }
                if ((vcd.equals("1")) && (vca.equals("1"))) {
                   
                    out.println("   <p class=\"textocom\" align=\"center\">Usted ya votó por todos los cuerpos colegiados, muchas gracias por su participación</p>");
                 
                }
                out.println("</table>");
                %>
                <p></p>
 <table width="819" border="0" align="center" cellspacing="0">
                  <tr>
                <td>
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="Menu" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
 </table>

      <%      }
}
%>
       </div>
  </body>
</html

