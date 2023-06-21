<%-- 
    Document   : TAP2
    Created on : 20/10/2011, 05:14:24 PM
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
        for(i=1; i<16; i++){
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
  
<p class="Centro" align="center"><strong>Taller Administrativo Profesional-2</strong></p>
      <div align="left">
        <p>
        <font face="Arial, Helvetica, sans-serif" size="2">Este  taller busca&nbsp; conocer las opiniones del <strong>Personal Administrativo Profesional</strong> sobre diferentes aspectos de la vida universitaria.<strong> </strong>En cada grupo habr&aacute; un moderador que formular&aacute; las preguntas,  coordinar&aacute; la discusi&oacute;n y obtendr&aacute; el consenso&nbsp;  antes de registrar en la planilla una sola respuesta para cada pregunta.  Dicho consenso ir&aacute; acompa&ntilde;ado de una justificaci&oacute;n grupal para cada una de las  respuestas</font>        </p>
        <div align="left">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u> Factor 1.  Misi&oacute;n y Proyecto Institucional</u></strong></font></p>
      </div>
  </div>
   <form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
<input type="hidden" name="total" value="15">
<input type="hidden" name="idenc" value="31">
    <input type="hidden" name="flag" value="<%=flag%>">
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
           <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
          </td>
          <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><strong>La  Misi&oacute;n Institucional</strong></font>:</div>
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
                       <tr>
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">2</font></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Se <strong>incorpora</strong> a los objetivos  Institucionales</font></p></td>
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
  <br />
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">3</font></div></td>
      <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La Misi&oacute;n se refleja en los  logros institucionales de manera:</strong></font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
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
  <p>&nbsp;
  <div> </div>
  <div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 2.  Estudiantes</u></strong></font><br />
    </p>
  </div>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
<tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">4</font></div></td>
          <td rowspan="2" width="30%"><div align="left">
            <div align="left">
              <p><font size="2" face="Arial, Helvetica, sans-serif"><strong>La </strong>aplicaci&oacute;n del reglamento<strong> sobre </strong><strong>deberes,  derechos y participaci&oacute;n </strong>de los estudiantes<strong> en los &oacute;rganos directivos</strong><strong> Contribuye</strong> al cumplimiento de  la <strong>Misi&oacute;n Institucional.</strong></font></p>
</div>
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
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">5</font></div></td>
      <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Los <strong>procedimientos </strong>de matr&iacute;cula son:</strong></font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuados</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
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
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">6</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <div align="left">
          <p><font size="2" face="Arial, Helvetica, sans-serif">Los <strong>estudiantes</strong> tienen una <strong>adecuada participaci&oacute;n</strong> en:</font></p>
          <p><font size="2" face="Arial, Helvetica, sans-serif">a. Los  <strong>&oacute;rganos colegiados.</strong></font></p>
        </div>
      </div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
      <td rowspan="2" width="5%"><div align="center"></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b.Las  <strong>organizaciones estudiantiles.</strong></font></p></td>
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
      <td rowspan="2" width="5%"><div align="center"></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c.Los  <strong>proyectos de liderazgo.</strong></font></p></td>
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
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">d.La <strong>organizaci&oacute;n de grupos universitarios.</strong></font></p></td>
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
  </table>
<br />
  <div align="left">
<p><font face="Arial, Helvetica, sans-serif" size="2"><strong></strong></font></p>
  </div>
  <div align="left">
<p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 6. Pertinencia e  Impacto Social</u></strong></font></p>
      </div>
  <table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
      <td rowspan="2" width="5%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">7</font></div>
      </td>
      <td rowspan="2" width="30%"><div align="left">
        <p>&nbsp;</p>
      </div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>pol&iacute;tica</strong>s sobre el  sentido, prop&oacute;sitos y organizaci&oacute;n de la <strong>interacci&oacute;n  con el medio social, cultural y productivo</strong> son:</font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinentes</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinentes</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente pertinentes</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinentes</strong></font></div></td>
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
  <p><br />
  </p>
  <div align="left">
<p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 9.  Organización, Gestión y Administración</u></strong></font></p>
  </div>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%">
        <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">8</font></div>
      </td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>Estructura organizacional es coherente</strong> con la naturaleza y complejidad de los programas y proyectos existentes</font></p></td>
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
</table>
  <p><br />
  </p>
  <div align="left">
<p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 11.Recursos  Financieros</u></strong></font>  </p>
  </div>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">9</font></div>
      </td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>asignaci&oacute;n de </strong><strong>recursos presupuestales</strong> para el desarrollo de los <strong>programas y  actividades de bienestar institucional </strong>es:</font></p></td>
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
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">10</font></div>
      </td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>apoyo</strong> recibido por el <strong>personal administrativo</strong> para <strong>cualificar el desempe&ntilde;o</strong> de sus labores  administrativas es:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinentes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinentes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente pertinentes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinentes</strong></font></div></td>
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
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">11</font></div>
      </td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>procedimientos y tr&aacute;mites</strong> en la gesti&oacute;n financiera (son efectivos<strong>: </strong>generan impactos positivos)</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy efectivos</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Efectivos</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente efectivos</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco efectivos</strong></font></div></td>
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
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%">
        <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">12</font></div>
      </td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>personal especializado</strong> en  el manejo financiero es:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy efectivos</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Efectivos</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente efectivos</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco efectivos</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P15" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P15" value="6" />
    </font></div></td>
    <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P15" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P15" value="2" />
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
