<%@ include file="secure.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
    <head>
        <%            response.setHeader("Cache-Control", "no-cache");
            HttpSession sesion;
            otros.ruta ruta = new otros.ruta();
            login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");
            session.setAttribute("loginex", empleado.getUsrExchange());
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
            String error = new String();
            String paramtext = new String();
            String titulo = new String("Servicio a Profesores");
            String usuario1 = (String) session.getAttribute("usuario");
            String clave = (String) session.getAttribute("clave");
            //out.println(clave);
            session.setAttribute("usuario", usuario1);
            session.setAttribute("clave", clave);
            if (empleado.getMenu().equals("1")) {
                titulo = "Servicio a Administrativos";
            }
            String arreglo[] = new String[50];
            String texto[] = new String[20];
            String noticias[] = new String[200];
            String noti[] = new String[20];
            int i = 0, not = 0, contmenu = 0;
            int k = 0;
            try {
                FileReader ra = new FileReader(ruta.valruta() + "servicios.txt");
                BufferedReader entrada = new BufferedReader(ra);
                String s;
                s = entrada.readLine();
                empleado.setPeriodo(s);
                s = entrada.readLine();
                empleado.setperHorario(s);
                s = entrada.readLine();
                empleado.setTercio(s);
                while ((s = entrada.readLine()) != null) {
                    arreglo[i] = s;
                    i = i + 1;
                }
                ra = new FileReader(ruta.valruta() + "noticias.txt");
                entrada = new BufferedReader(ra);
                while ((s = entrada.readLine()) != null) {
                    noticias[not] = s;
                    not = not + 1;
                }
                entrada.close();
                ra.close();
                error = "OK";
            } catch (java.io.FileNotFoundException fnfex) {
                error = "Error: " + fnfex;
            } catch (java.io.IOException ioex) {
                error = "Error: " + ioex;
            }
            String año = new String();
            String mes = new String();
            Vector fecha = admin.Fecha();

            año = (fecha.elementAt(0).toString());
            mes = (fecha.elementAt(1).toString());
            int respuesta = admin.Insertaestadis(año, mes, empleado.getIdemp());%>

        <title>Menu Profesores</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

        <!--<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>-->
        <script type="text/javascript">
            <!--
            /***********************************************
             * Cross browser Marquee II- © Dynamic Drive (www.dynamicdrive.com)
             * This notice MUST stay intact for legal use
             * Visit http://www.dynamicdrive.com/ for this script and 100s more.
             ***********************************************/

            var delayb4scroll = 2000 //Specify initial delay before marquee starts to scroll on page (2000=2 seconds)
            var marqueespeed = 1 //Specify marquee scroll speed (larger is faster 1-10)
            var pauseit = 1 //Pause marquee onMousever (0=no. 1=yes)?

            ////NO NEED TO EDIT BELOW THIS LINE////////////

            var copyspeed = marqueespeed
            var pausespeed = (pauseit == 0) ? copyspeed : 0
            var actualheight = ''

            function scrollmarquee() {
                if (parseInt(cross_marquee.style.top) > (actualheight * (-1) + 8))
                    cross_marquee.style.top = parseInt(cross_marquee.style.top) - copyspeed + "px"
                else
                    cross_marquee.style.top = parseInt(marqueeheight) + 8 + "px"
            }

            function initializemarquee() {
                cross_marquee = document.getElementById("vmarquee")
                cross_marquee.style.top = 0
                marqueeheight = document.getElementById("marqueecontainer").offsetHeight
                actualheight = cross_marquee.offsetHeight
                if (window.opera || navigator.userAgent.indexOf("Netscape/7") != -1) { //if Opera or Netscape 7x, add scrollbars to scroll and exit
                    cross_marquee.style.height = marqueeheight + "px"
                    cross_marquee.style.overflow = "scroll"
                    return
                }
                setTimeout('lefttime=setInterval("scrollmarquee()",30)', delayb4scroll)
            }

            if (window.addEventListener)
                window.addEventListener("load", initializemarquee, false)
            else if (window.attachEvent)
                window.attachEvent("onload", initializemarquee)
            else if (document.getElementById)
                window.onload = initializemarquee
