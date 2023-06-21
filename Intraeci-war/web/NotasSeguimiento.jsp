<%-- Document   : NotasSeguimiento
    Created on : 25/01/2011, 09:54:52 AM
    Author     : lrodriguez
--%>
<%@ include file="secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<%
            HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            //String grupo = request.getParameter("idgrupo");
            String opcion, tercio, clanum, idgrupo, codasig, codgrupo, nomasig, idasig, nota;
            tercio = request.getParameter("tercio");
            idgrupo = request.getParameter("idgrupo");
            codasig = request.getParameter("codasig");
            idasig = request.getParameter("idasig");
            codgrupo = request.getParameter("codg");
            nomasig = request.getParameter("nomasig");
            String periodo = request.getParameter("per");
            String texto[] = new String[5];
            //  out.println(idgrupo);
            // out.println(codgrupo);
// StringTokenizer st = new StringTokenizer(grupo, "|");
            int acumul[] = new int[5];
            int i, cancel, fin = 4;
            int tipo = 1;
            i = 0;
            /* while (st.hasMoreTokens()) {
            texto[i] = st.nextToken();
            i = i + 1;
            }*/
            for (i = 0; i < fin; i++) {
                acumul[i] = 0;
            }
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
            Vector asignaturas = profesor.getAsignaturas(periodo, empleado.getIdProf());
            Vector horario = profesor.getHorario(empleado.getIdProf(), periodo);
            //String periodo = request.getParameter("paramtext");
            tercio = request.getParameter("tercio");
            String documento = empleado.getDocumProf();
            Vector asigs = profesor.AsigLabAux(idasig);
            String asg = "'" + asigs.elementAt(0) + "', '" + asigs.elementAt(1) + "', '" + asigs.elementAt(2) + "'";
            int cant = 1;
%>

