<%-- 
    Document   : SolicitudVB
    Created on : 17/08/2017, 09:59:05 AM
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
    int contador = horario.size();
%>

<html>
    <head>
        <title>Solicitar Video Beam</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <script>
            function comprueba(contador) {
               for (i = 0; i < contador; i++) {
                    dato = new String("video" + i);
                    if (document.form1[dato].value == "null") {
                        alert("Por favor seleccione si desea o no usar video beam ");
                        document.form1[dato].style.backgroundColor = '#FFA74F';
                        return false;
                    }
                }
            }
        </script>
    </head>
    <body  onLoad="preloadImg()">
        <div class="container">
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
            <br>
            <br>
            <center> Seleccione para cada sesión de clase si requiere o no video beam.</center>
            <br>
            <br>
            <form name="form1"  method="post" action="GuardaVB">
                <div align="center">

                    <table width="70%" border="1" cellspacing="0" cellpadding="0" class="textocommas">
                        <tr> 
                            <td><b>Día</b></td>
                            <td><b>Hora Inicio</b></td>
                            <td><b>Hora Fin</b></td>
                            <td align="center"><b>Requiere Video Beam?</b></td>
                        </tr>


                        <%for (int i = 0; i < horario.size(); i++) {

                                Vector dato = (Vector) horario.elementAt(i);
                                String dia = dato.elementAt(3).toString();
                                String horaini = dato.elementAt(4).toString();
                                String horafin = dato.elementAt(5).toString();
                                String idsalgrupo = dato.elementAt(8).toString();%>
                        <tr> 
                            <td> 
                                <%if (dia.equals("1")) {%>
                                Lunes 
                                <%} else if (dia.equals("2")) {%>
                                Martes 
                                <%} else if (dia.equals("3")) {%>
                                Miércoles 
                                <%} else if (dia.equals("4")) {%>
                                Jueves 
                                <%} else if (dia.equals("5")) {%>
                                Viernes 
                                <%} else if (dia.equals("6")) {%>
                                Sábado 
                                <%}%>
                            </td>
                            <td><%=horaini%></td>
                            <td><%=horafin%></td>
                            <td align="center"> 
                                <select name="video<%=i%>"   class="textocommas">
                                    <option value="null" Selected>Seleccione:</option>
                                    <option value="S-<%=idsalgrupo%>">SI</option>
                                    <option value="N-<%=idsalgrupo%>">NO</option>
                                </select>
                            </td>
                        </tr>

                        <%}%>
                    </table>
                </div>

                <div align="center">
                    <table height="88">
                        <tr>
                            <td colspan="4" height="49"> 
                                <div align="center">
                                    <input type="submit" name="Submit" value=" Enviar " class="textocommas" onclick="return comprueba(<%=contador%>);">
                                </div>
                            </td>
                        </tr>
                    </table>
            </form>
            <div align="center">
                <table
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

        </div>
    </body>
</html>
