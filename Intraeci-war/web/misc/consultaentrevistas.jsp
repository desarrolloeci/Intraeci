<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject, 
         login.InicioProfRemoteBusiness, 
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
    HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    PrintWriter aout = response.getWriter();
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    Vector entrevista = profesor.getentrevista(empleado.getDocumProf(), empleado.getPerHorario());
%>


<html>
    <head>
        <title>Consulta Entrevistas Posgrado</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">     
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico"> 
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function impresion(){
            document.getElementById("tablaboton").style.visibility='hidden';
            window.print();
            window.close();
            }
            -->
        </script>
        <style type="text/css">
            <!--
            a  { text-decoration: none }
            .texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

            -->
        </style>
    </head>

    <body bgcolor="#FFFFFF" text="#000000">
 <div class="container">
           
            <p class="textocom">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
        <table width="819" border="0" cellpadding="0" align="center" cellspacing="0" class="textoimpre">
            <tr> 
                <td width="8" height="42"></td>
                <td width="564" height="42"> 
                    <table width="100%" border="0" align="center" class="textoimpre">
                        <tr> 
                            <td width="52%" height="33" align="left" valign="top"> 
                                <div align="left"></div>
                                <div align="left"><b>ESCUELA 
                                        COLOMBIANA DE INGENIERIA<br>
                                        Servicios a Profesores - Entrevistas</b></div></td>
                            <td width="48%" align="left" valign="top"><table width="100%" border="0" id="tablaboton">
                                   
                                </table></td>
                        </tr>
                        <tr> 
                            <td height="6" colspan="2"> 
                                <div><b>Nombre: 
                                        &nbsp;<%=empleado.getNomProf()%> </b></div>
                            </td>
                        </tr>
                        <tr>             
                            <td colspan="2" align="center" valign="top">
                                <%if ((entrevista.size()) > 0) {%>
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" class="textoimpre">
                                    <tr bgcolor="#E2E2E2"> 
                                        <td width="46%"><div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#666666">Estudiante</font></b></div></td>
                                        <td width="12%"><div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#666666">Fecha 
                                                    de <br>
                                                    Entrevista</font></b></div></td>
                                        <td width="12%"><div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#666666">Hora 
                                                    </font></b></div></td>
                                        <td width="30%"><div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="#666666">Lugar</font></b></div></td>
                                    </tr>
                                    <%for (int j = 0; j < entrevista.size(); j++) {
                                            Vector datosentrev = (Vector) entrevista.elementAt(j);
                                    %>
                                    <tr> 
                                        <td width="46%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=datosentrev.elementAt(3)%></font></td>
                                        <td width="12%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=datosentrev.elementAt(1)%></font></td>
                                        <td width="12%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=datosentrev.elementAt(2)%></font></td>
                                        <td width="30%"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=datosentrev.elementAt(4)%></font></td>
                                    </tr>
                                    <%}%>
                                     <tr>
                                        <td width="20%">
                                            <div align="right">
                                                <input name="imprimir" type="submit" id="imprimir3" value="Imprimir" class="boton" onClick="impresion()">
                                            </div>
                                        </td>
                                        <td width="20%"><div align="right">
                                                <input type="submit" name="Submit2" value="Cerrar" onClick="javascript: window.close();" class="boton">
                                            </div></td>
                                    </tr>
                                </table>
                                <br>
                                <%} else {%>

                                <p><b> <font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif">Usted 
                                        no tiene informaci&oacute;n registrada para este proceso</font></b>              <br>&nbsp;
                                        <%}%>
                            </td>
                        </tr>
                        <tr> 
                            <td colspan="2" valign="top"> 
                                <div align="right"></div>
                                <div align="right"> 

                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <!--<tr> 
               <td width="8"><img src="img/abaIzq.gif" width="24" height="24"></td>
               <td width="564" valign="bottom"><img src="img/punto.gif" width="564" height="2.5"></td>
               <td width="8"><img src="img/abaDer.gif" width="24" height="24"></td>
             </tr>-->
        </table>
 <div align="center">
                            <jsp:include page="piepag">
                                <jsp:param name="anterior" value="Menu" />
                            </jsp:include>
                        </div>
 </div>
    </body>
</html>

