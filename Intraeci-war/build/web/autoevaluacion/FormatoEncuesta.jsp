<%-- 
    Document   : FormatoEncuesta
    Created on : 11/03/2013, 10:57:28 AM
    Author     : Lucero
--%>

<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.text.*, java.net.*;" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties,java.lang.reflect.Array " %>

<%HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            session.setAttribute("loginex", empleado.getUsrExchange());
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
            String cedula = empleado.getIdemp();
            String prog = request.getParameter("prog");
            String iden = request.getParameter("iden");
            String descripcion = request.getParameter("descripcion");
            Vector Datos = admin.DatosEncuestas(cedula);
            String dato = "";%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Encuestas Autoevaluación con fines de Acreditación Institucional</title>
        <SCRIPT LANGUAGE="JavaScript">

            
            function comprueba(total){
                var nombre, valida;
                for(i=1; i<=total; i++){
                    nombre = new String("P" + i);0
                    valida = document.getElementById("valida" + i).value;
                    if (valida == 3){
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.backgroundColor= '#ffcc00';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }
                    }

                    if (valida == 4){
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked ) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.backgroundColor= '#ffcc00';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }
                    } else if (valida ==5){

                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked  && !document.forms.form1[nombre][4].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.backgroundColor= '#ffcc00';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }

                    }else if (valida ==6){
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked  && !document.forms.form1[nombre][4].checked && !document.forms.form1[nombre][5].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.backgroundColor= '#ffcc00';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }
                    }else if (valida ==7){
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked  && !document.forms.form1[nombre][4].checked && !document.forms.form1[nombre][5].checked && !document.forms.form1[nombre][6].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.backgroundColor= '#ffcc00';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }
                    }

                }//for
                return true;
            }

        </SCRIPT>
        <style type="text/css"></style>
    </head>
    <body>

        <% int valida = 0;%>
        <%Vector preguntas = admin.PreguntasEnc(iden);
                    int total = preguntas.size();%>
        <center>
  <p><b><%=descripcion%>-<%=prog%></b> </p>
  <table width="950" border="0">
    <tr>
      <td>
        <p align="left"><b><font size="3">Para la Escuela Colombiana de Ingenier&iacute;a 
          Julio Garavito es muy importante su participaci&oacute;n en los procesos 
          de autoevaluaci&oacute;n,
          puesto que su opini&oacute;n contribuye a identificar las fortalezas 
          y oportunidades de mejoramiento de la instituci&oacute;n y de los programas 
          acad&eacute;micos.
          A partir de &eacute;stos se formulan planes, cuyos resultados favorecen 
          el avance y madurez de los programas, en b&uacute;squeda de la excelencia.</font></b></p>
        <p align="left"><font size="3"><b>Una vez inicie el diligenciamiento de 
          esta encuesta, por favor responda el total de los enunciados antes de 
          salir de la aplicaci&oacute;n. Para cada caso, seleccione aquella opci&oacute;n 
          que refleje su opini&oacute;n respecto al tema. </b></font></p>
        <p align="left"><font size="3"><b>Le agradecemos de antemano su valiosa 
          participaci&oacute;n en este proceso.</b></font></p>
  </td>
    </tr>
  </table>

</center>
        <p></p>
        <form name="form1"  method="post"  action="autoevaluacion">
            <input type="hidden" name="prog" value="<%=prog%>">
            <input type="hidden" name="total" value="<%=total%>">
            <input type="hidden" name="idenc" value="<%=iden%>">
            <table width="90%" border="1" cellspacing="0" cellpadding="0">

                <% for (int i = 0; i < preguntas.size(); i++) {

                                Vector pregunta = (Vector) preguntas.elementAt(i);
                                String hasta = pregunta.elementAt(4).toString();
                                valida = Integer.parseInt(hasta);%>
                               
                <input type="hidden" id="valida<%=i + 1%>" value="<%=valida%>">
                <input type="hidden" name="total" value="<%=total%>">
                <input type="hidden" name="idenc" value="<%=iden%>">
                <input type="hidden" name="prog" value="<%=prog%>">
                <tr>
                    <td rowspan="2" width="3%"><%=pregunta.elementAt(0)%></td>

                    <td rowspan="2" width="39%"><%=pregunta.elementAt(3)%></td>

                    <td  align="center" width="8%"><%=pregunta.elementAt(6)%></td>

                    <td align="center" width="8%"><%=pregunta.elementAt(7)%></td>

                    <td align="center" width="8%"><%=pregunta.elementAt(8)%></td>

                    <% if (pregunta.elementAt(4).equals("4")) {%>
                    <td align="center" width="8%"><%=pregunta.elementAt(9)%></td>

                    <% }
                         if (pregunta.elementAt(4).equals("5")) {%>

                    <td align="center" width="8%"><%=pregunta.elementAt(9)%></td>
                    <td align="center" width="8%"><%=pregunta.elementAt(10)%></td>
                    <%}
                         if (pregunta.elementAt(4).equals("6")) {%>
                    <td align="center" width="8%"><%=pregunta.elementAt(9)%></td>
                    <td align="center" width="8%"><%=pregunta.elementAt(10)%></td>
                    <td align="center" width="8%"><%=pregunta.elementAt(11)%></td>
                    <%}  if (pregunta.elementAt(4).equals("7")) {%>
                    <td align="center" width="8%"><%=pregunta.elementAt(9)%></td>
                    <td align="center" width="8%"><%=pregunta.elementAt(10)%></td>
                    <td align="center" width="8%"><%=pregunta.elementAt(11)%></td>
                    <td align="center" width="8%"><%=pregunta.elementAt(12)%></td>
                    <%}%>

                </tr>

                <%  dato = pregunta.elementAt(4).toString();
                     int cuantos = Integer.parseInt(dato);
                     int x = cuantos;
                     //int a = (cuantos - 1);
                     int a = 0;
                     for (int p = 1; p <= cuantos; p++) {%>
                <% String valores = pregunta.elementAt(5).toString().substring(a, p);
                                         a++;
                                         // String valores = pregunta.elementAt(5).toString().substring(a, x);
                                         //a--;
                                         //x--;%>

                <td width="5%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P<%=i + 1%>" value="<%=valores%>">
                        </font></div>
                </td>

                <%}%>

                <%}
                %>
            </table>

            <p>&nbsp;</p>
            <center>
                <input type="submit" name="Submit" value="Enviar Datos" onclick="return comprueba(<%=total%>);"></center>
        </form>



        <h1>&nbsp;</h1>
        <h1 align="center">&nbsp;</h1>
        <div align="center"></div>
    </body>
</html>
