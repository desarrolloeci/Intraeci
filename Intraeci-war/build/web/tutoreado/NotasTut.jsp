<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<% response.setHeader("Cache-Control", "no-cache");
            String carnet = request.getParameter("carnet");
            PrintWriter oout = response.getWriter();
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
            Vector period = profesor.getConsultaPeriodos(carnet);
            Vector datos = profesor.datosEst(carnet);%>
<html>
    <head>
        <title>Servicios Académicos - Consulta de Notas Consejerias</title>
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
                            <td>
                                Nombre: <%=datos.elementAt(0)%>
                            </td>
                            <td>
                                Programa: <%=datos.elementAt(1)%>
                            </td>
                            <td>
                                Estado: <%=datos.elementAt(4)%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Semestre: <%=datos.elementAt(3)%>
                            </td>
                            <td>
                                Plan de estudios: <%=datos.elementAt(2)%>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                            <br>
                    <table width="100%" border="0" align="center"  class="textocom">
                        <tr>
                            <td valign="top">
                                <fieldset>
                                    <font color="#336699" face="Verdana, Arial, Helvetica, sans-serif" >
                                        <center><legend><font color="#666666" size="2"><b>Consulta
                                                        de Notas</b></font></legend>
                                            <b><font size="2">Seleccione el periodo académico a consultar:</font></b>
                                        </center>
                                    </font>
                                    <form name="form1" method="post" action="ConsultNotasTut?carnet=<%=carnet%>">
                                        <center>
                                            <select name="periodo">
                                                <option value="PA">Consulta Periodo Actual</option>
                                                <!--option value="2007-I">Consulta Periodo Actual</option-->
                                                <% for (int j = 0; j < period.size(); j++) {
                                                                Vector periodos = (Vector) period.elementAt(j);
                                                %>

                                                <option value="<%=periodos.elementAt(0)%>">Período <%=periodos.elementAt(0)%></option>
                                                <%}%>
                                            </select>
                                        </center>
                                        <br>
                                        <div align="center">
                                            <input type="submit" name="Submit" value=" Consultar " size="2" class="boton">
                                        </div>
                                    </form>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" height="12">
                                <div align="center">
                                    <jsp:include page="piepag">
                                        <jsp:param name="anterior" value="Tutor" />
                                    </jsp:include>
                                </div>
                            </td>

                        </tr>
                    </table>
            </tr>
           
        </table>
         </div>
    </body>
</html>