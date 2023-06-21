<%-- 
    Document   : ECD
    Created on : 10/10/2011, 03:51:07 PM
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
        for(i=1; i<30; i++){
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
<body>
    <html>

<style type="text/css"></style>
<div align="left"></div>
    <p class="Centro"><center>
    <strong><center>Encuesta Consejo Directivo</center></strong>
  </center></p>
    <div align="left">
      <p>
      <font face="Arial, Helvetica, sans-serif" size="2">La Escuela está realizando un proceso de <strong>Autoevaluación con fines de Acreditación Institucional</strong>. Su opinión es muy  importante para precisar  fortalezas y oportunidades de mejoramiento sobre diferentes aspectos de la  actividad universitaria. Le solicitamos responder todas las preguntas de la  encuesta. Agradecemos su participación.    </font>
      <div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 1.  Misi&oacute;n y Proyecto Institucional</u></strong></font></p>
      </div>
      <p><font face="Arial, Helvetica, sans-serif" size="2"><br />
      </font>
     </div>
     <form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
<input type="hidden" name="total" value="29">
<input type="hidden" name="idenc" value="29">
        <input type="hidden" name="flag" value="<%=flag%>">

<table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La Escuela demuestra un decidido compromiso  Institucional con:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a.<strong>La calidad</strong></font></p>          <p>&nbsp;</p></td>
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
                        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b.<strong>Los  principios constitucionales</strong></font></p></td>

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
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">3</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Las<strong> </strong>orientaciones del PEI <strong>se constituyen en r</strong><strong>eferencia fundamental</strong> para los procesos de <strong>toma de decisiones</strong> en la Escuela</font></p></td>
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
<div align="left">
 <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 3. Profesores</u></strong></font><br />
     </p></div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">4</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> de las <strong>pol&iacute;ticas de reconocimiento</strong> a la docencia calificada es:</font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada</strong></font></div></td>
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
       <tr>
         <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">5</font></div></td>
         <td rowspan="2" width="30%"><div align="left"></div>
           <p><font face="Arial, Helvetica, sans-serif" size="2">Las  acciones <strong>de reconocimiento</strong> a la docencia calificada son:</font></p></td>
         <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinentes</strong></font></div></td>
         <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Prtinentes</strong></font></div></td>
         <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente pertinentes</strong></font></div></td>
         <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinentes</strong></font></div></td>
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
     </table>
     <br />
<table width="98%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">6</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">La<strong> aplicaci&oacute;n de las pol&iacute;ticas y  criterios </strong>institucionales para la<strong> creaci&oacute;n de comunidades acad&eacute;micas </strong>al interior de la instituci&oacute;n es:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">7</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> de las  pol&iacute;ticas y criterios institucionales para promover una <strong>interacci&oacute;n significativa</strong> con <strong>comunidades  acad&eacute;micas nacionales e internacionales es:</strong></font></p></td>
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
    <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P7" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P7" value="2" />
    </font></div></td>
  </tr>
</table>
     <div align="left">
       <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 5. Investigaci&oacute;n</u></strong></font><br />
       </p>
     </div>

<table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">8</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela <strong>aplica pol&iacute;ticas</strong> institucionales para fomentar la actividad investigativa <strong>en distintas &aacute;reas del conocimiento </strong>que se desarrollan en la  instituci&oacute;n<strong>.</strong></font></p></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
      </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" name="P8" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" name="P8" value="6">
                          </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" name="P8" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" name="P8" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 6. Pertinencia e  Impacto Social</u></strong></font></p>
      </div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">9</font></div></td>
          <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La Escuela ejerce una <strong>influencia en el entorno</strong>:</font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy positiva</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Positiva</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente positiva</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco positiva</strong></font></div></td>
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">10</font></div></td>
    <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los siguientes <strong>servicios que ofrece la  Escuela </strong>a sus graduados son:</font></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">a. Informaci&oacute;n  institucional y de inter&eacute;s acad&eacute;mico a trav&eacute;s de boletines electr&oacute;nicos.</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuados</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P10" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P10" value="6" />
    </font></div></td>
    <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P10" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P10" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b.Informaci&oacute;n  institucional a trav&eacute;s de la web de la Escuela.</font></p></td>
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
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c.Atenci&oacute;n  personalizada, v&iacute;a correo electr&oacute;nico y telef&oacute;nica.</font></p></td>
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
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">d.Actualizaci&oacute;n  de datos en l&iacute;nea.</font></p></td>
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
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">e. Facilidad  de interacci&oacute;n a trav&eacute;s de la Red Social de Graduados de la Escuela en  Facebook.</font></p></td>
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
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">f.Capacitaci&oacute;n  para la inserci&oacute;n al mercado laboral.</font></p></td>
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
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">g. Capacitaci&oacute;n  a trav&eacute;s de talleres en Ub&iacute;kate: orientaci&oacute;n para la b&uacute;squeda de empleo.</font></p></td>
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
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">h. Oportunidades  de empleo a trav&eacute;s de la Feria  laboral.</font></p></td>
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
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">i. Interacci&oacute;n  a trav&eacute;s del Encuentro  de Graduados</font></p></td>
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
<div align="left">
  <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 7.  Autoevaluaci&oacute;n y Autorregulaci&oacute;n</u></strong></font></p>
</div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">11</font></div></td>
    <td rowspan="2" width="30%">
        <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">En 
          la Escuela los procesos de <strong>Planeaci&oacute;n son </strong></font> 
          <div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><strong>participativos 
            y permanentes</strong></font></div>
          </div>
      </td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">12</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>registros estad&iacute;sticos y los  indicadores de gesti&oacute;n</strong> para la <strong>planeaci&oacute;n,  la toma de decisiones y la apreciaci&oacute;n de la calidad</strong> se <strong>utilizan</strong> de una manera:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>adecuada</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
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
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">13</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n de los criterios de evaluaci&oacute;n</strong> de profesores, personal administrativo y directivas <strong>tiene un impacto sobre la calidad</strong>:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy alto</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Alto</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente alto</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Bajo</strong></font></div></td>
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
<div align="left">
  <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 8.  Bienestar  Institucional</u></strong></font></p>
</div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">14</font></div></td>
    <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los siguientes <strong>servicios que ofrece la  Escuela </strong>a sus graduados son:</font></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">a. La <strong>Escuela</strong> mantiene un <strong>clima institucional</strong>:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuado</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
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
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b.La<strong> unidad</strong> (Consejo Directivo)  a la cual pertenece mantiene <strong>un clima  institucional</strong>:</font></p></td>
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
<div align="left">
  <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 9.  Organizaci&oacute;n, Gesti&oacute;n y Administraci&oacute;n</u></strong></font></p>
</div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">15</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los &nbsp;<strong>criterios</strong> utilizados para la definici&oacute;n  y asignaci&oacute;n de funciones <strong>corresponden</strong> a la naturaleza y complejidad de la instituci&oacute;n.</font></p></td>
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
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">16</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>sistemas de comunicaci&oacute;n e informaci&oacute;n</strong> (Web, bolet&iacute;n, notiweb, correo, etc.) de la Escuela son:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente/s</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente/s</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficiente/s</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente/s</strong></font></div></td>
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
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">17</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>El personal  administrativo </strong>de  la instituci&oacute;n es:</font></p></td>
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
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">18</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>programas de capacitaci&oacute;n y  cualificaci&oacute;n</strong> para el personal son:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinentes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinentes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente pertinentes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinentes</strong></font></div></td>
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
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">19</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>apoyo</strong> recibido por el <strong>personal administrativo</strong> para <strong>cualificar el desempe&ntilde;o</strong> de sus labores  administrativas es:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuado</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
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
<div align="left">
  <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 11.Recursos  Financieros</u></strong></font></p>
</div>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">20</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Las pol&iacute;ticas </strong>para la<strong> elaboraci&oacute;n del  presupuesto de inversi&oacute;n y funcionamiento</strong><strong> </strong>son:</font></p></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada/s</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>adecuada/s</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada/s</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada/s</strong></font></div></td>
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
<p>
<center><input type="submit" name="Submit" value="Enviar Datos" /></center>
</form>

</body>
    </html>
