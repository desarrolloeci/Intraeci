
<%@page import="utiles.Correo"%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject, 
         login.InicioProfRemoteBusiness, 
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
    <head>
        <%!  Vector iniMatriz() {
                int i, j;
                Integer h;
                String vacia = new String(" "), cad;
                Vector horario = new Vector();
                Vector horas = new Vector();
                for (i = 600, j = 0; i <= 2000; i = i + 100, j++) {

                    h = new Integer(i);
                    cad = new String(h.toString(i) + "-" + h.toString(i + 30));
                    horas.addElement(cad);
                    cad = new String(h.toString(i + 30) + "-" + h.toString(i + 100));
                    horas.addElement(cad);
                }
                horario.addElement(horas);
                for (i = 1; i < 7; i++) {
                    horas = new Vector();
                    for (j = 0; j < 29; j++) {
                        horas.addElement(vacia);
                    }
                    horario.addElement(horas);
                }
                return horario;
            }
        %>

        <%! void marqueHora(Vector horas, Vector reg) {
                int horaini, horafin, pdia, inicio, fin, i;
                Vector dia;
                String cadhor;
                horaini = (new Integer((String) reg.elementAt(4))).intValue();
                horafin = (new Integer((String) reg.elementAt(5))).intValue();
                pdia = (new Integer((String) reg.elementAt(3))).intValue();
                cadhor = new String(reg.elementAt(1) + "-" + reg.elementAt(6) + " (" + reg.elementAt(2) + ")");
                dia = (Vector) horas.get(pdia);
                inicio = (horaini / 100) * 2 - 12;
                if (horaini % 100 > 0) {
                    inicio++;
                }
                fin = (horafin / 100) * 2 - 12;
                if (horafin % 100 > 0) {
                    fin++;
                }
                for (i = inicio; i < fin; i++) {
                    dia.setElementAt(cadhor, i);
                }
                horas.setElementAt(dia, pdia);
            }
        %>

        <% try{
            HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
            // Vector horario = profesor.getHorario(empleado.getIdProf(), "2015-I");
            Vector horario = profesor.getHorario(empleado.getIdProf(), empleado.getPerHorario());
        %>
        <title>Horario de clases Profesores</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
    </head>
    <body  onLoad="preloadImg()">
         <div class="container">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
              <jsp:param name="headerImg" value="banner.jpg" />
        </jsp:include>
        <table width="819" border="0" align="center" cellspacing="0">
            <tr class="textocom">
                <td height="22"> 
                    <div align="center">
                        <%
                            if ((horario.size()) > 0) {
                                Vector horas;
                                horas = iniMatriz();
                                for (int j = 0; j < horario.size(); j++) {
                                    Vector horarioprof = (Vector) horario.elementAt(j);
                                    marqueHora(horas, horarioprof);
                                }
                        %>
                        <table width="98%" border="1" cellspacing="0" cellpadding="0" class="textocom">
                            <tr>
                                <td width="14%"><b>Horas</b></td>
                                <td width="14%"><b>Lunes</b></td>
                                <td width="14%"><b>Martes</b></td>
                                <td width="14%"><b>Miercoles</b></td>
                                <td width="14%"><b>Jueves</b></td>
                                <td width="14%"><b>Viernes</b></td>
                                <td width="14%"><b>S&aacute;bado</b></td>
                            </tr>
                            <% for (int j = 0; j < 29; j++) {%>

                            <tr>
                                <%for (int i = 0; i < 7; i++) {%>
                                <td>&nbsp;
                                    <%Vector vh;%>
                                    <%vh = (Vector) horas.get(i);%>
                                    <%=(String) vh.elementAt(j)%>&nbsp;&nbsp;
                                </td>
                                <%}%>
                            </tr>
                            <%}%>


                        </table>
                        <%
                        } else {
                        %>        
                        <br><b>Usted no tiene horario asignado para este periodo </b>
                        <%    }%>
                    </div></td>
            </tr>
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
<% } catch (Exception e) {
                Correo correo = new Correo();
                correo.enviar("Listas de Clase son correo", e.getMessage());
            }
%>