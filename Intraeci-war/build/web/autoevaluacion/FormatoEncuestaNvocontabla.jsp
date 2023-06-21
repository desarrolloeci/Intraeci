
<%-- 
    Document   : FormatoEncuestaNvocontabla
    Created on : 9/03/2015, 10:45:46 AM
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
    //NUEVO//
    // Vector Factor = admin.FactoresEnc(iden);
    //  int nrofactor = Factor.size();
    int cuentafac = 0;
    String dato = "";%>
<html>
    <head>
        <link href="css/encuestaODI.css" rel="stylesheet" type="text/css" media="all"/>
<style>
@font-face {
    font-family: "Open Sans Condensed";
    src: url(../web-fonts/opensans_light_macroman/OpenSans-Light-webfont.eot);
	src: url(../web-fonts/opensans_light_macroman/OpenSans-Light-webfont.svg);
	src: url(../web-fonts/opensans_light_macroman/OpenSans-Light-webfont.woff);
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Encuestas Autoevaluación con fines de Acreditación Institucional</title>
        <SCRIPT LANGUAGE="JavaScript">

            function comprueba(total) {
                var nombre, valida;
                for (i = 1; i <= total; i++) {
                    nombre = new String("P" + i);
                    0
                    valida = document.getElementById("valida" + i).value;
                    if (valida == 3) {
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.backgroundColor = '#ffcc00';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }
                    }

                    if (valida == 4) {
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.backgroundColor = '#ffcc00';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }
                    } else if (valida == 5) {

                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.backgroundColor = '#ffcc00';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }

                    } else if (valida == 6) {
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked && !document.forms.form1[nombre][5].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.backgroundColor = '#ffcc00';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }
                    } else if (valida == 7) {
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked && !document.forms.form1[nombre][5].checked && !document.forms.form1[nombre][6].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.backgroundColor = '#ffcc00';
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
<div id="container">
<!--inicio header-->
	<header>
    </header>
<!--inicio section-->
   <!-- <section>
    	<div class="colmIzquierda">
        	<h1>Factor<span>1</span></h1>
        </div>
    </section>-->
<!--inicio aside-->
    <aside>
    	<div class="colmDerecha">
        	<h2><%=descripcion%>-<%=prog%></h2>
            <p>Descripción del factor</p>
        </div>
        <% int valida = 0;%>
        <!--NUEVO-->

        <% Vector preguntas = admin.PreguntasEnc(iden);
            int total = preguntas.size();%>
    <center><b></b>
    </center>
    <p></p>
    <form name="form1"  method="post"  action="autoevaluacionNuevo">
        <input type="hidden" name="prog" value="<%=prog%>">
        <input type="hidden" name="total" value="<%=total%>">
        <input type="hidden" name="idenc" value="<%=iden%>">


        <%
            int i = 0;

            //PREGUNTAS POR CADA FACTOR
            Vector FactorEnc = admin.FactoresEnc(iden);
            for (int s = 0; s < FactorEnc.size(); s++) {
                Vector FactorE = (Vector) FactorEnc.elementAt(s);
                String nombre = "factor";
                int CodFactor = (Integer.valueOf((String) FactorE.elementAt(0))).intValue();
                String nomfac = nombre + CodFactor;
                Vector Contesto = admin.ContestoEncuestaFac(cedula, nomfac);
                if (Contesto.elementAt(0).equals("0")) {
                    Vector preguntasFactor = admin.PreguntasEncFactor(iden, CodFactor);

                    int pregfac = preguntasFactor.size();
                    //CUANTOS FACTORES TIENE LA ENCUESTA

                    if ((preguntasFactor.size() > 0)) {
                        int contador = preguntasFactor.size();

                        for (int k = 0; k < preguntasFactor.size(); k++) {

                            Vector PregFactor = (Vector) preguntasFactor.elementAt(k);
                            String identifica = PregFactor.elementAt(15).toString();
                            String hasta = PregFactor.elementAt(4).toString();
                            valida = Integer.parseInt(hasta);%>

        <input type="hidden" id="valida<%=i + 1%>" value="<%=valida%>">
        <input type="hidden" name="total" value="<%=total%>">
        <input type="hidden" name="idenc" value="<%=iden%>">
        <input type="hidden" name="prog" value="<%=prog%>">
        <input type="hidden" name="confactor" value="<%=contador%>">
        <input type="hidden" name="CodFactor" value="<%=CodFactor%>">
        <input type="hidden" name="identifica<%=k + 1%>" value="<%=identifica%>">

        <table width="90%" border="1" cellspacing="0" cellpadding="0" class="encuesta"> 
          
            <tr>
                <td rowspan="2" width="2%"><%=PregFactor.elementAt(0)%></td>

                <td rowspan="2" width="50%"><%=PregFactor.elementAt(3)%></td>

                <td  align="center" width="6%"><%=PregFactor.elementAt(6)%></td>

                <td align="center" width="6%"><%=PregFactor.elementAt(7)%></td>

                <td align="center" width="6%"><%=PregFactor.elementAt(8)%></td>

                <% if (PregFactor.elementAt(4).equals("4")) {%>
                <td align="center" width="8%"><%=PregFactor.elementAt(9)%></td>

                <% }
                    if (PregFactor.elementAt(4).equals("5")) {%>
                <td align="center" width="6%"><%=PregFactor.elementAt(9)%></td>
                <td align="center" width="6%"><%=PregFactor.elementAt(10)%></td>
                <%}
                    if (PregFactor.elementAt(4).equals("6")) {%>
                <td align="center" width="6%"><%=PregFactor.elementAt(9)%></td>
                <td align="center" width="6%"><%=PregFactor.elementAt(10)%></td>
                <td align="center" width="6%"><%=PregFactor.elementAt(11)%></td>
                <%}
                    if (PregFactor.elementAt(4).equals("7")) {%>
                <td align="center" width="6%"><%=PregFactor.elementAt(9)%></td>
                <td align="center" width="6%"><%=PregFactor.elementAt(10)%></td>
                <td align="center" width="6%"><%=PregFactor.elementAt(11)%></td>
                <td align="center" width="6%"><%=PregFactor.elementAt(12)%></td>
                      <%}%>

            </tr>

            <%  dato = PregFactor.elementAt(4).toString();
                int cuantos = Integer.parseInt(dato);
                int x = cuantos;
                //int a = (cuantos - 1);
                int a = 0;
                for (int p = 1; p <= cuantos; p++) {%>
            <% String valores = PregFactor.elementAt(5).toString().substring(a, p);
                a++;
                // String valores = pregunta.elementAt(5).toString().substring(a, x);
                //a--;
                //x--;%>

            <td width="5%">
                <div  class="radiogroup" align="center">   <font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P<%=k + 1%>" value="<%=valores%>">
                    </font></div>
            </td>

            <%}

                // datofac ++; %>


            <%}%>
        </table>

        <p>&nbsp;</p>
        <center>
            <input type="submit" name="Submit" value="Enviar Datos" onclick="return comprueba(<%=total%>);"></center>
    </form>
    <% }

                s = FactorEnc.size();
            }
        }%>

    <h1>&nbsp;</h1>
    <h1 align="center">&nbsp;</h1>
    <div align="center"></div>
</body>
</html>
