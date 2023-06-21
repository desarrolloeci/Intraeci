<%-- 
    Document   : EDI
    Created on : 18/10/2011, 11:37:02 AM
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
        String flag = request.getParameter("flag");
//  Vector Datos = admin.DatosEncuestas(cedula);

        /*   if (Datos.size() > 0) {
        String iden = Datos.elementAt(1).toString();
        String flag1 = Datos.elementAt(2).toString();
        if (flag1.equals("0")) {*/
%>
<SCRIPT LANGUAGE="JavaScript">

    function comprueba( ){
        for(i=1; i<56; i++){
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
<p class="Centro"><strong><CENTER>Encuesta Directivos EDI</CENTER></strong></p>
<div align="left">
    <p>
    <font face="Arial, Helvetica, sans-serif" size="2">La Escuela está realizando un proceso de <strong>Autoevaluación con fines de Acreditación Institucional</strong>. Su opinión es muy  importante para precisar  fortalezas y oportunidades de mejoramiento sobre diferentes aspectos de la  actividad universitaria. Le solicitamos responder todas las preguntas de la  encuesta. Agradecemos su participación.    </font>
    <div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 1.  Misi&oacute;n y Proyecto Institucional</u></strong></font></p>
    </div>
    <p><font face="Arial, Helvetica, sans-serif" size="2"><br />
</font>          </div>
<form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
<input type="hidden" name="total" value="55">
<input type="hidden" name="idenc" value="26">
<input type="hidden" name="flag" value="<%=flag%>">
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La Escuela demuestra un decidido compromiso  Institucional con:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La calidad</strong></font></p>          <p>&nbsp;</p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">2</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Los  principios constitucionales</strong></font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P2" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P2" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P2" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P2" value="2">
            </font></div>
        </td>
    </tr>

</table>
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 2.  Estudiantes</u></strong></font><br />
    </p>
</div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">3</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>permanencia d</strong>e los estudiantes en la  instituci&oacute;n<strong> </strong>se enmarca en <strong>criterios acad&eacute;micos</strong> establecidos.</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">4</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> de las <strong>pol&iacute;ticas de permanencia</strong> de los estudiantes es:</font></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">a. <strong>Equitativa</strong></font> </p>
        <p>&nbsp;</p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b.<strong>Transparente</strong></font></p></td>
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
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">5</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>criterios</strong> para la asignaci&oacute;n de <strong>becas y pr&eacute;stamos</strong> para estudiantes  acad&eacute;micamente destacados<strong> </strong>son<strong>:</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Prtinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinentes</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">6</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La  asignaci&oacute;n de <strong>becas y pr&eacute;stamos  contribuye </strong>a la <strong>permanencia</strong> de<strong> estudiantes</strong> acad&eacute;micamente destacados</font><font size="2" face="Arial, Helvetica, sans-serif">.</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P7" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P7" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P7" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P7" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">7</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>criterios</strong> institucionales <strong>para el  otorgamiento de est&iacute;mulos </strong>(monitor&iacute;as, asistencia de investigaci&oacute;n, becas,  condonaci&oacute;n de cr&eacute;ditos u otros) a estudiantes destacados son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 3. Profesores</u></strong></font><br />
</p></div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">8</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n del reglamento </strong>sobre deberes,  derechos y participaci&oacute;n <strong>del profesorado </strong>en los &oacute;rganos directivos:</font></p>
        <p><font size="2" face="Arial, Helvetica, sans-serif">Es transparente.</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="2">
            </font></div>
        </td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center">
                <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">9</font></div>
        </div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Es<strong> eficiente</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P10" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P10" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P10" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P10" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 4.  Procesos Acad&eacute;micos</u></strong></font><br />
    </p>
</div>

<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">10</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas de formaci&oacute;n</strong> (pregrado y  posgrado) de la Escuela son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficientes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficientes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficientes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficientes</strong></font></div></td>
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
        <td width="20%">
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">11</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>criterios</strong> acad&eacute;micos de  la Escuela para <strong>crear, diferenciar y  relacionar programas formales </strong>son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">12</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>criterios</strong> acad&eacute;micos de  la Escuela para crear, diferenciar y relacionar <strong>Programas de educaci&oacute;n continuada</strong> son:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">13</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Existe coherencia entre las <strong>condiciones  de apertura y desarrollo de programas de educaci&oacute;n continuada</strong> y  los <strong>criterios </strong>correspondientes.</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 5. Investigaci&oacute;n</u></strong></font></p>
</div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">14</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela <strong>aplica pol&iacute;ticas</strong> institucionales para fomentar la actividad investigativa <strong>en distintas &aacute;reas del conocimiento </strong>que se desarrollan en la  instituci&oacute;n<strong>.</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P15" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P15" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P15" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P15" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">15</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>gesti&oacute;n y apoyo a</strong>l  desarrollo de las <strong>actividades  investigativas</strong> es:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficiente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P16" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P16" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P16" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P16" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">16</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left">
                    <p><font face="Arial, Helvetica, sans-serif" size="2">Para <strong>desarrollar las actividades de investigaci&oacute;</strong>n la  Escuela cuenta con:</font></p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">a.<strong>Recursos  bibliogr&aacute;ficos</strong></font></p>
                </div>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy suficientes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Suficientes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente suficientes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Insuficientes</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P17" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P17" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P17" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P17" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Laboratorios:</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P18" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P18" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P18" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P18" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c.<strong>Recursos inform&aacute;ticos:</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P19" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P19" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P19" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P19" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 6. Pertinencia e  Impacto Social</u></strong></font></p>
</div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">17</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela ejerce una <strong>influencia en el entorno</strong>:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy positiva</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Positiva</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente positiva</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco positiva</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P20" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P20" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P20" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P20" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">18</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los &nbsp;programas y actividades de<strong> interacci&oacute;n con el entorno </strong>&nbsp;son de:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Alta calidad</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Calidad</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Calidad parcial</strong></font><strong><font size="2" face="Arial, Helvetica, sans-serif"> </font></strong></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poca calidad</strong></font></div></td>
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
<br />
<div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor7.  Autoevaluaci&oacute;n y Autorregulaci&oacute;n</u></strong></font> </div>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">19</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Son<strong> participativos y permanentes </strong>en  la Escuela los procesos de<strong>:</strong></font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. <strong>Autoevaluaci&oacute;n  y autorregulaci&oacute;n</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P22" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P22" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P22" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P22" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b.<strong>Planeaci&oacute;n</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P23" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P23" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P23" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P23" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">20</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>procesos de autoevaluaci&oacute;n,  autorregulaci&oacute;n y planeaci&oacute;n </strong>contribuyen al logro de la <strong>Misi&oacute;n y del Proyecto Institucional</strong>.</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P24" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P24" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P24" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P24" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">21</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>sistemas de informaci&oacute;n</strong> para sustentar la autoevaluaci&oacute;n, la planeaci&oacute;n y la toma de decisiones</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. <strong>Son  eficientes.</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b.<strong>Son  efectivos.</strong></font></p></td>
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
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">22</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>registros estad&iacute;sticos y los  indicadores de gesti&oacute;n</strong> para la <strong>planeaci&oacute;n,  la toma de decisiones y la apreciaci&oacute;n de la calidad</strong> se <strong>utilizan</strong> de una manera:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P27" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P27" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
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
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">23</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La aplicaci&oacute;n de los <strong>criterios para la evaluaci&oacute;n</strong> de</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a.Los <strong>profesores,</strong> es</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy transparente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Transparente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente transparente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco transparente</strong></font></div></td>
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
    <tr>
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b<strong>. El  personal administrativo, </strong>es:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P29" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P29" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P29" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P29" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c<strong>. Los  directivos, </strong>es:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P30" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P30" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P30" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P30" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">24</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n de los criterios de evaluaci&oacute;n</strong> de profesores, personal administrativo y directivas <strong>tiene un impacto sobre la calidad:</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy alto</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Alto</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente alto</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Bajo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P31" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P31" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P31" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P31" value="2" />
        </font></div></td>
    </tr>
</table>
<div align="left">
    <p>&nbsp;</p>
    <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 
      8. Bienestar Institucional</u></strong></font></p>
</div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">25</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. La <strong>Escuela</strong> mantiene un <strong>clima institucional</strong>:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuado</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>La<strong> unidad</strong> a la cual pertenece  mantiene <strong>un clima institucional</strong>:</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P33" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P33" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P33" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P33" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">26</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>unidad</strong> encargada de planificar y ejecutar los programas y actividades del bienestar  institucional es:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy efectiva</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Efectiva</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente efectiva</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco efectiva</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P34" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P34" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P34" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P34" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">27</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>infraestructura, equipos y materiales&nbsp; </strong>para el desarrollo de los <strong>programas de bienestar institucional</strong> son:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. <strong>Adecuados</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P35" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P35" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P35" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P35" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Suficientes</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P36" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P36" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P36" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P36" value="2" />
        </font></div></td>
    </tr>
</table>
<div align="left">
    <p>&nbsp;</p>
    <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 
      9. Organizaci&oacute;n, Gesti&oacute;n y Administraci&oacute;n</u></strong></font></p>
</div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">28</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los &nbsp;<strong>criterios</strong> utilizados para la definici&oacute;n  y asignaci&oacute;n de funciones <strong>corresponden</strong> a la naturaleza y complejidad de la instituci&oacute;n.</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P37" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P37" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P37" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P37" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">29</font></div></td>
        <td rowspan="2" width="30%">
        <div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>sistemas de comunicaci&oacute;n e informaci&oacute;n</strong> (Web, bolet&iacute;n, notiweb, correo, etc.) de la Escuela son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente/s</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente/s</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficiente/s</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente/s</strong></font></div></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">30</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>El personal  administrativo </strong>de  la instituci&oacute;n es:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P39" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P39" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
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
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>programas de capacitaci&oacute;n y  cualificaci&oacute;n</strong> para el personal son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinentes</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P40" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P40" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P40" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P40" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">32</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>apoyo</strong> recibido por el <strong>personal administrativo</strong> para <strong>cualificar el desempe&ntilde;o</strong> de sus labores  administrativas es:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuado</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
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
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">33</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La aplicaci&oacute;n de pol&iacute;ticas de <strong>est&iacute;mulos,  promoci&oacute;n y evaluaci&oacute;n</strong> del personal administrativo es:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficiente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente</strong></font></div></td>
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
    <p>&nbsp;</p>
    <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 
      10. Recursos de Apoyo Acad&eacute;mico y Planta F&iacute;sica</u></strong></font></p>
</div>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">34</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font size="2" face="Arial, Helvetica, sans-serif">La <strong>planta f&iacute;sica</strong> de la Escuela :</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"> a. Es de <strong>calidad</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P43" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P43" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P43" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P43" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Est&aacute;<strong> bien distribuida.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P44" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P44" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P44" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P44" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. Es<strong> funcional.</strong></font></p></td>
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
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">35</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font size="2" face="Arial, Helvetica, sans-serif">La <strong>planta f&iacute;sica</strong> de la Escuela tiene buena:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"> a. <strong>Accesibilidad</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Capacidad </strong>para el desarrollo de las actividades universitarias.</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P47" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P47" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P47" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P47" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. <strong>Iluminaci&oacute;n.</strong></font></p></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">d. <strong>Ventilaci&oacute;n.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P49" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P49" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P49" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P49" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">e. <strong>Condiciones  de seguridad.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P50" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P50" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P50" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P50" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">f. <strong>Condiciones  de higiene.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P51" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P51" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P51" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P51" value="2" />
        </font></div></td>
    </tr>
</table>
<div align="left">
    <p>&nbsp;</p>
    <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 
      11.Recursos Financieros</u></strong></font></p>
</div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">36</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Las pol&iacute;ticas </strong>para la<strong> elaboraci&oacute;n del  presupuesto de inversi&oacute;n y funcionamiento</strong><strong> </strong>son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada/s</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>adecuada/s</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada/s</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada/s</strong></font></div></td>
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
        <td rowspan="2" width="5%"><div align="center">
                <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">37</font></div>
        </div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>asignaci&oacute;n de </strong><strong>recursos presupuestales</strong> para el desarrollo de los <strong>programas y  actividades de bienestar institucional </strong>es:</font></p></td>
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">38</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font size="2" face="Arial, Helvetica, sans-serif">El <strong>persona</strong>l <strong>especializado</strong> en el <strong>manejo  financiero</strong> es:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"> a. Muy <strong>eficiente</strong> (optimiza el rendimiento de  dicho manejo)</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P54" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P54" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P54" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P54" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Muy <strong>efectivo </strong>(genera impactos  positivos)</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P55" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P55" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P55" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P55" value="2" />
        </font></div></td>
    </tr>
</table>
<br>
<CENTER><input type="submit" name="Submit" value="Enviar Datos" /></CENTER>
</form>
</body>
</html>
