<%@ include file="secure.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
    <head>
        <%
                    response.setHeader("Cache-Control", "no-cache");
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
                    session.setAttribute("usuario", usuario1);
                    if (empleado.getMenu().equals("1")) {
                        titulo = "Servicio a Administrativos";
                    }
                    String arreglo[] = new String[50];
                    String texto[] = new String[20];
                    String noticias[] = new String[200];
                    String noti[] = new String[20];
                    int i = 0, not = 0, contmenu;
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
        <link type="text/css" href="/css/conozcanos.css?v=2" rel="stylesheet" media="all" />
          <link rel="stylesheet" type="text/css" media="screen" href="css/estilos.css?v=2" />
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <style type="text/css">
            #marqueecontainer{
                position: relative;
                width: 400px;
                height: 150px;
                background-color: white;
                overflow: hidden;
                border: 2px solid #666666;
                padding: 2px;
                padding-left: 4px;
                background-image: url(img/fondo.gif);
            }
        </style>

        <script type="text/javascript">
            <!--
            /***********************************************
             * Cross browser Marquee II- © Dynamic Drive (www.dynamicdrive.com)
             * This notice MUST stay intact for legal use
             * Visit http://www.dynamicdrive.com/ for this script and 100s more.
             ***********************************************/

            var delayb4scroll=2000 //Specify initial delay before marquee starts to scroll on page (2000=2 seconds)
            var marqueespeed=1 //Specify marquee scroll speed (larger is faster 1-10)
            var pauseit=1 //Pause marquee onMousever (0=no. 1=yes)?

            ////NO NEED TO EDIT BELOW THIS LINE////////////

            var copyspeed=marqueespeed
            var pausespeed=(pauseit==0)? copyspeed: 0
            var actualheight=''

            function scrollmarquee(){
                if (parseInt(cross_marquee.style.top)>(actualheight*(-1)+8))
                    cross_marquee.style.top=parseInt(cross_marquee.style.top)-copyspeed+"px"
                else
                    cross_marquee.style.top=parseInt(marqueeheight)+8+"px"
            }

            function initializemarquee(){
                cross_marquee=document.getElementById("vmarquee")
                cross_marquee.style.top=0
                marqueeheight=document.getElementById("marqueecontainer").offsetHeight
                actualheight=cross_marquee.offsetHeight
                if (window.opera || navigator.userAgent.indexOf("Netscape/7")!=-1){ //if Opera or Netscape 7x, add scrollbars to scroll and exit
                    cross_marquee.style.height=marqueeheight+"px"
                    cross_marquee.style.overflow="scroll"
                    return
                }
                setTimeout('lefttime=setInterval("scrollmarquee()",30)', delayb4scroll)
            }

            if (window.addEventListener)
                window.addEventListener("load", initializemarquee, false)
            else if (window.attachEvent)
                window.attachEvent("onload", initializemarquee)
            else if (document.getElementById)
                window.onload=initializemarquee
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

    </head>

    <body  onLoad="enfocar()">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
        </jsp:include>


        <!-- Place this tag where you want both of the search box and the search results to render -->


        <table width="640" border="0" align="center" cellspacing="0">
            <tr class="textocom">
                <td width="200" height="20"><div align="center"><font color="#990000"><strong>Opciones</strong></font></div></td>
                <td width="10" height="20" valign="top"><div align="center"></div></td>
                <td width="430" valign="top"><div align="center"><font color="#990000"><strong></strong></font></div></td>
            </tr>
            <tr>
                <td valign="top">
                    <table width="200" border="1" cellpadding=1 cellspacing="0" >
                        <div class="columna1">
                            <ul class="menu_izq2">

                                <li>
                                    <a href="http://virtual.escuelaing.edu.co/ " target="_blank" class="">Campus Virtual</a>
                                </li>
                                <li>
                                    <a href="http://practicas.escuelaing.edu.co/empresa/ " target="_blank" class="">Practicas Empresariales</a>
                                </li>
                            </ul>
                        </div>
                        <!--<tr>
                            <td width="200" height="20" bgcolor="#999999" class="textocom" onMouseOver="textoin('f<!%=contmenu%>'); ilum(this,'#CCCCCC')" onMouseOut="textout('f<!%=contmenu%>'); ilum(this,'#999999')">
                                <div align="left">
                                    <a href="" onclick="window.open('http://practicas.escuelaing.edu.co/correoProfesor/enviarCorreoImpresion?userst=@escuelaing.edu.co&nombre=<!%=empleado.getNomemp()%>&user=<%=empleado.getUsrname()%>','','width=600,height=400, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false">
                                        <font id="f<!%=contmenu%>" color="#FFFFFF"><strong><!%=contmenu + 1%>. Servicio de Impresión</strong></font></a></div>
                            </td>-->
                    </table>


                <td width="430" valign="top">
                    <!-- <table width="410" border="1" align="center" cellspacing="0" bordercolor="#CCCCCC" class="textocom">
                         <tr>
                             <td>
                                 <table width="410" height="150" border="0" class="textocom">
                                     <tr>
                                         <td>
                                             <div id="marqueecontainer" onMouseover="copyspeed=pausespeed" onMouseout="copyspeed=marqueespeed">
                                                 <div id="vmarquee" style="position: absolute; width: 98%;">
                    <%    if (error.equals("OK")) {
                                    for (int n = 0; n < not; n++) {
                                        StringTokenizer st = new StringTokenizer(noticias[n], "|");
                                        k = 0;
                                        while (st.hasMoreTokens()) {
                                            noti[k] = st.nextToken();
                                            k = k + 1;
                                        }
                    %>
                    <%=noti[0]%> - <strong><%=noti[1]%></strong> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%=noti[2]%> ... <a href=""  onclick="window.open('<%=noti[3]%>','','width=600,height=400, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false"><strong>[+ Información]</strong> </a><br>
                    <%
                                    }
                                }
                    %>
                </div>
            </div>
    </tr>
</table>
</td>
</tr>
</table>-->
                    <p>
                    <center>

                        <p>&nbsp;
                        <p>&nbsp;
                        <p align="left"><a href="http://tycho.escuelaing.edu.co/contenido/osiris/encuestas/<%=usuario%>.pdf" target="top"><font face="Verdana, Arial, Helvetica, sans-serif" color="#666666" size="3"><b><font face="Arial, Helvetica, sans-serif">Respuesta
                                            Encuesta Académica 2012-2</font></b></font></a>
                        <p>&nbsp;
                        <p align="left"> <font face="Arial, Helvetica, sans-serif"><a href="http://tycho.escuelaing.edu.co/contenido/osiris/encuestas/Formatoencuesta.pdf" target="top"><font color="#666666" size="3"><b>
                                            Formato Encuesta Académica 2012-2</b></font></a
                                ></font>
                    </center>
            </tr>
            <tr>
                <td colspan="3">
                    <div align="right">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="Menu" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>

        <p>&nbsp;</p></body>
</html>
