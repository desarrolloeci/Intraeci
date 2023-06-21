<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject, 
         login.InicioProfRemoteBusiness, 
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<%
    HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    String grupo = request.getParameter("idgrupo");
    String opcion, tercio, clanum, idgrupo, codasig, codgrupo, nomasig, idasig;
    String texto[] = new String[5];
    StringTokenizer st = new StringTokenizer(grupo, "|");
    int acumul[] = new int[5];
    int i, cancel, fin = 4;
    i = 0;
    while (st.hasMoreTokens()) {
        texto[i] = st.nextToken();
        i = i + 1;
    }
    for (i = 0; i < fin; i++) {
        acumul[i] = 0;
    }
    idgrupo = texto[0];
    codasig = texto[1];
    codgrupo = texto[2];
    nomasig = texto[3];
    idasig = texto[4];

    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    // Vector asignaturas = profesor.getAsignaturas("2015-I", empleado.getIdProf());
    // Vector horario = profesor.getHorario(empleado.getIdProf(), "2015-I");
    Vector asignaturas = profesor.getAsignaturas(empleado.getPerHorario(), empleado.getIdProf());
    Vector horario = profesor.getHorario(empleado.getIdProf(), empleado.getPerHorario());
    String periodo = request.getParameter("paramtext");
    Vector asigs = profesor.AsigLabAux(idasig);
    String asg = "'" + asigs.elementAt(0) + "', '" + asigs.elementAt(1) + "', '" + asigs.elementAt(2) + "'";
    int cant = 1;
    opcion = request.getParameter("rbOpcCorreo");

%>

<html>
    <head>
        <title>Listas de Clase</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
    </head>

    <body onload="preloadImg()">
        <div class="container">
            <p class="textocom">&nbsp;</p>
           
            <table width="680" border="0" align="left" cellpadding="0" cellspacing="0" class="textoimpre">
                <tr>
                    <td><strong><font size="1">Escuela Colombiana de Ingenier&iacute;a &quot;Julio
                            Garavito&quot;<br>
                            Secretar&iacute;a General<br>
                            Listas de clase</font></strong></td>
                </tr>
                <tr>
                    <td>		  
                        <table width="100%" border="0" cellspacing="0" class="textoimpre">
                            <tr>
                                <td width="50%"><strong>Periodo Acad&eacute;mico:</strong> <%=empleado.getPerHorario()%></td>
                                <td width="50%"><strong>Profesor:</strong><%=empleado.getNomProf()%></td>
                            </tr>

                            <tr>
                                <td width="50%"><strong>Asignatura:</strong><%=nomasig%> <%=codasig%></td>
                                <td width="50%"><strong>Grupo:</strong><%=codgrupo%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2"><strong>Horario: &nbsp;&nbsp;</strong>
                                    <%
                                        for (int n = 0; n < horario.size(); n++) {
                                            Vector campohorario = (Vector) horario.elementAt(n);
                                            if (campohorario.elementAt(1).equals(codasig) && (campohorario.elementAt(7).equals(idgrupo))) {
                                            if (campohorario.elementAt(3).equals("1")) {%>
                                    <b>Lunes:&nbsp;&nbsp;</b>(<%=campohorario.elementAt(2)%> -- <%=campohorario.elementAt(4)%>)
                                    <%      } else if (campohorario.elementAt(3).equals("2")) {%>
                                    <b>Martes:&nbsp;&nbsp;</b>(<%=campohorario.elementAt(2)%> -- <%=campohorario.elementAt(4)%>)
                                    <%      } else if (campohorario.elementAt(3).equals("3")) {%>
                                    <b>Miércoles:&nbsp;&nbsp;</b>(<%=campohorario.elementAt(2)%> -- <%=campohorario.elementAt(4)%>)
                                    <%      } else if (campohorario.elementAt(3).equals("4")) {%>
                                    <b>Jueves:&nbsp;&nbsp;</b> (<%=campohorario.elementAt(2)%> -- <%=campohorario.elementAt(4)%>)
                                    <%      } else if (campohorario.elementAt(3).equals("5")) {%>
                                    <b>Viernes:&nbsp;&nbsp;</b>(<%=campohorario.elementAt(2)%> -- <%=campohorario.elementAt(4)%>)
                                    <%      } else if (campohorario.elementAt(3).equals("6")) {%>
                                    <b>Sábado:&nbsp;&nbsp;</b><%=campohorario.elementAt(2)%> -- <%=campohorario.elementAt(4)%>
                                    <%      }%>
                                    &nbsp;|&nbsp;
                                    <%  }
                                    }%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>

                        <table width="819" border="1" align="left" cellspacing="0" class="textoimpre">
                            <tr> 
                                <td width="2"> 
                                    <div align="center"><b>Nro</b></div>
                                </td>
                                <td width="282"> 
                                    <div align="center"><b>NOMBRE</b></div>
                                </td>
                                <td width="20"><b><font size="1">NIV</font></b></td>
                                <td width="20"> 
                                    <div align="center"><b><font size="1">PRG</font></b></div>
                                </td>
                                <td width="49"> 
                                    <div align="center"><b><font size="1">CARNET</font></b></div>
                                </td>
                                <td width="46"> 
                                    <div align="center"><b><font size="1">CLAVE</font></b></div>
                                </td>
                                <td width="280"> 
                                    <div align="center"><b>EMAIL - PROFESOR</b></div>
                                </td>
                            </tr>
                            <!--empleado.getPerHorario() para periodo Normal,  "2012-I" PI  -->
                            <%
                                Vector tmp;


                                //Vector estudiantes = profesor.getListaNotas(idgrupo, empleado.getPerHorario());
                                Vector estudiantes = profesor.getListasClase(empleado.getPerHorario(), idasig, codgrupo);
                                // Vector estudiantes = profesor.getListasClase("2015-I",  idasig, codgrupo);
                                for (int a = 0; a < estudiantes.size(); a++) {
                                    Vector estudiante = (Vector) estudiantes.elementAt(a);
                            %>
                            <tr> 
                                <td width="2">
                                    <div align="center"><%=a + 1%></div>
                                </td>
                                <td width="320"><a href="Semaforo?carnet=<%=estudiante.elementAt(6)%>" target="_blank"><%=estudiante.elementAt(0)%></a></td>
                                <td width="20"><%=estudiante.elementAt(16)%></td>
                                <td width="20"> 
                                    <div align="center"><%=estudiante.elementAt(7)%></div>
                                </td>
                                <td width="49"> 
                                    <div align="center"><%=estudiante.elementAt(6)%></div>
                                </td>
                                <td width="46"> 
                                    <% if (estudiante.elementAt(5).equals("Z")) {%>
                                    <div align="center">Normal</div>
                                    <%}%>
                                    <% if (estudiante.elementAt(5).equals("C")) {%>
                                    <div align="center">Cancelado</div>
                                    <%}%>
                                </td>
                                <td width="280"> 
                                    <div align="center"><a href=mailto:<%=estudiante.elementAt(8)%>@mail.escuelaing.edu.co > 
                                            <%=estudiante.elementAt(8)%>@mail.escuelaing.edu.co</a> 
                                            <%
                                                tmp = profesor.getNomProfs(asg, estudiante.elementAt(6).toString());
                                                if (tmp.size() > 0) {
                                            %>
                                        <br>
                                        <%=tmp.elementAt(2)%>Gr.<%=tmp.elementAt(1)%> 
                                        <%
                                            }
                                        %>
                                    </div>
                                </td>
                            </tr>
                            <%}%>
                        </table>
                    </td>
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
