<%-- 
    Document   : EDPpr
    Created on : 11/10/2011, 11:16:05 AM
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
        for(i=1; i<125; i++){
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
<p class="Centro"><strong><center>Encuesta Director de Programa</center></strong></p>
<div align="left">
    <p>
    <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela está realizando un proceso de<strong> Autoevaluación con fines de Acreditación Institucional</strong>. Su opinión es muy importante para precisar fortalezas y oportunidades de mejoramiento sobre diferentes aspectos de la actividad universitaria. Le solicitamos responder todas las preguntas de la encuesta. Agradecemos su participación.
            <br />
    </font></p>
    <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 1.  Misi&oacute;n y Proyecto Institucional</u></strong></font>
    </p>
    <div align="left"> </div>
</div>
<form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
<input type="hidden" name="total" value="124">
<input type="hidden" name="idenc" value="19">
<input type="hidden" name="flag" value="<%=flag%>">

<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left">
            <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>Misi&oacute;n  Institucional:</strong></font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Es <strong>coherente</strong> con el medio social y  cultural.</font></p></td>
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

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">2</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La  Escuela demuestra un decidido <strong>compromiso Institucional </strong>con<strong> la calidad:</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P2" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P2" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P2" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P2" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<br />
<br />
<div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 2.  Estudiantes</u></strong></font> </div>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">3</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n del reglamento </strong>sobre deberes,  derechos y participaci&oacute;n <strong>de los estudiantes </strong>en los &oacute;rganos directivos:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Es Transparente</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">4</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Es Eficiente</strong></font></p></td>
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
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">5</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Contribuye</strong> al cumplimiento de  la <strong>Misi&oacute;n Institucional</strong></font></p></td>
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
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">6</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La<strong> aplicaci&oacute;n de la  reglamentaci&oacute;n sobre </strong>procesos de admisi&oacute;n,  permanencia en la instituci&oacute;n, promoci&oacute;n, traslado y grado:&nbsp;</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Es Transparente</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">7</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Es Eficiente</strong></font></p></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">8</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Contribuye</strong> al cumplimiento de  la <strong>Misi&oacute;n Institucional</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">9</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>pol&iacute;ticas de admisi&oacute;n</strong> de  estudiantes son:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Pertinentes</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center">
                <div align="center"></div>
        </div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Equitativas</strong></font></p></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center">
                <div align="center"></div>
        </div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong> c. Transparentes</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P11" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P11" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P11" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P11" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">10</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>procedimientos </strong>de matr&iacute;cula son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados</strong></font></div></td>
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
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">11</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>permanencia d</strong>e los estudiantes en la  instituci&oacute;n<strong> </strong>se enmarca en <strong>criterios acad&eacute;micos</strong> establecidos.</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">12</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> de las <strong>pol&iacute;ticas de permanencia</strong> de los estudiantes es::</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Equitativa</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center">
                <div align="center"></div>
        </div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Transparente</strong></font></p></td>
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">13</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>estudiantes</strong> tienen una <strong>adecuada participaci&oacute;n</strong> en:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. Los  <strong>&oacute;rganos colegiados</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P16" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P16" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P16" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P16" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center">
                <div align="center"></div>
        </div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Las  <strong>organizaciones estudiantiles.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P17" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P17" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P17" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P17" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center">
                <div align="center"></div>
        </div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c Los  <strong>proyectos de liderazgo.</strong></font></p></td>
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
        <td rowspan="2" width="5%"><div align="center">
                <div align="center"></div>
        </div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">d. La <strong>organizaci&oacute;n de grupos universitarios.</strong></font></p></td>
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
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 3.  Profesores</u></strong></font></p>
</div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">14</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n del reglamento </strong>sobre deberes,  derechos y participaci&oacute;n <strong>del profesorado </strong>en los &oacute;rganos directivos</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Es Transparente</strong>.</font></p></td>
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
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P20" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P20" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">15</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Es Eficiente</strong></font></p></td>
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">16</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los  criterios sobre la vinculaci&oacute;n del profesorado <strong>se aplican</strong> de manera <strong>transparente.</strong></font></p></td>
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
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">17</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> del Estatuto de profesores <strong>es:</strong></font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Transparente</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P23" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P23" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P23" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P23" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">18</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong> Eficiente</strong></font></p></td>
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
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">19</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>nivel</strong> de<strong> productividad intelectual </strong>del profesorado es:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuado</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
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
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">20</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>pol&iacute;ticas </strong>de la Escuela para el <strong>desarrollo profesoral</strong> son<strong>:</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinentes</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P26" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P26" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
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
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">21</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La ejecuci&oacute;n de los programas<strong> de desarrollo profesoral</strong> es:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente eficiente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente</strong></font></div></td>
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
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">22</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> de las <strong>pol&iacute;ticas de reconocimiento</strong> a la docencia calificada es:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada</strong></font></div></td>
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
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">23</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Las  acciones <strong>de reconocimiento</strong> a la docencia calificada son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente pertinentes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinentes</strong></font></div></td>
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
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 4.  Procesos Académicos</u></strong></font></p>
</div>

<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">24</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n </strong>de las<strong>&nbsp; pol&iacute;ticas institucionales </strong>para<strong>:</strong></font></div>
                <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>ense&ntilde;anza y la utilizaci&oacute;n de lenguas extranjeras,</strong> es:</font></p>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
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
        <td width="20%">
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
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">25</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La  flexibilizaci&oacute;n de</strong> los planes de estudio, es:</font></p></td>

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

</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">26</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La  incorporaci&oacute;n y manejo de <strong>las TICS</strong> tiene un alto impacto sobre el <strong>aprendizaje.</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">27</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas de formaci&oacute;n</strong> (pregrado y  posgrado) de la Escuela son <strong>muy pertinentes</strong>: </font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P33" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P33" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
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
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">28</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>criterios</strong> acad&eacute;micos de  la Escuela para crear, diferenciar y relacionar <strong>Programas de educaci&oacute;n continuada</strong> son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados </strong></font></div></td>
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
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">29</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Existe coherencia entre las <strong>condiciones  de apertura y desarrollo de programas de educaci&oacute;n continuada</strong> y  los <strong>criterios </strong>correspondientes:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
        <td width="19%">
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
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 5. Investigaci&oacute;n</u></strong></font><br />
    </p>
</div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">30</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left"></div>
                <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La  participaci&oacute;n de los estudiantes en actividades de investigaci&oacute;n formativa es:</strong></font></p>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
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
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">31</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left">
                    <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>investigaci&oacute;n formativa</strong> en  la Escuela tiene</font><font face="Arial, Helvetica, sans-serif" size="2">:</font></p>
                </div>
                <p><font face="Arial, Helvetica, sans-serif" size="2">a. <strong>Niveles  de desarrollo:</strong></font></p>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P37" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P37" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P37" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P37" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Mecanismos  de evaluaci&oacute;n</strong>:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P38" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P38" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
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
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">32</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left"></div>
                <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>gesti&oacute;n y apoyo a</strong>l  desarrollo de las <strong>actividades  investigativas</strong> es:.</font></p>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente eficiente </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente</strong></font></div></td>
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
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">33</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left">
                    <p><font face="Arial, Helvetica, sans-serif" size="2">Para <strong>desarrollar las actividades de investigaci&oacute;n </strong>la  Escuela cuenta con<strong>:</strong></font><font face="Arial, Helvetica, sans-serif" size="2">a.<strong>Recursos  bibliogr&aacute;ficos</strong><strong>:</strong></font></p>
                </div>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy suficientes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Suficientes</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente suficientes </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco suficientes</strong></font></div></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. </strong><strong>Laboratorios:</strong></font></p></td>
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
    </p>
</div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">34 </font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela ejerce una <strong>influencia en el entorno</strong>:</font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy positiva</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Positiva</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente positiva </strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco positiva</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P43" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P43" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P43" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P43" value="2">
            </font></div>
        </td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">35</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left"></div>
                <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>participaci&oacute;n de los  profesores</strong> en programas y actividades de interacci&oacute;n con el entorno es:</font></p>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
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
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">36</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left"></div>
                <p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>pr&aacute;cticas de los estudiantes</strong> y su <strong>formaci&oacute;n profesional</strong> est&aacute;n:</font></p>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy articulados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Articulados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente articulados </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco articulados</strong></font></div></td>
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
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">37</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left">
                    <p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>pr&aacute;cticas</strong> de los estudiantes</font></p>

                </div>
            </div>
        <font face="Arial, Helvetica, sans-serif" size="2">a.Son <strong>pertinentes</strong> para la formaci&oacute;n.</font></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b.Son de <strong>alta calidad</strong></font></p></td>
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
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">38 </font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los &nbsp;programas y actividades de<strong> interacci&oacute;n con el entorno </strong>&nbsp;son de:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Alta calidad</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Calidad</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Calidad parcial</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poca calidad</strong></font></div></td>
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">39 </font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La Escuela ofrece </strong>informaci&oacute;n actualizada<strong> sobre posibilidades de </strong>empleo<strong> para sus graduados</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Siempre</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Casi siempre</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pocas veces</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Nunca</strong></font></div></td>
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
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">40</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left">
                    <div align="left">
                        <p><font face="Arial, Helvetica, sans-serif" size="2">Los siguientes <strong>servicios que ofrece la  Escuela </strong>a sus graduados son:</font></p>
                    </div>
                </div>
        <font face="Arial, Helvetica, sans-serif" size="2">a.Informaci&oacute;n  institucional y de inter&eacute;s acad&eacute;mico a trav&eacute;s de boletines electr&oacute;nicos.</font></div></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmentea actualizados</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Actualizados</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente actualizados </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco actualizados</strong></font></div></td>
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
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Informaci&oacute;n  institucional a trav&eacute;s de la web de la Escuela.</font></p></td>
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
    <tr>
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. Atenci&oacute;n  personalizada, v&iacute;a correo electr&oacute;nico y telef&oacute;nica.</font></p></td>
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
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">d. Actualizaci&oacute;n  de datos en l&iacute;nea.</font></p></td>
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
    <tr>
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">e. Facilidad  de interacci&oacute;n a trav&eacute;s de la Red Social de Graduados de la Escuela en  Facebook.</font></p></td>
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
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">f. Capacitaci&oacute;n  para la inserci&oacute;n al mercado laboral.</font></p></td>
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
    <tr>
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">g.Capacitaci&oacute;n  a trav&eacute;s de talleres en Ub&iacute;kate: orientaci&oacute;n para la b&uacute;squeda de empleo.</font></p></td>
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
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">h. Oportunidades  de empleo a trav&eacute;s de la Feria  laboral.</font></p></td>
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
        <td rowspan="2" width="5%">&nbsp;</td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">i. Interacci&oacute;n  a trav&eacute;s del Encuentro  de Graduados</font></p></td>
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
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 7. Autoevaluación y Autorregulación</u></strong></font><br />
    </p>
</div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">41</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Son<strong> participativos y permanentes </strong>en  la Escuela los procesos de<strong>:</strong></font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a.</strong> <strong>Autoevaluaci&oacute;n  y autorregulaci&oacute;n</strong></font></p>          <p>&nbsp;</p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">42</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>procesos de autoevaluaci&oacute;n,  autorregulaci&oacute;n y planeaci&oacute;n </strong>contribuyen al logro de la <strong>Misi&oacute;n y del Proyecto Institucional</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P60" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P60" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
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
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">43</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>sistemas de informaci&oacute;n</strong> para sustentar la autoevaluaci&oacute;n, la planeaci&oacute;n y la toma de decisiones</font></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a.</strong><strong>Son  eficientes</strong></font></p>
        <p>&nbsp;</p></td>
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
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P61" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P61" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Son  efectivos</strong></font><strong><font size="2" face="Arial, Helvetica, sans-serif"> </font></strong></p></td>
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
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">44</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>registros estad&iacute;sticos y los  indicadores de gesti&oacute;n</strong> para la <strong>planeaci&oacute;n,  la toma de decisiones y la apreciaci&oacute;n de la calidad</strong> se <strong>utilizan</strong> de una manera:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P63" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P63" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P63" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P63" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 8. Bienestar Institucional</u></strong></font><br />
</p></div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">45</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. La <strong>Escuela</strong> mantiene un <strong>clima institucional</strong>:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  adecuado</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. La<strong> unidad</strong> a la cual pertenece  mantiene <strong>un clima institucional</strong>:</font></p></td>
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">46</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La Escuela promueve un <strong>clima  favorable de bienestar</strong> mediante:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a.</strong> <strong>El  pago oportuno de los salarios</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P66" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P66" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P66" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P66" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. La  equidad en la asignaci&oacute;n de funciones</strong>.</font></p></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>c. El  ofrecimiento de oportunidades equitativas para capacitaci&oacute;n y promoci&oacute;n.</strong></font></p></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>d. La  disposici&oacute;n de facilidades para el desempe&ntilde;o de las labores asignadas</strong>.</font></p></td>
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
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">47</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>unidad</strong> encargada de planificar y ejecutar los programas y actividades del bienestar  institucional es:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy efectiva</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Efectiva</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  efectiva</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco efectiva</strong></font></div></td>
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
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">48</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>actividades orientadas a la prevenci&oacute;n de  desastres y atenci&oacute;n de emergencias, </strong>son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuadas</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuadas</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  adecuadas</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuadas</strong></font></div></td>
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
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">49</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas</strong> y <strong>servicios de bienestar</strong> de la Escuela:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. Son &nbsp;de <strong>alta calidad</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Tienen <strong>alto impacto</strong>.</font></p></td>
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">50</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>infraestructura, equipos y materiales&nbsp; </strong>para el desarrollo de los <strong>programas de bienestar institucional</strong> son:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. <strong>Adecuados</strong></font></p></td>
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
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Suficientes</strong></font></p></td>
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
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 9. Organización, Gestión y Administración</u></strong></font><br />
</p></div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">51</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>procedimientos</strong> <strong>y mecanismos de</strong> <strong>seguimiento y evaluaci&oacute;n</strong> de la gesti&oacute;n institucional son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuados </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados </strong></font></div></td>
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">52</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los  procesos de <strong>toma de decisiones</strong> en la  Escuela son:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. <strong>Transparentes</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Equitativos</strong></font></p></td>
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
</table>
<br>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">53</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>sistemas de comunicaci&oacute;n e informaci&oacute;n</strong> (Web, bolet&iacute;n, notiweb, correo, etc.) de la Escuela son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente/s</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente/s</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficiente/s</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente/s</strong></font></div></td>
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
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">54</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>El personal  administrativo </strong>de  la instituci&oacute;n es:</font></p></td>
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
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">55</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left"></div>
                <p><font face="Arial, Helvetica, sans-serif" size="2">a.Existe <strong>estabilidad</strong> institucional</font></p>
        </div></td>
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
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Existe  <strong>continuidad</strong> en las <strong>pol&iacute;ticas</strong> generadas por la <strong>estructura organizacional y administrativa.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P82" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P82" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P82" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P82" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">56</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left"></div>
                <p><font face="Arial, Helvetica, sans-serif" size="2">Los procedimientos para la <strong>creaci&oacute;n  y modificaci&oacute;n de programas formales</strong> ofrecen una garant&iacute;a de <strong>calidad acad&eacute;mica</strong>.</font></p>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P83" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P83" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P83" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P83" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">57</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left"></div>
                <p><font face="Arial, Helvetica, sans-serif" size="2">Los procedimientos para la <strong>creaci&oacute;n  y modificaci&oacute;n de programas formales</strong> son:</font></p>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy claros</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Claros</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente claros</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco claros</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P84" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P84" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P84" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P84" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 10. Recursos de Apoyo Académico y Planta Física</u></strong></font><br />
</p></div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">58</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La participaci&oacute;n de los <strong>profesores</strong> en la <strong>adquisici&oacute;n y actualizaci&oacute;n de  material bibliogr&aacute;fico es:</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P85" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P85" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P85" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P85" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">59</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>recursos bibliogr&aacute;ficos</strong> en las diferentes  &aacute;reas del conocimiento son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuados </strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados </strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P86" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P86" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P86" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P86" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">60</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">El servicio de <strong>correo electr&oacute;nico</strong> y el acceso  a <strong>internet</strong> son:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P87" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P87" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P87" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P87" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">61</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>equipos audiovisuales e  inform&aacute;ticos</strong> son:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P88" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P88" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P88" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P88" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">62</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>puestos de trabajo</strong> del  personal acad&eacute;mico, directivo y administrativo (dotaci&oacute;n) son:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P89" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P89" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P89" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P89" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">63</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>recursos bibliogr&aacute;ficos</strong> en diferentes  &aacute;reas del conocimiento est&aacute;n:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmentea actualizados</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Actualizados</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente actualizados </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco actualizados</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P90" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P90" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P90" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P90" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">64</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los<strong> laboratorio y talleres</strong> est&aacute;n:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P91" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P91" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P91" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P91" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">65</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios de c&oacute;mputo</strong> est&aacute;n:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P92" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P92" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P92" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P92" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">66</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>tecnolog&iacute;as de informaci&oacute;n y  comunicaci&oacute;n</strong> para la interacci&oacute;n entre profesores y estudiantes est&aacute;n:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P93" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P93" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P93" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P93" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">67</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>equipos audiovisuales e inform&aacute;ticos </strong>est&aacute;n:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P94" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P94" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P94" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P94" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">68</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>recursos bibliogr&aacute;ficos</strong> en diferentes  &aacute;reas del conocimiento</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy suficientes</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Suficientes</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente suficientes </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco suficientes</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P95" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P95" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P95" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P95" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">69</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios</strong> prestados por la <strong>biblioteca</strong> son:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P96" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P96" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P96" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P96" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">70</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>dotaci&oacute;n</strong> de los <strong>laboratorios y talleres </strong>es:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P97" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P97" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P97" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P97" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">71</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>equipos audiovisuales e inform&aacute;ticos</strong> son:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P98" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P98" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P98" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P98" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">72</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios</strong> prestados por la <strong>biblioteca</strong> son de alta calidad.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P99" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P99" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P99" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P99" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">73</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios</strong> prestados para el uso de  los <strong>equipos audiovisuales e inform&aacute;ticos</strong> son de alta calidad.</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P100" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P100" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P100" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P100" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">74</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los<strong> laboratorios y talleres </strong>tienen un<strong> buen  mantenimiento</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P101" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P101" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P101" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P101" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">75</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios de c&oacute;mputo </strong>tienen un<strong> buen mantenimiento</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P102" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P102" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P102" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P102" value="2" />
        </font></div></td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">76</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"> Los<strong> servicios </strong>de <strong>equipos audiovisuales e inform&aacute;ticos</strong> son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy oportunos</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Oportunos</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente oportunos</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco oportunos</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P103" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P103" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P103" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P103" value="2" />
        </font></div></td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">77</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"> Los<strong> servicios </strong>de <strong>c&oacute;mputo </strong>est&aacute;n:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente&nbsp; disponibles</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Disponibles</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente disponibles</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco disponibles</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P104" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P104" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P104" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P104" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">78</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los sistemas de <strong>consulta  bibliogr&aacute;fica</strong> son: </font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficientes</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficientes</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficientes </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficientes</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P105" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P105" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P105" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P105" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">79</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font size="2" face="Arial, Helvetica, sans-serif">La <strong>planta f&iacute;sica</strong> de la Escuela :</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"> a. Es de <strong>calidad</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P106" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P106" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P106" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P106" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Est&aacute;<strong> bien distribuida.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P107" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P107" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P107" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P107" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. Es<strong> funcional.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P108" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P108" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P108" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P108" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">80</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font size="2" face="Arial, Helvetica, sans-serif">La <strong>planta f&iacute;sica</strong> de la Escuela tiene buena:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"> a. <strong>Accesibilidad</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P109" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P109" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P109" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P109" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Capacidad </strong>para el desarrollo de las actividades universitarias.</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P110" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P110" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P110" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P110" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. <strong>Iluminaci&oacute;n.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P111" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P111" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P111" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P111" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">d. <strong>Ventilaci&oacute;n.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P112" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P112" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P112" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P112" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">e. <strong>Condiciones  de seguridad.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P113" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P113" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P113" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P113" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">f. <strong>Condiciones  de higiene.</strong></font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P114" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P114" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P114" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P114" value="2" />
        </font></div></td>
    </tr>
</table>
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 11.Recursos  Financieros</u></strong></font><br />
    </p>
</div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">81</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La  instituci&oacute;n cuenta con una buena <strong>solidez  financiera</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P115" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P115" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P115" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P115" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">82</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Las pol&iacute;ticas </strong>para la<strong> elaboraci&oacute;n del  presupuesto de inversi&oacute;n y funcionamiento</strong><strong> </strong>son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada/s</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada/s</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada/s</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada/s</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P116" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P116" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P116" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P116" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">83</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>participaci&oacute;n de profesores  y de directivos</strong> en la <strong>elaboraci&oacute;n del presupuesto  de funcionamiento e inversi&oacute;n </strong>es:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P117" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P117" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P117" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P117" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">84</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>asignaci&oacute;n de </strong><strong>recursos presupuestales</strong> para el desarrollo de los <strong>programas y  actividades de bienestar institucional </strong>es:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P118" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P118" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P118" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P118" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">85</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"> Los <strong>procesos para la elaboraci&oacute;n y  ejecuci&oacute;n</strong> del presupuesto de inversi&oacute;n y funcionamiento son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficientes</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficientes</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficientes</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficientes</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P119" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P119" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P119" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P119" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">86</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>criterios para distribuci&oacute;n  presupuestal</strong> entre las distintas unidades acad&eacute;micas y administrativas son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinentes</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinentes</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente pertinentes</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinentes</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P120" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P120" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P120" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P120" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">87</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>criterios para distribuci&oacute;n  presupuestal</strong> entre las <strong>funciones  propias de la educaci&oacute;n superior</strong> (Formaci&oacute;n, Investigaci&oacute;n, Relaciones con  el entorno, Gesti&oacute;n y Bienestar) son:</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P121" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P121" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P121" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P121" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">88</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>procedimientos y tr&aacute;mites</strong> en la gesti&oacute;n financiera son eficientes (optimizan el rendimiento de dicha  gesti&oacute;n)</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P122" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P122" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P122" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P122" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">89</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>procedimientos y tr&aacute;mites</strong> en la gesti&oacute;n financiera (son efectivos<strong>: </strong>generan impactos positivos)</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy efectivos</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Efectivoss</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente efectivos</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco efectivos</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P123" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P123" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P123" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P123" value="2" />
        </font></div></td>
    </tr>
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">90</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>personal especializado</strong> en el manejo financiero es</font></p></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P124" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P124" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P124" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P124" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
<CENTER><input type="submit" name="Submit" value="Enviar Datos" /></CENTER>
</form>
</body>
</html>
