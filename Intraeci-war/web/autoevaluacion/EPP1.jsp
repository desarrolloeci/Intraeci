<%-- 
    Document   : EPP1
    Created on : 5/10/2011, 03:22:51 PM
    Author     : lrodriguez
--%>

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
        Vector Datos = admin.DatosEncuestas(cedula);
        String flag = request.getParameter("flag");%>
<html>
<head>
<title>Encuesta a profesores de planta EPP1</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<SCRIPT LANGUAGE="JavaScript">

    function comprueba( ){
        for(i=1; i<82; i++){
            nombre = new String("P" + i);

            if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked) {
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
<div align="left"></div>
<p class="Centro"><strong>Encuesta Profesores de Planta</strong></p>
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela está realizando un proceso de<strong> Autoevaluación con fines de Acreditación Institucional</strong>. Su opinión es muy importante para precisar fortalezas y oportunidades mejoramiento sobre diferentes aspectos de la actividad universitaria. Le solicitamos responder todas las preguntas de la encuesta. Agradecemos su participación.
            <br />__________________________________________________________________________________________________________________________________________________________________________<br /><center>
                <p>En cada pregunta seleccione la casilla que a su juicio representa mejor su opinión. Sus respuestas serán tratadas de forma CONFIDENCIAL Y ANÓNIMA.</p>
            </center>
    __________________________________________________________________________________________________________________________________________________________________________<br /></font></p>
    <div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 1.  Misi&oacute;n y Proyecto Institucional</u></strong></font></p>
    </div>
</div>
<form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
<input type="hidden" name="total" value="81">
<input type="hidden" name="idenc" value="12">
<input type="hidden" name="flag" value="<%=flag%>">
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><strong>La </strong>Misi&oacute;n  Institucional</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Es <strong>coherente</strong> con el medio social y  cultural.</font></p><p>&nbsp;</p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P1" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P1" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P1" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P1" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">
        <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">2</font></div>
    </td>
    <td rowspan="2" width="30%">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Corresponde</strong> a la naturaleza de la  Escuela.</font></p></td>

    </tr>
    <tr>
    <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="P2" value="8" />
    </font></div></td>
    <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="P2" value="6" />
    </font></div></td>
    <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="P2" value="4" />
    </font></div></td>
    <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="P2" value="2" />
    </font></div></td>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">3</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La Misi&oacute;n se refleja en los  logros institucionales de manera:</strong></font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada</strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div>
        </td>
    </tr>
    <tr>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="8" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="6" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="4" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="2" />
        </font></div></td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">4</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font size="2" face="Arial, Helvetica, sans-serif">Las <strong>orientaciones del PEI son adecuadas</strong>  parala planeaci&oacute;n,  organizaci&oacute;n, evaluaci&oacute;n y autorregulaci&oacute;n de:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. La <strong>formaci&oacute;n</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. La <strong>construcci&oacute;n y desarrollo del conocimiento</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P5" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P5" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P5" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P5" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. La <strong>interacci&oacute;n con el entorno</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">5</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font size="2" face="Arial, Helvetica, sans-serif">Las <strong>orientaciones del PEI </strong>se<strong> aplican</strong> para:</font></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2"> Fomentar la<strong> formaci&oacute;n integral.</strong></font></p>
        <p>&nbsp;</p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P7" value="8" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P7" value="6" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P7" value="4" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P7" value="2" />
        </font></div></td>
    </tr>
</table>
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 2.  Estudiantes</u></strong></font></p>
</div>
</div>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">6</font></div>
        </td>
        <td rowspan="2" width="30%">     <div align="left">
                <div align="left"><font size="2" face="Arial, Helvetica, sans-serif">La <strong>aplicaci&oacute;n del reglamento</strong> sobre deberes,  derechos y participaci&oacute;n <strong>de los estudiantes</strong> en los &oacute;rganos directivos:</font></div>
                <p><font face="Arial, Helvetica, sans-serif" size="2"> Es <strong>transparente.</strong></font></p>
        </div></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div>
        </td>
    </tr>
    <tr>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="8" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="6" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="4" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="2" />
        </font></div></td>
    </tr>
    <td rowspan="2" width="5%">
        <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">7</font></div>
    </td>
    <td rowspan="2" width="30%">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Es eficiente</strong>.</font></p></td>

    </tr>
    <tr>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="8" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="6" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="4" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="2" />
        </font></div></td>
    </tr>

    <td rowspan="2" width="5%">
        <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">8</font></div>
    </td>
    <td rowspan="2" width="30%">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Contribuye</strong> al cumplimiento de  la <strong>Misi&oacute;n Institucional.</strong></font></p></td>

    </tr>
    <tr>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P10" value="8" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P10" value="6" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P10" value="4" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P10" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">9</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los  procesos de admisi&oacute;n de los estudiantes se enmarcan en criterios acad&eacute;micos  establecidos.</font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P11" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P11" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P11" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P11" value="2">
            </font></div>
        </td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">10</font></div>
        </td>
        <td rowspan="2" width="30%">     <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> de las <strong>pol&iacute;ticas de permanencia</strong> de los estudiantes es:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Equitativas</strong>.</font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">
        <div align="center"></div>
    </td>
    <td rowspan="2" width="30%">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. </strong><strong>Transparentes</strong>.</font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="2">
            </font></div>
        </td>
    </tr>


    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">11</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>procesos de seguimiento</strong> al  desarrollo integral de los estudiantes se enmarcan en <strong>criterios acad&eacute;micos</strong> establecidos, de una<strong> manera:</strong></font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada </strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="2">
            </font></div>
        </td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">12</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>estudiantes</strong> tienen una <strong>adecuada participaci&oacute;n</strong> en:</font></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">a. Los  <strong>&oacute;rganos colegiados</strong></font></p>
        <p>&nbsp;</p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P15" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P15" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P15" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P15" value="2">
            </font></div>
        </td>

    </tr>
    <td rowspan="2" width="5%">
        <div align="center"></div>
    </td>
    <td rowspan="2" width="30%">
    <p><font face="Arial, Helvetica, sans-serif" size="2">b</font><font face="Arial, Helvetica, sans-serif" size="2">. Las  <strong>organizaciones estudiantiles</strong>.</font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P16" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P16" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P16" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P16" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">
        <div align="center"></div>
    </td>
    <td rowspan="2" width="30%">
    <p><font face="Arial, Helvetica, sans-serif" size="2">c</font><font face="Arial, Helvetica, sans-serif" size="2">. Los  <strong>proyectos de liderazgo</strong>.</font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P17" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P17" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P17" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P17" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">
        <div align="center"></div>
    </td>
    <td rowspan="2" width="30%">
    <p><font size="2" face="Arial, Helvetica, sans-serif">d. La <strong>organizaci&oacute;n de grupos universitarios.</strong></font></p></td>

    </tr>
    <tr>
    <td width="17%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="P18" value="8">
        </font></div>
    </td>
    <td width="12%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="P18" value="6">
        </font></div>
    </td>
    <td width="20%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="P18" value="4">
        </font></div>
    </td>
    <td width="16%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="P18" value="2">
        </font></div>
    </td>

</table>
<br />
<br />
<div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 3.  Profesores</u></strong></font> </div>
</div>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">13</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los  criterios sobre la vinculaci&oacute;n del profesorado <strong>se aplican</strong> de manera <strong>transparente</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P19" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P19" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P19" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P19" value="2">
            </font></div>
        </td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">14</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> del Estatuto de profesores <strong>es:</strong></font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Transparente</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P20" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P20" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P20" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P20" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">15</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P21" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P21" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P21" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P21" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">16</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>cantidad de profesores</strong> para atender al  n&uacute;mero de estudiantes matriculados<strong> es</strong>:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P22" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P22" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P22" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P22" value="2">
            </font></div>
        </td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">17</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La aplicaci&oacute;n </strong>del modelo de  evaluaci&oacute;n de profesores<strong> es efectiva  (genera impactos o efectos positivos)</strong></font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P23" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P23" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P23" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P23" value="2">
            </font></div>
        </td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">18</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>nivel</strong> de<strong> productividad intelectual </strong>del profesorado es:</font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuado </strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P24" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P24" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P24" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P24" value="2">
            </font></div>
        </td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">19</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><strong>La aplicaci&oacute;n de los criterios de clasificaci&oacute;n de  los profesores en el escalaf&oacute;n es:</strong></font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Coherente</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P25" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P25" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P25" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P25" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Rigurosa</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P26" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P26" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P26" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P26" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">20</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Las  <strong>pol&iacute;ticas </strong>de la Escuela para el <strong>desarrollo profesoral</strong> son<strong>:</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente pertinentes </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinentes</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P27" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P27" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P27" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P27" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">21</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> de las <strong>pol&iacute;ticas de reconocimiento</strong> a la docencia calificada es:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P28" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P28" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P28" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P28" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">22</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La<strong> aplicaci&oacute;n de las pol&iacute;ticas y  criterios </strong>institucionales para la<strong> creaci&oacute;n de comunidades acad&eacute;micas </strong>al interior de la instituci&oacute;n es:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P29" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P29" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P29" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P29" value="2" />
        </font></div></td>
    </tr>

</table>

<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 4.  Procesos Académicos</u></strong></font></p>
</div>
</div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">23</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Las  concepciones institucionales sobre el mundo, el hombre, la sociedad y la  historia, orientan la formaci&oacute;n integral de manera:</font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinente</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinente</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente pertinente </strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinente</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P30" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P30" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P30" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P30" value="2">
            </font></div>
        </td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">24</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los procesos de <strong>dise&ntilde;o, desarrollo y evaluaci&oacute;n  curricular</strong> tienen un alto impacto para la formaci&oacute;n.</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P31" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P31" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P31" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P31" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">25</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">La  incorporaci&oacute;n y manejo de <strong>las TICS</strong> tiene un alto impacto sobre el <strong>aprendizaje.</strong></font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="2">
            </font></div>
        </td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">26</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas de formaci&oacute;n</strong> (pregrado y  posgrado) de la Escuela son:</font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficientes</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficientes</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente eficientes</strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficientes</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P33" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P33" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P33" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P33" value="2">
            </font></div>
        </td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">27</font></div>
        </td>
        <td rowspan="2" width="30%">     <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas de formaci&oacute;n</strong> (pregrado y  posgrado) de la Escuela son:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Muy  pertinentes</strong>.</font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P34" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P34" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P34" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P34" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">
        <div align="center"></div>
    </td>
    <td rowspan="2" width="30%">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. De  alta calidad</strong></font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P35" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P35" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P35" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P35" value="2">
            </font></div>
        </td>
    </tr>
</table>
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 5. Investigación</u></strong></font></p>
</div>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">28</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>investigaci&oacute;n formativa</strong> en  la Escuela tiene:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Niveles  de desarrollo:</strong></font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados </strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P36" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P36" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P36" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P36" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">
        <div align="center"></div>
    </td>
    <td rowspan="2" width="30%">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Mecanismos  de evaluaci&oacute;n</strong>:</font></p></td>

    </tr>
    <tr>
    <td width="17%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="P37" value="8">
        </font></div>
    </td>
    <td width="12%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="P37" value="6">
        </font></div>
    </td>
    <td width="20%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="P37" value="4">
        </font></div>
    </td>
    <td width="16%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                <input type="radio" name="P37" value="2">
        </font></div>
    </td>


</table>
<br />

<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">29</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela <strong>aplica pol&iacute;ticas</strong> institucionales para fomentar la actividad investigativa <strong>en distintas &aacute;reas del conocimiento </strong>que se desarrollan en la  instituci&oacute;n<strong>.</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P38" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P38" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P38" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P38" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">30</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>desarrollo investigativo</strong> de la instituci&oacute;n en relaci&oacute;n con el <strong>entorno  social</strong>, tiene un <strong>impacto:</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P39" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P39" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P39" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P39" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">31</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Para <strong>desarrollar las actividades de investigaci&oacute;n</strong> la  Escuela cuenta con:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Recursos  bibliogr&aacute;ficos:</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy suficientes</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Sficientes</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P40" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P40" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P40" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P40" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Laboratorios:</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P41" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P41" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P41" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P41" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>c. Recursos inform&aacute;ticos:</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P42" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P42" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P42" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P42" value="2" />
        </font></div></td>
    </tr>
</table>
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 6. Pertinencia e Impacto Social</u></strong></font><br />
</p></div>

<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">32</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela ejerce una <strong>influencia en el entorno:</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy articulados</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Articulados</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente articulados </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco articulados</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P43" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P43" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P43" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P43" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">33</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>proyectos de interacci&oacute;n con  el entorno </strong>desarrollados por la Escuela en relaci&oacute;n con:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a.</strong> Los <strong>programas de formaci&oacute;n</strong>,  est&aacute;n:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy suficientes</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Suficientes</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P44" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P44" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P44" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P44" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Las actividades de <strong>construcci&oacute;n y desarrollo  del conocimiento, </strong>est&aacute;n:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P45" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P45" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P45" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P45" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">34</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>pr&aacute;cticas de los estudiantes</strong> y su <strong>formaci&oacute;n profesional</strong> est&aacute;n:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P46" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P46" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P46" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P46" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 7. Autoevaluación y Autorregulación</u></strong></font><br />
    </p>
</div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">35</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Son<strong> participativos y permanentes </strong>en  la Escuela los procesos de<strong>:</strong></font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a.</strong> <strong>Autoevaluaci&oacute;n  y autorregulaci&oacute;n</strong></font></p>          <p>&nbsp;</p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P47" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P47" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P47" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P47" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Planeaci&oacute;n</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P48" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P48" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P48" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P48" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">36</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La informaci&oacute;n que brindan las <strong>estad&iacute;sticas e  indicadores de gesti&oacute;n</strong> para los procesos de <strong>planeaci&oacute;n, autoevaluaci&oacute;n y toma de decisiones, es</strong>:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy &uacute;til</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>&Uacute;til</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente &uacute;til</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco<br />
        &uacute;til</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P49" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P49" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P49" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P49" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">37</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>registros estad&iacute;sticos y los  indicadores de gesti&oacute;n</strong> para la <strong>planeaci&oacute;n,  la toma de decisiones y la apreciaci&oacute;n de la calidad</strong> se <strong>utilizan</strong> de una manera:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P50" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P50" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P50" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P50" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">38</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La aplicaci&oacute;n de los <strong>criterios para la evaluaci&oacute;n</strong> de</font>:</div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a.</strong> Los <strong>profesores,</strong> es:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy transparente</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Transparente</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente transparente </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco transparente</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P51" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P51" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P51" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P51" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>El  personal administrativo, </strong>es:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P52" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P52" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P52" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P52" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. <strong>Los  directivos, </strong>es:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P53" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P53" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P53" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P53" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">39</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n de los criterios de evaluaci&oacute;n</strong>&nbsp; de profesores, personal administrativo y  directivas <strong>tiene un impacto sobre la  calidad:</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy alto</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Alto</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente alto </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Bajo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P54" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P54" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P54" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P54" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 8. Bienestar Institucional</u></strong></font><br />
</p></div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">40</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La Escuela promueve un <strong>clima  favorable de bienestar</strong> mediante:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a.</strong> <strong>El  pago oportuno de los salarios</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P55" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P55" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P55" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P55" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. La  equidad en la asignaci&oacute;n de funciones</strong>.</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P56" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P56" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P56" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P56" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>c. El  ofrecimiento de oportunidades equitativas para capacitaci&oacute;n y promoci&oacute;n.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P57" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P57" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P57" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P57" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>d. La  disposici&oacute;n de facilidades para el desempe&ntilde;o de las labores asignadas</strong>.</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P58" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P58" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P58" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P58" value="2" />
        </font></div></td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">41</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los procedimientos de orientaci&oacute;n (inducci&oacute;n) para quienes ingresan por  primera vez a la Instituci&oacute;n&nbsp; (estudiantes,  profesores y personal administrativo), son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuados</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P59" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P59" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P59" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P59" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">42</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>unidad</strong> encargada de planificar y ejecutar los programas y actividades del bienestar  institucional es:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy efectiva</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Efectiva</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente efectiva </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco efectiva</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P60" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P60" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P60" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P60" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">43</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas</strong> y <strong>servicios de bienestar</strong> de la Escuela:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. Son &nbsp;de <strong>alta calidad</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P61" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P61" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P61" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P61" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Tienen <strong>alto impacto</strong>.</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P62" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P62" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P62" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P62" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 9. Organización, Gestión y Administración</u></strong></font><br />
</p></div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">44</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>estructura organizacional</strong> corresponde a la  complejidad de la Escuela.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P63" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P63" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P63" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P63" value="2" />
        </font></div></td>
    </tr>
</table
><br>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">45</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>procedimientos</strong> <strong>y mecanismos de</strong> <strong>seguimiento y evaluaci&oacute;n</strong> de la gesti&oacute;n institucional son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuados</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P64" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P64" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P64" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P64" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">46</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>Estructura organizacional es coherente</strong> con la naturaleza y complejidad de los programas y proyectos existentes</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P65" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P65" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P65" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P65" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">47</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>sistemas de comunicaci&oacute;n e informaci&oacute;n</strong> (Web, bolet&iacute;n, notiweb, correo, etc.) de la Escuela son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente/s</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente/s</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficiente/s</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente/s</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P66" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P66" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P66" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P66" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">48</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Las actuaciones de los <strong>directivos  en relaci&oacute;n con </strong>la <strong>Misi&oacute;n y el  Proyecto Institucional </strong>son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy coherentes</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Coherentes</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente coherentes</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco coherentes</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P67" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P67" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P67" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P67" value="2" />
        </font></div></td>
    </tr>
</table>
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 10. Recursos de Apoyo Académico y Planta Física</u></strong></font><br />
</p></div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">49</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La participaci&oacute;n de los <strong>profesores</strong> en la <strong>adquisici&oacute;n y actualizaci&oacute;n de  material bibliogr&aacute;fico es:</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P68" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P68" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P68" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P68" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">50</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>recursos bibliogr&aacute;ficos</strong> en diferentes  &aacute;reas del conocimiento est&aacute;n:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmentea actualizados</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Actualizados</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente actualizados </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco actualizados</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P69" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P69" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P69" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P69" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">51</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los<strong> laboratorio y talleres</strong> est&aacute;n:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P70" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P70" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P70" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P70" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">52</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>servicios de c&oacute;mputo</strong> est&aacute;n:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P71" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P71" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P71" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P71" value="2" />
        </font></div></td>
    </tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">53</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Las  <strong>tecnolog&iacute;as de informaci&oacute;n y  comunicaci&oacute;n</strong> para la interacci&oacute;n entre profesores y estudiantes est&aacute;n:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P72" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P72" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P72" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P72" value="2" />
        </font></div></td>
    </tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">54</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>equipos audiovisuales e inform&aacute;ticos </strong>est&aacute;n:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P73" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P73" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P73" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P73" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">55</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios</strong> prestados por la <strong>biblioteca</strong> son de alta calidad.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P74" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P74" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P74" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P74" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">56</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>servicios</strong> prestados para el uso de  los <strong>equipos audiovisuales e inform&aacute;ticos</strong> son de alta calidad.</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P75" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P75" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P75" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P75" value="2" />
        </font></div></td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">57</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"> Los<strong> servicios </strong>de <strong>equipos audiovisuales e inform&aacute;ticos</strong> son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy oportunos</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Oportunos</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente oportunos</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco oportunos</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P76" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P76" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P76" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P76" value="2" />
        </font></div></td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">58</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los sistemas de <strong>consulta  bibliogr&aacute;fica</strong> son: </font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficientes</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficientes</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficientes </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficientes</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P77" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P77" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P77" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P77" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">59</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font size="2" face="Arial, Helvetica, sans-serif">La <strong>planta f&iacute;sica</strong> de la Escuela :</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"> a. Es de <strong>calidad</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P78" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P78" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P78" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P78" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Est&aacute;<strong> bien distribuida.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P79" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P79" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P79" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P79" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. Es<strong> funcional.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P80" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P80" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P80" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P80" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 11. Recursos Financieros</u></strong></font><br />
    </p>
</div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">60</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La  instituci&oacute;n cuenta con una buena <strong>solidez  financiera</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P81" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P81" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P81" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P81" value="2" />
        </font></div></td>
    </tr>
</table>
<p>&nbsp;</p>
<center>
<input type="submit" name="Submit" value="Enviar Datos"></center>
</form>
</body>
</html>