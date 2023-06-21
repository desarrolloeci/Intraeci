<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
javax.rmi.PortableRemoteObject, 
login.InicioProfRemoteBusiness, 
login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%  
response.setHeader("Cache-Control","no-cache");
String peraca = request.getParameter("periodo");
String notad;
String carnet = request.getParameter("carnet");
//String ban = new String((String)session.getAttribute("ban"));
String ban="0";
PrintWriter oout = response.getWriter() ;
inicio.conectaEJB conEjb = new inicio.conectaEJB();
BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
Vector notas = profesor.getdespNotas(carnet,peraca);
Vector notasact = profesor.despNotasAct(carnet,empleado.getPeriodo());
Vector datos = profesor.datosEst(carnet);
%>

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
                    
                    <table width="100%" border="0" align="center" class="textocom">
                        
                        <%if ((notas.size()>0) || (notasact.size()>0)){%>
                        <%if (!(peraca.equals("PA"))){%>
                        <% for ( int j = 0 ; j < 1 ; j++ ){
                            Vector notasant = (Vector)notas.elementAt(j) ;
                        %>
                        <tr> 
                           <!-- <td height="6" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" ><b>Pr.
                                    Acum: <font color="#666666"><!%=notasant.elementAt(3)%></font></b>
                                </font>--><br>
                                <!--<font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Pr. 
                                Ult. Sem: <font color="#000000"><!%=notasant.elementAt(4)%></font></b>
            </font><br>-->
                                <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" ><b>Datos 
                                    para el Periodo: <font color="#666666"><%=notasant.elementAt(6)%></font></b> 
                            </font> </td>
                        </tr>
                        <%}%>
                        <%}else{%>
                        <!--else si periodo es actual-->
                        <% for ( int j = 0 ; j < 1 ; j++ ){
                            Vector notasactual = (Vector)notasact.elementAt(j) ;
                        %>
                        <tr> 
                            <td height="38" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" ><b>Pr. 
                                        Acum: <font color="#666666">
                                            <%
                                            if(notasactual.elementAt(3).toString().equals("0E-7") || notasactual.elementAt(3).toString().equals("0E-12"))
                                                out.println(" ---- ");
                                            else
                                                out.println(notasactual.elementAt(3));
                                            %>
                                    </font></b> 
                                </font><br>
                                <!--<font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Pr. 
                                Ult. Sem: <font color="#000000"><%=notasactual.elementAt(4)%></font></b> 
                            </font>--></td>
                        </tr>
                        <%}%>
                        <%}%>
                        <!--fin else-->
                        <%if (!(peraca.equals("PA"))){%>
                        <tr> 
                            <td valign="top"> 
                                <table width="100%" border="1" align="center" bordercolor="#336699" background="img/fondonot.gif">
                                    <tr bgcolor="#336699"> 
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Código</b></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nombre</b></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota</b></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Clave</b></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Observaciones</b></font></div>
                                        </td>
                                    </tr>
                                    <% for ( int j = 0 ; j < notas.size() ; j++ ){
                                        Vector notasant = (Vector)notas.elementAt(j) ;
                                        notad = notasant.elementAt(9).toString();
                                        if (!notasant.elementAt(12).toString().equals("N")){
                                            if (notad.compareTo("3.0") >= 0)
                                                notad = "Aprobado";
                                            else
                                                notad = "No aprobado";
                                        }
                                    
                                    
                                    %>
                                    <tr> 
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasant.elementAt(7)%></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasant.elementAt(8)%></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Cambria, Verdana" size="2"><%=notad%></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;<%=notasant.elementAt(10)%></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasant.elementAt(11)%></font></div>
                                        </td>
                                    </tr>
                                    <%}%>
                                </table>
                            </td>
                        </tr>
                        <%}else{%>
                        <!--cierra if de periodo diferente PA-->
                        <tr> 
                            <td valign="top" >
                                <table width="100%" border="1" align="center" bordercolor="#336699" background="img/fondonot.gif">
                                    <tr bgcolor="#336699"> 
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Código</b></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota 
                                            1</b></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota 
                                            2</b></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota 
                                            3</b></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota 
                                            Lab</b></font></div>
                                        </td>
                                         <td>
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota
                                            5</b></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota</b></font></div>
                                        </td>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Clave</b></font></div>
                                        </td>
                                    </tr>
                                    <% for ( int j = 0 ; j < notasact.size() ; j++ ){
                                        Vector notasactual = (Vector)notasact.elementAt(j) ;%>
                                    <tr> 
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasactual.elementAt(6)%></font></div>
                                        </td>
                                        <%          if (notasactual.elementAt(7).equals("No disponible")){%>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div>
                                        </td>
                                        <%          } else {%>
                                        <td> 
                                            <div align="center"><font face="Cambria, Verdana" size="2"><%=notasactual.elementAt(7)%></font></div>
                                        </td>
                                        <%          }%>
                                        <%          if (notasactual.elementAt(8).equals("No disponible")){%>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div>
                                        </td>
                                        <%          } else {%>
                                        <td> 
                                            <div align="center"><font face="Cambria, Verdana" size="2"><%=notasactual.elementAt(8)%></font></div>
                                        </td>
                                        <%          }%>
                                        <%          if (notasactual.elementAt(9).equals("No disponible")){%>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div>
                                        </td>
                                        <%          } else {%>
                                        <td> 
                                            <div align="center"><font face="Cambria, Verdana" size="2"><%=notasactual.elementAt(9)%></font></div>
                                        </td>
                                        <%          }%>
                                        <%          if (notasactual.elementAt(10).equals("No disponible")){%>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div>
                                        </td>
                                        <%          } else {%>
                                        <td> 
                                            <div align="center"><font face="Cambria, Verdana" size="2"><%=notasactual.elementAt(10)%></font></div>
                                        </td>
                                        <%          }%>

                                         <%          if (notasactual.elementAt(14).equals("No disponible")){%>
                                        <td>
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div>
                                        </td>
                                        <%          } else {%>
                                        <td>
                                            <div align="center"><font face="Cambria, Verdana" size="2"><%=notasactual.elementAt(14)%></font></div>
                                        </td>
                                        <%          }%>


                                        <%          if (notasactual.elementAt(11).equals("No disponible")){%>
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div>
                                        </td>
                                        <%          } else {%>
                                        <td> 
                                            <div align="center"><font face="Cambria, Verdana" size="2"><%=notasactual.elementAt(11)%></font></div>
                                        </td>
                                        <% }%> 				
                                        <td> 
                                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;<%=notasactual.elementAt(12)%></font></div>
                                        </td>
                                        
                                    </tr>
                                    <%}%>
                                </table>
                            </td>
                        </tr>
                        <%}%>
                        <%}else{%>
                        <tr> 
                            <td >&nbsp;</td>
                        </tr>
                        <tr> 
                            <td > 
                                <p><b>NO EXISTEN DATOS PARA ESTE PERIODO</b></p>
                            </td>
                        </tr>
                        <%}%>
                        <tr> 
                            <td >&nbsp;</td>
                        </tr>
                        <tr> 
                            <td ><div align="center" class="texto">
                                    <p><font color="#666666">Este documento
                                            no es v&aacute;lido como certificado
                                            oficial de la Escuela Colombiana de Ingenier&iacute;a<br>
                                    Secretar&iacute;a General</font></p>
                            </div></td>
                        </tr>
                      <tr> 
    <td valign="top" height="12"> 
        <div align="center">	   
            <jsp:include page="piepag">
                <jsp:param name="anterior" value="Tutor" />
            </jsp:include>
        </div>
    </td>
        </table>	
        <p align="center">
            </div>
    </body>
</html>
