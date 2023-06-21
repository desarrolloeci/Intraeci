<%-- 
    Document   : Inscrito
    Created on : 14/05/2012, 08:56:11 AM
    Author     : lrodriguez
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
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    String dpto = request.getParameter("dpto");
// Vector asignaturas = profesor.getAsignaturas(empleado.getPerHorario(), empleado.getIdProf());
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <title>Inscripción Cursos Periodo Intermedio</title>

        <script language="JavaScript" type="text/JavaScript">

            function comprueba( ){

            if (!document.forms.formulario.medio.checked ) {
            alert("Por favor seleccione el curso al que desea inscribirse");
            return false;

            return true;
            }

        </script>
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

    <body>
        <p class="textocom" align="center">&nbsp;</p>
        <div class="container">
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>

            <%if (dpto.equals("126")) {%>
            <form name="formulario" method="post" action="ListaViceAcad">
                <input name="nombres" type="hidden" id="nombres" value="<%=empleado.getNomemp()%>">
                <input name="ape" type="hidden" id="ape" value="<%=empleado.getApeemp()%>">
                <input name="doc" type="hidden" id="doc" value="<%=empleado.getIdProf()%>">
                <input name="dpto" type="hidden" id="doc" value="<%=dpto%>">
                <input name="vinculo" type="hidden" id="vinculo" value="PROF">
                <%  Vector linea = admin.Lineas(dpto);%>

                <table width="819" border="0" id="tablaboton" align="center" class="tabla">
                    
                    <tr><td> <div align="center">Seleccione la linea correspondiente al curso al cual desea inscribirse:</div> </td></tr>
                    <tr>
                        <td><div align="center">
                            <select name="linea" class="campotext">
                                <option value="0" Selected><font size="3">Seleccione</font></option>
                                <%Vector lineas = new Vector();
                                    for (int x = 0; x < linea.size(); x++) {
                                        lineas = (Vector) linea.elementAt(x);%>
                                <option value="<%=lineas.elementAt(0)%>"><font size="3"><%=lineas.elementAt(1)%></font></option>
                                <%}%>
                            </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8">
                            <div align="center">
                                <input type="submit" name="Submit" value="Inscribirse">
                            </div>
                        </td>
                    </tr>

                </table>
            </form>
            <%} else {%>

            <!--CAMBIAR PARA INTERSEMESTRAL "2020-I" empleado.getPerHorario()-->
            <%Vector curso = admin.InscripEventos(dpto, empleado.getPerHorario());%>
            <%  if (curso.size() <= 0) {%>
            <center> No hay programación de cursos disponibles en el momento.</center>
            <p>

                <%} else {
                %>

            <p><center>Seleccione el curso al cual desea inscribirse : </center></p>

        <table width="100%" border="1" id="tablaboton" align="center" class="textocom">
            <form name="formulario" method="post" action="RespuestaInscripcion">
                <input name="nombres" type="hidden" id="nombres" value="<%=empleado.getNomemp()%>">
                <input name="ape" type="hidden" id="ape" value="<%=empleado.getApeemp()%>">
                <input name="doc" type="hidden" id="doc" value="<%=empleado.getIdProf()%>">
                <input name="vinculo" type="hidden" id="vinculo" value="PROF">

                <tr>
                    <td><b>Nombre del curso</b></td>
                    <td><b>Profesor:</b></td>
                    <td><b>Horario</b></td>
                    <td><b>Lugar</b></td>
                    <td><b>Fec.Ini.</b></td>
                    <td><b>Fec.Fin.</b></td>

                    <td><b>Seleccione</b></td>
                <p>
                    <%   Vector cursos = new Vector();

                        for (int x = 0; x < curso.size(); x++) {
                        cursos = (Vector) curso.elementAt(x);%>

                </p>
                </tr>
                <tr>
                    <td><%=cursos.elementAt(1)%></td>
                    <td><%=cursos.elementAt(9)%></td>

                    <td><%=cursos.elementAt(8)%></td>
                    <td><%=cursos.elementAt(4)%></td>
                    <td><%=cursos.elementAt(2)%></td>
                    <td><%=cursos.elementAt(3)%></td>
                    <td align="center"> 
                        <input type="radio" name="medio" value="<%=cursos.elementAt(0)%>-<%=cursos.elementAt(5)%>">
                    </td>
                </tr>
                <%}
                }%>
                <tr>
                    <td colspan="8">
                        <div align="center">
                            <input type="submit" name="Submit" value="Inscribirse">
                        </div>
                    </td>
                </tr>
                <% }%>
            </form>
        </table> 

        <div align="center">
            <jsp:include page="piepag">
                <jsp:param name="anterior" value="Menu" />
            </jsp:include>
        </div>
</body>
</html>
