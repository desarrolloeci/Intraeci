<%@ include file="secure.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
    <head>
        <title>Mensaje</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <%
        response.setHeader("Cache-Control", "no-cache");
        HttpSession sesion;
        login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");
        String idmsj = request.getParameter("idmsj");
        String msjsup = new String("");
        String titulo = new String("");
        String msj = new String("");
        String piepag = new String("");
        if (idmsj != null) {
            if (idmsj.equals("1")) {
                titulo = "Captura de Notas";
                msjsup = "Las notas ya han sido procesadas y registradas en el sistema.";
                msj = "<b>Distinguido(a) profesor(a):</b>" +
                        "<p>A partir de la fecha, el mecanismo de entrega de notas se manejará exclusivamente " +
                        "vía Internet (Usted NO tendrá necesidad de entregar " +
                        "soporte físico). A manera de control " +
                        "personal, se recomienda que imprima las notas que acaba de enviar, mediante la opcion " +
                        "\"Imprimir Notas\" en el menú <a href=\"CapturaNotas\">Capturar e Imprimir notas</a> del menú principal." +
                        "<br>Estaremos a su disposición para atender cualquier duda o inconveniente.<br>SECRETARIA GENERAL";
                piepag = "CapturaNotas";
            } else if (idmsj.equals("2")) {
                titulo = "Captura de Notas";
                msjsup = "Las notas ya han sido procesadas y registradas en el sistema.";
                msj = "<b>Distinguido(a) profesor(a):</b>" +
                       "<br>Estaremos a su disposición para atender cualquier duda o inconveniente.<br>SECRETARIA GENERAL";
                piepag = "CapturaNotas";
            } else if (idmsj.equals("3")) {
                String grupo = request.getParameter("grupo");
                titulo = "Captura de Notas";
                msjsup = "Las notas ya han sido procesadas y registradas en el sistema.";
                msj = "<b>Distinguido(a) profesor(a):</b>" +
                        "<p>A partir de la fecha, el mecanismo de entrega de notas se manejará exclusivamente " +
                        "vía Internet (Usted NO tendrá necesidad de entregar " +
                        "soporte físico). A manera de control " +
                        "personal, se recomienda que imprima las notas que acaba de enviar, mediante la opcion " +
                        "\"Impresion de Notas Posgrado\" ." +
                        "<input type=\"hidden\" name=\"idgrupo\" value=\"" + grupo + "\">" +
                        "<br>Estaremos a su disposición para atender cualquier duda o inconveniente.<br>SECRETARIA GENERAL" +
                        "</form>" ;
                piepag = "NotasPosgrado?paramtext=0";
            } else if (idmsj.equals("4")) {
                titulo = "Solicitud de Salones";
                msjsup = "Usted tiene completas las reservas para este mes";
                piepag = "SolicitudSalones";
            } else if (idmsj.equals("5")) {
                String salon = request.getParameter("salon");
                String fecuso = request.getParameter("fecuso");
                String hora = request.getParameter("hora");
                String horafin = request.getParameter("horafin");
                String sec = request.getParameter("sec");

                titulo = "Solicitud de Salones";
                msj = "Este formato certifica que el profesor <b>" + empleado.getNomemp() + "</b>, separo el salón " +
                        salon + " para el día " + fecuso + " desde las " + hora + " hasta las " + horafin + ". <br>" +
                        "<script language=\"JavaScript\" type=\"text/JavaScript\"> \n" +
                        "function fecha(){ \n" +
                        "fecha = new Date() \n" +
                        "mes = fecha.getMonth() \n" +
                        "diaMes = fecha.getDate() \n" +
                        "diaSemana = fecha.getDay() \n" +
                        "anio = fecha.getFullYear() \n" +
                        "dias = new Array('Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sábado') \n" +
                        "meses = new Array('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre') \n" +
                        "document.write('<span id=\"fecha\">') \n" +
                        "document.write (dias[diaSemana] + \", \" + diaMes + \" de \" + meses[mes] + \" de \" + anio ) \n" +
                        "document.write ('</span>') \n } \n" +
                        "</script> \n" +
                        "<p>Nro. de solicitud:" + sec + "<br>" +
                        "Fecha de solicitud:<script>fecha()</script></p>Por favor conserve este desprendible" +
                        " para cualquier tipo de aclaración o para la cancelación de la petición." +
                        " <br><br><br><center><input type=button name=print value=\"Imprimir\" onclick=\"window.open('ImprimirDesprendible?impre=solicitud&salon=" + salon + "&fecuso=" +
                        fecuso + "&hora=" + hora + "&horafin=" + horafin + "&sec=" + sec + "','','width=800,height=600, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes," +
                        " menubar=yes,resizable=yes');return false\" class=\"boton\"></center>";
                piepag = "SolicitudSalones";
            // piepag = "SalonesExa";
            } else if (idmsj.equals("6")) {
                titulo = "Correo enviado";
                msjsup = "Se ha enviado el correo satisfactoriamente";
                msj = "Para continuar haga click en <a href=\"Menu\"> Atrás </a>";
                piepag = "Menu";
            } else if (idmsj.equals("7")) {
                titulo = "Captura de Notas";
                msjsup = "Este grupo no tiene información de control";
                msj = "Comuníquese con la oficina de Registro Académico";
                piepag = "Menu";
            } else if (idmsj.equals("8")) {
                titulo = "Solicitud Curso en Mooodle";
                msjsup = "Su solicitud ha sido enviada satisfactoriamente";
                piepag = "Menu";
            } else if (idmsj.equals("9")) {
                titulo = "Solicitud Curso en Mooodle";
                msjsup = "Su solicitud no ha podido ser enviada,\n\r intente nuevamente y si el problema persiste comuníquese con OSIRIS";
                piepag = "Menu";
            } else if (idmsj.equals("10")) {
                titulo = "Solicitud Curso en Mooodle";
                msjsup = "Su solicitud no ha podido ser enviada, usted no es usuario Preciso, debe comuníquese con Recursos Humanos";
                piepag = "Menu";
            } else if (idmsj.equals("11")) {
                String grupo = request.getParameter("idgrupo");
                String tercio = request.getParameter("tercio");
                String clanum = request.getParameter("clavenume");
                String rbopciones = request.getParameter("rbopciones");
                String periodo = request.getParameter("periodo");
                titulo = "Solicitud de Modificación de Notas";
                msjsup = "Su solicitud de modificación de notas ha sido procesada y registrada en el sistema." +
                        " <input type=\"hidden\" name=\"grupo\" value=\"" + grupo + "\"> " +
                        " <input type=\"hidden\" name=\"tercio\" value=\"" + tercio + "\"> " +
                        " <input type=\"hidden\" name=\"clanum\" value=\"" + clanum + "\"> " +
                        " <input type=\"hidden\" name=\"rbopciones\" value=\"" + rbopciones + "\"> ";
                piepag = "NotasModificar?idgrupo=" + grupo + "&tercio=" + tercio + "&clavenume=" + clanum + "&rbopciones=" + rbopciones + "&periodo=" + periodo;
            } else if (idmsj.equals("12")) {
                String salon = request.getParameter("salon");
                String fecuso = request.getParameter("fecuso");
                String hora = request.getParameter("hora");
                String horafin = request.getParameter("horafin");
                String sec = request.getParameter("sec");
                String tarifa = request.getParameter("tarifa");
                titulo = "Solicitud de Reserva Polideportivo";
                msj = "Este formato certifica que el profesor <b>" + empleado.getNomemp() + "</b>, separo el salón " +
                        salon + " para el día " + fecuso + " desde las " + hora + " hasta las " + horafin + ". <br>" +
                        "<script language=\"JavaScript\" type=\"text/JavaScript\"> \n" +
                        "function fecha(){ \n" +
                        "fecha = new Date() \n" +
                        "mes = fecha.getMonth() \n" +
                        "diaMes = fecha.getDate() \n" +
                        "diaSemana = fecha.getDay() \n" +
                        "anio = fecha.getFullYear() \n" +
                        "dias = new Array('Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sábado') \n" +
                        "meses = new Array('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre') \n" +
                        "document.write('<span id=\"fecha\">') \n" +
                        "document.write (dias[diaSemana] + \", \" + diaMes + \" de \" + meses[mes] + \" de \" + anio ) \n" +
                        "document.write ('</span>') \n } \n" +
                        "</script> \n" +
                        "<p>Nro. de solicitud:" + sec + "<br>" +
                        "Fecha de solicitud:<script>fecha()</script></p>" +
                       /* "Con la presente, me permito autorizar a la Escuela Colombiana de Ingeniería Julio Garavito,  a descontar por nómina el valor de $" + tarifa +
                        "por concepto de ____________, a partir (o en la nómina de) del mes________. " +
                        "Así mismo, autorizo a la Escuela para que retenga y cobre de mi liquidación de prestaciones sociales, salarios e indemnizaciones los saldos que esté adeudando, en caso de que llegase a finalizar mi contrato de trabajo antes de completar el pago total objeto de la presente libranza, según lo establecido en el artículo 149 del Código Sustantivo del Trabajo. " +*/
                        "Por favor conserve este desprendible para cualquier tipo de aclaración o para la cancelación de la petición." +
                        " <br><br><br><center><input type=button name=print value=\"Imprimir\" onclick=\"window.open('ImprimirDesprendible?impre=solicitud&salon=" + salon + "&fecuso=" +
                        fecuso + "&hora=" + hora + "&horafin=" + horafin + "&sec=" + sec + "','','width=800,height=600, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes," +
                        " menubar=yes,resizable=yes');return false\" class=\"boton\"></center>";
                piepag = "Polideportivo";
            // piepag = "SalonesExa";
            } else if (idmsj.equals("13")) {
                titulo = "Solicitud Reserva Polideportivo";
                msjsup = "Su solicitud no ha podido ser enviada,  la capacidad solicitada excede la capacidad de disponibilidad del Recurso";
                piepag = "Menu";
            }else if (idmsj.equals("14")) {
                titulo = "Solicitud Talento Humano";
                msjsup = "Talento Humano está temporalmente fuera de servicio por motivos de integración con el ERP";
                piepag = "Menu";
            }

        }
        %>
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function enfocar(){
                window.focus();
                preloadImg();
            }
            //-->
        </script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
         <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
    </head>

    <body background="img/fondo.gif" onLoad="enfocar()">
         <div class="container">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
             <jsp:param name="headerImg" value="banner.jpg" />
        </jsp:include>
        <table width="819" border="0" align="center" cellspacing="0" class="textocom">
            <tr class="textocom">
                <td height="40"><div align="center"><font color="#990000"><strong><%=msjsup%></strong></font></div>      </td>
            </tr>
            <tr>
                <td valign="top"><%=msj%></td>
            </tr>
            <tr>
                <td>
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="<%=piepag%>" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
         </div>
    </body>
</html>
