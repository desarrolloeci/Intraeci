<%@page contentType="text/html"%>
<%@ page session="false" %>
<%@page pageEncoding="iso-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    response.setHeader("Cache-Control", "no-cache");
// String usuario = (String)session.getAttribute("sro");
//String isp ;

//if (usuario != null && !usuario.equals("")) {
//	isp = new String((String)session.getAttribute("isp"));
    String nMsg = (String) request.getParameter("msg");
    String mensaje = new String("");

    if (nMsg != null) {
        if (nMsg.equals("0")) {
            mensaje = "Falta alguno de los campos";
        } else if (nMsg.equals("1")) {
            mensaje = "Usuario desconocido";
        } else if (nMsg.equals("2")) {
            mensaje = "El usuario no se ha autenticado correctamente";
        } else if (nMsg.equals("4")) {
            mensaje = "Sesion Cerrada";
        } else if (nMsg.equals("5")) {
            mensaje = "Error del Servidor";
        } else if (nMsg.equals("6")) {
            mensaje = "No ha iniciado Sesion";
        } else if (nMsg.equals("7")) {
            mensaje = "<font color='#FF0000'>Ya existia una Sesion!</font> <i>Vuelva a autenticarse</i>";
        } else if (nMsg.equals("8")) {
            HttpSession sesion = request.getSession();
            sesion.invalidate();
        } else if (nMsg.equals("9")) {
            HttpSession sesion = request.getSession();
            sesion.invalidate();
            mensaje = "No se ha podido iniciar la sesión porque tiene bloqueadas las <br>ventanas "
                    + "emergentes para este sitio, para continuar debe permitirlas para empleados.escuelaing.edu.co<br>"
                    + "si no sabe como hacerlo haga <a href=\"html/manualintraeci.htm\">click AQUI</a>";
        }
    }
