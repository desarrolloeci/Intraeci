<%-- 
    Document   : TASA
    Created on : 19/10/2011, 03:57:05 PM
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
        for(i=1; i<41; i++){
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
  <p class="Centro"><strong><center>Taller Personal Administrativo de servicio</center></strong></p>
      <div align="left">
        <p>
        <font face="Arial, Helvetica, sans-serif" size="2">Este  taller busca&nbsp; conocer las opiniones del <strong>Personal&nbsp;  Administrativos</strong> sobre diferentes aspectos de la vida universitaria.<strong> </strong>En cada grupo habr&aacute; un moderador que  formular&aacute; las preguntas, coordinar&aacute; la discusi&oacute;n y obtendr&aacute; el consenso&nbsp; antes de registrar en la planilla una sola  respuesta para cada pregunta. Dicho consenso ir&aacute; acompa&ntilde;ado de una  justificaci&oacute;n grupal para cada una de las respuestas.</font>        </p>
        <div align="left">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u> Factor 1.  Misi&oacute;n y Proyecto Institucional</u></strong></font></p>
      </div>
  </div>
    <form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
<input type="hidden" name="total" value="40">
<input type="hidden" name="idenc" value="32">
    <input type="hidden" name="flag" value="<%=flag%>">
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
           <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
          </td>
          <td rowspan="2" width="30%"><div align="left"></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">La<strong> </strong>Escuela demuestra un decidido <strong>compromiso Institucional</strong> con<strong> la calidad</strong></font></p></td>
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
  <p><br />
<div> </div>
  <div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 7.  Autoevaluaci&oacute;n y Autorregulaci&oacute;n</u></strong></font><br />
    </p>
  </div>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
<tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">2</font></div></td>
          <td rowspan="2" width="30%"><div align="left">
            <div align="left">
              <p><font size="2" face="Arial, Helvetica, sans-serif">Los <strong>sistemas de informaci&oacute;n</strong> para sustentar la autoevaluaci&oacute;n, la planeaci&oacute;n y la toma de decisiones </font></p>
              <p><font size="2" face="Arial, Helvetica, sans-serif"><strong>a. Son  eficientes </strong>(optimiza el rendimiento)</font><font size="2" face="Arial, Helvetica, sans-serif"><br />
              </font></p>
            </div>
      </div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
      <tr>
      <td rowspan="2" width="5%"><div align="center"></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Son  efectivos </strong>(genera impactos positivos)</font></p></td>
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
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">3</font></div></td>
      <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La aplicaci&oacute;n de los <strong>criterios para la evaluaci&oacute;n</strong> del<strong> personal administrativo, </strong>es:</font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy transparente</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Transparente</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente transparente</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco transparente</strong></font></div></td>
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
  
<p>&nbsp;</p>
  
<div> </div>
  <div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 8.  Bienestar Institucional</u></strong></font></p>
  </div>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">4</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <div align="left">
          <p>&nbsp;</p>
          <p><font size="2" face="Arial, Helvetica, sans-serif">a. La <strong>Escuela</strong> mantiene un <strong>clima institucional</strong>:</font></p>
        </div>
      </div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuado</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
    </tr>
    <tr>
      <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P5" value="8" />
      </font></div></td>
      <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P5" value="6" />
      </font></div></td>
      <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P5" value="4" />
      </font></div></td>
      <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P5" value="2" />
      </font></div></td>
    </tr>
    <tr>
      <td rowspan="2" width="5%"><div align="center"></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. La<strong> unidad</strong> a la cual pertenece  mantiene <strong>un clima institucional</strong>:</strong></font></p></td>
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
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">5</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <div align="left">
          <p><font size="2" face="Arial, Helvetica, sans-serif">La Escuela promueve un <strong>clima favorable  de bienestar</strong> mediante:</font></p>
          <p><font size="2" face="Arial, Helvetica, sans-serif">a. El pago oportuno de los salarios</font></p>
</div>
      </div></td>
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
      <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P7" value="4" />
      </font></div></td>
      <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P7" value="2" />
      </font></div></td>
    </tr>
    <tr>
      <td rowspan="2" width="5%"><div align="center"></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. La equidad en la asignaci&oacute;n de funciones:</font></p></td>
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
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. El ofrecimiento de oportunidades equitativas para capacitaci&oacute;n y  promoci&oacute;n</font></p></td>
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
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">d. La disposici&oacute;n de facilidades para el desempe&ntilde;o de las labores asignadas</font><font size="2" face="Arial, Helvetica, sans-serif">.</font></p></td>
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
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">6</font></div></td>
      <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los procedimientos de orientaci&oacute;n (inducci&oacute;n) para quienes ingresan por  primera vez a la Instituci&oacute;n&nbsp; (estudiantes,  profesores y personal administrativo), son:</font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuados</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
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
<p><font face="Arial, Helvetica, sans-serif" size="2"></font></p>
      <table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">7</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <p>&nbsp;</p>
      </div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>unidad</strong> encargada de planificar y ejecutar los programas y actividades del bienestar  institucional es:</font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy efectiva</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Efectiva</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente efectiva</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco efectiva</strong></font></div></td>
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
  </table>
  <br />
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">8</font></div></td>
      <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>actividade</strong>s<strong> orientadas a la prevenci&oacute;n de  desastres y atenci&oacute;n de emergencias, </strong>son:</font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuadas</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuadas</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuadas</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuadas</strong></font></div></td>
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
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">9</font></div></td>
      <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas</strong> y <strong>servicios de bienestar</strong> de la Escuela:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. Son &nbsp;de <strong>alta calidad</strong></font></p></td>
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
    <tr>
      <td rowspan="2" width="5%"><div align="center"></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Tienen <strong>alto impacto</strong></font></p></td>
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
<p><font face="Arial, Helvetica, sans-serif" size="2"></font></p>
  <div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 9.  Organización, Gestión y Administración</u></strong></font></p>
  </div>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">10</font></div></td>
    <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los  procesos de <strong>toma de decisiones</strong> en la  Escuela son:</font></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">a. <strong>Transparentes</strong></font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
  <tr>
    <td rowspan="2" width="5%"><div align="center"></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Equitativos</strong></font></p></td>
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
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">11</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>sistemas de comunicaci&oacute;n e informaci&oacute;n</strong> (Web, bolet&iacute;n, notiweb, correo, etc.) de la Escuela son:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficientes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficientes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficientes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficientes</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P18" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P18" value="6" />
    </font></div></td>
    <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P18" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P18" value="2" />
    </font></div></td>
  </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">12</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas de capacitaci&oacute;n y  cualificaci&oacute;n</strong> para el personal son:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinentes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinentes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente pertinentes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinentes</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P19" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P19" value="6" />
    </font></div></td>
    <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P19" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P19" value="2" />
    </font></div></td>
  </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">13</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>apoyo</strong> recibido por el <strong>personal administrativo</strong> para <strong>cualificar el desempe&ntilde;o</strong> de sus labores  administrativas es:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuado</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
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
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">14</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">La aplicaci&oacute;n de pol&iacute;ticas de <strong>est&iacute;mulos,  promoci&oacute;n y evaluaci&oacute;n</strong> del personal administrativo es:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficiente</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P21" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P21" value="6" />
    </font></div></td>
    <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P21" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P21" value="2" />
    </font></div></td>
  </tr>
</table>
<p><br />
</p>
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 10.  Recursos de Apoyo Acad&eacute;mico y Planta F&iacute;sica</u></strong></font></p>
</div>

  <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">15</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">El servicio de <strong>correo electr&oacute;nico</strong> y el acceso  a <strong>internet</strong> son:</font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuados</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
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
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">16</font></div></td>
          <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>equipos audiovisuales e  inform&aacute;ticos</strong> son:</font></p></td>
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
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">17</font></div></td>
          <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>puestos de trabajo</strong> del  personal acad&eacute;mico, directivo y administrativo (dotaci&oacute;n) son:</font></p></td>
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
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">18</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios de c&oacute;mputo</strong> est&aacute;n:</font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente actualizados</strong></font></div></td>
          <td height="23"><div align="center">
            <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Actualizados</strong></font></p>
</div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente actualizados</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco actualizados</strong></font></div></td>
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
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">19</font></div></td>
          <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>equipos audiovisuales e inform&aacute;ticos </strong>est&aacute;n:</font></p></td>
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
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">20</font></div></td>
      <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>equipos audiovisuales e inform&aacute;ticos</strong> son:</font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy Suficientes</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Suficientes</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente Suficientes</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco Suficientes</strong></font></div></td>
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
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">21</font></div></td>
      <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>servicios</strong> prestados para el uso de  los <strong>equipos audiovisuales e inform&aacute;ticos</strong> son de alta calidad.</font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
  </table>
  <br />
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">22</font></div></td>
      <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios de c&oacute;mputo </strong>tienen un<strong> buen mantenimiento</strong></font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
  </table>
  <br />
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">23</font></div></td>
      <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los<strong> servicios </strong>de <strong>equipos audiovisuales e inform&aacute;ticos</strong> son:</font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy oportunos</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Oportunos</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  oportunos</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco oportunos</strong></font></div></td>
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
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">24</font></div></td>
      <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los<strong> servicios </strong>de <strong>c&oacute;mputo </strong>est&aacute;n:</font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente disponibles</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Disponibles</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente disponibles</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco disponibles</strong></font></div></td>
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
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
<tr>
           <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">25</font></div></td>
           <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>planta f&iacute;sica</strong> de la Escuela :</font></div>
             <p><font face="Arial, Helvetica, sans-serif" size="2">a. Es de <strong>calidad</strong></font></p></td>
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
         <tr>
           <td rowspan="2" width="5%"><div align="center"></div></td>
           <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Est&aacute;<strong> bien distribuida.</strong></font></p></td>
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
         <tr>
           <td rowspan="2" width="5%"><div align="center"></div></td>
           <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. Es<strong> funcional.</strong>os <strong>puestos de trab</strong></font></p></td>
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
       <br>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
         <tr>
           <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">26</font></div></td>
           <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>planta f&iacute;sica</strong> de la Escuela tiene buena:</font></div>
             <p><font face="Arial, Helvetica, sans-serif" size="2">a. <strong>Accesibilidad</strong></font></p></td>
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
           <td rowspan="2" width="5%"><div align="center"></div></td>
           <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Capacidad </strong>para el desarrollo de las actividades universitarias.</font></p></td>
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
         <tr>
           <td rowspan="2" width="5%"><div align="center"></div></td>
           <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. <strong>Iluminaci&oacute;n</strong></font></p></td>
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
           <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">d.<strong> Ventilaci&oacute;n</strong></font></p></td>
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
         <tr>
           <td rowspan="2" width="5%"><div align="center"></div></td>
           <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">e. <strong>Condiciones  de seguridad.</strong></font></p></td>
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
         <tr>
           <td rowspan="2" width="5%"><div align="center"></div></td>
           <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">f. <strong>Condiciones  de higiene.</strong></font></p></td>
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
