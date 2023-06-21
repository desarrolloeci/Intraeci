<%-- 
    Document   : TGB5
    Created on : 24/10/2011, 02:54:59 PM
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
        for(i=1; i<11; i++){
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
<p class="Centro"><strong><center>TALLER GRUPO BASE-5</center></strong></p>
<div align="left">
    <p>
    <font face="Arial, Helvetica, sans-serif" size="2">Este taller busca&nbsp; conocer las  opiniones de la comunidad Universitaria sobre el <strong>Factor Investigaci&oacute;n. </strong>Los asistentes se dividir&aacute;n en grupos<strong>. </strong>En cada grupo habr&aacute; un moderador que  formular&aacute; las preguntas. Se recoger&aacute;n las opiniones de los participantes y se  elaborar&aacute; un consenso grupal. Dicho consenso se transcribir&aacute; e ir&aacute; acompa&ntilde;ado  de una justificaci&oacute;n para cada una de las respuestas.</font></p>
</div>

<form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
    <input type="hidden" name="total" value="10">
    <input type="hidden" name="idenc" value="37">
           <input type="hidden" name="flag" value="<%=flag%>">
           <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
            <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
            </td>
            <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La  participaci&oacute;n de los estudiantes en actividades de investigaci&oacute;n formativa es:</strong></font></p></td>
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
            <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>investigaci&oacute;n formativa</strong> en  la Escuela tiene:</font></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Niveles  de desarrollo:</strong></font></p></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
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
            <td rowspan="2" width="5%"><div align="center"></div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Mecanismos  de evaluaci&oacute;n</strong>:</font></p></td>
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
  <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">3</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <div align="left"></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela <strong>aplica pol&iacute;ticas</strong> institucionales para fomentar la actividad investigativa <strong>en distintas &aacute;reas del conocimiento </strong>que se desarrollan en la  instituci&oacute;n<strong>.</strong></font></p>
            </div></td>
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
            <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P4" value="4" />
            </font></div></td>
            <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                        <input type="radio" name="P4" value="2" />
            </font></div></td>
        </tr>
    </table>
    <br />
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">4</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <div align="left"></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> de las <strong>pol&iacute;ticas institucionales</strong> para la  conformaci&oacute;n, organizaci&oacute;n y desarrollo de grupos, l&iacute;neas y proyectos de  investigaci&oacute;n</font></p>
            </div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
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
  <label for="justif2"></label>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">5</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <div align="left"></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>desarrollo investigativo</strong> de la instituci&oacute;n en relaci&oacute;n con el <strong>entorno  social</strong>, tiene un <strong>impacto:</strong></font></p>
            </div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy favorable</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Favorable</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente favorable</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco favorable</strong></font></div></td>
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
    
 <br>
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">6</font></div></td>
            <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>gesti&oacute;n y apoyo a</strong>l  desarrollo de las <strong>actividades  investigativas</strong> es</font></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">(Eficiente: optimiza el rendimiento)</font></p></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente eficiente</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente</strong></font></div></td>
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
            <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">7</font></div></td>
            <td rowspan="2" width="30%"><div align="left">
                    <p><font face="Arial, Helvetica, sans-serif" size="2">Para <strong>desarrollar las actividades de investigaci&oacute;n l</strong>a  Escuela cuenta con:</font></p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">a. <strong>Recursos  bibliogr&aacute;ficos:</strong></font></p>
            </div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy suficientes</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Suficientes</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente suficientes</strong></font></div></td>
            <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco suficientes</strong></font></div></td>
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
            <td rowspan="2" width="5%"><div align="center"></div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Laboratorios:</strong></font></p></td>
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
            <td rowspan="2" width="5%"><div align="center"></div></td>
            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. <strong>Recursos inform&aacute;ticos:</strong></font></p></td>
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
