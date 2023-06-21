<%-- 
    Document   : EPC-EsP
    Created on : 25/09/2012, 11:19:20 AM
    Author     : Lucero
--%>


<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        String cedula = request.getParameter("cedula");
        String flag = request.getParameter("flag");
        String prog = request.getParameter("prog");
%>
<SCRIPT LANGUAGE="JavaScript">

    function comprueba( ){
        for(i=1; i<46; i++){
            nombre = new String("P" + i);
             if (i==19 || i==20 || i==21 || i==22 || i==23 || i ==24 ){
                 if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked && !document.forms.form1[nombre][5].checked) {
                alert("Por favor responda todos los campos de la encuesta");
                document.forms.form1[nombre][0].style.backgroundColor= '#ffcc00';
                document.forms.form1[nombre][0].focus();
                return false;
            }

             }

          else if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked) {
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
<p class="Centro" align="center"><strong>Encuesta Profesores de Cátedra-Es</strong></p>

	<form name="form1"  method="post" onSubmit="return comprueba( );" action="autoevaluacion">
	<input type="hidden" name="total" value="45">
	<input type="hidden" name="idenc" value="141">
        <input type="hidden" name="flag" value="<%=flag%>">
        <input type="hidden" name="prog" value="<%=prog%>">

  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="2%">1</td>
      <td rowspan="2" width="38%">Su nivel de conocimiento del Proyecto Educativo
        Institucional (PEI) de la Escuela es:</td>
      <td width="11%" align="center">Muy bueno</td>
      <td width="11%" align="center">Bueno</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Malo</td>
      <td width="12%" align="center" colspan="2">Nulo</td>
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
      <td rowspan="2" width="38%">Su nivel de conocimiento de la Misi&oacute;n
        de la Escuela es:</td>
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
      <td rowspan="2" width="38%">Su nivel de conocimiento del Proyecto de Formaci&oacute;n
        del programa es:</td>
      <td width="11%" align="center">Muy bueno</td>
      <td width="11%" align="center">Bueno</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Malo</td>
      <td width="12%" align="center" colspan="2">Nulo</td>
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
      <td rowspan="2" width="38%">Su nivel de conocimiento del Reglamento Estudiantil
        es: </td>
      <td width="11%" align="center">Muy bueno</td>
      <td width="11%" align="center">Bueno</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Malo</td>
      <td width="12%" align="center" colspan="2">Nulo</td>
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
    <tr>
      <td rowspan="2" width="2%">5</td>
      <td rowspan="2" width="38%"> La relaci&oacute;n del curr&iacute;culo del
        Programa con las necesidades del contexto social (local, regional, nacional
        e internacional) es: (En la justificaci&oacute;n, relacionar el tipo de
        actividades que evidencian esta relaci&oacute;n).</td>
      <td width="11%" align="center">Muy pertinente</td>
      <td width="11%" align="center">Pertinente</td>
      <td width="11%" align="center">Medianamente pertinente</td>
      <td width="11%" align="center">Poco pertinente</td>
      <td width="12%" align="center" colspan="2">Nada pertinente</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P5" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P5" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P5" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P5" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P5" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">6</td>
      <td rowspan="2" width="38%"> La relaci&oacute;n del curr&iacute;culo del
        programa con las tendencias actuales en el campo disciplinar es:</td>
      <td width="11%" align="center">Muy pertinente</td>
      <td width="11%" align="center">Pertinente</td>
      <td width="11%" align="center">Medianamente pertinente</td>
      <td width="11%" align="center">Poco pertinente</td>
      <td width="12%" align="center" colspan="2">Nada pertinente</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P6" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P6" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P6" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P6" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P6" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">7</td>
      <td rowspan="2" width="38%">El Reglamento Estudiantil de la Escuela es:
      </td>
      <td width="11%" align="center">Muy claro</td>
      <td width="11%" align="center">Claro</td>
      <td width="11%" align="center">Medianamente claro</td>
      <td width="11%" align="center">Poco claro</td>
      <td width="12%" align="center" colspan="2">Nada claro</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P7" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P7" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P7" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P7" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P7" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">8</td>
      <td rowspan="2" width="38%">En la Escuela se aplican las normas del Estatuto
        de Profesores en relaci&oacute;n con ubicaci&oacute;n, permanencia y ascenso
        en las categor&iacute;as del escalaf&oacute;n.</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P8" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P8" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P8" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P8" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P8" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">9</td>
      <td rowspan="2" width="38%">Su nivel de conocimiento de las pol&iacute;ticas,
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
        <input type="radio" name="P9" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P9" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P9" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P9" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P9" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">10</td>
      <td rowspan="2" width="38%"> En la vinculaci&oacute;n de los profesores
        del Programa en los &uacute;ltimos cinco a&ntilde;os se evidencia la aplicaci&oacute;n
        de las pol&iacute;ticas, normas y criterios de selecci&oacute;n, vinculaci&oacute;n,
        renovaci&oacute;n y contrataci&oacute;n del profesorado. </td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P10" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P10" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P10" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P10" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P10" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">11</td>
      <td rowspan="2" width="38%">Los criterios y mecanismos para la evaluaci&oacute;n
        de los profesores es:</td>
      <td width="11%" align="center">Muy pertinentes</td>
      <td width="11%" align="center">Pertinentes</td>
      <td width="11%" align="center">Medianamente pertinentes</td>
      <td width="11%" align="center">Poco pertinentes</td>
      <td width="12%" align="center" colspan="2">Nada pertinentes</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P11" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P11" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P11" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P11" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P11" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">12</td>
      <td rowspan="2" width="38%">La calidad del profesorado propio del Programa
        en relaci&oacute;n con los aspectos acad&eacute;mico profesionales (su
        conocimiento disciplinar) es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="12%" align="center" colspan="2">Muy mala</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P12" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P12" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P12" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P12" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P12" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">13</td>
      <td rowspan="2" width="38%"> La calidad del profesorado propio del Programa
        en relaci&oacute;n con los aspectos pedag&oacute;gicos es: </td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="12%" align="center" colspan="2">Muy mala</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P13" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P13" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P13" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P13" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P13" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">14</td>
      <td rowspan="2" width="38%">La calidad del profesorado propio del Programa
        en relaci&oacute;n con los aspectos investigativos es: </td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="12%" align="center" colspan="2">Muy mala</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P14" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P14" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P14" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P14" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P14" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">15</td>
      <td rowspan="2" width="38%"> Los directivos del programa muestran idoneidad
        en el desarrollo de sus funciones:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P15" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P15" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P15" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P15" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P15" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">16</td>
      <td rowspan="2" width="38%">Los directivos del programa muestran eficiencia
        en el desarrollo de sus funciones:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P16" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P16" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P16" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P16" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P16" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">17</td>
      <td rowspan="2" width="38%"> Los directivos del programa muestran liderazgo
        en la gesti&oacute;n del programa:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P17" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P17" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P17" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P17" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P17" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">18</td>
      <td rowspan="2" width="38%">Considerando las exigencias del programa, la
        proporci&oacute;n entre a) el n&uacute;mero de funcionarios administrativos
        y de servicio (secretaria, personal t&eacute;cnico), y b) el n&uacute;mero
        de profesores y estudiantes, es:</td>
      <td width="11%" align="center">Muy adecuada</td>
      <td width="11%" align="center">Adecuada</td>
      <td width="11%" align="center">Medianamente adecuada</td>
      <td width="11%" align="center">Poco adecuada</td>
      <td width="12%" align="center" colspan="2">Nada adecuada</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P18" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P18" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P18" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P18" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P18" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">19</td>
      <td rowspan="2" width="38%"> La calidad del apoyo administrativo prestado
        por secretarias que soportan al programa es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No Aplica</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P19" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P19" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P19" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P19" value="2">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P19" value="1">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P19" value="0">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">20</td>
      <td rowspan="2" width="38%">La calidad del apoyo administrativo prestado
        por T&eacute;cnicos de los laboratorios relacionados con el programa es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No Aplica</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P20" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P20" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P20" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P20" value="2">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P20" value="1">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P20" value="0">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">21</td>
      <td rowspan="2" width="38%"> La calidad del apoyo administrativo prestado
        al programa por la oficina de Registro es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No Aplica</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P21" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P21" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P21" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P21" value="2">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P21" value="1">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P21" value="0">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">22</td>
      <td rowspan="2" width="38%">La calidad del apoyo administrativo prestado
        al programa por la Unidad de Gesti&oacute;n Externa es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No Aplica</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P22" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P22" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P22" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P22" value="2">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P22" value="1">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P22" value="0">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">23</td>
      <td rowspan="2" width="38%"> La calidad del apoyo administrativo prestado
        al programa por Osiris (Oficina de sistemas y recursos inform&aacute;ticos)
        es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No Aplica</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P23" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P23" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P23" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P23" value="2">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P23" value="1">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P23" value="0">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">24</td>
      <td rowspan="2" width="38%">La calidad del apoyo administrativo prestado
        al programa por la Oficina de Audiovisuales es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No Aplica</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P24" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P24" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P24" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P24" value="2">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P24" value="1">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P24" value="0">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">25</td>
      <td rowspan="2" width="38%">Las pol&iacute;ticas y criterios de evaluaci&oacute;n
        de los estudiantes se aplican.</td>
      <td width="11%" align="center">Siempre</td>
      <td width="11%" align="center">Casi siempre</td>
      <td width="11%" align="center">Algunas veces</td>
      <td width="11%" align="center">Casi nunca</td>
      <td width="12%" align="center" colspan="2">Nunca</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P25" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P25" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P25" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P25" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P25" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">26</td>
      <td rowspan="2" width="38%"> Los sistemas de informaci&oacute;n y de comunicaci&oacute;n
        con que cuenta el programa para la gesti&oacute;n acad&eacute;mica del
        Programa y la divulgaci&oacute;n de sus resultados, son pertinentes:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P26" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P26" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P26" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P26" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P26" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">27</td>
      <td rowspan="2" width="38%">Los sistemas de informaci&oacute;n y de comunicaci&oacute;n
        con que cuenta el programa para la gesti&oacute;n acad&eacute;mica del
        Programa y la divulgaci&oacute;n de sus resultados, son actualizados:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P27" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P27" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P27" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P27" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P27" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">28</td>
      <td rowspan="2" width="38%"> Los sistemas de informaci&oacute;n y de comunicaci&oacute;n
        con que cuenta el programa para la gesti&oacute;n acad&eacute;mica del
        Programa y la divulgaci&oacute;n de sus resultados, son suficientes:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P28" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P28" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P28" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P28" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P28" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">29</td>
      <td rowspan="2" width="38%"> Los mecanismos para recoger, sistematizar y
        divulgar informaci&oacute;n requerida para el logro de los prop&oacute;sitos
        del programa son suficientes: </td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P29" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P29" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P29" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P29" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P29" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">30</td>
      <td rowspan="2" width="38%"> Los mecanismos para recoger, sistematizar y
        divulgar informaci&oacute;n requerida para el logro de los prop&oacute;sitos
        del programa son eficaces:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P30" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P30" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P30" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P30" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P30" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">31</td>
      <td rowspan="2" width="38%">Ha participado en algunas de las siguientes
        actividades o servicios que ofrece Bienestar Universitario: consulta m&eacute;dica,
        consulta odontol&oacute;gica, atenci&oacute;n psicol&oacute;gica, actividades
        deportivas, actividades recreativas, actividades culturales.</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P31" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P31" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P31" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P31" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P31" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">32</td>
      <td rowspan="2" width="38%"> Los servicios de bienestar universitario tienen
        amplia divulgaci&oacute;n:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P32" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P32" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P32" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P32" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P32" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">33</td>
      <td rowspan="2" width="38%">Los servicios de bienestar universitario son
        de alta calidad:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P33" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P33" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P33" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P33" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P33" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">34</td>
      <td rowspan="2" width="38%"> Los servicios de bienestar universitario son
        efectivos:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P34" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P34" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P34" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P34" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P34" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">35</td>
      <td rowspan="2" width="38%">La accesibilidad de los espacios f&iacute;sicos
        de la Escuela, utilizados para la operaci&oacute;n del Programa, es:</td>
      <td width="11%" align="center">Muy adecuada</td>
      <td width="11%" align="center">Adecuada</td>
      <td width="11%" align="center">Parcialmente adecuada</td>
      <td width="11%" align="center">Poco adecuada</td>
      <td width="12%" align="center" colspan="2">Nada adecuada</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P35" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P35" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P35" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P35" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P35" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">36</td>
      <td rowspan="2" width="38%"> La capacidad de los espacios f&iacute;sicos
        de la Escuela, utilizados para la operaci&oacute;n del Programa, es:</td>
      <td width="11%" align="center">Muy adecuada</td>
      <td width="11%" align="center">Adecuada</td>
      <td width="11%" align="center">Parcialmente adecuada</td>
      <td width="11%" align="center">Poco adecuada</td>
      <td width="12%" align="center" colspan="2">Nada adecuada</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P36" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P36" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P36" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P36" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P36" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">37</td>
      <td rowspan="2" width="38%"> La iluminaci&oacute;n de los espacios f&iacute;sicos
        de la Escuela, utilizados para la operaci&oacute;n del Programa,es:</td>
      <td width="11%" align="center">Muy adecuada</td>
      <td width="11%" align="center">Adecuada</td>
      <td width="11%" align="center">Parcialmente adecuada</td>
      <td width="11%" align="center">Poco adecuada</td>
      <td width="12%" align="center" colspan="2">Nada adecuada</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P37" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P37" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P37" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P37" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P37" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">38</td>
      <td rowspan="2" width="38%"> La ventilaci&oacute;n de los espacios f&iacute;sicos
        de la Escuela, utilizados para la operaci&oacute;n del Programa,es:</td>
      <td width="11%" align="center">Muy adecuada</td>
      <td width="11%" align="center">Adecuada</td>
      <td width="11%" align="center">Parcialmente adecuada</td>
      <td width="11%" align="center">Poco adecuada</td>
      <td width="12%" align="center" colspan="2">Nada adecuada</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P38" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P38" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P38" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P38" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P38" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">39</td>
      <td rowspan="2" width="38%"> La seguridad e higiene de los espacios f&iacute;sicos
        de la Escuela, utilizados para la operaci&oacute;n del Programa, es:</td>
      <td width="11%" align="center">Muy adecuada</td>
      <td width="11%" align="center">Adecuada</td>
      <td width="11%" align="center">Parcialmente adecuada</td>
      <td width="11%" align="center">Poco adecuada</td>
      <td width="12%" align="center" colspan="2">Nada adecuada</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P39" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P39" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P39" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P39" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P39" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">40</td>
      <td rowspan="2" width="38%">La capacidad de los laboratorios, talleres y
        espacios para pr&aacute;ctica (con simuladores, por ejemplo) para atender
        el n&uacute;mero de estudiantes del programa es suficiente. </td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P40" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P40" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P40" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P40" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P40" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">41</td>
      <td rowspan="2" width="38%">El material bibliogr&aacute;fico disponible
        en la biblioteca (libros, publicaciones peri&oacute;dicas, suscripciones
        y bases de datos), es suficiente en relaci&oacute;n con la cantidad de
        usuarios. </td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P41" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P41" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P41" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P41" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P41" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">42</td>
      <td rowspan="2" width="38%">Los servicios bibliotecarios de pr&eacute;stamo
        y de consulta bibliogr&aacute;fica para estudiantes y profesores del Programa
        son de alta calidad.</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P42" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P42" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P42" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P42" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P42" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">43</td>
      <td rowspan="2" width="38%"> Los recursos inform&aacute;ticos (computadores,
        software, conexi&oacute;n a redes) para apoyar el desarrollo de las actividades
        acad&eacute;micas del Programa son adecuados: </td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P43" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P43" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P43" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P43" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P43" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">44</td>
      <td rowspan="2" width="38%"> Los recursos inform&aacute;ticos (computadores,
        software, conexi&oacute;n a redes) para apoyar el desarrollo de las actividades
        acad&eacute;micas del Programa son actualizados:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P44" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P44" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P44" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P44" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P44" value="1">
      </td>
    </tr>
    <tr>
      <td rowspan="2" width="2%">45</td>
      <td rowspan="2" width="38%">Los equipos y materiales de los laboratorios
        y espacios para pr&aacute;cticas (incluye simuladores virtuales) son adecuados
        con la naturaleza y las exigencias acad&eacute;micas del Programa. </td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr>
      <td width="11%" align="center">
        <input type="radio" name="P45" value="5">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P45" value="4">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P45" value="3">
      </td>
      <td width="11%" align="center">
        <input type="radio" name="P45" value="2">
      </td>
      <td width="12%" align="center" colspan="2">
        <input type="radio" name="P45" value="1">
      </td>
    </tr>
  </table>

<p>&nbsp;</p>
  <div align="center">
    <input type="submit" name="Submit" value="Enviar Datos">
  </div>
</form>
</body>
</html>

