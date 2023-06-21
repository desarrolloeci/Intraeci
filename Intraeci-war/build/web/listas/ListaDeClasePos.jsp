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
        String formato = request.getParameter("formato");
        if ((formato != null) && (formato.equals("excel"))) {
            response.setContentType("application/vnd.ms-excel");
        }
        String opcion, tercio, clanum, area, idgrupo, codasig, codgrupo, nomasig, peraca, idasig;
        String texto[] = new String[8];
        StringTokenizer st = new StringTokenizer(grupo, "|");
        int acumul[] = new int[8];
        int i, cancel, fin = 5;
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
        grupo = texto[2];
        nomasig = texto[3];
        peraca = texto[4];
        area = texto[5];
        idasig = texto[6];
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        Vector asignaturas = profesor.getListaspos(empleado.getIdProf());
       // Vector horario = profesor.getHorario(empleado.getIdProf(), empleado.getPeriodo());
         Vector horario = profesor.getHorarioPos(empleado.getIdProf(), peraca);
       //ASI ESTABA CAMBIAR POR VISTA 
        //Vector estudiantes = profesor.getListaNotasPos(idgrupo, empleado.getPeriodo());
        Vector estudiantes = profesor.getListasClase(peraca,  idasig, grupo);
        String periodo = request.getParameter("paramtext");
        int cant = 1;
        opcion = request.getParameter("rbOpcCorreo");

%>

