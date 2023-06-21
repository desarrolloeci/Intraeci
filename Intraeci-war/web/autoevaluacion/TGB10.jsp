<%-- 
    Document   : TGB10
    Created on : 24/10/2011, 02:55:51 PM
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

<SCRIPT LANGUAGE="JavaScript">

    function comprueba( ){
        for(i=1; i<31; i++){
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

<p class="Centro" align="center"><strong>TALLER GRUPO BASE-10</strong></p>
<div align="left">
    <p>
    <font face="Arial, Helvetica, sans-serif" size="2">Este  taller busca&nbsp; conocer las opiniones de la  comunidad Universitaria sobre el <strong>Factor  Recursos de Apoyo Acad&eacute;mico y Planta F&iacute;sica. </strong>En cada grupo habr&aacute; un  moderador que formular&aacute; las preguntas, coordinar&aacute; la discusi&oacute;n y obtendr&aacute; el  consenso&nbsp; antes de registrar en la  planilla una sola respuesta para cada pregunta. Dicho consenso ir&aacute; acompa&ntilde;ado  de una justificaci&oacute;n grupal para cada una de las respuestas.</font></p>
</div>
<br />
<div align="left">
    <p>
    <font face="Arial, Helvetica, sans-serif" size="2"><u><strong>Factor  10. Recursos de Apoyo Acad&eacute;mico y Planta F&iacute;sica</strong></u></font></p>
</div>
<form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
    <input type="hidden" name="total" value="30">
    <input type="hidden" name="idenc" value="42">
    <input type="hidden" name="flag" value="<%=flag%>">
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
            <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
            </td>
            <td rowspan="2" width="30%"><div align="left">
                    <div align="left">
                        <p><font face="Arial, Helvetica, sans-serif" size="2">La participaci&oacute;n de los <strong>profesores</strong> en la <strong>adquisici&oacute;n y actualizaci&oacute;n de  material bibliogr&aacute;fico es</strong></font></p>
                    </div>
            </div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
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
            <td width="20%">
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
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">2</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <p>&nbsp;</p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>recursos bibliogr&aacute;ficos</strong> en las diferentes  &aacute;reas del conocimiento son:</font></p>
            </div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  adecuados</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco</strong></font><font face="Arial, Helvetica, sans-serif" size="2"><strong>adecuados </strong></font></div></td>
        </tr>
        <tr>
            <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P2" value="8" />
            </font></div></td>
            <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P2" value="6" />
            </font></div></td>
            <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P2" value="4" />
            </font></div></td>
            <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P2" value="2" />
            </font></div></td>
        </tr>
        <tr>
            <td rowspan="2" width="5%"><div align="center">
                    <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">3</font></div>
            </div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">El servicio de <strong>correo electr&oacute;nico</strong> y el acceso  a <strong>internet</strong> son:</font></p></td>
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
        <tr>
            <td rowspan="2" width="5%"><div align="center">
                    <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">4</font></div>
            </div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>equipos audiovisuales e  inform&aacute;ticos</strong> son:</font></p></td>
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
            <td rowspan="2" width="5%"><div align="center">
                    <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">5</font></div>
            </div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>puestos de trabajo</strong> del  personal acad&eacute;mico, directivo y administrativo (dotaci&oacute;n) son:</font></p></td>
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
            <td rowspan="2" width="30%"><div align="left">
                    <div align="left"></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>recursos bibliogr&aacute;ficos</strong> en diferentes  &aacute;reas del conocimiento est&aacute;n.</font></p>
            </div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente actualizados</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Actualizados</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente actualizados</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco actualizados</strong></font></div></td>
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
        <tr>
            <td rowspan="2" width="5%"><div align="center">
                    <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">7</font></div>
            </div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los<strong> laboratorio y talleres</strong> est&aacute;n:</font></p></td>
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
            <td rowspan="2" width="5%"><div align="center">
                    <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">8</font></div>
            </div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios de c&oacute;mputo</strong> est&aacute;n:</font></p></td>
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
        <tr>
            <td rowspan="2" width="5%"><div align="center">
                    <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">9</font></div>
            </div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>tecnolog&iacute;as de informaci&oacute;n y  comunicaci&oacute;n</strong> para la interacci&oacute;n entre profesores y estudiantes est&aacute;n:</font></p></td>
        </tr>
        <tr>
            <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P9" value="8" />
            </font></div></td>
            <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P9" value="6" />
            </font></div></td>
            <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P9" value="4" />
            </font></div></td>
            <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P9" value="2" />
            </font></div></td>
        </tr>
        <tr>
            <td rowspan="2" width="5%"><div align="center">
                    <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">10</font></div>
            </div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>equipos audiovisuales e inform&aacute;ticos </strong>est&aacute;n:</font></p></td>
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
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">11</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <p>&nbsp;</p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>recursos bibliogr&aacute;ficos</strong> en diferentes  &aacute;reas del conocimiento</font></p>
            </div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy Suficientes</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Suficientes</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente Suficientes</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco Suficientes</strong></font></div></td>
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
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">12</font></div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios</strong> prestados por la <strong>biblioteca</strong> son:</font></p></td>
        </tr>
        <tr>
            <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P12" value="8" />
            </font></div></td>
            <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P12" value="6" />
            </font></div></td>
            <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P12" value="4" />
            </font></div></td>
            <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P12" value="2" />
            </font></div></td>
        </tr>
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">13</font></div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>dotaci&oacute;n</strong> de los <strong>laboratorios y talleres </strong>es:</font></p></td>
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
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">14</font></div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>equipos audiovisuales e inform&aacute;ticos</strong> son:</font></p></td>
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
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">15</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <p>&nbsp;</p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios</strong> prestados por la <strong>biblioteca</strong> son&nbsp; de alta calidad.</font></p>
            </div></td>
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
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">16</font></div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"> Los  <strong>servicios</strong> prestados para el uso de los <strong>equipos audiovisuales e inform&aacute;ticos</strong> son de alta calidad.</font></p></td>
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
    <BR>
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">17</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <p>&nbsp;</p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">Los<strong> laboratorio y talleres </strong>tienen un<strong> buen  mantenimiento</strong></font></p>
            </div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">18</font></div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"> Los  <strong>servicios de c&oacute;mputo </strong>tienen un<strong> buen mantenimiento</strong></font></p></td>
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
    </table>
    <br />
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">19</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <p>&nbsp;</p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">Los<strong> servicios </strong>de <strong>equipos audiovisuales e inform&aacute;ticos</strong> son:</font></p>
            </div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy oportunos</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Oportunos</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente oportunos</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco oportunos</strong></font></div></td>
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
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">20</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <p>&nbsp;</p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">Los<strong> servicios </strong>de <strong>c&oacute;mputo </strong>est&aacute;n:</font></p>
            </div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente &nbsp;disponibles</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Disponibles</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente disponibles</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco disponibles</strong></font></div></td>
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
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">21</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <p>&nbsp;</p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">Los sistemas de <strong>consulta  bibliogr&aacute;fica</strong> son:</font></p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">(Eficiente: optimiza el rendimiento)</font></p>
                    <p>&nbsp;</p>
            </div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficientes</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficientes</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficientes</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficientes</strong></font></div></td>
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
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">22</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <p>&nbsp;</p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>planta f&iacute;sica</strong> de la Escuela :</font></p>
                    <p><font size="2" face="Arial, Helvetica, sans-serif">a. Es de <strong>calidad</strong>.</font></p>
            </div></td>
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
            <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P22" value="4" />
            </font></div></td>
            <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P22" value="2" />
            </font></div></td>
        </tr>
        <tr>
            <td rowspan="2" width="5%"><div align="center"></div></td>
            <td rowspan="2" width="30%"><p><font size="2" face="Arial, Helvetica, sans-serif">b. Est&aacute;<strong> bien distribuida.</strong></font></p></td>
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
        <tr>
            <td rowspan="2" width="5%"><div align="center"></div></td>
            <td rowspan="2" width="30%"><p><font size="2" face="Arial, Helvetica, sans-serif">c. Es<strong> funcional.</strong></font></p></td>
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
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">23</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <p>&nbsp;</p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>planta f&iacute;sica</strong> de la Escuela tiene buena:</font></p>
                    <p><font size="2" face="Arial, Helvetica, sans-serif">a. <strong>Accesibilidad</strong></font></p>
            </div></td>
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
            <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P25" value="4" />
            </font></div></td>
            <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P25" value="2" />
            </font></div></td>
        </tr>
        <tr>
            <td rowspan="2" width="5%"><div align="center"></div></td>
            <td rowspan="2" width="30%"><p><font size="2" face="Arial, Helvetica, sans-serif">b. <strong>Capacidad </strong>para el desarrollo de las actividades universitarias.</font></p></td>
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
        <tr>
            <td rowspan="2" width="5%"><div align="center"></div></td>
            <td rowspan="2" width="30%"><p><font size="2" face="Arial, Helvetica, sans-serif">c. <strong>Iluminaci&oacute;n</strong></font></p></td>
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
        <tr>
            <td rowspan="2" width="5%"><div align="center"></div></td>
            <td rowspan="2" width="30%"><p><font size="2" face="Arial, Helvetica, sans-serif">d. <strong>Ventilaci&oacute;n.</strong></font></p></td>
        </tr>
        <tr>
            <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P28" value="8" />
            </font></div></td>
            <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P28" value="6" />
            </font></div></td>
            <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P28" value="4" />
            </font></div></td>
            <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P28" value="2" />
            </font></div></td>
        </tr>
        <tr>
            <td rowspan="2" width="5%"><div align="center"></div></td>
            <td rowspan="2" width="30%"><p><font size="2" face="Arial, Helvetica, sans-serif">e. <strong>Condiciones  de seguridad.</strong></font></p></td>
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
            <td rowspan="2" width="5%"><div align="center"></div></td>
            <td rowspan="2" width="30%"><p><font size="2" face="Arial, Helvetica, sans-serif">f. <strong>Condiciones  de higiene.</strong></font></p></td>
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
    <p>&nbsp;</p>
    <p><b><font face="Arial, Helvetica, sans-serif" size="2">GRAN JUSTIFICACION</font></b></p>

    <p>
        <textarea name="granjustif" cols="125" rows="5"></textarea>
    </p>
    <p>&nbsp; </p>
    <center>
    <input type="submit" name="Submit" value="Enviar Datos"></center>
</form>
</body>
</html>
