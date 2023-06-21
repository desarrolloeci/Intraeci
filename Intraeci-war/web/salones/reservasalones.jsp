<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject, 
         login.InicioProfRemoteBusiness, 
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<%
    response.setHeader("Cache-Control", "no-cache");
    //Fecha actual
    String error = request.getParameter("error");
    String fecuso = new String(""), dia = new String(""), capac = new String(""),
            descr = new String(""), msj = new String(""), ndia = new String("");
    if (error != null) {
        if (error.equals("formaerror")) {
            fecuso = new String((String) session.getAttribute("fecuso"));
            ndia = new String((String) session.getAttribute("ndia"));
            dia = new String((String) session.getAttribute("dia"));
            capac = new String((String) session.getAttribute("capac"));
            descr = new String((String) session.getAttribute("descr"));
            msj = "No existen recursos disponibles para esta solicitud<br>modifíquela y envíela nuevamente";
        }
    }

    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
    Date currentTime_1 = new Date();
    String dateString = formatter.format(currentTime_1);
    //Secuencia de solicitud de reserva de salon
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    //DESCOMENTAR CUANDO INICIE PERIODO 2018-2
    String periodo=empleado.getPerHorario();
    //String periodo="2018-2";
    Vector asignaturas = profesor.getAsignaturas(periodo, empleado.getIdProf());
    String sec = admin.getSecuencia();
    session = request.getSession(true);
    session.setAttribute("sec", sec);
%>

