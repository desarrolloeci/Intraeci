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
            String prog = request.getParameter("prog");

%>
<SCRIPT LANGUAGE="JavaScript">

    function comprueba( ){
        for(i=1; i<81; i++){
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
<p class="Centro" align="center"><strong>Guía Grupo Base</strong></p>

	<form name="form1"  method="post" onSubmit="return comprueba( );" action="autoevaluacion">
	<input type="hidden" name="total" value="80">
	<input type="hidden" name="idenc" value="135">
        <input type="hidden" name="flag" value="<%=flag%>">
        <input type="hidden" name="prog" value="<%=prog%>">
	<table width="98%" border="1" cellspacing="0" cellpadding="0">

		<tr><td rowspan="2" width="2%">1</td>
		  <td rowspan="2" width="38%">El Proyecto de Formaci&oacute;n del Programa est&aacute; claramente formulado.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P1" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P1" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P1" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P1" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P1" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">2</td>
		  <td rowspan="2" width="38%">Su nivel de conocimiento del Proyecto Educativo Institucional (PEI) de la Escuela es:</td>
		  <td width="11%" align="center">Muy bueno</td><td width="11%" align="center">Bueno</td>
		  <td width="11%" align="center">Regular</td><td width="11%" align="center">Malo</td><td width="12%" align="center">Nulo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P2" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P2" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P2" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P2" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P2" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">3</td>
		  <td rowspan="2" width="38%">Su nivel de conocimiento de la Misi&oacute;n de la Escuela es:</td>
		  <td width="11%" align="center">Muy bueno</td><td width="11%" align="center">Bueno</td>
		  <td width="11%" align="center">Regular</td><td width="11%" align="center">Malo</td><td width="12%" align="center">Nulo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P3" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P3" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P3" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P3" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P3" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">4</td>
		  <td rowspan="2" width="38%">Su nivel de conocimiento del Proyecto de Formaci&oacute;n del programa es:</td>
		  <td width="11%" align="center">Muy bueno</td><td width="11%" align="center">Bueno</td>
		  <td width="11%" align="center">Regular</td><td width="11%" align="center">Malo</td><td width="12%" align="center">Nulo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P4" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P4" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P4" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P4" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P4" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">5</td>
		  <td rowspan="2" width="38%">Su nivel de conocimiento del Reglamento Estudiantil es: </td>
		  <td width="11%" align="center">Muy bueno</td><td width="11%" align="center">Bueno</td>
		  <td width="11%" align="center">Regular</td><td width="11%" align="center">Malo</td><td width="12%" align="center">Nulo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P5" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P5" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P5" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P5" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P5" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">6</td>
		  <td rowspan="2" width="38%">Existen documentos con la evidencia sobre la reflexi&oacute;n, estudio o an&aacute;lisis formulados o en desarrollo, acerca de las tendencias y l&iacute;neas de desarrollo de la disciplina o profesi&oacute;n a nivel local,  regional, nacional e internacional que busquen la moderniza</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P6" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P6" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P6" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P6" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P6" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">7</td>
		  <td rowspan="2" width="38%">En el proyecto de formaci&oacute;n existe la explicaci&oacute;n clara de la correspondencia entre la formaci&oacute;n ofrecida por el programa, el t&iacute;tulo que otorga y el perfil del graduado.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P7" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P7" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P7" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P7" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P7" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">8</td>
		  <td rowspan="2" width="38%">El n&uacute;mero de estudiantes matriculados en el programa por cohorte en los &uacute;ltimos 5 a&ntilde;os (estudio sociodemogr&aacute;fico: puntaje icfes, estrato econ&oacute;mico, colegio) es adecuado:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P8" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P8" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P8" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P8" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P8" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">9</td>
		  <td rowspan="2" width="38%">La relaci&oacute;n de estudiantes inscritos, admitidos y matriculados al programa en los &uacute;ltimos 5 a&ntilde;os es adecuada:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P9" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P9" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P9" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P9" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P9" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">10</td>
		  <td rowspan="2" width="38%">Existen documentos con evidencias de la reflexi&oacute;n, el estudio o el an&aacute;lisis para identificar, evaluar y corregir las causas de la deserci&oacute;n estudiantil, acciones resultantes de la reflexi&oacute;n e impacto de las mismas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P10" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P10" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P10" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P10" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P10" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">11</td>
		  <td rowspan="2" width="38%">Existe informaci&oacute;n sobre la tasa de deserci&oacute;n del programa por cohortes (distinguir entre mortalidad acad&eacute;mica y retiro por otras causas) (5 &uacute;ltimos a&ntilde;os).</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P11" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P11" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P11" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P11" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P11" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">12</td>
		  <td rowspan="2" width="38%">La relaci&oacute;n entre la duraci&oacute;n prevista del programa y la duraci&oacute;n real de las cohortes es adecuada.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P12" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P12" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P12" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P12" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P12" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">13</td>
		  <td rowspan="2" width="38%">Existe informaci&oacute;n actualizada sobre el n&uacute;mero de profesores del programa por dedicaci&oacute;n y categor&iacute;as acad&eacute;micas establecidas en el escalaf&oacute;n.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P13" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P13" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P13" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P13" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P13" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">14</td>
		  <td rowspan="2" width="38%">La relaci&oacute;n entre el n&uacute;mero de profesores del programa y el cumplimiento de las necesidades y compromisos del mismo es:</td>
		  <td width="11%" align="center">Muy adecuada</td><td width="11%" align="center">Adecuada</td>
		  <td width="11%" align="center">Medianamente adecuada</td><td width="11%" align="center">Poco adecuada</td><td width="12%" align="center">Nada adecuada</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P14" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P14" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P14" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P14" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P14" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">15</td>
		  <td rowspan="2" width="38%">La relaci&oacute;n entre el n&uacute;mero de profesores del programa y el cumplimiento de las necesidades y compromisos del mismo es:</td>
		  <td width="11%" align="center">Muy adecuada</td><td width="11%" align="center">Adecuada</td>
		  <td width="11%" align="center">Medianamente adecuada</td><td width="11%" align="center">Poco adecuada</td><td width="12%" align="center">Nada adecuada</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P15" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P15" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P15" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P15" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P15" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">16</td>
		  <td rowspan="2" width="38%">Existe informaci&oacute;n actualizada sobre la producci&oacute;n intelectual de los profesores (publicaciones con registro ISBN o ISSN, cap&iacute;tulos de libros, art&iacute;culos en revistas, patentes, software, ponencias, productos tecnol&oacute;gicos, etc.) como resultado de actividade</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P16" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P16" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P16" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P16" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P16" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">17</td>
		  <td rowspan="2" width="38%">Existe informaci&oacute;n actualizada sobre la formaci&oacute;n de los profesores (Pregrado, especializaci&oacute;n, maestr&iacute;a o doctorado).</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P17" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P17" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P17" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P17" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P17" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">18</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas en materia de desarrollo profesoral est&aacute;n claramente formuladas. </td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P18" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P18" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P18" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P18" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P18" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">19</td>
		  <td rowspan="2" width="38%">El plan de perfeccionamiento docente del programa est&aacute; claramente formulado.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P19" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P19" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P19" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P19" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P19" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">20</td>
		  <td rowspan="2" width="38%">Existe informaci&oacute;n con el porcentaje de profesores vinculados al programa, que aprovechan espacios y participan en actividades de desarrollo profesoral y de capacitaci&oacute;n profesional y pedag&oacute;gica.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P20" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P20" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P20" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P20" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P20" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">21</td>
		  <td rowspan="2" width="38%">Existen documentos (evidencias) con evaluaciones peri&oacute;dicas de los profesores.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P21" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P21" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P21" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P21" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P21" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">22</td>
		  <td rowspan="2" width="38%">Existen documentos (evidencias) con las acciones adelantadas por la Escuela a partir de los resultados de la evaluaci&oacute;n integral de los profesores.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P22" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P22" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P22" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P22" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P22" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">23</td>
		  <td rowspan="2" width="38%">Las funciones del director del programa y del personal administrativo del mismo est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P23" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P23" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P23" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P23" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P23" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">24</td>
		  <td rowspan="2" width="38%">Directivos: El Programa tiene claramente definidas las funciones del personal directivo y administrativo y su articulaci&oacute;n con los objetivos y necesidades del mismo.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P24" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P24" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P24" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P24" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P24" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">25</td>
		  <td rowspan="2" width="38%">La relaci&oacute;n del No. graduados registrados en la base de datos de la UGE/ No. de graduados del programa es adecuada:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P25" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P25" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P25" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P25" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P25" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">26</td>
		  <td rowspan="2" width="38%">Los mecanismos de seguimiento de los graduados del Programa son:</td>
		  <td width="11%" align="center">Muy efectivos</td><td width="11%" align="center">Efectivos</td>
		  <td width="11%" align="center">Medianamente efectivos</td><td width="11%" align="center">Poco efectivos</td><td width="12%" align="center">Nada efectivos</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P26" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P26" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P26" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P26" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P26" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">27</td>
		  <td rowspan="2" width="38%">La informaci&oacute;n de seguimiento de graduados para el mejoramiento del Programa se utiliza en grado:</td>
		  <td width="11%" align="center">Muy alto</td><td width="11%" align="center">Alto</td>
		  <td width="11%" align="center">Medio</td><td width="11%" align="center">Bajo</td><td width="12%" align="center">Muy bajo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P27" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P27" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P27" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P27" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P27" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">28</td>
		  <td rowspan="2" width="38%">Existe informaci&oacute;n con el tiempo que transcurre entre la graduaci&oacute;n y la ubicaci&oacute;n de los graduados en el mercado laboral.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P28" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P28" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P28" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P28" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P28" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">29</td>
		  <td rowspan="2" width="38%">La coherencia entre: a) la formaci&oacute;n recibida durante sus estudios en la Escuela  y  b) el campo de desempe&ntilde;o de su profesi&oacute;n es:</td>
		  <td width="11%" align="center">Muy alta</td><td width="11%" align="center">Alta</td>
		  <td width="11%" align="center">Media</td><td width="11%" align="center">Baja</td><td width="12%" align="center">Muy baja</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P29" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P29" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P29" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P29" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P29" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">30</td>
		  <td rowspan="2" width="38%">Las actividades que den cuenta de la integralidad del curr&iacute;culo acordes con las pol&iacute;ticas institucionales (ej: vitrinas, monitor&iacute;as, grupos de inter&eacute;s, conferencias) est&aacute;n claramente descritas en el Proyecto de Formaci&oacute;n.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P30" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P30" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P30" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P30" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P30" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">31</td>
		  <td rowspan="2" width="38%">Existe un documento que muestre la evaluaci&oacute;n sobre la aplicaci&oacute;n de cr&eacute;ditos acad&eacute;micos y competencias en el programa.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P31" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P31" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P31" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P31" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P31" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">32</td>
		  <td rowspan="2" width="38%">Las asignaturas y actividades acad&eacute;micas del programa que expresan la flexibilidad curricular y tiene la posibilidad de tomarse en otros programas de la Escuela, nacionales e internacionales est&aacute;n claramente definidas en un documento.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P32" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P32" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P32" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P32" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P32" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">33</td>
		  <td rowspan="2" width="38%">Existe informaci&oacute;n sobre el n&uacute;mero de estudiantes del programa que toman asignaturas en otros programas de la Escuela, nacionales e internacionales (&uacute;ltimos 5 a&ntilde;os). </td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P33" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P33" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P33" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P33" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P33" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">34</td>
		  <td rowspan="2" width="38%">Las opciones que tiene el estudiante para realizar investigaci&oacute;n o para profundizar en diferentes &aacute;reas est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P34" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P34" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P34" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P34" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P34" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">35</td>
		  <td rowspan="2" width="38%">El perfil que se espera satisfaga el estudiante al culminar el programa est&aacute; claramente formulado (perfil del graduado).</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P35" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P35" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P35" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P35" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P35" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">36</td>
		  <td rowspan="2" width="38%">Los prop&oacute;sitos formativos que se espera que los estudiantes logren en el curso del programa est&aacute;n claramente definidos.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P36" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P36" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P36" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P36" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P36" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">37</td>
		  <td rowspan="2" width="38%">La coherencia entre la denominaci&oacute;n, la justificaci&oacute;n, los objetivos, los procesos curriculares propios del proyecto curricular est&aacute; claramente formulada en el Proyecto de Formaci&oacute;n del Programa.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P37" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P37" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P37" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P37" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P37" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">38</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas y espacios acad&eacute;micos para el tratamiento interdisciplinario de problemas acad&eacute;micos ligados al programa est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P38" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P38" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P38" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P38" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P38" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">39</td>
		  <td rowspan="2" width="38%">La participaci&oacute;n de otras unidades acad&eacute;micas de la Escuela en el tratamiento interdisciplinario de temas y problemas pertinentes al programa est&aacute; claramente descrita en el Proyecto de Formaci&oacute;n.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P39" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P39" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P39" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P39" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P39" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">40</td>
		  <td rowspan="2" width="38%">La descripci&oacute;n de las l&iacute;neas de investigaci&oacute;n y las l&iacute;neas de &eacute;nfasis (si las hay) est&aacute;n claramente definidas en el Proyecto de Formaci&oacute;n.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P40" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P40" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P40" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P40" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P40" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">41</td>
		  <td rowspan="2" width="38%">Los mecanismos de revisi&oacute;n y ajuste del proyecto de formaci&oacute;n del programa son:</td>
		  <td width="11%" align="center">Muy efectivos</td><td width="11%" align="center">Efectivos</td>
		  <td width="11%" align="center">Medianamente efectivos</td><td width="11%" align="center">Poco efectivos</td><td width="12%" align="center">Nada efectivos</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P41" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P41" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P41" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P41" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P41" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">42</td>
		  <td rowspan="2" width="38%">a. Los objetivos de formaci&oacute;n del programa en relaci&oacute;n con la fundamentaci&oacute;n conceptual del proyecto de formaci&oacute;n son pertinentes:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P42" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P42" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P42" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P42" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P42" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">43</td>
		  <td rowspan="2" width="38%">b. Los objetivos de formaci&oacute;n del programa en relaci&oacute;n con la fundamentaci&oacute;n conceptual del proyecto de formaci&oacute;n son coherentes:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P43" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P43" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P43" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P43" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P43" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">44</td>
		  <td rowspan="2" width="38%">El plan de estudios del programa est&aacute; claramente definido.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P44" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P44" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P44" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P44" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P44" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">45</td>
		  <td rowspan="2" width="38%">Los contenidos program&aacute;ticos de cada asignatura del programa est&aacute;n escritos en un documento que contiene: 
