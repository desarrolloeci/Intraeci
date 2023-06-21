<%-- 
    Document   : Copasst
    Created on : 19/08/2015, 03:58:01 PM
    Author     : Lucero
--%>

<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
    HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    String cedula = empleado.getIdemp();
    String nomCrp = new String();
    String tipo = new String();
    String consulta = new String();
    Vector lista, infocan;
    int cont = 0, i, j;
    /* Aquí se cambia 11 por 9*/
    int total = 8;

    //String clave = request.getParameter("clave");
    if (cedula != null && !cedula.equals("")) {
        nomCrp = "copasst";
        tipo = "120";

        //BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        lista = admin.CandidatosCopasst(tipo);
        Vector res2 = admin.ConsultaVotoCopasst(cedula);
        String copasst = ((String) res2.elementAt(0));
%>

<html>
    <head>
        <title>Votación</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <style type="text/css">
            <!--
            .textocom {
                font-family: Verdana, Arial, Helvetica, sans-serif;
                font-size: 12px;
                color: #666666;
                font-weight: bold;
            }
            -->
        </style>
        <script language="javascript">


            function comprueba(elemento, total) 
            {
                var P1, nombre, valida;
                var num_opciones = 2;
                var numcheckbox = 0;
                var uno = 1;
                
                for (i = 1; i <= total; i++) 
                {    
                    nombre = new String("P" + i);
                    if ( document.forms.formulario1[nombre].checked )
                    numcheckbox++;
                }
                //alert(numcheckbox);
                /* Pregunta si se ha marcado más de 2 opciones (candidatos) */
                if (numcheckbox > num_opciones)                
                {       
                    alert("Debe seleccionar como máximo dos opciones");
                    elemento.checked = false;
                    return false;
                }

                if (numcheckbox > 0)
                {
                    return true;
                }
                else{
                    alert("Debe marcar al menos una opción");
                    return false;
                }
                
            }




            //-->
        </script>
    </head>
    <body bgcolor="#FFFFFF">
          <div class="container">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="headerImg" value="banner.jpg" />
        </jsp:include>
        <%if (!copasst.equals("0")) {
                out.println("<center><h2>");
                out.println("Su voto ya se encuentra registrado, muchas gracias por su participación");
                out.println("<p>");
                out.println("</h2>");
                out.println("<p>");
                out.println("<br>");
               
             } else {%>
        <form method="post" action="guardavotoscopasst" name="formulario1">
            <!-- Tabla externa -->
            <table border="0" cellspacing="0" cellpadding="0" width="725" align="center">
                <tr>
                    <td height="30" valign="top" width="725&quot;"><div align="center">
                            <table width="600" border="0" align="center">
                                <tr>
                                    <td align="center" valign="middle"><div align="left"><br>
                                            <font face="Verdana" size=4 color="#000000"><b>Seleccione </b><font face="impact" size=5 color="#228B22">DOS OPCIONES</font> 
                                            <b>haciendo click en el cuadro <font face="Verdana" size=4 color="#990000">enmarcado en 
                                                rojo</font> correspondiente a los candidatos deseados y presionando 
                                                al final el botón de <font face="Verdana" size=4 color="#990000">Enviar voto</font>.</b></span> 
                                        </div>
                                    </td>
                                </tr>
                            </table>

                            <font face="Impact" size="3">

                            </font></div></td>
                </tr>
                <tr>
                    <td height="23" width="725"><div align="center">
                        </div>
                        <table width="720" border="1" align="center">
                            <%
                                cont = lista.size();
                                i = 1;
                                while (cont > 0) {
                            %>
                            <tr>
                                <%
                                    for (j = 0; j < 3; j++) {
                                %>
                                <td>
                                    <%
                                        if (i <= lista.size()) {
                                            infocan = (Vector) lista.elementAt(i - 1);
                                    %>
                                    <table border="0" width="270">
                                        <tr>
                                            <td width="110" rowspan="2"><img src="img/<%=infocan.elementAt(2)%>.gif" width="110" height="125" alt="wpe133.jpg (3748 bytes)" align="right"></td>
                                            <td width="60" rowspan="2" class="textocom"><font size="2"><strong><%=infocan.elementAt(1)%>
                                                    <p>
                                                        <%
                                                            if (!infocan.elementAt(2).toString().equals("imblanco")) {
                                                        %>
                                                        <!--a href="html/<!%=infocan.elementAt(2)%>.htm" onClick="window.open(this.href, this.target);
                                                            return false;"> VER PROPUESTA</a-->
                                                        <%                                                           }
                                                        %>
                                                </strong></font>
                                            </td>
                                            <td width="51"><img src="img/nro<%=infocan.elementAt(0)%>.jpg" width="51" height="57"></td>
                                        </tr>
                                        <tr>
                                            <td width="50">
                                                <table border="1" width="28%" bgcolor="#FF0000">
                                                    <tr>
                                                        <td width="100%">
                                                            <p><input type="checkbox" name="P<%=i%>" value="<%=infocan.elementAt(0)%>" onclick="return comprueba(this, <%=total%>);">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <%
                                    } else {
                                    %>
                                    &nbsp;
                                    <%}
                                        i = i + 1;
                                    %>
                                </td>
                                <%
                                    }
                                %>
                            </tr>
                            <%
                                    cont = cont - 3;
                                }
                            %>
                        </table>
                    </td>
                </tr>
                <input type="hidden" name="nomcrp" value="<%=nomCrp%>">
                <input type="hidden" name="codcrp" value="<%=tipo%>">
                <input type="hidden" name="cedula" value="<%=cedula%>">
                <input type="hidden" name="totCandi" value="<%=lista.size()%>">

                <tr align="center">
                    <td height="65" valign="top" width="756" align="center"><fieldset><legend class="textocom">Enviar Voto</legend>
                            <div align="center"><center><p><blink><span class="textocom"><font color="#990000"><b>Una
                                                vez seleccionado el candidato presione el botón&nbsp; ==========&gt;&nbsp;</b></font></span><b> </b></blink>
                                    <input type="submit" value="Enviar voto" name="B1" onclick="return comprueba(null, <%=total%>);" >
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
                                </center></div><p>&nbsp;</fieldset></td>
                </tr>
                <tr align="center">
                    <td height="66" valign="top" width="756"><p><font
                                color="#CCCCCC" size="2"><a href="" onClick="window.open('http://www.escuelaing.edu.co');
                                                                    return false;"><font color="#999999" size="1" face="Verdana, Arial, Helvetica, sans-serif">Escuela
                                Colombiana de Ingeniería</font></a><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><br>
                            Avenida 13 No 205-59 Autopista Norte. Km 13 <br>
                            Bogotá, D.C. - Colombia. Sur América<br></font></font></td>
                </tr>
                <tr align="center">
                    <td height="22" valign="top" width="91"><div align="center"></div></td>
                </tr>
                <!--  cierra Tabla  externa -->
            </table>
        </form>
    </body>
    <p></p>
   
<%
    }
} else {
%>
<% response.sendRedirect("http://intraeci.escuelaing.edu.co/intraeci/jsp/inicio.jsp ");

    }
%>
 <table width="300" border="0" align="center" cellspacing="0">
        <tr>
            <td>
                <div align="center">
                    <jsp:include page="piepag">
                        <jsp:param name="anterior" value="Menu" />
                    </jsp:include>
                </div>
            </td>
        </tr>
    </table>
</div>
    </body>
</html>