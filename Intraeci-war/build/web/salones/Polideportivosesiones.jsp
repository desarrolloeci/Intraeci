<%-- 
    Document   : Polideportivo
    Created on : 14/02/2012, 03:48:09 PM
    Author     : lrodriguez
--%>
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
        Vector asignaturas = profesor.getAsignaturas(empleado.getPerHorario(), empleado.getIdProf());
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
    </head>
    <body  onLoad="preloadImg()">
        <script language="JavaScript">
  function Combos(x) {
                ItDepend=document.getElementById('CombDependiente');
                if(!ItDepend){return;}
                var mitems=new Array();
                mitems['Seleccione']=[''];
                mitems['C']=['Seleccione','700','830','1000','1130'];
                mitems['L']=['Seleccione','700','800','900','1000'];

                ItDepend.options.length=0;
                ItActual=mitems[x.options[x.selectedIndex].value];
                if(!ItActual){return;}
                ItDepend.options.length=ItActual.length;
                for(var i=0;i<ItActual.length;i++) {
                    ItDepend.options[i].text=ItActual[i];
                    ItDepend.options[i].value=ItActual[i];
                }
            }
        </script>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="Solicitud de salones" />
        </jsp:include>
        <table width="640" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
            <tr>
                <td align="center" valign="top">
                    <form name="form1" method="post" action="reservasPoli" onSubmit="return comprueba();" >
                        <input type="hidden" name="ndia" value="<%=ndia%>">
                        <font color="#990000" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><%=msj%>
                        </strong></font>
                        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="textocom">
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
              <a href="javascript:show_calendar('form1.fecha'); document.form1.fecha.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha de solicitud de reserva.'); return true;" onMouseOut="window.status=''; nd();  return true;"> 
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
                de Uso:</b></font> 
                <select name="tipo" id="or" onchange="Combos(this)">
                  <option value="Seleccione">Seleccione</option>
                  <option value="C">Clase</option>
                  <option value="L">Uso Libre</option>
                </select>
                <label for="CombDependiente">Hora:</label> 
                <select name="hora" id="CombDependiente">
                </select>
          </tr>
          <tr> 
            <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" color="#CC0000"><b><font size="2">Caracter&iacute;sticas</font></b></font></td>
          </tr>
          <tr> 
            <td colspan="2"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              <input type="radio" name="caracteris" value="L">
              Cancha de baloncesto</font></td>
            <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              <input type="radio" name="caracteris" value="T" >
              Sal&oacute;n de arte</font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              <input type="radio" name="caracteris" value="S">
              Cancha de squash</font></td>
            <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              <input type="radio" name="caracteris" value="E" >
              Sal&oacute;n de espejos</font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              <input type="radio" name="caracteris" value="V">
              Cancha de voleibol</font></td>
            <td width="44%" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              <input type="radio" name="caracteris" value="M" >
              Salas m&uacute;ltiples </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              <input type="radio" name="caracteris" value="F">
              Futsal</font></td>
            <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              <input type="radio" name="caracteris" value="T" >
              Tenis de Mesa </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              <input type="radio" name="caracteris" value="I" >
              Gimnasio </font></td>
            <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              </font></td>
            <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
              </font></td>
            <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Capacidad: 
              <input type="text" name="capacidad" size="4" maxlength="4"  class="campotext"  value="<%=capac%>">
              </b></font></td>
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
                    <div align="right">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="SolicitudSalones" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
        <div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
    <p>&nbsp;</p></body>
</html>