<html>
    <title>Lista De clase Posgrado Sin Correos</title>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function impresion(){
                document.getElementById("tablaboton").style.visibility='hidden';
                window.print();
                window.close();
            }
            -->
        </script>
        <%
        if (!((formato != null) && (formato.equals("excel")))) {
        %>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <%        }
        %>

    </head>
    <body onload="preloadImg()" >
        <div class="container">
            <p class="textocom">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
        <table width="819" border="0" class="textoimpre">
            <tr>
                <td height="22">    <div align="center">
                        <p align="left"><strong>Escuela Colombiana de Ingenier&iacute;a &quot;Julio
                                Garavito&quot;<br>
                                Secretar&iacute;a General<br>
                        Listas de clase</strong></p>
                </div></td>
                <td>
                    <table width="100%" border="0" id="tablaboton">
                        <tr>
                            <td width="40%">
                                <div align="right">
                                    <input name="imprimir" type="submit" id="imprimir3" value="Imprimir Listas" class="boton" onClick="impresion()">
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellspacing="0" class="textoimpre">
                        <tr>
                            <td width="50%"><strong>Periodo Acad&eacute;mico:</strong><%=peraca%></td>
                            <td width="50%"><strong>Profesor:</strong><%=empleado.getNomProf()%></td>
                        </tr>
                        <tr>
                            <td width="50%"><strong>Asignatura:</strong><%=nomasig%> <%=codasig%></td>
                            <td width="50%"><strong>Grupo:</strong><%=grupo%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                                  <tr>
                <td colspan="2"><strong>Horario:&nbsp;&nbsp;</strong>
                <%
        for (int n = 0; n < horario.size(); n++) {
            Vector campohorario = (Vector) horario.elementAt(n);
            if (campohorario.elementAt(1).equals(codasig) && (campohorario.elementAt(7).equals(idgrupo))) {
                if (campohorario.elementAt(3).equals("1")) {%>
                <B>Lunes:&nbsp;&nbsp;</B>(<%=campohorario.elementAt(2)%>
                -- <%=campohorario.elementAt(4)%>)
                <%} else if (campohorario.elementAt(3).equals("2")) {%>
                <B>Martes:&nbsp;&nbsp;</B>(<%=campohorario.elementAt(2)%>
                -- <%=campohorario.elementAt(4)%>)
                <%} else if (campohorario.elementAt(3).equals("3")) {%>
                <B>Miércoles:&nbsp;&nbsp;</B>(<%=campohorario.elementAt(2)%> -- <%=campohorario.elementAt(4)%>)
                <%} else if (campohorario.elementAt(3).equals("4")) {%>
                <B>Jueves:&nbsp&nbsp&nbsp&nbsp </B> (<%=campohorario.elementAt(2)%>
                -- <%=campohorario.elementAt(4)%>)
                <%} else if (campohorario.elementAt(3).equals("5")) {%>
                <B>Viernes:&nbsp;&nbsp;</B>(<%=campohorario.elementAt(2)%>
                -- <%=campohorario.elementAt(4)%>)
                <%} else if (campohorario.elementAt(3).equals("6")) {%>
                <B> Sábado:&nbsp;&nbsp;</B><%=campohorario.elementAt(2)%>
                -- <%=campohorario.elementAt(4)%>
                <%}
                %>
                &nbsp;&nbsp;|&nbsp;&nbsp;
                <%
            }
        }
                %>
            </tr>
                        <tr>
                            <td><strong>Area:</strong> <%=area%></td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
            <td colspan="2">
            
      <table  width="819" border="1" cellspacing="0" class="textoimpre">
        <tr> 
          <td width="5"> 
            <div align="center"><b>Nro</b></div>
          </td>
          <td width="300"> 
            <div align="center"><b>NOMBRE</b></div>
          </td>
          <td width="20"><b><font size="1">NIV</font></b></td>
          <td width="20"> 
            <div align="center"><b><font size="1">PRG</font></b></div>
          </td>
          <td width="30"> 
            <div align="center"><b>CLAVE</b></div>
          </td>
          <td colspan="5"> 
            <div align="center"><b>FALLAS</b></div>
          </td>
          <td colspan="5"> 
            <div align="center"><b>NOTAS PARCIALES</b></div>
          </td>
          <td colspan="3"> 
            <div align="center"><b> N.D.</b></div>
          </td>
        </tr>
        <tr> 
          <td width="5">&nbsp;</td>
          <td width="270">&nbsp;</td>
          <td width="20">&nbsp;</td>
          <td width="20">&nbsp;</td>
          <td width="49">&nbsp;</td>
          <td width="9"> 
            <div align="center">1</div>
          </td>
          <td width="9"> 
            <div align="center">2</div>
          </td>
          <td width="9"> 
            <div align="center">3</div>
          </td>
          <td width="9"> 
            <div align="center">4</div>
          </td>
          <td width="9"> 
            <div align="center">5</div>
          </td>
          <td width="22"> 
            <div align="center">1</div>
          </td>
          <td width="22"> 
            <div align="center">2</div>
          </td>
          <td width="22"> 
            <div align="center">3</div>
          </td>
          <td width="22"> 
            <div align="center">4</div>
          </td>
          <td width="22"> 
            <div align="center">5</div>
          </td>
          <td width="40">&nbsp;</td>
        </tr>
        <%
        for (int a = 0; a < estudiantes.size(); a++) {
            Vector estudiante = (Vector) estudiantes.elementAt(a);
                %>
        <tr> 
          <td width="5"> 
            <div align="center"><%=a + 1%></div>
          </td>
          <td width="270"><%=estudiante.elementAt(0)%></td>
          <td width="20"><%=estudiante.elementAt(16)%></td>
          <td width="20"><%=estudiante.elementAt(7)%></td>
          <% if (estudiante.elementAt(5).equals("Z")) {%>
          <td width="70"> 
            <div align="center">Normal</div>
          </td>
          <%} else if (estudiante.elementAt(5).equals("C")) {%>
          <td width="70"> 
            <div align="center">Cancelado</div>
          </td>
          <%}else if (estudiante.elementAt(5).equals("E")) {%>
          <td width="70">
            <div align="center">Electiva</div>
          </td>
            <%}else if (estudiante.elementAt(5).equals("O")) {%>
           <td width="70">
            <div align="center">Opcional</div>
          </td>
          
          <%}%>
          <td width="9">&nbsp;</td>
          <td width="9">&nbsp;</td>
          <td width="9">&nbsp;</td>
          <td width="9">&nbsp;</td>
          <td width="9">&nbsp;</td>
          <td width="22">&nbsp;</td>
          <td width="22">&nbsp;</td>
          <td width="22">&nbsp;</td>
          <td width="22">&nbsp;</td>
          <td width="22">&nbsp;</td>
          <td width="35">&nbsp;</td>
        </tr>
        <%}%>
      </table>
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
