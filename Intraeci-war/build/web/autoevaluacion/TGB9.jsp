<%-- 
    Document   : TGB9
    Created on : 24/10/2011, 02:55:40 PM
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
        for(i=1; i<20; i++){
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
  <p class="Centro"><strong><CENTER>TALLER GRUPO BASE-9</CENTER></strong></p>
      <div align="left">
        <p>
        <font face="Arial, Helvetica, sans-serif" size="2">Este  taller busca&nbsp; conocer las opiniones de la  comunidad Universitaria sobre el <strong>Factor Organizaci&oacute;n,  Gesti&oacute;n y Administraci&oacute;n. </strong>En cada grupo habr&aacute; un moderador que formular&aacute;  las preguntas, coordinar&aacute; la discusi&oacute;n y obtendr&aacute; el consenso antes de  registrar en la planilla una sola respuesta para cada pregunta. Dicho consenso  ir&aacute; acompa&ntilde;ado de una justificaci&oacute;n grupal para cada una de las respuestas.</font></p>
      </div>
       <form name="form1"  method="post"  onSubmit="return comprueba( );" action="autoevaluacion">
    <input type="hidden" name="total" value="19">
    <input type="hidden" name="idenc" value="41">
           <input type="hidden" name="flag" value="<%=flag%>">
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
       <tr>
           <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
          </td>
          <td rowspan="2" width="30%"><div align="left">
            <div align="left">
              <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>estructura organizacional</strong> corresponde a la  complejidad de la Escuela.</font></p>
</div>
</div></td>
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
  <table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">2</font></div></td>
      <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los &nbsp;<strong>criterios</strong> utilizados para la definici&oacute;n  y asignaci&oacute;n de funciones <strong>corresponden</strong> a la naturaleza y complejidad de la instituci&oacute;n.</font></p></td>
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
<br />
  <table width="98%" border="1" cellpadding="0" cellspacing="0">
    <tr>
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">3</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>procedimientos</strong> <strong>y mecanismos de</strong> <strong>seguimiento y evaluaci&oacute;n</strong> de la gesti&oacute;n institucional son:</font></p>
</div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
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
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">4</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>Estructura organizacional es coherente</strong> con la naturaleza y complejidad de los programas y proyectos existentes.</font></p>
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
          <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">5</font></div></td>
          <td rowspan="2" width="30%"><div align="left">
            <p><font face="Arial, Helvetica, sans-serif" size="2">Los  procesos de <strong>toma de decisiones</strong> en la  Escuela son:</font></p>
            <p><font face="Arial, Helvetica, sans-serif" size="2">a.<strong>Transparentes</strong></font></p>
          </div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy transparente</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Transparente</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente transparente</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco transparente</strong></font></div></td>
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
        <tr>
          <td rowspan="2" width="5%"><div align="center"></div></td>
          <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b.<strong>Equitativos</strong></font></p></td>
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
  <table width="98%" border="1" cellpadding="0" cellspacing="0">
        <tr>
          <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">6</font></div></td>
          <td rowspan="2" width="30%"><div align="left">
            <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>sistemas de comunicaci&oacute;n e informaci&oacute;n</strong> (Web, bolet&iacute;n, notiweb, correo, etc.) de la Escuela son:</font></p>
            <p><font face="Arial, Helvetica, sans-serif" size="2">(Eficiente: optimiza el rendimiento)</font></p>
          </div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente/s</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente/s</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente eficiente/s</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente/s</strong></font></div></td>
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
            <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">7</font></div>
          </div></td>
          <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>El personal  administrativo </strong>de  la instituci&oacute;n es:</font></p></td>
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
          <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">8</font></div></td>
          <td rowspan="2" width="30%"><div align="left">
            <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas de capacitaci&oacute;n y  cualificaci&oacute;n</strong> para el personal administrativo son:</font></p>
</div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinentes</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinentes</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  pertinentes</strong></font></div></td>
          <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco</strong></font> <font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinentes</strong></font></div></td>
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
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">9</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>apoyo</strong> recibido por el <strong>personal administrativo</strong> para <strong>cualificar el desempe&ntilde;o</strong> de sus labores  administrativas es:</font></p>
      </div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  adecuado</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco</strong></font><font face="Arial, Helvetica, sans-serif" size="2"><strong>adecuado</strong></font></div></td>
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
      <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">10</font></div></td>
      <td rowspan="2" width="30%"><div align="left">
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> de  pol&iacute;ticas de <strong>est&iacute;mulos, promoci&oacute;n y  evaluaci&oacute;n</strong> del personal administrativo es:</font></p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">(Eficiente: optimiza el rendimiento):</font>      </p>
      </div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  eficiente</strong></font></div></td>
      <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco</strong></font><font face="Arial, Helvetica, sans-serif" size="2"><strong>eficiente</strong></font></div></td>
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
<br>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">11</font></div></td>
    <td rowspan="2" width="30%"><div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>directivos</strong> de la  instituci&oacute;n muestran:</font></p>
      <p><font face="Arial, Helvetica, sans-serif" size="2">a. Una buena capacidad de <strong>liderazgo</strong></font></p>
    </div></td>
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
  <tr>
    <td rowspan="2" width="5%"><div align="center">
      <div align="center"></div>
    </div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"> b. <strong>Integridad </strong>en el desarrollo de sus funciones</font></p></td>
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
    <td rowspan="2" width="5%"><div align="center">
      <div align="center"></div>
    </div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. <strong>Idoneidad</strong> en  el desarrollo de sus funciones</font></p></td>
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
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">12</font></div></td>
    <td rowspan="2" width="30%"><div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2">Las actuaciones de los <strong>directivos  en relaci&oacute;n con </strong>la <strong>Misi&oacute;n y el  Proyecto Institucional </strong>son:</font></p>
    </div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy coherentes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Coherentes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  coherentes</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco</strong></font><font face="Arial, Helvetica, sans-serif" size="2"><strong>coherentes</strong></font></div></td>
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
<br>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">13</font></div></td>
    <td rowspan="2" width="30%"><div align="left">
      <p>&nbsp;</p>
      <p><font face="Arial, Helvetica, sans-serif" size="2">a. Existe <strong>estabilidad</strong> institucional</font></p>
    </div></td>
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
    <td rowspan="2" width="5%"><div align="center">
      <div align="center"></div>
    </div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"> b. Existe  <strong>continuidad</strong> en las <strong>pol&iacute;ticas</strong> generadas por la <strong>estructura organizacional y administrativa.</strong></font></p></td>
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
<br>
<table width="98%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">14</font></div></td>
    <td rowspan="2" width="30%"><div align="left">
      <p>&nbsp;</p>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los procedimientos para la <strong>creaci&oacute;n  y modificaci&oacute;n de programas formales</strong> ofrecen una garant&iacute;a de <strong>calidad acad&eacute;mica</strong>.</font></p>
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
<table width="98%" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">15</font></div></td>
    <td rowspan="2" width="30%"><div align="left">
      <p>&nbsp;</p>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los procedimientos para la <strong>creaci&oacute;n  y modificaci&oacute;n de programas formales</strong> ofrecen una garant&iacute;a de <strong>calidad acad&eacute;mica</strong>.</font></p>
    </div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy claros</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Claros</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente  claros</strong></font></div></td>
    <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco</strong></font><font face="Arial, Helvetica, sans-serif" size="2"><strong> claros</strong></font></div></td>
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
