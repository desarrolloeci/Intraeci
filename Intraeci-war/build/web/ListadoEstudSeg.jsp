<%-- 
    Document   : ListadoEstudSeg
    Created on : 14/01/2011, 10:23:46 AM
    Author     : lrodriguez
--%>
<%@ include file="secureprof.jsp" %>
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
       // out.println(idgrupo);
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        Vector asignaturas = profesor.getAsignaturas(empleado.getPerHorario(), empleado.getIdProf());
        Vector horario = profesor.getHorario(empleado.getIdProf(), empleado.getPerHorario());
        String periodo = request.getParameter("paramtext");
        tercio = request.getParameter("tercio");
        Vector asigs = profesor.AsigLabAux(idasig);
        String asg = "'" + asigs.elementAt(0) + "', '" + asigs.elementAt(1) + "', '" + asigs.elementAt(2) + "'";
        int cant = 1;
%>

<html>
    <head>
        <title>Listas Estudiantes Seguimiento Académico</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
    </head>
    <body onload="preloadImg()">
        <table width="680" border="0" align="left" cellpadding="0" cellspacing="0" class="textoimpre">
            <tr>
                <td><strong><font size="1">Escuela Colombiana de Ingenier&iacute;a &quot;Julio
                            Garavito&quot;<br>
                </font></strong></td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" class="textoimpre">
                        <tr>
                            <td width="50%"><strong>Periodo Acad&eacute;mico:</strong><%=empleado.getPerHorario()%></td>
                            <td width="50%"><strong>Profesor:</strong><%=empleado.getNomProf()%></td>
                        </tr>
                        <tr>
                            <td width="50%"><strong>Asignatura:</strong><%=nomasig%> <%=codasig%></td>
                            <td width="50%"><strong>Grupo:</strong><%=codgrupo%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="680" border="1" align="left" cellspacing="0" class="textoimpre">
                        <tr>
                        <td width="35">
                            <div align="center"><b>Nro</b></div>
                        </td>
                        <td width="173">
                            <div align="center"><b><font size="1">CARNET</font></b></div>
                        </td>
                        <td width="326"><b>NOMBRE</b></td>
                        <td width="128"><b>Observaciones</b></td>0
                        <td width="128">
                            <div align="center"><b>Notas</b></div>
                        </td>
                        <td width="128"><b>Alarmas</b></td>

                        <%  Vector tmp;
        Vector estudiantes = profesor.getListaNotas(idgrupo, empleado.getPerHorario());
        for (int a = 0; a < estudiantes.size(); a++) {
            Vector estudiante = (Vector) estudiantes.elementAt(a);%>

                        <tr>
                            <td width="35">
                                <div align="center"><%=a + 1%></div>
                            </td>
                            <td width="100"><%=estudiante.elementAt(6)%></td>
                            <td width="326"><%=estudiante.elementAt(0)%></td>
                            <td width="128">
                                <form name="form1" method="post" action="Observaciones?carnet=<%=estudiante.elementAt(6)%>&idasig=<%=idasig%>&per=<%=empleado.getPerHorario()%>&tercio=<%=tercio%>&idgrupo=<%=idgrupo%>&codg=<%=codgrupo%>">
                                    <input type="submit" name="Submit" value="Ingresar/Consultar">
                                </form>
                            </td>
                            <td width="128">
                                <div align="center">
                                    <input type="submit" name="Submit2" value="Consultar">
                                </div>
                            </td>
                            <td width="100">                             
                                    <div align="center">
                                        <input type="checkbox" name="alarma" value= >
                                    </div>                             
                            </td>
                        </tr>
                        <input type="hidden" name="carnet"  value="">
                        <%}%>
                    </table>
                </td>
            </tr>
        </table>
    <p>&nbsp;</p></body>
</html>
