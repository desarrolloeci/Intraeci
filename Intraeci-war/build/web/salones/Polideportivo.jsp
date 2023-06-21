<%-- 
    Document   : Polideportivo
    Created on : 20/02/2012, 10:42:14 AM
    Author     : lrodriguez
--%>

<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*, java.util.Date, java.awt.*,java.io.*, java.text.*, java.net.*;" %>

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
    Date d = new Date();
    String horactual = (Integer.toString(d.getHours()));
    //  out.println(horactual);
//Secuencia de solicitud de reserva de salon
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    Vector asignaturas = profesor.getAsignaturas(empleado.getPerHorario(), empleado.getIdProf());
// Vector tarifas = profesor.
    String sec = admin.getSecuencia();
    session = request.getSession(true);
    session.setAttribute("sec", sec);
%>

<html>
    <head>
        <title>Solicitud de Coliseo El Otoño </title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
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

        </style>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="JavaScript" type="text/JavaScript">

            <!--
            function calcula(){
            var caract, caracteris;


            for (var i=0; i<12;i++){
            if (document.forms.form1.hora[i].checked){
            var hora= document.forms.form1.hora[i].value;
            } if (document.forms.form1.horafin[i].checked){
            var horafin=  document.forms.form1.horafin[i].value;
            }

            var horas = (horafin-hora);
            if (horas == 200){
            horas= 2;
            }else{
            horas=1;
            }

            if (document.forms.form1.caracteris[0].checked){
            if (horas == 1){
            document.getElementById("valor").innerHTML= "$24.000";
            document.getElementById("servicio").innerHTML= "Reserva Cancha de Baloncesto";
            } else if (horas ==2){
            document.getElementById("valor").innerHTML= "$48.000";
            document.getElementById("servicio").innerHTML= "Reserva Cancha de Baloncesto";
            } else{
            return true;
            }
            }else if(document.forms.form1.caracteris[1].checked){
            if ( horas == 1){
            document.getElementById("valor").innerHTML= "$12.000";
            document.getElementById("servicio").innerHTML= "Reserva Media Cancha de Baloncesto";
            } else if (horas ==2){
            document.getElementById("valor").innerHTML= "$24.000";
            document.getElementById("servicio").innerHTML= "Reserva Media Cancha de Baloncesto";
            } else{
            return true;
            }
            }else if(document.forms.form1.caracteris[2].checked){

            if (horas == 1){
            document.getElementById("valor").innerHTML= "$12.000";
            document.getElementById("servicio").innerHTML= "Reserva Cancha de Squash";
            } else if (horas ==2){
            document.getElementById("valor").innerHTML= "$24.000";
            document.getElementById("servicio").innerHTML= "Reserva Cancha de Squash";
            } else{
            return true;
            }

            }else if(document.forms.form1.caracteris[3].checked){

            if (horas == 1){
            document.getElementById("valor").innerHTML= "$18.000";
            document.getElementById("servicio").innerHTML= "Reserva Salón de arte";
            } else if (horas ==2){
            document.getElementById("valor").innerHTML= "$36.000";
            document.getElementById("servicio").innerHTML= "Reserva Salón de arte";
            } else{
            return true;
            }

            }else if(document.forms.form1.caracteris[4].checked){

            if (horas == 1){
            document.getElementById("valor").innerHTML= "$24.000";
            document.getElementById("servicio").innerHTML= "Reserva Cancha de voleibol";
            } else if (horas ==2){
            document.getElementById("valor").innerHTML= "$48.000";
            document.getElementById("servicio").innerHTML= "Reserva Cancha de voleibol";
            } else{
            return true;
            }

            }else if(document.forms.form1.caracteris[5].checked){
            if ( horas == 1){
            document.getElementById("valor").innerHTML= "$18.000";
            document.getElementById("servicio").innerHTML= "Reserva salón de espejos";
            } else if (horas ==2){
            document.getElementById("valor").innerHTML= "$36.000";
            document.getElementById("servicio").innerHTML= "Reserva salón de espejos";
            } else{
            return true;
            }

            } else if(document.forms.form1.caracteris[6].checked){

            if (horas == 1){
            document.getElementById("valor").innerHTML= "$5.000";
            document.getElementById("servicio").innerHTML= "Reserva cancha de fútbol sala";
            } else if (horas ==2){
            document.getElementById("valor").innerHTML= "$10.000";
            document.getElementById("servicio").innerHTML= "Reserva cancha de fútbol sala";
            } else{
            return true;
            }

            }else if(document.forms.form1.caracteris[7].checked){
            if (horas == 1){
            document.getElementById("valor").innerHTML= "$18.000";
            document.getElementById("servicio").innerHTML= "Reserva Salas múltiples";
            } else if (horas ==2){
            document.getElementById("valor").innerHTML= "$36.000";
            document.getElementById("servicio").innerHTML= "Reserva Salas múltiples";
            } else{
            return true;
            }

            } else if(document.forms.form1.caracteris[8].checked){
            if (horas == 1){
            document.getElementById("valor").innerHTML= "$5.000";
            document.getElementById("servicio").innerHTML= "Reserva cancha tenis de mesa";
            } else if (horas ==2){
            document.getElementById("valor").innerHTML= "$10.000";
            document.getElementById("servicio").innerHTML= "Reserva cancha tenis de mesa";
            } else{
            return true;
            }

            }

            else{
            return true;
            }

            }

            }

            //    -->
        </script>

        <script language="JavaScript" src="jscript/solpolidep.js"></script>
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
            <form name="form1" method="post" action="reservasPoli" onSubmit="return comprueba();">
                <tr>
                    <td align="center" valign="top">
                        <input type="hidden" name="ndia" value="<%=ndia%>">
                        <input type="hidden" name="capacidad" value="0">
                        <input type="hidden" name="horactual" value="<%=horactual%>">
                        <font color="#990000" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><%=msj%>
                        </strong></font>

                        <table width="90%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                            <tr>
                                <td colspan="2"><b><font size="2">N&uacute;mero: <font color="#990000"><%=sec%></font></font> </b></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fecha
                                        actual:</b>
                                    <script>fecha()</script>
                                    </font></td>
                            </tr>
                            <tr>
                                <td width="23%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fecha
                                        Utilizaci&oacute;n:</b> </font></td>
                                <td width="33%">
                                    <input type="text" name="fecha" size="14" maxlength="10" onfocus="this.blur()" class="campotext" value="<%=fecuso%>">
                                    <a href="javascript:show_calendar('form1.fecha'); document.form1.fecha.focus();" onMouseOver="window.status = 'Elige fecha';
            overlib('Pulsa para elegir la fecha de solicitud de reserva.');
            return true;" onMouseOut="window.status = '';
            nd();
            return true;">
                                        <img src="img/calendar.gif" width=16 height=16 border=0></a></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>D&iacute;a
                                        utilizaci&oacute;n:
                                        <input type="text" name="dia" size="9" maxlength="9" onfocus="this.blur()" class="campotext" value="<%=dia%>">
                                    </b>
                                    <script>
                                        <!--
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
                                        -->


                                    </script>
                                    </font> </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Tipo
                                            de Uso:</b></font> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <input type="radio" onclick="return calcula();" name="tipo" value="C">
                                        Clase
                                        <input type="radio"  onclick="return calcula();" name="tipo" value="L">
                                        Uso Libre </font>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    </font> </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Hora
                                            Inicio:</b>
                                        <input type="radio" onclick="return calcula();" name="hora" value="700">
                                        700
                                        <input type="radio" onclick="return calcula();" name="hora" value="800">
                                        800
                                        <input type="radio" onclick="return calcula();" name="hora" value="900">
                                        900
                                        <input type="radio" onclick="return calcula();" name="hora" value="1000">
                                        1000
                                        <input type="radio" onclick="return calcula();" name="hora" value="1100">
                                        1100
                                        <input type="radio" onclick="return calcula();" name="hora" value="1200">
                                        1200
                                        <input type="radio" onclick="return calcula();" name="hora" value="1300">
                                        1300
                                        <input type="radio" onclick="return calcula();" name="hora" value="1400">
                                        1400
                                        <input type="radio" onclick="return calcula();" name="hora" value="1500">
                                        1500 </font><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        &nbsp;&nbsp;<input type="radio" onclick="return calcula();" name="hora" value="1600">
                                        1600
                                        <input type="radio" onclick="return calcula();" name="hora" value="1700">
                                        1700
                                        <input type="radio" onclick="return calcula();" name="hora" value="1800">
                                        1800 </font> </p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><font face="Arial, Helvetica, sans-serif" color="#990000"><b><font size="2">Si
                                        desea realizar una reserva para un bloque (2 horas) seleccione la
                                        hora final</font></b></font></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Hora
                                            Fin: </b>
                                        <input type="radio" onclick="return calcula();" name="horafin" value="900">
                                        900
                                        <input type="radio" onclick="return calcula();" name="horafin" value="1000">
                                        1000
                                        <input type="radio" onclick="return calcula();" name="horafin" value="1100">
                                        1100
                                        <input type="radio" onclick="return calcula();" name="horafin" value="1200">
                                        1200
                                        <input type="radio" onclick="return calcula();" name="horafin" value="1300">
                                        1300
                                        <input type="radio" onclick="return calcula();" name="horafin" value="1400">
                                        1400
                                        <input type="radio" onclick="return calcula();" name="horafin" value="1500">
                                        1500
                                        <input type="radio" onclick="return calcula();" name="horafin" value="1600">
                                        1600
                                        <input type="radio" onclick="return calcula();" name="horafin" value="1700">
                                        1700 </font><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        &nbsp;&nbsp; <input type="radio"onclick="return calcula();"  name="horafin" value="1800">
                                        1800
                                        <input type="radio" onclick="return calcula();" name="horafin" value="1900">
                                        1900 </font></p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" color="#CC0000"><b><font size="2">Caracter&iacute;sticas</font></b></font></td>
                            </tr>
                            <tr>
                                <td colspan="2"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" onclick="return calcula();" name="caracteris" value="130">
                                    Cancha de baloncesto</font></td>

                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" onclick="return calcula();" name="caracteris" value="140">

                                    Media Cancha de Baloncesto</font></td>
                            </tr>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" onclick="return calcula();" name="caracteris" value="131">
                                    Cancha de squash</font></td>

                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" onClick="return calcula();" name="caracteris" value="135" >
                                    Sal&oacute;n de arte </font></td>
                            </tr>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" onclick="return calcula();" name="caracteris" value="132">
                                    Cancha de voleibol</font></td>

                                <td width="44%" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" onClick="return calcula();" name="caracteris" value="136" >
                                    Sal&oacute;n de espejos </font></td>
                            </tr>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" onClick="return calcula();" name="caracteris" value="133">
                                    Futsal</font></td>

                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" onClick="return calcula();" name="caracteris" value="137" >
                                    Salas m&uacute;ltiples </font></td>
                            </tr>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    </font></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" onClick="return calcula();" name="caracteris" value="138" >
                                    Tenis de Mesa </font></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div align="center"><a href="http://www.escuelaing.edu.co/coliseo/proceso-inscripcion.html">
                                            <!--<font face="Verdana, Arial, Helvetica, sans-serif" size="2">
              <input type="radio" name="caracteris" value="I" >
              Gimnasio </font>-->
                                            <font size="5">GIMNASIO</font></a></div>
                                </td>
                                <!-- <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <input type="radio" onclick="return calcula();" name="caracteris" value="139" >
                                Evento Especial(Ej:Grados-Imposici&oacute;n de escudos-Eciciencia)</font></td>-->
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                                <td width="44%">&nbsp;</td>
                            </tr>

                            <!--  <tr>
                                <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#800000">&nbsp;NOTA:
                                                La reserva para un evento especial bloquear&aacute; el recurso durante
                                                todo el d&iacute;a solicitado. Recuerde que para estos eventos especiales
                                                debe reservar m&iacute;nimo tres d&iacute;as, para lo cual deber&aacute;
                                realizar la reserva d&iacute;a por d&iacute;a.</font></b></font></td>
                            </tr>-->
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    </font></td>
                                <!--   <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Capacidad:
              <input type="text" name="capacidad" size="4" maxlength="4"  class="campotext"  value="<!%=capac%>">
              </b></font></td>-->
                            </tr>
                            <tr>

                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    </font></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Observaciones:</b>
                                    <b>
                                        <input type="text" name="observ" size="20" maxlength="70" class="campotext" value="<%=descr%>">
                                    </b></font></td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                                <td width="44%" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    </font></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <!--Fecha de solicitud:<!--script>fecha()</script>-->
                                    Con la presente, me permito autorizar a la Escuela Colombiana de
                                    Ingeniería Julio Garavito, a descontar por nómina el valor de: <BR> <font color="#990033">
                                    <div id="valor" style="float:left;"></div></font>
                                    <p>por concepto <font color="#990033">  <div id="servicio" style="float:left;"></div></font>,<br>  en la nómina del mes.
                                    <br>Así mismo, autorizo a la Escuela para que retenga y cobre de mi liquidación de prestaciones sociales, salarios e indemnizaciones los saldos que esté adeudando, en caso de que llegase a finalizar mi contrato de trabajo antes de completar el pago total objeto de la presente libranza, según lo establecido en el artículo 149 del Código Sustantivo del Trabajo.

                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div align="center">
                                        <input type="submit" name="Submit" value="Solicitar Reserva" class="boton">
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>

            </form>
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

