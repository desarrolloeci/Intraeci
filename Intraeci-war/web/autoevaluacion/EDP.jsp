<%@ include file="../secureprof.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>

<%HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            session.setAttribute("loginex", empleado.getUsrExchange());
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
            String cedula = empleado.getIdemp();
            String flag = request.getParameter("flag");
            String prog = request.getParameter("prog");%>

<SCRIPT LANGUAGE="JavaScript">

    function comprueba( ){
        for(i=1; i<5; i++){
            nombre = new String("P" + i);

            if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked) {
                alert("Por favor responda todos los campos de la encuesta");
                document.forms.form1[nombre][0].style.backgroundColor= '#ffcc00';
                document.forms.form1[nombre][0].focus();
                return false;
            }
        }
        return true;
    }

</SCRIPT>
<style type="text/css"></style>
<p class="Centro" align="center"><strong>Encuesta Directores de Programa</strong></p>
	<form name="form1"  method="post" onSubmit="return comprueba( );" action="autoevaluacion">
  <div align="center">
    <input type="hidden" name="total" value="4">
    <input type="hidden" name="idenc" value="130">
    <input type="hidden" name="flag" value="<%=flag%>">
    <input type="hidden" name="prog" value="<%=prog%>">
    <table width="90%" border="1" cellspacing="0" cellpadding="0">
      <tr> 
        <td rowspan="2" width="2%">1</td>
        <td rowspan="2" width="38%">El apoyo que los consejeros ofrecen a los 
          estudiantes con dificultades acad&eacute;micas ha sido: (directores)</td>
        <td width="11%" align="center">Muy efectivos</td>
        <td width="11%" align="center">Efectivos</td>
        <td width="11%" align="center">Medianamente efectivos</td>
        <td width="11%" align="center">Poco efectivos</td>
        <td width="6%" align="center">Nada efectivos</td>
        <td width="6%" align="center">No aplica</td>
      </tr>
      <tr> 
        <td width="11%" align="center"> 
          <input type="radio" name="P1" value="5">
        </td>
        <td width="11%" align="center"> 
          <input type="radio" name="P1" value="4">
        </td>
        <td width="11%" align="center"> 
          <input type="radio" name="P1" value="3">
        </td>
        <td width="11%" align="center"> 
          <input type="radio" name="P1" value="2">
        </td>
        <td width="6%" align="center"> 
          <input type="radio" name="P1" value="1">
        </td>
        <td width="6%" align="center">
          <input type="radio" name="P1" value="0">
        </td>
      </tr>
      <tr> 
        <td rowspan="2" width="2%">2</td>
        <td rowspan="2" width="38%">a. Su nivel de conocimiento de las pol&iacute;ticas, 
          normas y criterios de selecci&oacute;n, vinculaci&oacute;n, renovaci&oacute;n 
          y contrataci&oacute;n del profesorado es: </td>
        <td width="11%" align="center">Muy bueno</td>
        <td width="11%" align="center">Bueno</td>
        <td width="11%" align="center">Regular</td>
        <td width="11%" align="center">Malo</td>
        <td width="12%" align="center" colspan="2">Nulo</td>
      </tr>
      <tr> 
        <td width="11%" align="center"> 
          <input type="radio" name="P2" value="5">
        </td>
        <td width="11%" align="center"> 
          <input type="radio" name="P2" value="4">
        </td>
        <td width="11%" align="center"> 
          <input type="radio" name="P2" value="3">
        </td>
        <td width="11%" align="center"> 
          <input type="radio" name="P2" value="2">
        </td>
        <td width="12%" align="center" colspan="2"> 
          <input type="radio" name="P2" value="1">
        </td>
      </tr>
      <tr> 
        <td rowspan="2" width="2%">3</td>
        <td rowspan="2" width="38%">b. En la vinculaci&oacute;n de los profesores 
          del Programa en los &uacute;ltimos cinco a&ntilde;os se evidencia la 
          aplicaci&oacute;n de las pol&iacute;ticas, normas y criterios de selecci&oacute;n, 
          vinculaci&oacute;n, renovaci&oacute;n y contrataci&oacute;n del profesorado. 
        </td>
        <td width="11%" align="center">Totalmente de acuerdo</td>
        <td width="11%" align="center">De acuerdo</td>
        <td width="11%" align="center">Parcialmente de acuerdo</td>
        <td width="11%" align="center">En desacuerdo</td>
        <td width="12%" align="center" colspan="2">En total desacuerdo</td>
      </tr>
      <tr> 
        <td width="11%" align="center"> 
          <input type="radio" name="P3" value="5">
        </td>
        <td width="11%" align="center"> 
          <input type="radio" name="P3" value="4">
        </td>
        <td width="11%" align="center"> 
          <input type="radio" name="P3" value="3">
        </td>
        <td width="11%" align="center"> 
          <input type="radio" name="P3" value="2">
        </td>
        <td width="12%" align="center" colspan="2"> 
          <input type="radio" name="P3" value="1">
        </td>
      </tr>
      <tr> 
        <td rowspan="2" width="2%">4</td>
        <td rowspan="2" width="38%">Directivos: El Programa tiene claramente definidas 
          las funciones del personal directivo y administrativo y su articulaci&oacute;n 
          con los objetivos y necesidades del mismo.</td>
        <td width="11%" align="center">Totalmente de acuerdo</td>
        <td width="11%" align="center">De acuerdo</td>
        <td width="11%" align="center">Parcialmente de acuerdo</td>
        <td width="11%" align="center">En desacuerdo</td>
        <td width="12%" align="center" colspan="2">En total desacuerdo</td>
      </tr>
      <tr> 
        <td width="11%" align="center"> 
          <input type="radio" name="P4" value="5">
        </td>
        <td width="11%" align="center"> 
          <input type="radio" name="P4" value="4">
        </td>
        <td width="11%" align="center"> 
          <input type="radio" name="P4" value="3">
        </td>
        <td width="11%" align="center"> 
          <input type="radio" name="P4" value="2">
        </td>
        <td width="12%" align="center" colspan="2"> 
          <input type="radio" name="P4" value="1">
        </td>
      </tr>
    </table>
  </div>
  <p>&nbsp;</p>
  <div align="center">
    <input type="submit" name="Submit" value="Enviar Datos">
  </div>
</form>
</body>
</html>

