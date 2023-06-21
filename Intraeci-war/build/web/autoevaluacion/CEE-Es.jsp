<%@ include file="../secureprof.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>

<%
            HttpSession sesion;
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
            if (i==4 ){ 
                if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked && !document.forms.form1[nombre][5].checked) {
                alert("Por favor responda todos los campos de la encuesta");
                document.forms.form1[nombre][0].style.backgroundColor= '#ffcc00';
                document.forms.form1[nombre][0].focus();
                return false;
            }
            }else  if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked) {
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

<p class="Centro" align="center"><strong>Cuestionario de Entrevista Empleados-Es</strong></p>
<form name="form1"  method="post" onSubmit="return comprueba( );" action="autoevaluacion">
    <input type="hidden" name="total" value="4">
    <input type="hidden" name="idenc" value="147">
    <input type="hidden" name="flag" value="<%=flag%>">
    <input type="hidden" name="prog" value="<%=prog%>">

    
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr> 
      <td rowspan="2" width="2%">1</td>
      <td rowspan="2" width="38%">De acuerdo con el desempe&ntilde;o del profesional 
        a su cargo, considera que el programa responde a las necesidades de su 
        organizaci&oacute;n</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
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
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P1" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">2</td>
      <td rowspan="2" width="38%">De acuerdo con el desempe&ntilde;o del profesional 
        a su cargo, considera que el programa se encuentra alineado con las tendencias 
        actuales del ejercicio profesional</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
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
      <td rowspan="2" width="38%">El profesional de la Escuela muestra rasgos 
        distintivos comparado con profesionales del mismo nivel de formaci&oacute;n 
        de otras instituciones</td>
      <td width="11%" align="center" height="20">Totalmente de acuerdo</td>
      <td width="11%" align="center" height="20">De acuerdo</td>
      <td width="11%" align="center" height="20">Parcialmente de acuerdo</td>
      <td width="11%" align="center" height="20">En desacuerdo</td>
      <td width="12%" align="center" height="20" colspan="2">En total desacuerdo</td>
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
      <td colspan="8"> 
        <p>&nbsp;</p>
        <p><b>Escribir cu&aacute;les son esos rangos distintivos:</b></p>
        <p> 
          <input type="text" name="justif1" maxlength="220" size="220">
        </p>
        <p><b>1.Comentarios</b></p>
        <p> 
          <textarea name="justif2" cols="125" rows="2"></textarea>
        </p>
        <p>&nbsp;</p>
      </td>
    </tr>
    <tr> 
      <td width="2%">&nbsp;</td>
      <td width="38%">&nbsp;</td>
      <td width="11%" align="center">Muy alto</td>
      <td width="11%" align="center">Alto</td>
      <td width="11%" align="center">Medio</td>
      <td width="11%" align="center">Bajo</td>
      <td width="6%" align="center">Muy bajo</td>
      <td width="6%" align="center">No sabe</td>
    </tr>
    <tr> 
      <td width="2%">4</td>
      <td width="38%">El impacto social que el Programa ha ejercido sobre el medio 
        a trav&eacute;s de sus graduados es:</td>
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
      <td width="6%" align="center"> 
        <input type="radio" name="P4" value="1">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P4" value="0">
      </td>
    </tr>
  </table>
  <p><b>2.Comentarios</b> </p>
  <p> 
    <textarea name="granjustif" cols="125" rows="2"></textarea>
  </p>
    <div align="center">
        <input type="submit" name="Submit" value="Enviar Datos">
    </div>
</form>
</body>
</html>