<html>
    <head>
        <title>Listas Estudiantes Seguimiento Académico</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <link href="css/comun.css" rel="stylesheet" type="text/css"/>
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="javascript" type="text/javascript">
            function ValidaNotas(form) {
                if (form.nota.value == '' || form.nota.value == "null" ){
                    alert("Por favor ingrese la NOTA en el campo antes de hacer clik en Guardar Nota.");
                    return false;
                }
                if (form.nota.value > 50){
                    alert("Las notas no pueden ser superiores a 50, por favor verifique.");
                    return false;
                }
            }
        </script>
    </head>
    <body onload="preloadImg()">
          <div class="container">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
           <jsp:param name="headerImg" value="banner.jpg" />
        </jsp:include>
        <div align="center"></div>
        <div class="textoimpre"><strong><font size="1">Escuela Colombiana de Ingenier&iacute;a &quot;Julio
                            Garavito&quot;<br>
                            </font></strong></div>

                    <table width="100%" border="0" cellspacing="0" class="textoimpre">
                        <tr>
                            <td width="50%"><strong>Periodo Acad&eacute;mico:</strong><%=periodo%></td>
                            <td width="50%"><strong>Profesor:</strong><%=empleado.getNomProf()%></td>
                        </tr>
                        <tr>
                            <td width="50%"><strong>Asignatura:</strong><%=nomasig%> <%=codasig%></td>
                            <td width="50%"><strong>Grupo:</strong><%=codgrupo%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <b>Tercio:<%=tercio%> </b>
                            </td>
                        </tr>
                        <%if (!tercio.equals("1")) {%>
                        <tr>
                            <td colspan="2">
                                <p>&nbsp;</p>
                                <p><font color="#CC0000"><b>Unicamente apareceran habilitados para capturar
                                            notas los estudiantes que ya tengan las notas de los tercios anteriores
                                            y que no hayan cancelado la asignatura.</b> </font></p>
                            </td>
                        </tr>
                        <%} else {%>
                        <tr>
                            <td colspan="2"> <font color="#CC0000"><b>Unicamente apareceran habilitados
                                        para capturar notas los estudiantes que no hayan cancelado la asignatura.</b>
                                </font></td>
                        </tr>
                        <%}%>
                    </table>
                
                    <table width="819" border = "1" align = "left" cellspacing = "0" class= "textoimpre">
                        <tr>
                            <td width="27">
                                <div align="center"><b>Nro</b></div>
                            </td>
                            <td width="40">
                                <div align="center"><b><font size="1">CARNET</font></b></div>
                            </td>
                            <td width="250">
                                <div align="center"><b>NOMBRE</b></div>
                            </td>
                            <td width="100"><b>Foto</b></td>
                            <td width="25"><b>Clave</b></td>

                            <td width="50">
                                <div align="center"><b>Nota</b></div>
                            </td>

                            <td width="78">
                                <div align="center"><b>Fallas</b></div>
                            </td>
                            <td width="218">&nbsp; </td>
                            <td width="218" >
                                <div align  = "center" > <b>
                                        Observaciones</b></div>
                            </td>
                            <td width="218" >
                                <div
                                    align  = "center" > <b>
                                        Alarmas</b ></div>
                            </td>
                            <%  Vector tmp;
                                        Vector alar;
                                        Vector estudiantes = profesor.getListaNotas(idgrupo, periodo);
                                        String marcaalar = "";
                                        empleado.setEstudiantes(estudiantes);
                                        for (int a = 0; a < estudiantes.size(); a++) {
                                            Vector estudiante = (Vector) estudiantes.elementAt(a);
                                            Vector alarma = profesor.Alarmas(estudiante.elementAt(6).toString(), tercio, idasig, periodo, tipo);
                                            if (alarma.size() > 0) {
                                                /* if (alarma.size() == 0) {
                                                alar = "N";
                                                } else {*/
                                                alar = (Vector) alarma.elementAt(0);
                                                marcaalar = alar.elementAt(0).toString();
                                            } else {
                                                marcaalar = "N";
                                            }%>

                            <%if (estudiante.elementAt(15).toString().equals("0")) {%>
                        <tr>
                            <td width="27">
                                <div align="center"><%=a + 1%></div>
                            </td>
                            <td width="40"><%=estudiante.elementAt(6)%></td>
                            <td width="250"><%=estudiante.elementAt(0)%></td>
                            <td width="100" align="center"><img src="http://tycho.escuelaing.edu.co/contenido/seguimiento/<%=estudiante.elementAt(6)%>_Foto.jpg" width="50" height="50"  ></td>

                        <form name="form1" method="post" action="EnviaNotasSeg">
                            <input type="hidden" name="per" value="<%=periodo%>">
                            <input type="hidden" name="carnet" value="<%=estudiante.elementAt(6)%>">
                            <input type="hidden" name="idasig" value="<%=idasig%>">
                            <input type="hidden" name="idgrupo" value="<%=idgrupo%>">
                            <input type="hidden" name="codg" value="<%=codgrupo%>">
                            <input type="hidden" name="tercio" value="<%=tercio%>">
                            <input type="hidden" name="codasig" value="<%=codasig%>">
                            <input type="hidden" name="nomasig" value="<%=nomasig%>">
                            <input type="hidden" name="nombre" value="<%=estudiante.elementAt(0)%>">
                            <input name="notas1" type="hidden" id="notas1" value="<%=estudiante.elementAt(1)%>">
                            <input name="notas2" type="hidden" id="notas2" value="<%=estudiante.elementAt(2)%>">
                            <input name="notas3" type="hidden" id="notas3" value="<%=estudiante.elementAt(3)%>">
                            <input name="notas4" type="hidden" id="notas4" value="<%=estudiante.elementAt(4)%>">
                            <input name="notas5" type="hidden" id="notas5" value="<%=estudiante.elementAt(13)%>">
                            <input type="hidden" name="periodo" value="<%=periodo%>">
                            <input name="documento" type="hidden" id="documento" value="<%=documento%>">


                            <%  String notas1 = estudiante.elementAt(1).toString();
                                String notas2 = estudiante.elementAt(2).toString();
                                String notas3 = estudiante.elementAt(3).toString();
                                String notas4 = estudiante.elementAt(4).toString();
                                String notas5 = estudiante.elementAt(13).toString();
                                String falla1 = estudiante.elementAt(9).toString();
                                String falla2 = estudiante.elementAt(10).toString();
                                String falla3 = estudiante.elementAt(11).toString();
                                String falla4 = estudiante.elementAt(12).toString();
                                String falla5 = estudiante.elementAt(14).toString();
                                String clave = estudiante.elementAt(5).toString();%>

                            <td width="25">
                                <% if (!clave.equals("C")) {%>
                                Normal
                                <%} else {%>
                                <font color="#800000"><b>Cancelado</b></font>
                                <%}%>
                            </td>
                            <td width="60">
                                 <div align="center">
                                <!--PARA VALIDAR QUE NO PUEDA CAPTURAR UN TERCIO SIN HABER CAPTURADO EL ANTERIOR O ANTERIORES-->
                                <% if (tercio.equals("2") && notas1.equals("No disponible")) {
                                        out.println("&nbsp;");
                                    } else if (tercio.equals("3") && (notas1.equals("No disponible") || notas2.equals("No disponible"))) {
                                        out.println("&nbsp;");
                                    } else if (tercio.equals("4") && (notas1.equals("No disponible") || notas2.equals("No disponible") || notas3.equals("No disponible"))) {
                                        out.println("&nbsp;");
                                    } else if (tercio.equals("5") && (notas1.equals("No disponible") || notas2.equals("No disponible") || notas3.equals("No disponible") || notas4.equals("No disponible"))) {
                                        out.println("&nbsp;");
                                    } else if (tercio.equals("1") && !notas1.equals("No disponible") && !clave.equals("C")) {%>
                                <input type="text" name="nota" value="<%=estudiante.elementAt(1)%>" size="3" maxlength="2">
                                <%  } else if (tercio.equals("2") && !notas2.equals("No disponible") && !clave.equals("C")) {%>
                                <input type="text" name="nota" value="<%=estudiante.elementAt(2)%>" size="3" maxlength="2">
                                <%  } else if (tercio.equals("3") && !notas3.equals("No disponible") && !clave.equals("C")) {%>
                                <input type="text" name="nota" value="<%=estudiante.elementAt(3)%>" size="3" maxlength="2">
                                <% } else if (tercio.equals("4") && !notas4.equals("No disponible") && !clave.equals("C")) {%>
                                <input type="text" name="nota" value="<%=estudiante.elementAt(4)%>" size="3" maxlength="2">
                                <%} else if (tercio.equals("5") && !notas5.equals("No disponible") && !clave.equals("C")) {%>
                                <input type="text" name="nota" value="<%=estudiante.elementAt(13)%>" size="3" maxlength="2">
                                <%} else if (!clave.equals("C")) {%>
                                <input type="text" name="nota"  size="3" maxlength="2">
                                <%} else {
                                     out.println("&nbsp;");
                                 }%>
                            </td>
                            <td width="78">
                                <div align="center">

                                    <% if (tercio.equals("1") && !falla1.equals("No disponible")) {%>
                                    <input type="text" name="falla" value="<%=falla1%>" size="3" maxlength="2">
                                    <%  } else if (tercio.equals("2") && !falla2.equals("No disponible")) {%>
                                    <input type="text" name="falla" value="<%=falla2%>" size="3" maxlength="2">
                                    <%  } else if (tercio.equals("3") && !falla3.equals("No disponible")) {%>
                                    <input type="text" name="falla" value="<%=falla3%>" size="3" maxlength="2">
                                    <%  } else if (tercio.equals("4") && !falla4.equals("No disponible")) {%>
                                    <input type="text" name="falla" value="<%=falla4%>" size="3" maxlength="2">
                                    <%} else if (tercio.equals("5") && !falla5.equals("No disponible")) {%>
                                    <input type="text" name="falla" value="<%=falla5%>" size="3" maxlength="2">
                                    <%} else if (tercio.equals("2") && notas1.equals("No disponible")) {
                                         out.println("&nbsp;");
                                     } else if (tercio.equals("3") && (notas1.equals("No disponible") || notas2.equals("No disponible"))) {
                                         out.println("&nbsp;");
                                     } else if (tercio.equals("4") && (notas1.equals("No disponible") || notas2.equals("No disponible") || notas3.equals("No disponible"))) {
                                         out.println("&nbsp;");
                                     } else if (tercio.equals("5") && (notas1.equals("No disponible") || notas2.equals("No disponible") || notas3.equals("No disponible") || notas4.equals("No disponible"))) {
                                         out.println("&nbsp;");
                                     } else if (!clave.equals("C")) {%>

                                    <input  type = "text" name = "falla"  value = "0" size = "3" maxlength = "2" >
                                    <%}%>
                                </div>
                            </td>
                            <td width="218" align="center">
                                <input type="submit" class="boton"  value="Guardar Nota" onClick="return ValidaNotas(this.form);">
                        </form>
                </td>
                <td width="218">
                    <form name="form3" method="post" action="Observaciones">
                        <input type="hidden" name="per" value="<%=periodo%>">
                        <input type="hidden" name="carnet" value="<%=estudiante.elementAt(6)%>">
                        <input type="hidden" name="idasig" value="<%=idasig%>">
                        <input type="hidden" name="idgrupo" value="<%=idgrupo%>">
                        <input type="hidden" name="tercio" value="<%=tercio%>">
                        <input type="hidden" name="codg" value="<%=codgrupo%>">
                        <input type="hidden" name="codasig" value="<%=codasig%>">
                        <input type="hidden" name="nomasig" value="<%=nomasig%>">
                        <input type="hidden" name="nombre" value="<%=estudiante.elementAt(0)%>">
                        <input type="hidden" name="codgrupo" value="<%=codgrupo%>">
                        <input type="hidden" name="notas1"   value="<%=estudiante.elementAt(1)%>">
                        <input type="hidden" name="notas2"  value="<%=estudiante.elementAt(2)%>">
                        <input type="hidden" name="notas3"  value="<%=estudiante.elementAt(3)%>">
                        <input type="hidden" name="notas4" value="<%=estudiante.elementAt(4)%>">
                        <input type="hidden" name="notas5"  value="<%=estudiante.elementAt(13)%>">

                        <div align="center">
                            <input type="submit" name="Submit" value="Agregar">
                        </div>
                    </form>
                </td>
                <td width="218">
                    <div align="center">
                        <%if (marcaalar.equals("S")) {%>
                        <input type="checkbox" name="alarma" value="checkbox" checked>
                        <% } else {%>
                        <input type="checkbox" name="alarma" value="radiobutton" onClick="this.checked=false">
                        <%}%>
                    </div>
                </td>
            </tr>
            <input type="hidden" name="carnet"  value="">
            <%}
                        }%>
                       
       
    </table>
                        <div align="center">
              
                    <jsp:include page="piepag">
                        <jsp:param name="anterior" value="Menu" />
                    </jsp:include>

              
            </div>

    <p align="center">&nbsp;</p>
    </div>
</body>
</html>

