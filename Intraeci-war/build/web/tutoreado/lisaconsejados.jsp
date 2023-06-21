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
        Vector tutoreado = profesor.gettutoreados("0", empleado.getIdProf());
        %>

        <title>Listas de Aconsejados</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
        <link href="css/comun.css" rel="stylesheet" type="text/css">
         <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
    </head>
    <body>
      <div class="container">
           
            <p class="textocom">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
        <table width="819" border="0" align="center" cellspacing="0" class="textocom">
            <%
        if (tutoreado.size() > 0) { 
            %>
            <tr>
                <td height="22">
                    <table width="819" border="1" cellspacing="0" align="center"  class="textoimpre">
                        <tr>
                            <td width="20%">
                                <div align="center">Carnet</div>
                            </td>
                            <td width="60%">
                                <div align="center">Nombre</div>
                            </td>
                            <td width="20%">
                                <div align="center">Ver</div>
                            </td>
                        </tr>
                        <%
                for (int n = 0; n < tutoreado.size(); n++) {
                    Vector campo = (Vector) tutoreado.elementAt(n);%>
                        <tr>
                            <td>
                                <div align="center"><%=campo.elementAt(1)%></div>
                            </td>
                            <td>
                                <div align="center"><%=campo.elementAt(3)%></div>
                            </td>
                            <td>
                                <div align="center"><a href="AsignaturasPos?carnet=<%=campo.elementAt(1)%>&nomest=<%=campo.elementAt(3)%>">ver asignaturas</a></div>
                            </td>
                        </tr>

                        <%}%>

                    </table>
                </td>
            </tr>

            <%} else
            out.println("<tr><td><b>No se encontraron registrados asignados</td></tr>");
            %>
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