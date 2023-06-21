<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, javax.rmi.PortableRemoteObject, login.InicioProfRemoteBusiness, login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
    <head>
        <%
            HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
            String mensaje = "";
            Vector tutoreado = profesor.gettutoreados(empleado.getPerHorario(), empleado.getIdProf());%>
        <!-- Vector tutoreado = profesor.gettutoreados("2012-1", empleado.getIdProf()); -->

        <title>Listas Consejerias</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function impresion(){
            document.getElementById("tablaboton").style.visibility='hidden';
            window.print();
            window.close();
            }

            function openPop(pagename){
            window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=450,width=650')
            }

            -->
        </script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
    </head>
    <body>
        <div class="container">

            <p class="textocom">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
            <%if (tutoreado.size() > 0) {%>


            <form action="Informe">
                <center>  <input type="submit" name="Submit5" align="center" value="GENERAR INFORME CONSEJERIAS" class="boton"></center>
            </form>
            <br>
            <br>
            <table width="819" border="0" align="center" cellspacing="0" class="textocom">
                <tr>
                    <td height="22">
                        <table width="819" border="1" align="center"  class="textoimpre">
                            <tr>

                                <td width="8%">
                                    <div align="center">Foto</div></td>

                                <td width="6%"> 
                                    <div align="center">Carnet</div>
                                </td>

                                <td width="7%"> 
                                    <div align="center">Nombre</div>
                                </td>

                                <td width="20%"> 
                                    <div align="center">Email</div>
                                </td>

                                <td width="24%"> 
                                    <div align="center">Acudiente</div>
                                </td>
                                <td colspan="3">
                                    <div align="center">Opción</div>
                                </td>

                            </tr>
                            <%for (int n = 0; n < tutoreado.size(); n++) {
                                    Vector campo = (Vector) tutoreado.elementAt(n);%>
                            <tr>
                                <!%if (campo.elementAt(7).equals("2015-1")  || campo.elementAt(7).equals("2014-1")|| campo.elementAt(7).equals("2014-2") ){%>

                                <!--http://copernico.escuelaing.edu.co/segestudiantes/Estudiantes/-->

                                <td width="8%"><img src="http://tycho.escuelaing.edu.co/contenido/seguimiento/<%=campo.elementAt(1)%>_Foto.jpg" width="50" height="50"  align="right"> 
                                </td>

                                <!%} else {%>
                                 <!--td width="10%"><img src="http://tycho.escuelaing.edu.co/contenido/seguimiento/<%=campo.elementAt(1)%>.jpg" width="50" height="50"  align="right"> </td-->
                                <!%}%>

                                <td width="6%"> 
                                    <div align="center"><%=campo.elementAt(1)%></div>
                                </td>



                                <td width="7%"> 
                                    <div align="center"><a href="Historia?carnet=<%=campo.elementAt(1)%>"><%=campo.elementAt(3)%></a></div>
                                </td>

                                <td width="20%"> 
                                    <div align="center"><a href="mailto:<%=campo.elementAt(8)%>@mail.escuelaing.edu.co"><%=campo.elementAt(8)%>@mail.escuelaing.edu.co</a></div>
                                </td>

                                <td width="24%"> 
                                    <div align="center"><%=campo.elementAt(5)%><br>Tel: <%=campo.elementAt(6)%></div>
                                </td>

                                <td width="8%"> 
                                    <div align="center"><a href="Notastut?carnet=<%=campo.elementAt(1)%>">Notas</a></div>
                                </td>

                                <td width="9%"> 
                                    <div align="center"><a href="Semaforo?carnet=<%=campo.elementAt(1)%>">Sem&aacute;foro</a></div>
                                </td>
                                <!% if (campo.elementAt(4).equals("15")) {%>


                                <td width="9%"> 
                                    <div align="center"><a href="ObservaTutores?carnet=<%=campo.elementAt(1)%>&nombre=<%=campo.elementAt(3)%>">Observaciones</a></div>
                                </td>

                                <!--  <td>
                                      <div align="center"><a href="JavaScript:openPop('Preinscripcion?carnet=<!%=campo.elementAt(1)%>&nombre=<!%=campo.elementAt(3)%>&mensaje=<!%=mensaje%> ')">Preinscripción</a></div>
                                  </td>-->
                                <!%}%>
                            </tr>

                            <%}%>

                        </table>
                    </td>
                </tr>

                <%} else
                        out.println("<center><b>No se encontraron registrados asignados</b></center>");
                %>
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
        </div>
    </body>
</html>