<html>
    <head>
        <title>Solicitud de Salones</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            <!--
            #fecha {
                font-family: Verdana, Arial, Helvetica, sans-serif;
                font-size: 12px;
                color: #990000;
                font-weight: bold;
            }

            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
            .texto {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

            -->
        </style>
        <script language="JavaScript" src="jscript/solsalones.js"></script>
        <script language="JavaScript" src="jscript/calendario.js"></script>
        <script language="JavaScript" src="jscript/overlib_mini.js"></script>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
    </head>
    <body  onLoad="preloadImg()">
        <div class="container">
         <p class="textocom">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
        <table width="819" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
            <tr>             
                <td align="center" valign="top">
                    <form name="form1" method="post" action="reservas" onSubmit="return comprueba();" >
                        <input type="hidden" name="ndia" value="<%=ndia%>">
                        <font color="#990000" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><%=msj%>
                        </strong></font>           
                        <table width="90%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                            <tr> 
                                <td colspan="2"><b><font size="2">N&uacute;mero: 
                                        <font color="#990000"><%=sec%></font></font> </b></td>
                                <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fecha 
                                        actual:</b> 
                                    <script>fecha()</script>
                                    </font></td>
                            </tr>
                            <tr> 
                                <td width="23%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fecha 
                                        Utilizaci&oacute;n:</b> </font></td>
                                <td width="20%"> 
                                    <input type="text" name="fecha" size="14" maxlength="10" onfocus="this.blur()" class="campotext" value="<%=fecuso%>">
                                    <a href="javascript:show_calendar('form1.fecha'); document.form1.fecha.focus();" onMouseOver="window.status = 'Elige fecha';
            overlib('Pulsa para elegir la fecha de solicitud de reserva.');
            return true;" onMouseOut="window.status = '';
            doIt();
            return true;"> 
                                        <img src="img/calendar.gif" width=16 height=16 border=0></a></td>
                                <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>D&iacute;a 
                                        utilizaci&oacute;n: 
                                       <input type="text" name="dia" size="9" maxlength="9" onfocus="this.blur()" class="campotext" value="<%=dia%>">
                                    </b> 
                                    <script>
                                        
                                        function doIt() {
                                        var cad = document.form1.fecha.value; 
                                        var i;
                                        var aux1="";
                                        var ja = new Array(); 
                                        ja = cad.split("-"); 
                                        //var dia =parseInt(ja[1]) - 1;
                                        var dia = ja[1]-1;						
                                        var fechaAux = new Date(ja[2], dia, ja[0]);						
                                        aux1 = Dia_semana(fechaAux.getDay());		
                                        //var dia = parseInt(fechaAux.getDay()) +  1;
                                        var dia = parseInt(fechaAux.getDay());
                                        document.form1.dia.value=aux1;												
                                        document.form1.ndia.value=dia;
                                        //document.write (Dia_semana(fechaAux.getDay()) )						
                                        }
                                        
                                    </script>
                                    </font>
                                </td>
                            </tr>
                            <% //CAMBIAR ESTE PERIODO CADA AÑO EL DIA SIGUENTE AL ULTIMO DIA DE CLASES DEL PERIODO ACTUAL (SOLO INTERSEMESTRAL)
                                if (periodo.equals("2018-I")) {%>
                            <tr> 
                                <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Hora :</b> 
                                    <input type="radio" name="hora" value="700">700 
                                    <input type="radio" name="hora" value="800">800 
                                    <input type="radio" name="hora" value="900">900 
                                    <input type="radio" name="hora" value="1000">1000 
                                    <input type="radio" name="hora" value="1100">1100 
                                    <input type="radio" name="hora" value="1200">1200 
                                    <input type="radio" name="hora" value="1300">1300 
                                    <input type="radio" name="hora" value="1400">1400 
                                    <input type="radio" name="hora" value="150">1500 
                                    <input type="radio" name="hora" value="1600">1600 
                                    <input type="radio" name="hora" value="1700">1700
                                    <input type="radio" name="hora" value="1800">1800 
                                    </font>
                                </td>
                            </tr>                          
                            <tr>
                                <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#B70404">Si 
                                    desea realizar una reserva para un bloque de clase seleccione 
                                    la hora final:</font></td>
                            </tr>
                            <tr> 
                                <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Hora 
                                        final:</b> 
                                    <input type="radio" name="horafin" value="900">900 
                                    <input type="radio" name="horafin" value="1000">1000 
                                    <input type="radio" name="horafin" value="1100">1100 
                                    <input type="radio" name="horafin" value="1200">1200 
                                    <input type="radio" name="horafin" value="1300">1300 
                                    <input type="radio" name="horafin" value="1400">1400 
                                    <input type="radio" name="horafin" value="1500">1500
                                    <input type="radio" name="horafin" value="1600">1600 
                                    <input type="radio" name="horafin" value="1700">1700
                                    <input type="radio" name="horafin" value="1800">1800 
                                    <input type="radio" name="horafin" value="1900">1900 
                                    </font>
                                </td>
                            </tr>

                            <% } else {%>
                            <tr> 
                                <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Hora :</b> 
                                    <input type="radio" name="hora" value="700">700 
                                    <input type="radio" name="hora" value="830">830 
                                    <input type="radio" name="hora" value="1000">1000 
                                    <input type="radio" name="hora" value="1130">1130 
                                    <input type="radio" name="hora" value="1300">1300 
                                    <input type="radio" name="hora" value="1430">1430 
                                    <input type="radio" name="hora" value="1600">1600 
                                    <input type="radio" name="hora" value="1730">1730</font>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#B70404">Si 
                                    desea realizar una reserva para un bloque de clase seleccione 
                                    la hora final:</font></td>
                            </tr>
                            <tr> 
                                <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Hora 
                                        final:</b> 
                                    <input type="radio" name="horafin" value="1000">1000 
                                    <input type="radio" name="horafin" value="1130">1130 
                                    <input type="radio" name="horafin" value="1300">1300 
                                    <input type="radio" name="horafin" value="1430">1430 
                                    <input type="radio" name="horafin" value="1600">1600 
                                    <input type="radio" name="horafin" value="1730">1730 
                                    <input type="radio" name="horafin" value="1900">1900 </font>
                                </td>
                            </tr>

                            
                            <%}%>
                            <tr> 
                                <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" color="#CC0000"><b><font size="2">Caracter&iacute;sticas</font></b></font></td>
                            </tr>
                            <tr> 
                                
              <td colspan="2"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                </font></td>
                                <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Tipo 
                                        de uso:</b> </font> </td>
                            </tr>
                            <tr> 
                                
              <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="caracteris" value="R" class="campotext" checked>
                Audio (videobeam, PC, Red) </font></td>
              
                                <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                    <input type="radio" name="tipo" value="C">
                                    Clase 
                                    <input type="radio" name="tipo" value="R">
                                    Reuni&oacute;n 
                                    <input type="radio" name="tipo" value="M">
                                    Monitor&iacute;a 
                                    <input type="radio" name="tipo" value="T">
                                    Taller</font></td>
                            </tr>
                            <tr> 
                                
              <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                </font></td>
                                <td width="57%" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                    <b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Asignatura 
                                        - Grupo:</font></b> 
                                    <select name="idgrupo" size="1" align="center"  class="campotext">
                                        <option value="N" selected><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Seleccione</font></option>
                                        <%
                                            for (int i = 0; i < asignaturas.size(); i++) {
                                                Vector asignatura = (Vector) asignaturas.elementAt(i);
                                        %>
                                        <option value="<%=asignatura.elementAt(1)%>-<%=asignatura.elementAt(2)%>-<%=asignatura.elementAt(4)%>"> 
                                        <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=asignatura.elementAt(0)%> 
                                        - <%=asignatura.elementAt(1)%></font></option>
                                        <%
                                            }
                                        %>
                                        <option value="0-0-0"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Otra</font></option>
                                    </select>
                                    </font></td>
                            </tr>
                            <tr> 
                                
              <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                </font></td>
                                <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Capacidad: 
                                        <input type="text" name="capacidad" size="4" maxlength="4"  class="campotext"  value="<%=capac%>">
                                    </b> </font></td>
                            </tr>
                            <tr> 
                                
              <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                </font></td>
                                <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Observaciones:</b> 
                                    <b> 
                                        <input type="text" name="observ" size="20" maxlength="70" class="campotext" value="<%=descr%>">
                                    </b> </font></td>
                            </tr>
                            <tr> 
                                <td colspan="2">&nbsp;</td>
                                <td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></td>
                            </tr>
                            <tr> 
                                <td colspan="2">&nbsp;</td>
                                <td width="57%">&nbsp;</td>
                            </tr>
                            <tr> 
                                <td colspan="3"> 
                                    <div align="center"> 
                                        <input type="submit" name="Submit" value="Solicitar Reserva" class="boton">
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>	
                </td>
            </tr>
            <tr>
                <td>
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="SolicitudSalones" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
        <div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>	 
        <p>&nbsp;</p>
        </div>
        </body>
</html>

