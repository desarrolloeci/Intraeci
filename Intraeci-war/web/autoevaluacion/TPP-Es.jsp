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
        for(i=1; i<26; i++){
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
<p class="Centro" align="center"><strong>Taller Profesores de Planta-Es</strong></p>

	<form name="form1"  method="post" onSubmit="return comprueba( );" action="autoevaluacion">
	<input type="hidden" name="total" value="25">
	<input type="hidden" name="idenc" value="146">
        <input type="hidden" name="flag" value="<%=flag%>">
        <input type="hidden" name="prog" value="<%=prog%>">
<table width="98%" border="1" cellspacing="0" cellpadding="0">

		<tr><td rowspan="2" width="2%">1</td>
		  
      <td rowspan="2" width="38%"> La relaci&oacute;n del curr&iacute;culo del 
        Programa con las necesidades del contexto social (local, regional, nacional 
        e internacional) es: (En la justificaci&oacute;n, relacionar el tipo de 
        actividades que evidencian esta relaci&oacute;n).</td>
		  <td width="11%" align="center">Muy pertinente</td><td width="11%" align="center">Pertinente</td>
		  <td width="11%" align="center">Medianamente pertinente</td><td width="11%" align="center">Poco  pertinente</td><td width="12%" align="center">Nada  pertinente</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P1" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P1" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P1" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P1" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P1" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">2</td>
		  
      <td rowspan="2" width="38%"> La relaci&oacute;n del curr&iacute;culo del 
        programa con las tendencias actuales en el campo disciplinar es:</td>
		  <td width="11%" align="center">Muy pertinente</td><td width="11%" align="center">Pertinente</td>
		  <td width="11%" align="center">Medianamente pertinente</td><td width="11%" align="center">Poco  pertinente</td><td width="12%" align="center">Nada  pertinente</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P2" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P2" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P2" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P2" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P2" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">3</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas, normas y procesos para la selecci&oacute;n y admisi&oacute;n de estudiantes es:</td>
		  <td width="11%" align="center">Muy efectivo</td><td width="11%" align="center">Efectivos</td>
		  <td width="11%" align="center">Medianamente efectivos</td><td width="11%" align="center">Poco efectivos</td><td width="12%" align="center">Nada efectivos</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P3" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P3" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P3" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P3" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P3" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">4</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas, normas y procesos para la selecci&oacute;n y admisi&oacute;n de estudiantes se cumplen en grado:</td>
		  <td width="11%" align="center">Muy alto</td><td width="11%" align="center">Alto</td>
		  <td width="11%" align="center">Medio</td><td width="11%" align="center">Bajo</td><td width="12%" align="center">Muy bajo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P4" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P4" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P4" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P4" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P4" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">5</td>
		  <td rowspan="2" width="38%">El sistema de registro y archivo acad&eacute;mico de los estudiantes es:</td>
		  <td width="11%" align="center">Muy efectivo</td><td width="11%" align="center">Efectivos</td>
		  <td width="11%" align="center">Medianamente efectivos</td><td width="11%" align="center">Poco efectivos</td><td width="12%" align="center">Nada efectivos</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P5" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P5" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P5" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P5" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P5" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">6</td>
		  <td rowspan="2" width="38%">La aplicaci&oacute;n de pol&iacute;ticas institucionales orientadas al mantenimiento de la calidad docente, estabilidad de la planta y renovaci&oacute;n generacional es:</td>
		  <td width="11%" align="center">Muy adecuada</td><td width="11%" align="center">Adecuada</td>
		  <td width="11%" align="center">Medianamente adecuada</td><td width="11%" align="center">Poco adecuada</td><td width="12%" align="center">Nada adecuada</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P6" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P6" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P6" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P6" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P6" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">7</td>
		  <td rowspan="2" width="38%">La relaci&oacute;n entre el n&uacute;mero de profesores del programa y el cumplimiento de las necesidades y compromisos del mismo es:</td>
		  <td width="11%" align="center">Muy adecuada</td><td width="11%" align="center">Adecuada</td>
		  <td width="11%" align="center">Medianamente adecuada</td><td width="11%" align="center">Poco adecuada</td><td width="12%" align="center">Nada adecuada</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P7" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P7" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P7" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P7" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P7" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">8</td>
		  
      <td rowspan="2" width="38%">Existen sistemas y criterios para evaluar peri&oacute;dicamente 
        el n&uacute;mero, dedicaci&oacute;n y nivel de formaci&oacute;n de los 
        profesores de los programas.</td>
		  
      <td width="11%" align="center" height="20">Totalmente de acuerdo</td>
      <td width="11%" align="center" height="20">De acuerdo</td>
		  
      <td width="11%" align="center" height="20">Parcialmente de acuerdo</td>
      <td width="11%" align="center" height="20">En desacuerdo</td>
      <td width="12%" align="center" height="20">En total desacuerdo</td>
    </tr>
		<tr><td width="11%" align="center"><input type="radio" name="P8" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P8" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P8" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P8" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P8" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">9</td>
		  <td rowspan="2" width="38%">La formaci&oacute;n, la experiencia y la producci&oacute;n intelectual de los profesores son coherentes con los contenidos program&aacute;ticos de las asignaturas que est&aacute;n a su cargo.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P9" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P9" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P9" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P9" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P9" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">10</td>
		  <td rowspan="2" width="38%">Los criterios y mecanismos para la evaluaci&oacute;n de los profesores es:</td>
		  <td width="11%" align="center">Muy pertinentes</td><td width="11%" align="center">Pertinentes</td>
		  <td width="11%" align="center">Medianamente pertinentes</td><td width="11%" align="center">Poco  pertinentes</td><td width="12%" align="center">Nada  pertinentes</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P10" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P10" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P10" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P10" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P10" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">11</td>
		  <td rowspan="2" width="38%">Las propuestas curriculares del programa responden a los lineamientos curriculares institucionales. </td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P11" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P11" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P11" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P11" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P11" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">12</td>
		  <td rowspan="2" width="38%">Existe coherencia entre los contenidos y objetivos del programa con las competencias del perfil de formaci&oacute;n.</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P12" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P12" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P12" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P12" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P12" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">13</td>
		  <td rowspan="2" width="38%">Las pol&iacute;ticas, criterios y procedimientos de investigaci&oacute;n y de apoyo a la investigaci&oacute;n as&iacute; como estrategias que aseguren la implementaci&oacute;n de esta (v.gr. reconocimiento de tiempo a profesores, laboratorios adecuados, financiaci&oacute;n de proyectos, otros) so</td>
		  <td width="11%" align="center">Muy claras</td><td width="11%" align="center">Claras</td>
		  <td width="11%" align="center">Medianamente claras</td><td width="11%" align="center">Poco claras</td><td width="12%" align="center">Nada claras</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P13" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P13" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P13" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P13" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P13" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">14</td>
		  
      <td rowspan="2" width="38%"> Las estrategias utilizadas para la articulaci&oacute;n 
        del programa con los grupos de investigaci&oacute;n, sus l&iacute;neas 
        y proyectos son efectivas en relaci&oacute;n con la formaci&oacute;n:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P14" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P14" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P14" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P14" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P14" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">15</td>
		  
      <td rowspan="2" width="38%"> Las estrategias utilizadas para la articulaci&oacute;n 
        del programa con los grupos de investigaci&oacute;n, sus l&iacute;neas 
        y proyectos son efectivas en relaci&oacute;n con relaci&oacute;n con el 
        entorno:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P15" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P15" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P15" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P15" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P15" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">16</td>
		  
      <td rowspan="2" width="38%"> Las l&iacute;neas de investigaci&oacute;n relacionadas 
        con el programa y los proyectos que desarrolla para el pa&iacute;s son 
        pertinentes:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P16" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P16" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P16" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P16" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P16" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">17</td>
		  
      <td rowspan="2" width="38%"> Las l&iacute;neas de investigaci&oacute;n relacionadas 
        con el programa y los proyectos que desarrolla para el pa&iacute;s son 
        innovadores:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P17" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P17" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P17" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P17" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P17" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">18</td>
		  
      <td rowspan="2" width="38%">Las l&iacute;neas de investigaci&oacute;n relacionadas 
        con el programa y los proyectos que desarrolla para el pa&iacute;s han 
        generado impacto positivo:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P18" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P18" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P18" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P18" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P18" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">19</td>
		  
      <td rowspan="2" width="38%"> El impacto de los procesos de planeaci&oacute;n 
        y administraci&oacute;n del programa en el desarrollo del mismo es::</td>
		  <td width="11%" align="center">Muy alto</td><td width="11%" align="center">Alto</td>
		  <td width="11%" align="center">Medio</td><td width="11%" align="center">Bajo</td><td width="12%" align="center">Muy bajo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P19" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P19" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P19" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P19" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P19" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">20</td>
		  
      <td rowspan="2" width="38%"> El impacto de la evaluaci&oacute;n y seguimiento 
        de los contenidos curriculares en el desarrollo del programa es:</td>
		  <td width="11%" align="center">Muy alto</td><td width="11%" align="center">Alto</td>
		  <td width="11%" align="center">Medio</td><td width="11%" align="center">Bajo</td><td width="12%" align="center">Muy bajo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P20" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P20" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P20" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P20" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P20" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">21</td>
		  
      <td rowspan="2" width="38%">El impacto de las experiencias investigativas 
        en el desarrollo del programa es:</td>
		  <td width="11%" align="center">Muy alto</td><td width="11%" align="center">Alto</td>
		  <td width="11%" align="center">Medio</td><td width="11%" align="center">Bajo</td><td width="12%" align="center">Muy bajo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P21" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P21" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P21" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P21" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P21" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">22</td>
		  
      <td rowspan="2" width="38%"> El impacto de los servicios y recursos en la 
        calidad del programa es:</td>
		  <td width="11%" align="center">Muy alto</td><td width="11%" align="center">Alto</td>
		  <td width="11%" align="center">Medio</td><td width="11%" align="center">Bajo</td><td width="12%" align="center">Muy bajo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P22" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P22" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P22" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P22" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P22" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">23</td>
		  
      <td rowspan="2" width="38%"> Existe correspondencia entre las necesidades 
        y proyecciones del programa y el presupuesto asignado para formaci&oacute;n:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P23" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P23" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P23" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P23" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P23" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">24</td>
		  
      <td rowspan="2" width="38%"> Existe correspondencia entre las necesidades 
        y proyecciones del programa y el presupuesto asignado para construcci&oacute;n 
        y desarrollo del conocimiento:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P24" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P24" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P24" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P24" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P24" value="1"></td></tr>
		<tr><td rowspan="2" width="2%">25</td>
		  
      <td rowspan="2" width="38%"> Existe correspondencia entre las necesidades 
        y proyecciones del programa y el presupuesto asignado para interacci&oacute;n 
        con el entorno e internacionalizaci&oacute;n:</td>
		  <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
		  <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
		<tr><td width="11%" align="center"><input type="radio" name="P25" value="5"></td>
		  <td width="11%" align="center"><input type="radio" name="P25" value="4"></td>
		  <td width="11%" align="center"><input type="radio" name="P25" value="3"></td>
		  <td width="11%" align="center"><input type="radio" name="P25" value="2"></td>
		  <td width="12%" align="center"><input type="radio" name="P25" value="1"></td></tr>

</table>

<p>&nbsp;</p>
  <div align="center">
    <input type="submit" name="Submit" value="Enviar Datos">
  </div>
</form>
</body>
</html>

