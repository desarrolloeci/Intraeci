<%-- 
    Document   : Observaciones
    Created on : 17/01/2011, 11:00:02 AM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ include file="secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
    HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    PrintWriter oout = response.getWriter();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    String carnet = request.getParameter("carnet");
    String periodo = empleado.getTercio();
    String idasig = request.getParameter("idasig");
    String peri = request.getParameter("per");
    String tercio = request.getParameter("tercio");
    String idgrupo = request.getParameter("idgrupo");
    String codg = request.getParameter("codg");
    String nota = request.getParameter("nota");
    String falla = request.getParameter("falla");
    String nombre = request.getParameter("nombre");
    String nomasig = request.getParameter("nomasig");
    String codasig = request.getParameter("codasig");
    String documento = request.getParameter("docu");
    String notas1 = request.getParameter("notas1");
    String notas2 = request.getParameter("notas2");
    String notas3 = request.getParameter("notas3");
    String notas4 = request.getParameter("notas4");
    String notas5 = request.getParameter("notas5");
    String notanva = request.getParameter("nota");
    String grupo = request.getParameter("grupo");
    String clanum = request.getParameter("clanum");


    //  out.println(notas1);
    int per = Integer.valueOf(periodo).intValue();
    int tipo = 1;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Observaciones - Seguimiento Académico</title>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {

            if((document.form1.obs.value == "" ||  document.form1.obs.value == "null") && (document.form1.obs1.value == "")){
            alert("Por favor seleccione una observación o ingrese una nueva según el caso");
            return false;
            }
            }
            //-->
        </script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
            <form name="form1" method="post" action="GuardaObs">
                <div align="center">
                    <input type="hidden" name="docu" value="<%=empleado.getDocumProf()%>">
                    <input type="hidden" name="carnet" value="<%=carnet%>">
                    <input type="hidden" name="peri" value="<%=peri%>">
                    <input type="hidden" name="idasig" value="<%=idasig%>">
                    <input type="hidden" name="idgrupo" value="<%=idgrupo%>">
                    <input type="hidden" name="tercio" value="<%=tercio%>">
                    <input type="hidden" name="codg" value="<%=codg%>">
                    <input type="hidden" name="nota" value="<%=nota%>">
                    <input type="hidden" name="falla" value="<%=falla%>">
                    <input type="hidden" name="nomasig" value="<%=nomasig%>">
                    <input type="hidden" name="codasig" value="<%=codasig%>">
                    <input name="notas1" type="hidden" id="notas1" value="<%=notas1%>">
                    <input name="notas2" type="hidden" id="notas2" value="<%=notas2%>">
                    <input name="notas3" type="hidden" id="notas3" value="<%=notas3%>">
                    <input name="notas4" type="hidden" id="notas4" value="<%=notas4%>">
                    <input name="notas5" type="hidden" id="notas5" value="<%=notas5%>">
                    <input name="notanva" type="hidden" id="notanva" value="<%=notanva%>">

                    <table width="45%" border="0" class="textocom" >
                        <tr> 
                            <td width="9%">Estudiante: </td>
                            <td width="83%"><b><%=nombre%></b> </td>
                        </tr>
                        <tr> 

                            <td width="9%"> 
                                <p>&nbsp;</p>
                                <p>Observaci&oacute;n Estandar</p>
                            </td>

                            <td width="83%"> 
                                <p>&nbsp; </p>
                                <p>
                                    <select name="obs"  class="textocom">
                                        <option value="">Seleccione de la lista o ingrese una nueva Observación</option>
                                        <option value="El estudiante no entra a clase">El estudiante no 
                                            entra a clase</option>
                                        <option value="Falta con frecuencia">Falta con frecuencia</option>
                                        <option value="Es de fuera de la ciudad y no se ha adaptado a las nuevas condiciones">Es 
                                            de fuera de la ciudad y no se ha adaptado a las nuevas condiciones</option>
                                        <option value="El estudiante no pone atenci&oacute;n">El estudiante 
                                            no pone atenci&oacute;n</option>
                                        <option value="No ha comprendido la metodologia, no prepara los ejercicios para la clase, y no hace los ejercicios">No 
                                            ha comprendido la metodolog&iacute;a, no prepara los ejercicios 
                                            para la clase, y no hace los ejercicios</option>
                                        <option value="No es constante preparando los temas de la clase">No 
                                            es constante preparando los temas de la clase</option>
                                        <option value="A&uacute;n no tiene metodolog&iacute;a de estudio">A&uacute;n 
                                            no tiene metodolog&iacute;a de estudio</option>
                                        <option value="Argumenta problemas de salud">Argumenta problemas 
                                            de salud</option>
                                        <option value="Requiere de ayuda fuera de clase">Requiere de ayuda 
                                            fuera de clase</option>
                                        <option value="No hace preguntas">No hace preguntas</option>
                                        <option value="Es indisciplinado">Es indisciplinado</option>
                                    </select>
                                </p>
                            </td>
                        </tr>
                        <tr> 

                            <td width="9%"> 
                                <p>&nbsp;</p>
                                <p>Observaci&oacute;n Manual</p>
                            </td>

                            <td width="83%"> 
                                <p>&nbsp;</p>
                                <p>
                                    <input type="text" name="obs1" size="100" value="" maxlength="100">
                                </p>
                            </td>
                        </tr>
                        <tr> 
                            

                            <td width="9%">Activar Alarma</td>

                            <td width="83%"> 
                                <p>&nbsp;</p>
                                <p>NO : 
                                    <input type="radio"  CHECKED name="alarma" value="N">
                                </p>
                                <p>SI: &nbsp; 
                                    <input type="radio" name="alarma" value="S">
                                </p>
                                <p>&nbsp; </p>
                            </td>
                        </tr>

                        <%Vector alarma = profesor.Alarmas(carnet, tercio, idasig, empleado.getPerHorario(), tipo);%>
                        <tr>
                            <td colspan="2">
                                <p>&nbsp;</p>
                                <p>OBSERVACIONES REGISTRADAS</p>
                                <p>&nbsp;</p>
                            </td>

                            <td colspan="2" width="8%"> 
                                <div align="center">ALARMAS </div>
                            </td>
                        </tr>

                        <% if (alarma.size() > 0) {%>
                        <% for (int j = 0; j < alarma.size(); j++) {
                            Vector datos = (Vector) alarma.elementAt(j);%>
                        <br>
                        <tr> 
                            <td colspan="2"> 
                                <div align="left"> 
                                    <%=datos.elementAt(1)%> 
                                </div>
                            </td>

                            <td  width="8%"> 
                                <%if (datos.elementAt(0).equals("S")) {%>
                                <div align="center"> SI </div>
                                <%} else if (datos.elementAt(0).equals("N")) {%>
                                <div align="center"> NO </div>
                                <%  }%>
                            </td>
                        </tr>
                        <% }
                    } else {%>
                        <tr>
                            <td colspan="3">
                                No existen OBSERVACIONES registradas en el sistema. 
                            </td>
                        </tr>

                        <%}%>

                        <tr> 
                            <td colspan="3"> 
                                <div align="center"> 

                                    <p>&nbsp;</p>
                                    <p> 
                                        <input type="submit" name="Submit" value="Ingresar Datos" onClick="javascript: return validar();">
                                    </p>
                                    <p>&nbsp;</p>
                                </div>
                            </td>
                        </tr>
                        <tr> 
                            <td colspan="3"> 
                                <div align="center"> 
                                    
                                    <jsp:include page="piepag"> 
                                        <jsp:param name="anterior" value="javascript:history.back()"   />
                                    </jsp:include>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </body>
</html>
