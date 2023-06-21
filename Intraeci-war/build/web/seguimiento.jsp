<%-- 
    Document   : seguimiento
    Created on : 13/01/2011, 10:09:57 AM
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
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        Vector asignaturas = profesor.getAsignaturasSeg(empleado.getPeriodo(), empleado.getIdProf());
        String periodo = empleado.getTercio();
        int per = Integer.valueOf(periodo).intValue();
        Vector tercio = new Vector();
        if (per != 0 && per < 5) {
            tercio.addElement("Seleccione");
            if (per < 0) {
                tercio.addElement("Periodo Intermedio");
                per = 1;
            } else {
                tercio.addElement("Primero");
                tercio.addElement("Segundo");
                tercio.addElement("Tercero");
                tercio.addElement("Laboratorios");
            }
        }
        %>
<html>
    <head>
      
        <title>Seguimiento Académico</title>

        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondo.gif" onLoad="preloadImg()">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="Seguimiento Académico" />
        </jsp:include>
                <form name="form" method="post" action="ListadoEstudSeg">

        <table width="640" border="0" align="center" cellspacing="0">
            <tr class="textocom">
                <td height="22">
                    <div align="center">
                        <table width="75%" border="1">
                            <tr>
                                <td width="32%">Asignatura-Grupo</td>
                                <td width="21%">Tercio</td>
                             
                            </tr>
                            <tr>
                                <td width="137">
                                    <select name="idgrupo" class="campotext">
                                        <option value="null" selected>Seleccione</option>
                                        <%
        for (int i = 0; i < asignaturas.size(); i++) {
            Vector asignatura = (Vector) asignaturas.elementAt(i);
                                        %>
                                        <option value="<%=asignatura.elementAt(2)%>|<%=asignatura.elementAt(0)%>|<%=asignatura.elementAt(1)%>|<%=asignatura.elementAt(3)%>|<%=asignatura.elementAt(4)%>">
                                        <%=asignatura.elementAt(0)%> - <%=asignatura.elementAt(1)%></option>
                                        <%
        }
                                        %>
                                    </select>
                                </td>
                                <td width="21%"> <select name="tercio" class="campotext">
                                        <option value="-1" selected>Seleccione</option>
                                        <%
        int per_inter;
        for (int j = 1; j <= per; j++) {
            per_inter = j;
            if (tercio.elementAt(j).equals("Periodo Intermedio")) {
                per_inter = 3;
            }
                                        %>
                                        <option value="<%=per_inter%>"><%=tercio.elementAt(j)%></option>
                                        <%
        }
                                        %>
                                </select></td>
                              
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    
    
        <div align="center">
          <input type="submit" name="Submit" value="Enviar">
        </div>
      

          <div align="right">
        <jsp:include page="piepag">
        <jsp:param name="anterior" value="Menu" />
        </jsp:include>
      </div>
                </td>
            </tr>
        </table>
		</form>
    </body>
</html>