-->
        </script>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function validar(){
                if(document.forms[0].dia.value == 0 || document.forms[0].mes.value == 0 || document.forms[0].ano.value == 0){
                    alert("Seleccione la fecha límite de recepción de hojas de vida");
                    return false;
                }
                if(document.forms[0].ICIVemp.checked == false && document.forms[0].ISISemp.checked == false && document.forms[0].IELEemp.checked == false && document.forms[0].IINDemp.checked == false && document.forms[0].IELNemp.checked == false && document.forms[0].ECONemp.checked == false && document.forms[0].ESPEemp.checked == false){
                    alert("Debe seleccionar por lo menos 1 programa");
                    return false;
                }

                if(confirm("Seguro desea guardar?")){
                    document.forms[0].fec_venc.value = document.forms[0].dia.value + "/" + document.forms[0].mes.value + "/" + document.forms[0].ano.value;
                    return true;
                }else{
                    return false;
                }
            }
            function validarfecha(){
                if(parseInt(document.forms[i].inidia.value) > parseInt(document.forms[i].dia.value) && (parseInt(document.forms[i].inimes.value) >= parseInt(document.forms[i].mes.value) && parseInt(document.forms[i].iniano.value) >= parseInt(document.forms[i].ano.value))){
                    alert("La fecha de inicio no puede ser mayor que la de finalización");
                    return false;
                }else if(parseInt(document.forms[i].inimes.value) > parseInt(document.forms[i].mes.value) && parseInt(document.forms[i].iniano.value) >= parseInt(document.forms[i].ano.value)){
                    alert("La fecha de inicio no puede ser mayor que la de finalización");
                    return false;
                }else if(parseInt(document.forms[i].iniano.value) > parseInt(document.forms[i].ano.value)){
                    alert("La fecha de inicio no puede ser mayor que la de finalización");
                    return false;
                }
            }

            function enfocar(){
                window.focus();
                preloadImg();
            }


            function votaciones(){
                document.votacion.submit()
            }
            //-->
        </script>
         <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge; IE=11; IE=10; IE=EmulateIE10; IE=9; IE=EmulateIE9; IE=8; IE=EmulateIE8; IE=7; IE=EmulateIE7; IE=5">
    <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
    </head>

    <body onload="enfocar();">
        <div align="center">
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
        </div>
    <div class="container" align="center">
        <!-- <p class="textocom">&nbsp;</p>-->

        <table width="770" border="0" align="center" cellspacing="0">
            <tr >
                <td width="200" height="20"><div align="center"><font color="#990000"><strong>Opciones</strong></font></div></td>
                <td width="10" height="20" valign="top"><div align="center"></div></td>
                <td width="430" valign="top">
                    <p> 
                    <p> 
                    <p> 
            <center>
                <p align="left">&nbsp;</p>
                <p align="left"><b><font color="#990000" size="2">Para sistema operativo 
                        windows puede utilizar navegador Mozilla firefox y 
                        Google chrome .</font></b></p>
                <p align="left"><font color="#990000" size="2"><b>Para sistema operativo 
                        MAC puede utilizar navegador Mozilla firefox</b></font></p>
            </center>
            </td>
            </tr>
            <tr>
            <div >
                <td valign="top">
                    <table width="200" border="0" cellpadding=1 cellspacing="0">

                        <%    if (empleado.getMenu().equals("3")) {
                                out.println("No se encontró información en la Base de Datos");
                            } else {
                                contmenu = 0;
                                if (error.equals("OK")) {
                                    for (int j = 0; j < i; j++) {
                                        StringTokenizer st = new StringTokenizer(arreglo[j], "|");
                                        k = 0;
                                        while (st.hasMoreTokens()) {
                                            texto[k] = st.nextToken();
                                            k = k + 1;
                                        }
                        %>
                        <tr>
                            <%
                                if (empleado.getMenu().equals(texto[1]) || texto[1].equals("0")) {
                                    paramtext = new String("");
                                    if (texto[0].equals("0")) {
                            %>
                            <td width="200" height="20"  class="menuprueba" >
                                <a onclick="<%=texto[4]%><%=paramtext%>"><font id="f<%=contmenu%>" color="#000000"><%=contmenu + 1%>. <%=texto[3]%></font></a></td>
                                    <%
                                    } else {
                                        if (!texto[2].equals("*")) {
                                            paramtext = "?paramtext=" + texto[2];
                                        }
                                        // if(contmenu == 0){ %>

                            <!--td width="200" height="20" bgcolor="#990000" class="textocom" onMouseOver="textoin('f<!%=contmenu%>'); ilum(this,'#CCCCCC')" onMouseOut="textout('f<!%=contmenu%>'); ilum(this,'#990000')"-->

                            <!--a href="<!%=texto[4]%><!%=paramtext%>"><font id="f<!%=contmenu%>" color="#FFFFFF"><!--strong><!%=contmenu + 1%>. <!%=texto[3]%><br><!--Clave Numérica:></strong></font></a-->
                            <!--/td-->
                            <!%=contmenu%>
                            <% if (false) {
%>
                            <td width="200" height="20" onMouseOver="textoin('f<%=contmenu%>');" onMouseOut="textout('f<%=contmenu%>');
                                ">
                                <div align="left">
                                    <!--http://tycho.escuelaing.edu.co o http://localhost:8080/votaciones/votacionprof-->

                                    <form name='votacion' method='post' action='Votaciones'>
                                        <a href="<%=texto[4]%><%=paramtext%>"><font id="f<%=contmenu%>" color="#000000"><%=contmenu + 1%>. <%=texto[3]%><br>
                                            <font color="#000000">Clave Numérica:</font></font>
                                            <input type='hidden' name='cedula' value='<%=empleado.getDocumProf()%>'>
                                            <input type='hidden' name='indice' value='0'>
                                        </a><input name="clavenum" type="password" size="5" maxlength="10">
                                    </form>
                                </div></td>
                                <%
                                    }else {
                                %>
                            <td width="200" height="20"  class="menuprueba"  bgcolor="FFFFFF" onMouseOver="textoin('f<%=contmenu%>');" onMouseOut="textout('f<%=contmenu%>');">
                                <div align="left">
                                    <a href="<%=texto[4]%><%=paramtext%>"><font id="f<%=contmenu%>" color="#000000"><%=contmenu + 1%>. <%=texto[3]%> </font></a></div></td>
                                        <%
                                                                                            }
                                                }
                                                contmenu = contmenu + 1;
                                            }
                                        %>
                        </tr>
                        <%
                                }
                                if (usuario1.equalsIgnoreCase("alejandra.vargas") || usuario1.equalsIgnoreCase("paulina.alvarado")) {
                                    out.print("<tr>");
                                    out.print("<td width='200' height='20'  class='menuprueba'  bgcolor='FFFFFF' onMouseOver='textoin('f"+contmenu+");' onMouseOut='textout('f"+contmenu+"');'>");
                                    out.print("<div align='left'>");
                                    out.print("<a href='EnlaseNovasoft'><font id='f"+contmenu+"' color='#000000'>"+(contmenu + 1)+". Conciliación pagos ENLACE-NOVASOFT</font></a></div></td>");
                                    
                                    out.print("</tr>");
                                    contmenu = contmenu + 1;
                                    
                                    
                                }
                                if (usuario1.equalsIgnoreCase("ana.guzman") ||usuario1.equalsIgnoreCase("sara.osorio") || usuario1.equalsIgnoreCase("paulina.alvarado")) {
                                    out.print("<tr>");
                                    out.print("<td width='200' height='20'  class='menuprueba'  bgcolor='FFFFFF' onMouseOver='textoin('f"+contmenu+");' onMouseOut='textout('f"+contmenu+"');'>");
                                    out.print("<div align='left'>");
                                    out.print("<a href='http://10.1.3.132:8080/ECI-CIENCIA/#/home' target='_blank' rel='noopener noreferrer'><font id='f"+contmenu+"' color='#000000'>"+(contmenu + 1)+". Cursos ECI CIENCIA</font></a></div></td>");
                                    
                                    out.print("</tr>");
                                    contmenu = contmenu + 1;
                                    
                                    
                                }

                            }
                        %>

                        <!--  <tr>
                              <td width="200" height="20" bgcolor="#999999" class="textocom" onMouseOver="textoin('f<%=contmenu%>'); ilum(this,'#CCCCCC')" onMouseOut="textout('f<!%=contmenu%>'); ilum(this,'#999999')">
                                  <div align="left">
                                      <a href="" onclick="window.open('http://practicas.escuelaing.edu.co/correoProfesor/enviarCorreoImpresion?userst=@escuelaing.edu.co&nombre=<!%=empleado.getNomemp()%>&user=<%=empleado.getUsrname()%>','','width=600,height=400, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false">
                                          <font id="f<%=contmenu%>" color="#FFFFFF"><strong><%=contmenu + 1%>. Servicio de Impresión</strong></font></a></div>
                              </td>
                          </tr>-->

                        <%
                            }
                        %>

                    </table>
                </td>
            </div>
            <td width="10">
            </td>

            <td width="430" valign="top"> 
                <p>
            <center>
                <p align="left">&nbsp;

                <form action="descDoc">
                    <input type="hidden" value="encuesta" name="down">
                    <input type="hidden" name="user" value="<%=usuario%>">
                    <!--<input type="submit" value="Encuesta Académica 2019-1">-->
                    <p align="left"><!--a href="http://tycho.escuelaing.edu.co/contenido/osiris/encuestas/<%=usuario%>.pdf" target="top"><font face="Verdana, Arial, Helvetica, sans-serif" color="#666666" size="3"><b>Respuesta 
                  Encuesta Académica 2017-2</b></font></a-->
                    <p align="left">&nbsp; 
                </form>

               <!-- <a href="https://tycho.escuelaing.edu.co/promProfesores/Condiciones_Promocion_Profesor_Titular.pdf" target="top"><font face="Verdana, Arial, Helvetica, sans-serif" color="#666666" size="3"><b>Promoción a Profesor Titular en la Escuela Colombiana de Ingeniería</b></font></a>-->





                <!-- <p align="left"><font size="3"><a href="http://tycho.escuelaing.edu.co/contenido/osiris/encuestas/Formatoencuesta.pdf" target="top"><font face="Verdana, Arial, Helvetica, sans-serif" color="#666666"><b>Formato
                   Encuesta Académica 2013-2</b></font></a></font>-->
            </center>
            </tr>
            <tr>
                <td colspan="3">
                    <div align="right">

                    </div>
                </td>
            </tr>
        </table>
    </div>
    <p>&nbsp;</p>
    <jsp:include page="Layouts/PieDePagina.jsp">
        <jsp:param name="anterior" value="Menu" />
    </jsp:include>
</body>
</html>
