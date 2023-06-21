<%@ include file="../secureprof.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,java.text.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%
    response.setHeader("Cache-Control", "no-cache");
    PrintWriter aout = response.getWriter();
    //Profesor prof = new Profesor(IdProf) ;
    //Fecha actual
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    Date currentTime_1 = new Date();
    String dateString = formatter.format(currentTime_1);
    Date hoy = formatter.parse(dateString);
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
%>
<html>
    <head>
        <title>Cancela Reservas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

        <style type="text/css">
            <!--
            #fecha {
                font-family: Verdana, Arial;
                font-size: 12px;
            }
            -->

            <!--
            a  { text-decoration: none }
            .texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

            -->
        </style>
        <script language="JavaScript">
            function fecha(){
            fecha = new Date()
            mes = fecha.getMonth()
            diaMes = fecha.getDate()
            diaSemana = fecha.getDay()
            anio = fecha.getFullYear()
            dias = new Array('Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sábado')
            meses = new Array('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre')
            document.write('<span id="fecha">')
            document.write (dias[diaSemana] + ", " + diaMes + " de " + meses[mes] + " de " + anio )
            document.write ('</span>')
            }

            function validafecha(){
            var cad = document.form1.fecuso.value;
            var i;
            var aux1="";
            var ja = new Array(); 
            ja = cad.split("/"); 
            //var dia =parseInt(ja[1]) - 1;
            var dia = ja[1]-1;
            var fechaAux = new Date(ja[2], dia, ja[0]);
            //fechaAux = new Date()
            mes = fechaAux.getMonth()
            diaMes = fechaAux.getDate()
            diaSemana = fechaAux.getDay()
            anio = fechaAux.getFullYear()
            dias = new Array('Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sábado')
            meses = new Array('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre')
            document.write('<span id="fecha">')
            document.write (dias[diaSemana] + ", " + diaMes + " de " + meses[mes] + " de " + anio )
            document.write ('</span>')
            }

        </script>
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
            <table width="900" border="0" align="center">
                <tr> 
                    <td width="86%" height="41" align="center" valign="top"> <br>
                        <% 		   String token[] = new String[500];
                            int p = 0;
                            //String [] token;
                            String[] checEli;
                            checEli = request.getParameterValues("checEli");
                            int longChec = checEli.length;
                            for (int i = 0; i < longChec; i++) {
                                if (checEli[i].compareTo("null") != 0) {
                                    StringTokenizer st = new StringTokenizer(checEli[i], "*");
                                    int k = 0;
                                    while (st.hasMoreTokens()) {
                                        token[k] = st.nextToken();
                                        k = k + 1;

                                    }
                                    //String result = valida(token[1]);					
                                    Date fechasol = formatter.parse(token[1]);
                                    if (hoy.before(fechasol)) {
                                        p = 1;
                                        admin.eliminaReserva(token[0]);
                                    } else {
                                        p = 0;
                                    }
                                }
                            }

                        %>
                        <% if (p == 1) {%>
                        <form name=form1>
                            <input type="hidden" name="fecuso" value=<%=token[1]%>>
                            <table width="95%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                                <tr> 
                                    <td> 
                                        <div align="left"> 
                                            <p>Este 
                                                formato certifica que el profesor <b><%=empleado.getNomemp()%></b>, 
                                                cancelo el sal&oacute;n <b><%=token[2]%></b> para el día 
                                                <b> 
                                                    <script>validafecha()</script>
                                                </b> de <b><%=token[3]%></b> a <b><%=token[4]%>.</b></p>
                                            <p>Nro. 
                                                de solicitud: <%=token[0]%><br>
                                                Fecha de cancelaci&oacute;n: 
                                                <script>fecha()</script>
                                            </p>
                                            <p><i>&quot;Por 
                                                    favor conserve este desprendible para cualquier tipo de 
                                                    aclaraci&oacute;n.&quot; </i></p>
                                            <br>
                                            <center>
                                                <input type=button name=print value="Imprimir" onclick="window.open('ImprimirDesprendible?impre=elimina&salon=<%=token[2]%>&fecuso=<%=token[1]%>&hora=<%=token[3]%>&horafin=<%=token[4]%>&sec=<%=token[0]%>', '', 'width=800,height=600, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');
                    return false" class="boton">
                                            </center>
                                            <br>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <%} else {%>
                        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><i><b>NO 
                                    puede cancelar una reserva el mismo d&iacute;a de la fecha de utilización. 
                                    Para poder cancelarla debe hacerlo un d&iacute;a antes.</b></i></font></p>
                                    <%}%>	
                        <br>
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
            <p>&nbsp;</p></div></body>
</html>

