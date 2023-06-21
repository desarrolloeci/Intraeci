<%-- 
    Document   : TDP1
    Created on : 19/10/2011, 10:44:01 AM
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
        for(i=1; i<15; i++){
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
  
<p class="Centro" align="center"><strong><center>Taller Directores de Programas de Pregrado
y Posgrado </center></strong></p>
      <div align="left">
        <p>
        <font face="Arial, Helvetica, sans-serif" size="2">Este  taller busca conocer las opiniones de  los <strong>Directores de programas de pregrado  y posgrado</strong> sobre diferentes aspectos de la vida universitaria.<strong> </strong>En cada grupo habr&aacute; un moderador que  formular&aacute; las preguntas, coordinar&aacute; la discusi&oacute;n y obtendr&aacute; el consenso antes de registrar en la planilla una sola  respuesta para cada pregunta. Dicho consenso ir&aacute; acompa&ntilde;ado de una  justificaci&oacute;n grupal para cada una de las respuestas.</font></p>
      <div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u> Factor 1.  Misi&oacute;n y Proyecto Institucional</u></strong></font></p>
      </div>
      </div>
      <form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
<input type="hidden" name="total" value="14">
<input type="hidden" name="idenc" value="22">
    <input type="hidden" name="flag" value="<%=flag%>">
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
           <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
          </td>
          <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>Misi&oacute;n  Institucional</strong></font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">Es <strong>pertinente </strong>en relaci&oacute;n con los<strong> problemas y necesidades del entorno.</strong></font></p></td>
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
  <br />
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">2</font></div></td>
      <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>Misi&oacute;n  Institucional</strong></font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Se <strong>incorpora</strong> a los procesos  administrativos</font></p></td>
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
      <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P2" value="4" />
      </font></div></td>
      <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P2" value="2" />
      </font></div></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 2.  Estudiantes</u></strong></font><br />
    </p>
  </div>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">3</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <div align="left">
          <p>&nbsp;</p>
        </div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>procesos de admisi&oacute;n</strong> de los  estudiantes <strong>se enmarcan</strong> en <strong>criterios acad&eacute;micos</strong> establecidos.</font></p>
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

  </table>
  <p><font face="Arial, Helvetica, sans-serif" size="2"></font></p>
  <div align="left">
<p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 3. Profesores</u></strong></font><br />
  </p>
  </div>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
       <tr>
           <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">4</font></div>
          </td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>cantidad de profesores</strong> para atender al  n&uacute;mero de estudiantes matriculados<strong> es</strong>:</font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
        </tr>
                      <tr>
                          <td width="17%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P4" value="8">
                            </font></div>
                          </td>
                          <td width="12%">
                      <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P4" value="6">
                            </font></div>
                          </td>
                          <td width="20%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P4" value="4">
                            </font></div>
                          </td>
                          <td width="16%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P4" value="2">
                            </font></div>
                          </td>
                      </tr>

      </table>
      <br />
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
<tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">5</font></div></td>
          <td rowspan="2" width="30%"><div align="left">
            <div align="left">
              <p><font size="2" face="Arial, Helvetica, sans-serif">La  aplicaci&oacute;n del <strong>modelo de asignaci&oacute;n de  la actividad acad&eacute;mica</strong> para los profesores de planta es</font></p>
              <p><font size="2" face="Arial, Helvetica, sans-serif"><br />
              <strong>Equitativa</strong></font></p>
            </div>
      </div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">6</font></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente (optimiza  el rendimiento)</strong></font></p></td>
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

 <P>
  <div align="left">
    <p>&nbsp;</p>
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 4. 
      Procesos Acad&eacute;micos</u></strong></font></p>
  </div>
  <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">7</font></div></td>
          <td rowspan="2" width="30%"><div align="left">
            <p>&nbsp;</p>
</div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>concepciones institucionales</strong> sobre el mundo, el hombre, la sociedad y la historia, orientan la formaci&oacute;n  integral de manera</font>:</p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinente</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinente</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente pertinente</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinente</strong></font></div></td>
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
  <p>&nbsp;</p>
  <table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">8</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <div align="left">
          <p><font size="2" face="Arial, Helvetica, sans-serif"><strong>La </strong>aplicaci&oacute;n<strong> de las&nbsp; </strong>pol&iacute;ticas institucionales<strong> para:</strong></font></p>
        </div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>promoci&oacute;n</strong> de la <strong>interdisciplinariedad,</strong> es:</font></p>
      </div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
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
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">9</font></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La fundamentaci&oacute;n  cient&iacute;fica y &eacute;tica de conocimientos, </strong>es:</font></p></td>
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
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">10</font></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La actualizaci&oacute;n </strong>permanente de los planes de  estudio, es</font>:</p></td>
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
  <p><font face="Arial, Helvetica, sans-serif" size="2"></font></p>
<div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 7.  Autoevaluaci&oacute;n y Autorregulaci&oacute;n</u></strong></font></p>
  </div>
  <table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">11</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <div align="left">
          <p><font size="2" face="Arial, Helvetica, sans-serif">La aplicaci&oacute;n de los <strong>criterios para la evaluaci&oacute;n</strong> de:</font></p>
        </div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. </strong>Los <strong>profesores,</strong> es</font></p>
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
          <td rowspan="2" width="5%">&nbsp;</td>
          <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. El  personal administrativo, </strong>es:</font></p></td>
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
          <td rowspan="2" width="5%">&nbsp;</td>
          <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>c. Los  directivos, </strong>es:</font></p></td>
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
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">12</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <div align="left">
          <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n de los criterios de evaluaci&oacute;n</strong> de profesores, personal administrativo y directivas <strong>tiene un impacto sobre la calidad:</strong></font></p>
        </div>
      </div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy alto</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Alto</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  alto</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Bajo</strong></font></div></td>
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


     <p>&nbsp;</p>
  <p><b><font face="Arial, Helvetica, sans-serif" size="2">GRAN JUSTIFICACION</font></b></p>
     <textarea name="granjustif" cols="125" rows="5"></textarea>
  <br>
  <center>
  <p>&nbsp;</p>
  <br>
  <center>
<input type="submit" name="Submit" value="Enviar Datos"></center>
</form>

</body>
      </html>