a) Nombre completo de la asignatura
b) Fecha de actualizaci&oacute;n
c) Unidad acad&eacute;mica responsable
d) C&oacute;digos mnem&oacute;nico y num&eacute;rico
e) Tipo de asignatura </td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P45" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P45" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P45" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P45" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P45" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">46</td>
		  <td rowspan="2" width="38%">Los procesos y mecanismos para la actualizaci&oacute;n de los contenidos de formaci&oacute;n, evaluaci&oacute;n e incorporaci&oacute;n de avances en la investigaci&oacute;n est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P46" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P46" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P46" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P46" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P46" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">47</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas y criterios de evaluaci&oacute;n de los estudiantes se aplican.</td>
		  <td width="11%" align="center">Siempre</td><td width="11%" align="center">Casi siempre</td>
		  <td width="11%" align="center">Algunas veces</td><td width="11%" align="center">Casi nunca</td><td width="12%" align="center">Nunca</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P47" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P47" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P47" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P47" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P47" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">48</td>
		  <td rowspan="2" width="38%">Las metodolog&iacute;as de evaluaci&oacute;n y seguimiento acordes con la naturaleza de las asignaturas est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P48" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P48" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P48" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P48" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P48" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">49</td>
		  <td rowspan="2" width="38%">Las estrategias y mecanismos de seguimiento por parte de directores de trabajo de grado est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P49" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P49" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P49" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P49" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P49" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">50</td>
		  
      <td rowspan="2" width="38%">El impacto de las estrategias aplicadas para 
        mejorar los resultados en los ex&aacute;menes de calidad para la educaci&oacute;n 
        superior (SABER PRO) es:</td>
		  <td width="11%" align="center">Muy alto</td><td width="11%" align="center">Alto</td>
		  <td width="11%" align="center">Medio</td><td width="11%" align="center">Bajo</td><td width="12%" align="center">Muy bajo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P50" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P50" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P50" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P50" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P50" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">51</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas, criterios y procedimientos de investigaci&oacute;n y de apoyo a la investigaci&oacute;n as&iacute; como estrategias que aseguren la implementaci&oacute;n de esta (v.gr. reconocimiento de tiempo a profesores, laboratorios adecuados, financiaci&oacute;n de proyectos, otros) so</td>
		  <td width="11%" align="center">Muy claras</td><td width="11%" align="center">Claras</td>
		  <td width="11%" align="center">Medianamente claras</td><td width="11%" align="center">Poco claras</td><td width="12%" align="center">Nada claras</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P51" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P51" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P51" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P51" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P51" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">52</td>
		  <td rowspan="2" width="38%">Existe la relaci&oacute;n actualizada de productos resultado de los proyectos de investigaci&oacute;n (art&iacute;culos de revista, libros, cap&iacute;tulos de libros, software, etc) e impacto de estos resultados en el programa.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P52" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P52" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P52" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P52" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P52" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">53</td>
		  <td rowspan="2" width="38%">Existe un documento con la descripci&oacute;n clara de los grupos y l&iacute;neas de investigaci&oacute;n relacionados con el programa. </td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P53" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P53" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P53" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P53" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P53" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">54</td>
		  <td rowspan="2" width="38%">El n&uacute;mero de Grupos de investigaci&oacute;n relacionados con el programa que tienen convenios o pertenecen a redes de investigaci&oacute;n a nivel nacional e internacional es adecuado:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P54" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P54" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P54" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P54" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P54" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">55</td>
		  <td rowspan="2" width="38%">Existe informaci&oacute;n actualizada de la descripci&oacute;n de Proyectos de investigaci&oacute;n en ejecuci&oacute;n o terminados, con financiaci&oacute;n interna o externa asociados a los grupos de investigaci&oacute;n relacionados con el programa:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P55" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P55" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P55" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P55" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P55" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">56</td>
		  <td rowspan="2" width="38%">Los lineamientos curriculares que promuevan el desarrollo de pensamiento cr&iacute;tico, indagaci&oacute;n y b&uacute;squeda de informaci&oacute;n, an&aacute;lisis y soluci&oacute;n de problemas est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P56" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P56" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P56" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P56" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P56" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">57</td>
		  <td rowspan="2" width="38%">El n&uacute;mero de estudiantes que participan en proyectos de investigaci&oacute;n (proyectos dirigidos, trabajos de grado, asistencias de investigaci&oacute;n) - &uacute;ltimos 2 a&ntilde;os, es:</td>
		  <td width="11%" align="center">Muy adecuado</td><td width="11%" align="center">Adecuado</td>
		  <td width="11%" align="center">Medianamente adecuado</td><td width="11%" align="center">Poco adecuado</td><td width="12%" align="center">Nada adecuado</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P57" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P57" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P57" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P57" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P57" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">58</td>
		  <td rowspan="2" width="38%">En el Proyecto de Formaci&oacute;n se expresa claramente la relevancia e impacto de cada grupo de investigaci&oacute;n relacionados con el programa, para el desarrollo del pa&iacute;s, la regi&oacute;n o a nivel local.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P58" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P58" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P58" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P58" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P58" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">59</td>
		  <td rowspan="2" width="38%">Existe evidencia documental de los convenios de doble titulaci&oacute;n con otras instituciones.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P59" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P59" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P59" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P59" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P59" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">60</td>
		  <td rowspan="2" width="38%">Existe evidencia documental de los contratos, convenios y proyectos realizados con el sector productivo relacionados con el programa (incluir educaci&oacute;n continuada).</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P60" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P60" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P60" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P60" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P60" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">61</td>
		  <td rowspan="2" width="38%">El n&uacute;mero de estudiantes y profesores del programa que han realizado pasant&iacute;as o pr&aacute;cticas en grupos o entidades nacionales e internacionales es: </td>
		  <td width="11%" align="center">Muy adecuado</td><td width="11%" align="center">Adecuado</td>
		  <td width="11%" align="center">Medianamente adecuado</td><td width="11%" align="center">Poco adecuado</td><td width="12%" align="center">Nada adecuado</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P61" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P61" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P61" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P61" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P61" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">62</td>
		  <td rowspan="2" width="38%">El n&uacute;mero de eventos de car&aacute;cter nacional o internacional ofrecidos por el programa en los &uacute;ltimos 3 a&ntilde;os es:</td>
		  <td width="11%" align="center">Muy adecuado</td><td width="11%" align="center">Adecuado</td>
		  <td width="11%" align="center">Medianamente adecuado</td><td width="11%" align="center">Poco adecuado</td><td width="12%" align="center">Nada adecuado</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P62" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P62" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P62" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P62" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P62" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">63</td>
		  <td rowspan="2" width="38%">El n&uacute;mero de actividades acad&eacute;micas nacionales e internacionales a las que han asistido estudiantes y profesores del programa en los &uacute;ltimos 3 a&ntilde;os es:</td>
		  <td width="11%" align="center">Muy adecuado</td><td width="11%" align="center">Adecuado</td>
		  <td width="11%" align="center">Medianamente adecuado</td><td width="11%" align="center">Poco adecuado</td><td width="12%" align="center">Nada adecuado</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P63" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P63" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P63" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P63" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P63" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">64</td>
		  <td rowspan="2" width="38%">El n&uacute;mero de proyectos de investigaci&oacute;n realizados conjuntamente con universidades o centros de investigaci&oacute;n extranjeros en los &uacute;ltimos 3 a&ntilde;os es:</td>
		  <td width="11%" align="center">Muy adecuado</td><td width="11%" align="center">Adecuado</td>
		  <td width="11%" align="center">Medianamente adecuado</td><td width="11%" align="center">Poco adecuado</td><td width="12%" align="center">Nada adecuado</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P64" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P64" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P64" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P64" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P64" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">65</td>
		  <td rowspan="2" width="38%">a. Las funciones y procesos administrativos son eficientes:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P65" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P65" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P65" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P65" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P65" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">66</td>
		  <td rowspan="2" width="38%">b. Las funciones y procesos administrativos son eficaces:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P66" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P66" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P66" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P66" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P66" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">67</td>
		  <td rowspan="2" width="38%">c. Las funciones y procesos administrativos son claros:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P67" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P67" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P67" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P67" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P67" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">68</td>
		  <td rowspan="2" width="38%">a. El impacto de los procesos de planeaci&oacute;n y administraci&oacute;n del programa es:</td>
		  <td width="11%" align="center">Muy alto</td><td width="11%" align="center">Alto</td>
		  <td width="11%" align="center">Medio</td><td width="11%" align="center">Bajo</td><td width="12%" align="center">Muy bajo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P68" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P68" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P68" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P68" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P68" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">69</td>
		  <td rowspan="2" width="38%">b. El impacto de la evaluaci&oacute;n y seguimiento de los contenidos curriculares en el programa es:</td>
		  <td width="11%" align="center">Muy alto</td><td width="11%" align="center">Alto</td>
		  <td width="11%" align="center">Medio</td><td width="11%" align="center">Bajo</td><td width="12%" align="center">Muy bajo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P69" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P69" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P69" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P69" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P69" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">70</td>
		  <td rowspan="2" width="38%">c. El impacto de las experiencias investigativas en el programa es:</td>
		  <td width="11%" align="center">Muy alto</td><td width="11%" align="center">Alto</td>
		  <td width="11%" align="center">Medio</td><td width="11%" align="center">Bajo</td><td width="12%" align="center">Muy bajo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P70" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P70" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P70" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P70" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P70" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">71</td>
		  <td rowspan="2" width="38%">d. El impacto de los servicios y recursos en la calidad del programa es:</td>
		  <td width="11%" align="center">Muy alto</td><td width="11%" align="center">Alto</td>
		  <td width="11%" align="center">Medio</td><td width="11%" align="center">Bajo</td><td width="12%" align="center">Muy bajo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P71" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P71" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P71" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P71" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P71" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">72</td>
		  <td rowspan="2" width="38%">Existe evidencia de las reuniones de instancias organizativas, consejos y comit&eacute;s, que favorecen la discusi&oacute;n de asuntos acad&eacute;micos y administrativos en el programa y de los servicios institucionales (evidencia: actas).</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P72" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P72" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P72" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P72" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P72" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">73</td>
		  <td rowspan="2" width="38%">a. Los mecanismos  para recoger, sistematizar y divulgar informaci&oacute;n requerida para el logro de los prop&oacute;sitos del programa son suficientes: </td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P73" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P73" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P73" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P73" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P73" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">74</td>
		  <td rowspan="2" width="38%">b. Los mecanismos  para recoger, sistematizar y divulgar informaci&oacute;n requerida para el logro de los prop&oacute;sitos del programa son eficaces:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P74" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P74" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P74" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P74" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P74" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">75</td>
		  <td rowspan="2" width="38%">Ha participado en algunas de las siguientes actividades o servicios que ofrece Bienestar Universitario: consulta m&eacute;dica, consulta odontol&oacute;gica, atenci&oacute;n psicol&oacute;gica, actividades deportivas, actividades recreativas, actividades culturales.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P75" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P75" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P75" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P75" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P75" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">76</td>
		  <td rowspan="2" width="38%">Existe evidencia de las Becas obtenidas por estudiantes y profesores del Programa, en los &uacute;ltimos 3 a&ntilde;os. </td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P76" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P76" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P76" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P76" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P76" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">77</td>
		  <td rowspan="2" width="38%">Existe evidencia de las evaluaciones peri&oacute;dicas de los estudiantes, de los profesores, del plan de estudios, de la investigaci&oacute;n, de la gesti&oacute;n y del impacto del programa.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P77" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P77" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P77" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P77" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P77" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">78</td>
		  <td rowspan="2" width="38%">Existe evidencia de los procesos de autoevaluaci&oacute;n realizados en los &uacute;ltimos 5 a&ntilde;os en el programa y resultados de los planes de mejoramiento derivados de dichos procesos.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P78" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P78" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P78" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P78" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P78" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">79</td>
		  <td rowspan="2" width="38%">Los mecanismos de planeaci&oacute;n, mantenimiento y actualizaci&oacute;n de la infraestructura y equipamiento que garanticen el funcionamiento y la sostenibilidad del programa son:</td>
		  <td width="11%" align="center">Muy adecuados</td><td width="11%" align="center">Adecuados</td>
		  <td width="11%" align="center">Parcialmente adecuados</td><td width="11%" align="center">Poco adecuados</td><td width="12%" align="center">Nada adecuados</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P79" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P79" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P79" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P79" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P79" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">80</td>
		  <td rowspan="2" width="38%">Existe evidencia documental de la planeaci&oacute;n y la ejecuci&oacute;n de planes en materia de manejo de recursos f&iacute;sicos y financieros de la instituci&oacute;n y del programa.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P80" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P80" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P80" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P80" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P80" value="1"></td></tr>

</table>

<p>&nbsp;</p>
  <div align="center">
    <input type="submit" name="Submit" value="Enviar Datos">
  </div>
</form>
</body>
</html>

