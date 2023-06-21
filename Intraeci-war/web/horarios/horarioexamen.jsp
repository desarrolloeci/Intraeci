<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject, 
         login.InicioProfRemoteBusiness, 
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
    <head>
        <%
            HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
            Vector horarioexamenes = profesor.getHorarioExamenes(empleado.getIdProf(), empleado.getPeriodo());
        %>
        <title>Horario de clases Profesores</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
            <!--ESTO ES POR CONTINGENCIA COVID 19-->
            <h2>Los exámenes finales de las asignaturas que pudieron continuar con actividades no presenciales, se realizarán entre el 11 y el 22 de mayo de 2020 en el horario de clases establecido para el primer semestre de 2020</h2>
            <!--table width="819" border="0" align="center" cellspacing="0">
                <tr class="textocom">
                    <td height="22"> 
                        <div align="center">
                            <%
                                if (horarioexamenes.size() > 0) {
                            %>
                            <table width="100%" border="1" class="textocom">
                                <tr>
                                    <td><div align="center"><b>Titular</b></div></td>
                                    <td><div align="center"><b>Asignatura</b></div></td>
                                    <td><div align="center"><b>Grupo</b></div></td>
                                    <td><div align="center"><b>Día examen</b></div></td>
                                    <td><div align="center"><b>Hora</b></div></td>
                                    <td><div align="center"><b>Salón</b></div></td>
                                    <td><div align="center"><b>Auxiliar</b></div></td>
                                </tr>
                                <%
                                    for (int i = 0; i < horarioexamenes.size(); i++) {
                                        Vector examenes = (Vector) horarioexamenes.elementAt(i);
                                %>
                                <tr>
                                    <td><%=examenes.elementAt(0)%></td>
                                    <td><%=examenes.elementAt(1)%></td>
                                    <td><%=examenes.elementAt(2)%></td>
                                    <td><%=examenes.elementAt(7)%></td>
                                    <td><%=examenes.elementAt(5)%></td>
                                    <td><%=examenes.elementAt(6)%></td>
                                    <td><%=examenes.elementAt(8)%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </table>
                            <%
                            } else {
                            %>
                            <br><strong>No tiene horario de examen asignado</strong>
                            <%    }
                            %>
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
            </table-->
        </div>
    </body>
</html>
