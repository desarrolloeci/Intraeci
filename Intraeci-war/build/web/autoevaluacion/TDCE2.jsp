<%-- 
    Document   : TDCE2
    Created on : 13/10/2011, 09:21:52 AM
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
        String flag = request.getParameter("flag");

        %>
<SCRIPT LANGUAGE="JavaScript">

    function comprueba( ){
        for(i=1; i<19; i++){
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
  <p class="Centro"><strong><center>Taller Directores de Centro de Estudio</center></strong></p>
      <div align="left">
        <p>
        <font face="Arial, Helvetica, sans-serif" size="2">Este  taller busca&nbsp; conocer las opiniones de  los <strong>Directores de Centros de Estudio</strong> sobre diferentes aspectos de la vida universitaria.<strong> </strong>En cada grupo habr&aacute; un moderador que formular&aacute; las preguntas,  coordinar&aacute; la discusi&oacute;n y obtendr&aacute; el consenso&nbsp;  antes de registrar en la planilla una sola respuesta para cada pregunta.  Dicho consenso ir&aacute; acompa&ntilde;ado de una justificaci&oacute;n grupal para cada una de las  respuestas</font></p>
      <div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u> Factor 1.  Misi&oacute;n y Proyecto Institucional</u></strong></font></p>
      </div>
      </div>
        <form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
<input type="hidden" name="total" value="18">
<input type="hidden" name="idenc" value="25">
<input type="hidden" name="flag" value="<%=flag%>">
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
           <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
          </td>
          <td rowspan="2" width="30%"><div align="left"></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La Misi&oacute;n </strong>se refleja en<strong> los logros institucionales </strong>de manera:</font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada</strong></font></div></td>
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
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">2</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <div align="left">
          <p><font size="2" face="Arial, Helvetica, sans-serif">Las <strong>orientaciones del PEI son adecuadas </strong>para la planeaci&oacute;n,  organizaci&oacute;n, evaluaci&oacute;n y autorregulaci&oacute;n de:</font></p>
        </div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. La <strong>formaci&oacute;n</strong></font></p>
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
      <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P2" value="4" />
      </font></div></td>
      <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P2" value="2" />
      </font></div></td>
    </tr>
    <tr>
      <td rowspan="2" width="5%"><div align="center"></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. La <strong>construcci&oacute;n y desarrollo del conocimiento</strong></font></p></td>
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
      <td rowspan="2" width="5%"><div align="center"></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. La <strong>interacci&oacute;n con el entorno</strong></font>.</p></td>
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
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">3</font></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Las </strong>orientaciones del PEI son<strong> adecuadas para</strong> <strong>articular las funciones </strong>de formaci&oacute;n, construcci&oacute;n y desarrollo del  conocimiento e interacci&oacute;n con el entorno</font></p></td>
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
<strong><font size="2" face="Arial, Helvetica, sans-serif">J</font></strong><font face="Arial, Helvetica, sans-serif" size="2"><strong>ustificaci&oacute;n:</strong></font>
<p>
 <input type="text" name="justif1"  size="135" maxlength="250"  onBlur="this.value = convertTildes(this.value); "/>
</p>
  <div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 3. Profesores</u></strong></font><br />
  </p>
  </div>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
       <tr>
           <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">4</font></div>
          </td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>nivel de formaci&oacute;n de los profesores</strong> de  tiempo completo y medio tiempo<strong> es</strong></font><font size="2" face="Arial, Helvetica, sans-serif">:</font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuado</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
        </tr>
                      <tr>
                          <td width="17%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P6" value="8">
                            </font></div>
                          </td>
                          <td width="12%">
                      <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P6" value="6">
                            </font></div>
                          </td>
                          <td width="20%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P6" value="4">
                            </font></div>
                          </td>
                          <td width="16%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P6" value="2">
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
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">6</font></div></td>
      <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente (optimiza  el rendimiento)</strong></font></p></td>
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
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">7</font></div></td>
      <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>nivel</strong> de<strong> productividad intelectual </strong>del profesorado es</font><font size="2" face="Arial, Helvetica, sans-serif">:</font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuado</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
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
<p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Justificaci&oacute;n:</strong></font></p>
      <p>
        <input type="text" name="justif2"  size="135" maxlength="250"  onBlur="this.value = convertTildes(this.value); "/>
      </p>
      <div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 4.  Procesos Acad&eacute;micos</u></strong></font></p>
      </div>
  <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">8</font></div></td>
          <td rowspan="2" width="30%"><div align="left">
            <p>&nbsp;</p>
</div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>concepciones institucionales</strong> sobre el mundo, el hombre, la sociedad y la historia, orientan la formaci&oacute;n  integral de manera</font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinente</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinente</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente pertinente</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinente</strong></font></div></td>
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
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">9</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <div align="left">
          <p><font size="2" face="Arial, Helvetica, sans-serif"><strong>La </strong>aplicaci&oacute;n<strong> de las&nbsp; </strong>pol&iacute;ticas institucionales<strong> para:</strong></font></p>
        </div>
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La actualizaci&oacute;n </strong>permanente de los planes de  estudio, es</font></p>
      </div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
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
<p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Justificaci&oacute;n:</strong></font></p>
  <p>
    <input type="text" name="justif3"  size="135" maxlength="250"  onBlur="this.value = convertTildes(this.value); "/>
  </p>
  <div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 5. Investigaci&oacute;n</u></strong></font></p>
  </div>
  <table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">10</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <p>&nbsp;</p>
      </div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela <strong>aplica pol&iacute;ticas</strong> institucionales para fomentar la actividad investigativa <strong>en distintas &aacute;reas del conocimiento </strong>que se desarrollan en la  instituci&oacute;n</font><font size="2" face="Arial, Helvetica, sans-serif">:</font></p></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
  <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Justificaci&oacute;n:</strong></font></p>
  <p>
     <input type="text" name="justif4"  size="135" maxlength="250"  onBlur="this.value = convertTildes(this.value); "/>
  </p>
  <div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 6. Pertinencia e  Impacto Social</u></strong></font></p>
  </div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">11</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>pol&iacute;tica</strong>s sobre el  sentido, prop&oacute;sitos y organizaci&oacute;n de la <strong>interacci&oacute;n  con el medio social, cultural y productivo</strong> son</font></p></td>
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
<p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Justificaci&oacute;n:</strong></font></p>
       <input type="text" name="justif5"  size="135" maxlength="250"  onBlur="this.value = convertTildes(this.value); "/>

  <div align="left">
    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 7.  Autoevaluaci&oacute;n y Autorregulaci&oacute;n</u></strong></font></p>
</div>

  <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">12</font></div></td>
          <td rowspan="2" width="30%"><div align="left">
            <div align="left">
              <p><font size="2" face="Arial, Helvetica, sans-serif">La aplicaci&oacute;n de los <strong>criterios para la evaluaci&oacute;n</strong> de:</font></p>
            </div>
            <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. </strong>Los <strong>profesores,</strong> es</font></p>
          </div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy transparente</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Transparente</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente transparente</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco transparente</strong></font></div></td>
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
          <td rowspan="2" width="5%">&nbsp;</td>
          <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. El  personal administrativo, </strong>es:</font></p></td>
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
          <td rowspan="2" width="5%">&nbsp;</td>
          <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>c. Los  directivos, </strong>es:</font></p></td>
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
<p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Justificaci&oacute;n:</strong></font></p>
  <p> <input type="text" name="justif6"  size="135" maxlength="250"  onBlur="this.value = convertTildes(this.value); "/>
       </p>
       <table width="98%" border="1" cellspacing="0" cellpadding="0">
         <tr>
           <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">13</font></div></td>
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
       <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Justificaci&oacute;n:</strong></font></p>
 <input type="text" name="justif7"  size="135" maxlength="250"  onBlur="this.value = convertTildes(this.value); "/>
  <div align="left">
         <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 9.  Organizaci&oacute;n, Gesti&oacute;n y Administraci&oacute;n</u></strong></font></p>
  </div>
       <table width="98%" border="1" cellspacing="0" cellpadding="0">
         <tr>
           <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">14</font></div></td>
           <td rowspan="2" width="30%"><div align="left">
             <div align="left">
               <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>Estructura organizacional es coherente</strong> con la naturaleza y complejidad de los programas y proyectos existentes</font></p>
             </div>
</div></td>
           <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
           <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
           <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
           <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
       <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Justificaci&oacute;n:</strong></font></p>
       <p>
        <input type="text" name="justif8"  size="135" maxlength="250"  onBlur="this.value = convertTildes(this.value); "/><br>
    <p>&nbsp;</p>
     <p><b><font face="Arial, Helvetica, sans-serif" size="2">GRAN JUSTIFICACION</font></b></p>
     <textarea name="granjustif" cols="125" rows="5"></textarea>

    <br>
<center>
<input type="submit" name="Submit" value="Enviar Datos"></center>
</form>


  </p>
  </body>
      </html>
