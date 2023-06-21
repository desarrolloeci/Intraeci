<%-- 
    Document   : TCD
    Created on : 7/10/2011, 02:47:13 PM
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
        for(i=1; i<18; i++){
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
  
<p class="Centro" align="center"><strong>Taller Consejo Directivo</strong></p>
      <div align="left">
        <p>
        <font face="Arial, Helvetica, sans-serif" size="2">Este taller busca  conocer las opiniones del <strong> Consejo Directivo</strong> sobre diferentes aspectos de la vida universitaria. En cada grupo habrá un moderador que formulará las preguntas, coordinará la discusión y obtendrá el consenso  antes de registrar en la planilla una sola respuesta para cada pregunta. Dicho consenso irá acompañado de una justificación grupal para cada una de las respuestas.
  Agradecemos su participación
      <br />
      __________________________________________________________________________________________________________________________________________________________________________<center>
  <p align="center">En cada pregunta coloque una <strong>X</strong> en la casilla que a su juicio representa mejor su opinión. Sus respuestas serán  tratadas de forma CONFIDENCIAL Y ANÓNIMA.    </p>
      </center>
      __________________________________________________________________________________________________________________________________________________________________________<br /></font>
<div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 1.  Misi&oacute;n y Proyecto Institucional</u></strong></font></p>
      </div>
      </div>
       <form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
<input type="hidden" name="total" value="17">
<input type="hidden" name="idenc" value="18">
    <input type="hidden" name="flag" value="<%=flag%>">
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
           <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
          </td>
          <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La<strong> Misi&oacute;n  Institucional:</strong></font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Se  incorpora</strong> a los procesos acad&eacute;micos</font></p></td>
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
                            <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Se  incorpora </strong>a los procesos administrativos</font></p></td>

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
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
           <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">3</font></div>
          </td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La Misi&oacute;n se refleja en los  logros institucionales de manera:</strong></font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
    </tr>
                      <tr>
                          <td width="17%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P3" value="8">
                            </font></div>
                          </td>
                          <td width="12%">
                      <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P3" value="6">
                            </font></div>
                          </td>
                          <td width="20%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P3" value="4">
                            </font></div>
                          </td>
                          <td width="16%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P3" value="2">
                            </font></div>
                          </td>
                      </tr>

  </table>
  <p>&nbsp;</p>
  <div align="left">
<p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 3.  Profesores</u></strong></font></p>
  </div>
  <br />
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
           <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">4</font></div>
          </td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> del Estatuto de profesores <strong>contribuye</strong> al cumplimiento de la Misi&oacute;n  Institucional<strong>.</strong></font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
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
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>nivel de formaci&oacute;n de los profesores</strong> de  tiempo completo y medio tiempo<strong> es</strong>:</font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuado</strong></font></div></td>
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

  </table>
<br>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">6</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>nivel</strong> de<strong> productividad intelectual </strong>del profesorado es:</font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuado</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
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
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">7</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La aplicaci&oacute;n </strong>del modelo de  evaluaci&oacute;n de profesores<strong> es efectiva  (genera impactos o efectos positivos)</strong></font></p></td>
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
  </table>
      
<br>
      <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">8</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>criterios de permanencia y promoci&oacute;n</strong> en la carrera docente (escalaf&oacute;n) son:</font></p></td>
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
      <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">9</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>criterios acad&eacute;micos</strong> utilizados para  la <strong>asignaci&oacute;n salarial</strong> son:</font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
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
  </table>
  <p><label for="justif8"></label> </p>
      <div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 4.  Procesos Acad&eacute;micos</u></strong></font></p>
  </div>

      <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">10</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas de formaci&oacute;n</strong> (pregrado y  posgrado) de la Escuela son</font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficientes</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficientes</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente eficientes</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficientes</strong></font></div></td>
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
      </table>
  <p> <label for="justif9"></label> </p>
  <div align="left">
<p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 5. Investigaci&oacute;n</u></strong></font></p>
      </div>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">11</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>desarrollo investigativo</strong> de la instituci&oacute;n en relaci&oacute;n con el <strong>entorno  social</strong>, tiene un <strong>impacto:</strong></font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy favorable</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Favorable</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente favorable</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco favorable</strong></font></div></td>
        </tr>
        <tr>
          <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
            <input type="radio" name="P11" value="8" />
          </font></div></td>
          <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
            <input type="radio" name="P11" value="6" />
          </font></div></td>
          <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
            <input type="radio" name="P11" value="4" />
          </font></div></td>
          <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
            <input type="radio" name="P11" value="2" />
          </font></div></td>
        </tr>
  </table>
  <p><font face="Arial, Helvetica, sans-serif" size="2"></font></p>
      <div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 9. Organizaci&oacute;n, Gesti&oacute;n y Administraci&oacute;n</u></strong></font><br />
        </p>
  </div>
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">12</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>estructura organizacional</strong> corresponde a la  complejidad de la Escuela</font></p></td>
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
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">13</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>Estructura organizacional es coherente</strong> con la naturaleza y complejidad de los programas y proyectos existentes</font></p></td>
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
      
  <p><font face="Arial, Helvetica, sans-serif" size="2"></font></p>
  <div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 11.Recursos Financieros</u></strong></font><br />
        </p>
      </div>
      <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">14</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">La  instituci&oacute;n cuenta con una buena <strong>solidez  financiera</strong>.</font></p></td>
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
          <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
            <input type="radio" name="P14" value="4" />
          </font></div></td>
          <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
            <input type="radio" name="P14" value="2" />
          </font></div></td>
        </tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">15</font></div></td>
                          <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"> La  instituci&oacute;n ha <strong>consolidado su patrimonio</strong> en los &uacute;ltimos diez a&ntilde;os.</font></p></td>

                      </tr>
                      <tr>
                          <td width="17%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P15" value="8">
                              </font></div>
                          </td>
                          <td width="12%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P15" value="6">
                              </font></div>
                          </td>
                          <td width="20%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P15" value="4">
                              </font></div>
                          </td>
                          <td width="16%">
                              <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                      <input type="radio" name="P15" value="2">
                              </font></div>
                          </td>
      </table>
 <br>
      <table width="98%" border="1" cellspacing="0" cellpadding="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">16</font></div></td>
          <td rowspan="2" width="30%"><div align="left"></div>
            <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>criterios para distribuci&oacute;n  presupuestal</strong> entre las distintas unidades acad&eacute;micas y administrativas son:</font></p></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy
  pertinentes</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinentes</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  pertinentes</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinentes</strong></font></div></td>
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
          <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">17</font></div></td>
          <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"> Los <strong>criterios para distribuci&oacute;n  presupuestal</strong> entre las <strong>funciones  propias de la educaci&oacute;n superior</strong> (Formaci&oacute;n, Investigaci&oacute;n, Relaciones con  el entorno, Gesti&oacute;n y Bienestar) son:</font></p></td>
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
    <p>&nbsp;</p>
  <p><b><font face="Arial, Helvetica, sans-serif" size="2">GRAN JUSTIFICACION</font></b></p>

    <textarea name="granjustif" cols="125" rows="5"></textarea>
    <br>
  <center>
<input type="submit" name="Submit" value="Enviar Datos"></center>
</form>
  </body>
      </html>
