<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
String salon = request.getParameter("salon");
String fecuso = request.getParameter("fecuso");
String hora = request.getParameter("hora");
String horafin = request.getParameter("horafin");
String sec = request.getParameter("sec");
String impre = request.getParameter("impre");
login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness)session.getAttribute("empleado");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="JavaScript">
        <!--
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
        function imprimir(){
            window.print();
            window.close();
        }
          -->
        </script>
    </head>
    <body onload="imprimir()">
    <table width="530" border="1" cellpadding="1" cellspacing="1" bordercolor="#999999">
      <tr>
        <td>    <br>
    <table width="530" height="265" border="0" cellspacing="1" class="textoimpre">
      <tr>
        <td width="529" height="97" colspan="5"><div align="center"><strong><font size="3">Escuela
            Colombiana de Ingeniería<br>
            Servicio a Profesores<br>
        Solicitud de Salones</font></strong></div></td>
      </tr>
      <tr>
        <td colspan="5"><p>Este
              formato certifica que el profesor <b><u>
                          <%=empleado.getNomemp()%></u></b>
<%
      if(impre.equals("elimina"))
            out.println(", cancel&oacute; ");
      else
            out.println(", separ&oacute; ");              
%>
                          el sal&oacute;n <b>
                          <%=salon%>
                          </b> para el día <b>
                          <%=fecuso%>
                          </b> desde las <b>
                          <%=hora%>
                          </b> hasta las <b>
                          <%=horafin%>
                        </b>.</p>
          <p>Nro.
              de solicitud:
                <%=sec%>
                <br>
<%
      if(impre.equals("elimina"))
            out.println("Fecha de cancelación:");
      else
            out.println("Fecha de solicitud:");              
%>
  <script>fecha()</script>
          </font></p>
          <p><i>&quot;Por
        favor conserve este desprendible para cualquier tipo de aclaraci&oacute;n o para la cancelaci&oacute;n de la petici&oacute;n.&quot; </i></p>
        </td>
      </tr>
    </table>
	</td>
      </tr>
    </table>
    </body>
</html>
