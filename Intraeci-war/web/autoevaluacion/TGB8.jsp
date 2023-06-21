<%-- 
    Document   : TGB8
    Created on : 24/10/2011, 02:55:31 PM
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
        for(i=1; i<14; i++){
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
<p class="Centro"><strong><CENTER>TALLER GRUPO BASE-8</CENTER></strong></p>
<div align="left">
    <p>
    <font face="Arial, Helvetica, sans-serif" size="2">Este  taller busca&nbsp; conocer las opiniones de la  comunidad Universitaria sobre el <strong>Factor  Bienestar Institucional. </strong>En cada grupo habr&aacute; un moderador que formular&aacute; las  preguntas, coordinar&aacute; la discusi&oacute;n y obtendr&aacute; el consenso antes de registrar en  la planilla una sola respuesta para cada pregunta. Dicho consenso ir&aacute;  acompa&ntilde;ado de una justificaci&oacute;n grupal para cada una de las respuestas.</font>	</p>
</div>
<form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left"></div>
                <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. La <strong>Escuela</strong> mantiene un <strong>clima institucional</strong>:</strong></font></p>
        </div></td>

        <input type="hidden" name="total" value="13">
        <input type="hidden" name="idenc" value="40">
        <input type="hidden" name="flag" value="<%=flag%>">
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuado</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
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
    <td rowspan="2" width="5%"><div align="center"></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. La<strong> unidad</strong> a la cual usted pertenece,  mantiene <strong>un clima &nbsp;institucional</strong>:</font></p></td>

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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">2</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left">
                    <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>proyectos de interacci&oacute;n con  el entorno </strong>desarrollados por la Escuela en relaci&oacute;n con</font></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. </strong><strong>El  pago oportuno de los salarios</strong></font></p>
                </div>
        </div></td>
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
    <td rowspan="2" width="5%"><div align="center"></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>La  equidad en la asignaci&oacute;n de funciones</strong>.</font></p></td>

    </tr>
    <tr>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="8" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="6" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="4" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="2" />
        </font></div></td>
    </tr>
    <td rowspan="2" width="5%"><div align="center"></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. <strong>El  ofrecimiento de oportunidades equitativas para capacitaci&oacute;n y promoci&oacute;n</strong></font><strong><font size="2" face="Arial, Helvetica, sans-serif">.</font></strong></p></td>

    </tr>
    <tr>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P5" value="8" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P5" value="6" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P5" value="4" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P5" value="2" />
        </font></div></td>
    </tr>
    <td rowspan="2" width="5%"><div align="center"></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">d. <strong>La  disposici&oacute;n de facilidades para el desempe&ntilde;o de las labores asignadas</strong>.</font></p></td>

    </tr>
    <tr>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="8" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="6" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="4" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="2" />
        </font></div></td>
    </tr>
</table>
<br>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">3</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left">
                    <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>unidad</strong> encargada de planificar y ejecutar los programas y actividades del bienestar  institucional es:</font></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">(Efectiva: genera impactos o efectos positivos)</font></p>
                </div>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy efectiva</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Efectiva</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente efectiva</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco efectiva</strong></font></div></td>
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
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">4</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Las </strong>actividade<strong>s</strong> orientadas a la prevenci&oacute;n de  desastres y atenci&oacute;n de emergencias, son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuadas</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuadas</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuadas</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuadas</strong></font></div></td>
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
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">5</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left">
                    <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas</strong> y <strong>servicios de bienestar</strong> de la Escuela:</font></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Son &nbsp;de <strong>alta calidad</strong></strong></font></p>
                </div>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Tienen <strong>alto impacto </strong>positivo.</font></p></td>
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
  <table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">6</font></div></td>
        <td rowspan="2" width="30%"><div align="left">
                <div align="left">
                    <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>infraestructura, equipos y materiales&nbsp; </strong>para el desarrollo de los <strong>programas de bienestar institucional</strong> son:</font></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Adecuados</strong></font></p>
                </div>
        </div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Suficientes</strong></font></p></td>
    </tr>
    <tr>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="8" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="6" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="4" />
        </font></div></td>
        <td><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="2" />
        </font></div></td>
    </tr>
</table>
<br />
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">7</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los procedimientos de orientaci&oacute;n (inducci&oacute;n) para quienes ingresan por  primera vez a la Instituci&oacute;n&nbsp; (estudiantes,  profesores y personal administrativo), son:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  adecuados</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
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
