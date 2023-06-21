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
        for(i=1; i<55; i++){
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
<p class="Centro" align="center"><strong>Guía Información Institucional</strong></p>

	<form name="form1"  method="post" onSubmit="return comprueba( );" action="autoevaluacion">
	<input type="hidden" name="total" value="54">
	<input type="hidden" name="idenc" value="136">
        <input type="hidden" name="flag" value="<%=flag%>">
        <input type="hidden" name="prog" value="<%=prog%>">
	<table width="98%" border="1" cellspacing="0" cellpadding="0">

		<tr><td rowspan="2" width="2%">1</td>
		  <td rowspan="2" width="38%">El PEI, la misi&oacute;n y la visi&oacute;n institucional est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P1" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P1" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P1" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P1" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P1" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">2</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas, normas y procesos para la selecci&oacute;n y admisi&oacute;n de estudiantes es:</td>
		  <td width="11%" align="center">Muy efectivo</td><td width="11%" align="center">Efectivos</td>
		  <td width="11%" align="center">Medianamente efectivos</td><td width="11%" align="center">Poco efectivos</td><td width="12%" align="center">Nada efectivos</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P2" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P2" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P2" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P2" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P2" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">3</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas, normas y procesos para la selecci&oacute;n y admisi&oacute;n de estudiantes se cumplen en grado:</td>
		  <td width="11%" align="center">Muy alto</td><td width="11%" align="center">Alto</td>
		  <td width="11%" align="center">Medio</td><td width="11%" align="center">Bajo</td><td width="12%" align="center">Muy bajo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P3" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P3" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P3" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P3" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P3" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">4</td>
		  <td rowspan="2" width="38%">El sistema de registro y archivo acad&eacute;mico de los estudiantes es:</td>
		  <td width="11%" align="center">Muy efectivo</td><td width="11%" align="center">Efectivos</td>
		  <td width="11%" align="center">Medianamente efectivos</td><td width="11%" align="center">Poco efectivos</td><td width="12%" align="center">Nada efectivos</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P4" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P4" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P4" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P4" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P4" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">5</td>
		  <td rowspan="2" width="38%">Existen documentos con evidencias de la reflexi&oacute;n, el estudio o el an&aacute;lisis para identificar, evaluar y corregir las causas de la deserci&oacute;n estudiantil, acciones resultantes de la reflexi&oacute;n e impacto de las mismas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P5" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P5" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P5" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P5" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P5" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">6</td>
		  <td rowspan="2" width="38%">Los requisitos de permanencia de los estudiantes en el programa est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P6" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P6" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P6" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P6" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P6" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">7</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas y estrategias referidas a est&iacute;mulos acad&eacute;micos para los estudiantes est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P7" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P7" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P7" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P7" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P7" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">8</td>
		  <td rowspan="2" width="38%">El Reglamento Estudiantil de la Escuela es: </td>
		  <td width="11%" align="center">Muy claro</td><td width="11%" align="center">Claro</td>
		  <td width="11%" align="center">Medianamente claro</td><td width="11%" align="center">Poco claro</td><td width="12%" align="center">Nada claro</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P8" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P8" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P8" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P8" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P8" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">9</td>
		  <td rowspan="2" width="38%">Los mecanismos para la revisi&oacute;n y actualizaci&oacute;n del Reglamento Estudiantil est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P9" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P9" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P9" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P9" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P9" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">10</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas institucionales en materia de participaci&oacute;n del estudiantado en los &oacute;rganos de direcci&oacute;n de la Escuela y de los programas est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P10" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P10" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P10" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P10" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P10" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">11</td>
		  <td rowspan="2" width="38%">Los mecanismos para la designaci&oacute;n de representantes estudiantiles ante los &oacute;rganos de direcci&oacute;n de la Escuela y de los programas est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P11" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P11" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P11" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P11" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P11" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">12</td>
		  <td rowspan="2" width="38%">El Estatuto de Profesores est&aacute; claramente formulado y est&aacute; actualizado.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P12" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P12" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P12" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P12" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P12" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">13</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas institucionales y mecanismos para promover y reconocer el ejercicio calificado de la docencia, la investigaci&oacute;n, la proyecci&oacute;n social y la cooperaci&oacute;n internacional est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P13" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P13" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P13" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P13" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P13" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">14</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas y reglamentaciones sobre asignaci&oacute;n de la remuneraci&oacute;n a los profesores y en ellas se tienen en cuenta sus m&eacute;ritos profesionales y acad&eacute;micos est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P14" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P14" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P14" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P14" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P14" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">15</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas institucionales orientadas al mantenimiento de la calidad docente, estabilidad de la planta y relevo generacional est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P15" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P15" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P15" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P15" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P15" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">16</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas institucionales en materia de participaci&oacute;n de los profesores en los &oacute;rganos de direcci&oacute;n de la Escuela y de los programas est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P16" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P16" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P16" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P16" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P16" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">17</td>
		  <td rowspan="2" width="38%">Existe informaci&oacute;n actualizada sobre la experiencia de los profesores (acad&eacute;mica, investigativa, de extensi&oacute;n) de los &uacute;ltimos 5 a&ntilde;os.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P17" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P17" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P17" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P17" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P17" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">18</td>
		  <td rowspan="2" width="38%">El r&eacute;gimen de propiedad intelectual y el sistema de evaluaci&oacute;n para valorar el material producido por los profesores est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P18" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P18" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P18" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P18" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P18" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">19</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas sobre el est&iacute;mulo a la producci&oacute;n acad&eacute;mica debidamente evaluada est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P19" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P19" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P19" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P19" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P19" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">20</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas en materia de desarrollo profesoral est&aacute;n claramente formuladas. </td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P20" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P20" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P20" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P20" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P20" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">21</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas institucionales, mecanismos y componentes adecuados para adelantar la evaluaci&oacute;n integral de los profesores est&aacute;n claramente formulados.</td>
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
		  <td rowspan="2" width="38%">Las pol&iacute;ticas institucionales sobre asignaci&oacute;n de profesores como jurados de trabajos de grado y tesis est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P23" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P23" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P23" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P23" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P23" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">24</td>
		  <td rowspan="2" width="38%">Los mecanismos para el seguimiento de los graduados est&aacute;n claramente formulados:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P24" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P24" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P24" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P24" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P24" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">25</td>
		  <td rowspan="2" width="38%">El sistema de cr&eacute;ditos acad&eacute;micos que responda a los lineamientos curriculares est&aacute; claramente definido.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P25" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P25" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P25" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P25" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P25" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">26</td>
		  <td rowspan="2" width="38%">Las propuestas curriculares del programa responden a los lineamientos curriculares institucionales. </td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P26" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P26" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P26" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P26" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P26" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">27</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas en materia de formaci&oacute;n integral est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P27" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P27" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P27" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P27" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P27" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">28</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas institucionales en materia de flexibilidad curricular y pedag&oacute;gica est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P28" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P28" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P28" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P28" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P28" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">29</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas y espacios acad&eacute;micos para el tratamiento interdisciplinario de problemas acad&eacute;micos ligados al programa est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P29" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P29" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P29" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P29" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P29" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">30</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas institucionales para la revisi&oacute;n y actualizaci&oacute;n del plan de estudios est&aacute;n claramente formuladas. </td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P30" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P30" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P30" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P30" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P30" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">31</td>
		  <td rowspan="2" width="38%">Los lineamientos curriculares que promuevan el desarrollo de pensamiento cr&iacute;tico, indagaci&oacute;n y b&uacute;squeda de informaci&oacute;n, an&aacute;lisis y soluci&oacute;n de problemas est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P31" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P31" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P31" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P31" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P31" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">32</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas y criterios  que establecen el compromiso de la instituci&oacute;n con las necesidades locales, regionales y nacionales est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P32" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P32" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P32" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P32" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P32" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">33</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas y los criterios institucionales sobre est&iacute;mulos al desarrollo de actividades de interacci&oacute;n con el entorno est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P33" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P33" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P33" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P33" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P33" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">34</td>
		  <td rowspan="2" width="38%">Los acuerdos para otorgar doble titulaci&oacute;n con universidades extranjeras est&aacute;n claramente establecidos.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P34" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P34" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P34" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P34" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P34" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">35</td>
		  <td rowspan="2" width="38%">Existe evidencia documental de los convenios y compromisos de cooperaci&oacute;n acad&eacute;mica firmados con instituciones nacionales e internacionales. </td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P35" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P35" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P35" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P35" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P35" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">36</td>
		  <td rowspan="2" width="38%">Existe evidencia documental de los contratos, convenios y proyectos realizados con el sector productivo relacionados con el programa (incluir educaci&oacute;n continuada).</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P36" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P36" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P36" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P36" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P36" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">37</td>
		  <td rowspan="2" width="38%">Existencia de un Reglamento de movilidad nacional e internacional.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P37" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P37" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P37" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P37" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P37" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">38</td>
		  <td rowspan="2" width="38%">El Reglamento de pr&aacute;cticas profesionales est&aacute; claramente formulado.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P38" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P38" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P38" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P38" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P38" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">39</td>
		  <td rowspan="2" width="38%">En la p&aacute;gina web est&aacute;n disponibles los documentos de pol&iacute;tica institucional (PEI, misi&oacute;n, visi&oacute;n), Estatuto de profesores y Reglamento Estudiantil.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P39" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P39" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P39" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P39" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P39" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">40</td>
		  <td rowspan="2" width="38%">Las orientaciones institucionales sobre las responsabilidades que deben asumir las personas y sobre los procedimientos que se deben seguir est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P40" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P40" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P40" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P40" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P40" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">41</td>
		  <td rowspan="2" width="38%">Existe un documento con la descripci&oacute;n del sistema de archivo sobre la vida acad&eacute;mica y profesional de los profesores y del personal administrativo.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P41" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P41" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P41" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P41" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P41" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">42</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas y normas definidas por la instituci&oacute;n para la gesti&oacute;n acad&eacute;mica y administrativa de los programas est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P42" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P42" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P42" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P42" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P42" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">43</td>
		  <td rowspan="2" width="38%">Existe evidencia de las reuniones de instancias organizativas, consejos y comit&eacute;s, que favorecen la discusi&oacute;n de asuntos acad&eacute;micos y administrativos en el programa y de los servicios institucionales (evidencia: actas).</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P43" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P43" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P43" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P43" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P43" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">44</td>
		  <td rowspan="2" width="38%">La plataforma tecnol&oacute;gica que garantiza la conectividad y acceso a bases de datos o sistemas de informaci&oacute;n a nivel mundial es:</td>
		  <td width="11%" align="center">Muy adecuada</td><td width="11%" align="center">Adecuada</td>
		  <td width="11%" align="center">Medianamente adecuada</td><td width="11%" align="center">Poco adecuada</td><td width="12%" align="center">Nada adecuada</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P44" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P44" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P44" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P44" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P44" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">45</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas institucionales orientadas al bienestar y la cultura recreativa est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P45" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P45" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P45" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P45" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P45" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">46</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas y mecanismos en materia de autoevaluaci&oacute;n y autorregulaci&oacute;n que orienten al programa para la evaluaci&oacute;n continua de sus procesos, sus logros y su pertinencia para la sociedad est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P46" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P46" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P46" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P46" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P46" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">47</td>
		  <td rowspan="2" width="38%">La capacidad y acondicionamiento de espacios f&iacute;sicos dedicados a la docencia y a la construcci&oacute;n y desarrollo del conocimiento est&aacute;n claramente descritos en un documento.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P47" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P47" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P47" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P47" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P47" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">48</td>
		  <td rowspan="2" width="38%">Las normas de uso de suelos est&aacute;n claramente descritos en un documento (institucional o externo).</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P48" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P48" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P48" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P48" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P48" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">49</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas de adquisici&oacute;n de material bibliogr&aacute;fico y funcionamiento de la biblioteca est&aacute;n claramente formuladas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P49" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P49" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P49" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P49" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P49" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">50</td>
		  <td rowspan="2" width="38%">Existe evidencia de los convenios interbibliotecarios firmados por la Escuela que permitan complementar el acceso a la informaci&oacute;n.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P50" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P50" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P50" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P50" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P50" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">51</td>
		  <td rowspan="2" width="38%">Los criterios y las pol&iacute;ticas institucionales en materia de adquisici&oacute;n, actualizaci&oacute;n y capacitaci&oacute;n para el uso de recursos inform&aacute;ticos y de comunicaci&oacute;n est&aacute;n claramente formulados.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P51" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P51" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P51" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P51" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P51" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">52</td>
		  <td rowspan="2" width="38%">Existen medios audiovisuales suficientes para atender las necesidades de formaci&oacute;n en el programa.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P52" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P52" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P52" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P52" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P52" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">53</td>
		  <td rowspan="2" width="38%">Existen documentos e informes claros sobre origen, monto y distribuci&oacute;n de los recursos presupuestales destinados a los programas.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P53" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P53" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P53" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P53" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P53" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">54</td>
		  <td rowspan="2" width="38%">Existe evidencia documental de la planeaci&oacute;n y la ejecuci&oacute;n de planes en materia de manejo de recursos f&iacute;sicos y financieros de la instituci&oacute;n y del programa.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P54" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P54" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P54" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P54" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P54" value="1"></td></tr>

</table>

<p>&nbsp;</p>
  <div align="center">
    <input type="submit" name="Submit" value="Enviar Datos">
  </div>
</form>
</body>
</html>

