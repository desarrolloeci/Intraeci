<%-- 
    Document   : ListaCurso
    Created on : 21/08/2012, 04:26:30 PM
    Author     : Lucero
--%>

<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<%HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    session.setAttribute("loginex", empleado.getUsrExchange());
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    String cedula = empleado.getIdemp();
    String curso = request.getParameter("curso");
  //  String nomcurso = request.getParameter("nomcurso");
    String texto[] = new String[5];
    int tam = 0;
    StringTokenizer st = new StringTokenizer(curso, "*");
    int j = 0;
    while (st.hasMoreTokens()) {
        texto[j] = st.nextToken();
        j = j + 1;
    }
    String nombre = texto[0];
    String id = texto[1];
    String salon = texto[2];
    Vector Datos = admin.InscritosEvento(id);
    //out.println(nombre);
    //  out.println(id);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Inscritos</title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script>

            function enviarexcel() {
                if(document.formulario.rbopciones[0].checked) {
                    document.formulario.target = "";
                    document.formulario.action = "ImpresionListado?formato=excel";
                    return true;
                } else {
                    alert("Seleccione Exportar");
                    return false;
                }
            }

            function valida(tam) { 
                for(i=0;i<tam;i++) {
                    var selec=document.getElementsByName('califica'+i)[0].selectedIndex;
                    if (document.getElementsByName('califica'+i)[0].options[selec].value=="NULL") { 
                        alert("Por favor actualice el estado de todos los inscritos al curso"); 
                        return false;
                    } 
                }
            }

        </script>
    </head>
    <body>
        <div class="container">

            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
            <div align="center" class="textoimpre">
                <%=nombre%>  --  <%=salon%>
                <form name="formulario" method="post" action="ActualizaCurso">
                    <input type="hidden" name="id" value="<%=id%>">
                    <input type="hidden" name="nombre" value="<%=nombre%>">
                    <input type="hidden" name="salon" value="<%=salon%>">

                    <table width="80%" border="1" class="textoimpre">
                        <tr>
                            <td>
                                <div align="center"><b>Nombres</b></div>
                            </td>
                            <td>
                                <div align="center"><b>Correo</b></div>
                            </td>
                            <td>
                                <div align="center"><b>V&iacute;nculo</b></div>
                            </td>
                            <td>
                                <div align="center"><b>Estado</b></div>
                            </td>

                        </tr>
                        <% String nombres = new String();
                            for (int i = 0; i < Datos.size(); i++) {
                                Vector inscrito = (Vector) Datos.elementAt(i);
                                String vinculo = (inscrito.elementAt(4).toString());
                                if (vinculo.equals("EMP") || (vinculo.equals("PROF"))) {
                                    nombres = (inscrito.elementAt(1).toString() + " " + inscrito.elementAt(2).toString() + " " + inscrito.elementAt(3).toString());
                                } else {
                                    nombres = inscrito.elementAt(1).toString();
                                }%>
                        <tr>
                            <td><%=nombres%></td>
                            <td><%=inscrito.elementAt(5)%></td>
                            <td><%=inscrito.elementAt(4)%></td>
                            <td>
                                <% if (inscrito.elementAt(7).equals("NULL") || inscrito.elementAt(7).equals("No disponible") ) {%>
                                <select name="califica<%=i%>">
                                    <option value="NULL">Seleccione</option>
                                    <option value="Aprobado">Aprobado</option>
                                    <option value="No aprobado">No aprobado</option> 
                                    <option value="Nunca asistió">Nunca asistió</option>
                                    <option value="Abandonó">Abandonó</option>
                                </select>
                                <%} else {%>
                                <%=inscrito.elementAt(7)%>

                                <%}
                                        tam = tam + 1;
                                       // out.println(tam);
                                    }%>
                            </td>
                        </tr>
			</table>
                     <div align="center">
                                
        <p>&nbsp;</p>
        <p align="center"> 
          <input type="submit" name="Submit" value="  GUARDAR  " onclick="javascript: return valida(<%=tam%>);">
        </p>
        <p>&nbsp;</p>
      </div>

        <table width="32%" border="0" align="center" class="textocom">
                            <tr>
                                <td colspan="3" width="34%"><strong>Desea Exportar a Excel:</strong></td>
                                <td> Sí</td>
                                <td width="66%">
                                    <input type="radio" name="rbopciones" value="1">
                                </td>
                                <td width="34%"><strong>No:</strong></td>
                                <td width="66%">
                                    <input type="radio" name="rbopciones" value="2">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" name="Submit5" value="Exportar Listado a Excel" class="boton" onclick="javascript: return enviarexcel()">
                                </td>
                            </tr>
                           
                      </table>
                       
                                <div align="center">
                                    <jsp:include page="piepag">
                                        <jsp:param name="anterior" value="Inscritos" />
                                    </jsp:include>
                                </div>
                           
                </form>
            </div>
        </div>
    </body>
</html>