%>
<html>
    <head>
        <title>Inicio Intraeci</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <!-- Fireworks MX Dreamweaver MX target.  Created Wed Aug 16 09:51:45 GMT-0500 (Hora est. del Pacífico de SA) 2006-->
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge; IE=11; IE=10; IE=EmulateIE10; IE=9; IE=EmulateIE9; IE=8; IE=EmulateIE8; IE=7; IE=EmulateIE7; IE=5">
        <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
        <link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">

        <script type="text/javascript" language="javascript">
            <!--
            var verifwp;
            var pop;
            var mensaje;
            var http_request = false;


            function makeRequest(url) {
                http_request = false;

                if (window.XMLHttpRequest) { // Mozilla, Safari,...
                    http_request = new XMLHttpRequest();
                    if (http_request.overrideMimeType) {
                        http_request.overrideMimeType('text/xml');
                    }
                } else if (window.ActiveXObject) { // IE
                    try {
                        http_request = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch (e) {
                        try {
                            http_request = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {
                        }
                    }
                }

                if (!http_request) {
                    alert('Giving up :( Cannot create an XMLHTTP instance');
                    return false;
                }
                url = url + "usuario=" + document.getElementById("usuario").value + "&clave=" + document.getElementById("clave").value;
                //alert(url);
                http_request.onreadystatechange = alertContents;
                http_request.open('POST', url, true);
                http_request.send(null);

            }

            function alertContents() {

                if (http_request.readyState == 4) {
                    if (http_request.status == 200) {
                        var xmldoc = http_request.responseXML;
                        var root_node = xmldoc.getElementsByTagName('root').item(0);
                        if (root_node.firstChild.data != "OK") {
                            document.getElementById("msj").style.visibility = 'visible';
                            document.getElementById("msj").innerText = root_node.firstChild.data;
                            document.getElementById("msj").textContent = root_node.firstChild.data;
                            document.getElementById("tabla").style.visibility = 'visible';
                            document.getElementById("cargando").style.visibility = 'hidden';
                        } else {
                            verifwp = window.open("Menu", "servicioprofesores", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=no,resizable=yes");
                            //setTimeout("resultado()",2000);
                            resultado();
                            if (mensaje == "No existe bloqueador")
                                window.location = "cerrar";
                            else
                                window.location = "inicio?msg=9";
                        }
                    } else {
                        alert('There was a problem with the request.' + http_request.status);
                    }
                } else {
                    document.getElementById("tabla").style.visibility = 'hidden';
                    document.getElementById("cargando").style.visibility = 'visible';
                    document.getElementById("msj").style.visibility = 'hidden';
                }

            }

            function prueba() {
                var dato = navigator.appName;
                alert(dato);
            }

            function resultado() {
                pop = (verifwp == null);
                mensaje = (pop) ? "Existe bloqueador" : "No existe bloqueador";
            }
            -->
        </script>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function MM_reloadPage(init) {  //reloads the window if Nav4 resized
                if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
                        document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
                else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
            }
            MM_reloadPage(true);


            function MM_openBrWindow(theURL,winName,features) { //v2.0
                window.open(theURL,winName,features);
  }

            function ventanaSecundaria (URL){
                window.open(URL,"ventana1","width=800,height=600,scrollbars=yes")
            }
            //-->
        </script>
        <script type="text/javascript">
            <!--
            var xmlHttp;
            var EMP_PREFIX = "emp-";

            function createXMLHttpRequest() {
                if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                } else if (window.XMLHttpRequest) {
                    xmlHttp = new XMLHttpRequest();
                }
  }

            function refreshModelList() {
                var url = "NewsEci";
                createXMLHttpRequest();
                xmlHttp.onreadystatechange = handleStateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
  }

            function handleStateChange() {
                if (xmlHttp.readyState == 4) {
                    if (xmlHttp.status == 200) {
                        //document.getElementById("cargando").style.visibility='hidden';
                        updateModelsList();
                    }
                }/*else{
                 document.getElementById("cargando").style.visibility='visible';
                 }*/
  }

            function updateModelsList() {
                var results = xmlHttp.responseXML.getElementsByTagName("item");
                var title, link, description, htmltexto, fecha;
                var option = null;
                var mi_fecha, mes, annio, dia;
                htmltexto = "";
                for (var i = 0; i < results.length; i++) {
                    title = getChildElementText(results[i], "title");
                    link = getChildElementText(results[i], "link");
                    description = getChildElementText(results[i], "description");
                    fecha = getChildElementText(results[i], "pubDate");
                    var messageArea = document.getElementById("dateMessage");
                    var fontColor = "";
                    //if(i==0)
                    //  fontColor = " style=\"color:#990000; font-weight:bold\"";
                    var m = link.lastIndexOf("estudiante");
                    if (m == -1) {
                        htmltexto = htmltexto + "<div align=\"left\"" + fontColor + ">&#8226; " + title + " </div>";
                        //htmltexto = htmltexto + "<div align=\"left\">&#8226; " + title + " </div>";
                        mi_fecha = new Date(fecha);
                        dia = mi_fecha.getDate();
                        mes = mi_fecha.getMonth() + 1;
                        annio = mi_fecha.getFullYear();
                        if (dia < 10)
                            dia = "0" + dia;
                        if (mes < 10)
                            mes = "0" + mes;
                        // htmltexto = htmltexto + "" + dia + "/" + mes + "/" + annio  + " ";
                        //htmltexto = htmltexto + "<br>" + description + " ";
                        htmltexto = htmltexto + "<br><a href=\"#\" onclick=\"MM_openBrWindow('" + link + "','noticias','toolbar=yes,location=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')\">[ Leer mas... ] </a><br><br>";
                    }
                }
                messageArea.innerHTML = htmltexto;
  }

            function getChildElementText(parentNode, childTagName) {
                var childtag = parentNode.getElementsByTagName(childTagName);
                return childtag[0].firstChild.nodeValue;
  }

          -->
        </script>

        <script type="text/javascript">

            /***********************************************
             * Cross browser Marquee II- © Dynamic Drive            (www.dynamicdrive.com)
            * This notice MUST sta            y intact for legal use
            * Visit http://www.dynamicdrive.com/ for this             script and 100s more.
            *****************************            ******************/

            var delayb4scroll = 2000
            //Specify initial delay before marquee starts to scroll on page (2000=2 seconds)
            var marqueespeed = 1 //Specify marquee scroll speed (larger is faster 1-10)
            var pauseit = 1 //Pause marquee onMous            ever (0=no. 1=yes)?

            ////NO NEED TO EDIT BELOW TH            IS LINE////////////

            var copyspeed = marqueespeed
            var pausespeed = (pauseit == 0) ? copyspeed : 0
            va            r actualheight = ''

            function scrollmarquee() {
                if (parseInt(cross_marquee.style.top) > (actualheight * (-1) + 8))
                    cross_marquee.style.top = parseInt(cross_marquee.style.top) - copyspeed + "px"
                else
                    cross_marquee.style.top = parseInt(marqueeheight) + 8 +            "px"
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
                setTimeout('lefttime=setInterval("scrollmarquee()",30)', delayb4sc            roll)
            }

            if (wind            ow.addEventListener)
            window.addEventListener("load", initializemarquee, false)
            else if (win            dow.attachEvent)
            window.attachEvent("onload", initializemarquee)
            else if (document.get            ElementById)
            window.onload = initializemarquee


        </script>

        <script type="text/javascript">

            /***********************************************
            * Sw            itch Menu script- by Martial B of http://getElementById.com/
            * Mod            ified by Dynamic Drive for format & NS4/IE4 compatibility
            * Visi            t http://www.dynamicdrive.com/ for full source code
            *******            ****************************************/

            var persistmenu = "yes" //"yes" or "no". Make sure each SPAN content contains an incrementing ID starting at 1 (id="sub1", id="sub2", etc)
            var persisttype = "sitewide" //enter "sitewide" for menu to persist across site, "local" for this page only


            function SwitchMenu(obj) {
                if (document.getElementById) {
                    var el = document.getElementById(obj);
                    var ar = document.getElementById("masterdiv").getElementsByTagName("span"); //DynamicDrive.com change
                    if (el.style.display != "block") { //DynamicDrive.com change
                        for (var i = 0; i < ar.length; i++) {
                            if (ar[i].className == "submenu") //DynamicDrive.com change
                                ar[i].style.display = "none";
                        }
                        el.style.display = "block";
                    } else {
                        el.style.display = "none";
                    }
                }
     }

            function get_cookie(Name) {
                var search = Name + "="
                var returnvalue = "";
                if (document.cookie.length > 0) {
                    offset = document.cookie.indexOf(search)
                    if (offset != -1) {
                        offset += search.length
                        end = document.cookie.indexOf(";", offset);
                        if (end == -1)
                            end = document.cookie.length;
                        returnvalue = unescape(document.cookie.substring(offset, end))
                    }
                }
                return returnvalue;
     }

            function onloadfunction() {
                if (persistmenu == "yes") {
                    var cookiename = (persisttype == "sitewide") ? "switchmenu" : window.location.pathname
                    var cookievalue = get_cookie(cookiename)
                    if (cookievalue != "")
                        document.getElementById(cookievalue).style.display = "block"
                }
     }

            function savemenustate() {
                var inc = 1, blockid = ""
                while (document.getElementById("sub" + inc)) {
                    if (document.getElementById("sub" + inc).style.display == "block") {
                        blockid = "sub" + inc
                        break
                    }
                    inc++
                }
                var cookiename = (persisttype == "sitewide") ? "switchmenu" : window.location.pathname
                var cookievalue = (persisttype == "sitewide") ? blockid + ";path=/" : blockid
                document.cookie = cookiename + "=" + cookievalue
     }

            if (window.addEventListener)
            window.a            ddEventListener("load", onloadfunction, false)
            else if (window.attachEvent)
            window.attac            hEvent("onload", onloadfunction)
            else if (document.getElementById)
            window.onload =             onloadfunction

            if (persistmenu == "yes" && document.getElementById)
            window.onunload = sa            vemenustate

        </script>
</head>
  
    <body bgcolor="#ffffff"  id="public"   onLoad="refreshModelList();">     

        <div class="container">
<div class="row">
    <div class="col-2">
        <a href="https://escuela.aguayo.co/es/"><img src="img/Navegacion/logo-escuela.svg" alt="logo escuela"></a>
    </div>
    <div class="col">
        <div class="row">
            <div class="col-12">
                    <nav class="audiencias">
                        <ul class="nav nav-justified justify-content-center">
                            <li><a href="https://escuela.aguayo.co/es/estudiantes/" class="nav-item nav-link item uno">Estudiantes</a></li>
                            <li><a href="https://escuela.aguayo.co/es/profesores-y-administrativos/" class="nav-item nav-link item uno">Profesores y administrativos</a></li>
                            <li><a href="https://escuela.aguayo.co/es/graduados/" class="nav-item nav-link item uno">Graduados</a></li>
                            <li><a href="https://escuela.aguayo.co/es/padres-o-acudientes/" class="nav-item nav-link item uno">Padres o acudientes</a></li>
                            <li><a href="https://escuela.aguayo.co/es/empresa/" class="nav-item nav-link item uno">Empresa</a></li>                            
                            <li><a href="https://escuela.aguayo.co/es/donantes/" class="nav-item nav-link item uno">Donantes</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col align-self-center">
                    <nav class="navbar navbar-expand-lg productos">
                      <div class="collapse navbar-collapse" id="main_nav">

                        <ul class="navbar-nav">
                            <li class="nav-item"> <a href="https://escuela.aguayo.co/es/campus/" class="nav-link item dos" href="#">CAMPUS</a> </li>
                            <li class="nav-item dropdown has-megamenu">
                                <a class="nav-link dropdown-toggle item dos" href="#" data-toggle="dropdown">OFERTA ACADÉMICA</a>
                                <div class="dropdown-menu megamenu" role="menu">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="col-megamenu">
                                                <h6 class="title">Carreras profesionales</h6>
                                                <ul class="list-unstyled">
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-civil/">Ingeniería Civil</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-electrica/">Ingeniería Electrica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-de-sistemas/">Ingeniería de Sistemas</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-industrial/">Ingeniería Industrial</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-de-electronica/">Ingeniería Eléctronica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/economia/">Economía</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/administracion-de-empresas/">Administración de Empresas</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/matematicas/">Matemáticas</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-mecanica/">Ingeniería Mecánica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenier%C3%ADa-biom%C3%A9dica/">Ingeniería Biomédica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-ambiental/">Ingeniería Ambiental</a></li>
                                                </ul>
                                            </div>  <!-- col-megamenu.// -->
                                        </div><!-- end col-3 -->
                                        <div class="col-md-3">
                                            <div class="col-megamenu">
                                                <h6 class="title">Especializaciones</h6>
                                                <ul class="list-unstyled">
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-economia-para-ingenieros/">Especialización en Economía para Ingenieros</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-gerencia-de-operaciones/">Especialización en Gerencia de Operaciones</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-desarrollo-y-gerencia-integral-de-proyectos/">Especialización en Desarrollo y Gerencia Integral de Proyectos</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-diseno-construccion-y-conservacion-de-vias/">Especialización en Diseño, Construcción y Conservación de Vías</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-estructuras/">Especialización en Estructuras</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-gestion-integrada-de-la-seguridad-y-salud-en-el-trabajo-calidad-y-medioambiente/">Especialización en Gestión Integrada de la Seguridad y Salud en el Trabajo, Calidad y Medioambiente</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-ingenieria-de-fundaciones/">Especialización en Ingeniería de Fundaciones</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-recursos-hidraulicos-y-medioambiente/">Especialización en Recursos Hidráulicos y Medioambiente</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-saneamiento-ambiental/">Especialización en Saneamiento Ambiental</a></li>
                                                </ul>
                                            </div>  <!-- col-megamenu.// -->
                                        </div><!-- end col-3 -->
                                        <div class="col-md-3">
                                            <div class="col-megamenu">
                                                <h6 class="title">Maestrías</h6>
                                                <ul class="list-unstyled">
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-gestion-de-informacion/">Maestría en Gestión de Información</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ciencias-actuariales/">Maestría en Ciencias Actuariales</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-desarrollo-y-gerencia-integral-de-proyectos/">Maestría en Desarrollo y Gerencia Integral de Proyectos</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-informatica/">Maestría en Informática</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ingenieria-civil/">Maestría en Ingeniería Civil</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ingenieria-electronica/">Maestría en Ingeniería Electrónica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ingenieria-electrica/">Maestría en Ingeniería Eléctrica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ingenieria-industrial/">Maestría en Ingeniería Industrial</a></li>
                                                </ul>
                                            </div>  <!-- col-megamenu.// -->
                                        </div>    
                                        <div class="col-md-3">
                                            <div class="col-megamenu">
                                                <h6 class="title">Doctorado</h6>
                                                <ul class="list-unstyled">
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/doctorado-en-ingenieria/">Doctorado en Ingeniería</a></li>
                                                </ul>
                                            </div>  <!-- col-megamenu.// -->
                                        </div><!-- end col-3 -->
                                    </div><!-- end row --> 
                                </div> <!-- dropdown-mega-menu.// -->
                            </li>
                            <li><a href="https://escuela.aguayo.co/es/admisiones/" class="nav-link item dos">ADMISIONES</a></li>
                            <li><a href="https://escuela.aguayo.co/es/investigacion-e-innovacion/" class="nav-link item dos">INVESTIGACIÓN E INNOVACIÓN</a></li>
                            <li><a href="https://escuela.aguayo.co/es/la-escuela/" class="nav-link item dos">LA ESCUELA</a></li>
                            <li><a href="https://escuela.aguayo.co/es/noticias/" class="nav-link item dos">NOTICIAS</a></li>
                            <li><a href="#" class="nav-link item dos">EVENTOS</a></li>
                        </ul>
                    </div> <!-- navbar-collapse.// -->
                </nav>
            </div>
        </div>
    </div>
</div>

</div>

 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="Navegacion/js/popper.min.js"></script>
    <script src="Navegacion/js/bootstrap.min.js"></script>
    <script src="Navegacion/js/bootstrap.bundle.min.js"></script>
             <script>
            // jQuery code
        // Prevent closing from             click ins            ide dropdown
            $(document).on('click', '.dropdown-menu', function (e) {
            e.st            opPropagation();
     });
</script>
        
       
            <%
                javax.naming.Context ctx = new javax.naming.InitialContext();
                javax.naming.Context myenv = (javax.naming.Context) ctx.lookup("java:comp/env");
                java.lang.String clientId = (java.lang.String) myenv.lookup("clientId");
                java.lang.String tenantId = (java.lang.String) myenv.lookup("tenantId");
                String redirectUri = (String) ctx.lookup("java:comp/env/redirectUri");
            %>

            <div class="container contenidos-x" style="padding-bottom: 5px" align="center">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <h2>SERVICIOS PROFESORES Y ADMINISTRATIVOS</h2>
                        <div class=" col-xs-3 col-sm-3 col-md-3 col-lg-3"></div><br><br>
                        <div class="shadow p-3 mb-5 bg-white rounded form-group col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <form class="login" action="../intraeci/LoginAjax" method="post" name="forma" target="_blank" onSubmit="limpiarFormulario3()">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <label>Usuario</label>
                                    <input readonly class="form-control" type="text" id="usuario" name="usuario" value="${userInfo.displayableId}" />
                                    <a href="https://gestorpasswd.escuelaing.edu.co/"> ¿olvidó su contraseña? </a><br>
                                    <input  type="submit" value="Entrar" class="btn btn-danger" style="background-color: #990000;border-color: #990000"/>
                                </div>
                            </form>                              
                        </div>
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
                    </div>
                </div>
                <br><br><br><br>
            </div>



            <footer style="position: static">
                <div class="container">
                    <div class="row">
                        <div class="col-8 oferta-academica">
                            <ul>
                                <h6>Oferta Educativa</h6>  
                                <li>Carreras profesionales</li>
                                <li>Especializaciones</li>
                                <li>Maestrías</li>
                                <li>Doctorado</li>
                                <li>Educación Continuada</li>
                                <li>Escuela Internacional de Verano</li> 
                            </ul>

                        </div>
                        <div class="col localizacion-redes">
                            <ul> 
                                <li><img width="60%" height="60%" src="img/Navegacion/acreditacion.png" class="img-fluid" alt="acreditación institucional"></li><br>
                                <li>
                                    <div class="row">
                                        <div class="col-1 mr-2">
                                            <img src="img/Navegacion/icono-localizacion.png" alt="localizacion">
                                        </div>
                                        <div class="col ml-1">
                                            <p>AK. 45 n.º 205 - 59 (Autopista Norte)
                                                <br>PBX: +57 (1) 668 3600 - Bogotá
                                                <br>Línea nacional gratuita: 018000112668</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <ul class="list-inline">
                                        <li class="list-inline-item"><a href="https://www.facebook.com/EscuelaIng/" target="_blank"><img src="img/Navegacion/icono-facebook.png" class="img-fluid" alt="facebook"></a></li>
                                        <li class="list-inline-item"><a href="https://twitter.com/Escuelaing" target="_blank"><img src="img/Navegacion/icono-twitter.png" class="img-fluid" alt="twitter"></a></li>
                                        <li class="list-inline-item"><a href="https://www.linkedin.com/school/escuela-colombiana-de-ingenieria/" target="_blank"><img src="img/Navegacion/icono-linkedin.png" class="img-fluid" alt="linkedin"></a></li>
                                        <li class="list-inline-item"><a href="https://www.instagram.com/somoscivilescuelaing/" target="_blank"><img src="img/Navegacion/icono-instagram.png" class="img-fluid" alt="instagram"></a></li>
                                        <li class="list-inline-item"><a href="https://www.youtube.com/user/escuelacolingenieria" target="_blank"><img src="img/Navegacion/icono-youtube.png" class="img-fluid" alt="youtube"></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="col-12 derechos-reservados">
                            <p>
                                Todos los derechos reservados ©2011 - Escuela Colombiana de Ingeniería Julio Garavito. Personería Jurídica 086 de enero 19 de 1973. Renovación de Acreditación Institucional de Alta Calidad. Resolución 002710 del 18 de marzo de 2019 (vigencia de 6 años). Vigilada por Mineducación.
                            </p>
                        </div>
                    </div>
                </div>
            </footer>
        </body>
</html>