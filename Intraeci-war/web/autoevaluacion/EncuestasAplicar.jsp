<%-- 
    Document   : EncuestasAplicar
    Created on : 16/04/2013, 10:46:31 AM
    Author     : Lucero
--%>

<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.text.*, java.net.*;" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties,java.lang.reflect.Array " %>

<%HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    session.setAttribute("loginex", empleado.getUsrExchange());
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    String cedula = empleado.getIdemp();
    Vector Datos = admin.DatosEncuestas(cedula);
    String dato = "";%>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

        <title>Encuestas Autoevaluaci�n con fines de Acreditaci�n Institucional</title>
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
            <center>
                <font color="#800000">Tenga en cuenta que su sesi�n estar� activa durante <b>UNA
                    HORA </b>para responder la encuesta </font> 
            </center>

            <p>&nbsp;</p>
            <p>
                <% if (Datos.size() > 0) {

                        for (int i = 0; i < Datos.size(); i++) {
                            Vector aplica = (Vector) Datos.elementAt(i);
                            String iden = aplica.elementAt(1).toString();
                            String estado = aplica.elementAt(2).toString();
                            String prog = aplica.elementAt(3).toString();
                            String codigo = aplica.elementAt(4).toString();
                            String tipo = aplica.elementAt(5).toString(); 
                            String id_encuestado =aplica.elementAt(6).toString();
                            String grupo = aplica.elementAt(7).toString();
                                   %>
            </p>
            <%if (i == 0 && iden.equals("168")) {%>

            <table width="90%" border="0" height="143" align="center" class="textocom">

                <tr>
                    <td>
                        <p align="left"><b>Apreciados Directivos</b>
                            <br><br>

                            Los invitamos a contestar la siguiente encuesta para el proceso de Autoevaluaci�n con fines de Renovaci�n de la Acreditaci�n de los programas acad�micos de pregrado.
                            <br>
                            Debido a que estas respuestas ser�n utilizadas para los programas que adelantan dicho proceso en el presente a�o,  les solicitamos amablemente contesten la encuesta, pensando en la globalidad de todos los programas de pregrado de la Escuela.
                            <br><br>
                            Les agradecemos sus aportes, los cuales contribuir�n en este proceso tan importante para la instituci�n

                    </td>
                </tr>
            </table>
            <% } else if (i == 0 && iden.equals("174") || (i == 0 && iden.equals("175")) || (i == 0 && iden.equals("177")) || (i == 0 && iden.equals("178")) || (i == 0 && iden.equals("179")) || (i == 0 && iden.equals("180")) || (i == 0 && iden.equals("181")) || (i == 0 && iden.equals("183")) || (i == 0 && iden.equals("184")) || (i == 0 && iden.equals("185")) || (i == 0 && iden.equals("186")) || (i == 0 && iden.equals("187"))) {%>

            <table width="90%" border="0" height="143" align="center" class="textocom">
                <tr>
                    <td>
                        <p align="left">En el marco del proceso de autorregulaci�n con fines de autoevaluaci�n para la renovaci�n del Registro Calificado del programa de
                            Ingenier�a Biom�dica el cual se realiza en convenio entre la Universidad del Rosario y la Escuela Colombiana de Ingenier�a Julio Garavito, 
                            la evaluaci�n que haga la comunidad sobre la calidad del programa es de gran importancia.<br><br>
                            Por este motivo, ha sido usted seleccionado para que desde el rol que desempe�e y teniendo en cuenta el conocimiento que tiene del programa de Ingenier�a Biom�dica, eval�e su calidad respondiendo la siguiente encuesta.
                            Es importante resaltar que la informaci�n que usted suministre es confidencial, se trata entonces de evaluar de manera objetiva las fortalezas y oportunidades de mejoramiento del programa.
                            <br><br>Por favor conteste todas las preguntas y si desconoce alguno de los temas o considera que no aplican, marque las opciones correspondientes.
                        <p><br><br>
                            Muchas gracias por su valiosa participaci�n.
                            <br><br>
                        </p>

                    </td>
                </tr>
            </table>
            <% } else if (i == 0 && iden.equals("200") || (i == 0 && iden.equals("201")) || (i == 0 && iden.equals("205")) || (i == 0 && iden.equals("206")) || (i == 0 && iden.equals("207")) || (i == 0 && iden.equals("209")) || (i == 0 && iden.equals("198")) || (i == 0 && iden.equals("204"))) {%>

            <table width="50%" border="0" height="143" align="center" class="textocom">
                <tr>
                    <td>
                        <p align="left">La Escuela y la Universidad del Rosario vienen adelantando el proceso de Autoevaluaci�n con fines de renovaci�n del Registro Calificado del programa de Ingenier�a Biom�dica ofrecido en convenio entre ambas instituciones. Por tal motivo, los invitamos a responder la siguiente encuesta. Su opini�n es muy importante para precisar fortalezas y oportunidades de mejoramiento sobre diferentes aspectos del Programa y la Instituci�n.
                            <br><br>
                            Es importante que se contesten todas las preguntas; en caso de que no haya conocimiento sobre algunos temas o considere que no aplique, marque las opciones correspondientes. Sus respuestas ser�n tratadas de forma CONFIDENCIAL.
                            <br><br>
                            Agradecemos su participaci�n.

                        </p>

                    </td>
                </tr>
            </table>

            <%} else if (i == 0 && !iden.equals("168")) {%>
            <table width="90%" border="0" height="143" align="center" class="textocom">
                <tr>
                    <td>
                            <font size="4" color="#800000"> Encuesta Institucional</font>
                            <br><br>
                    <p align="justify">El proceso de autoevaluaci�n Institucional es de car�cter participativo, integral, reflexivo, cr�tico y constructivo, y de acuerdo con el Modelo Integral de Autoevaluaci�n se realiza cada dos a�os. Con los aportes de todos los miembros de nuestra comunidad, se lograr� identificar las fortalezas y oportunidades tanto a nivel institucional, como de los programas acad�micos que se encuentran adelantando procesos de aseguramiento de la calidad.
                        <br>
                        A continuaci�n, encontrar� una serie de afirmaciones sobre temas de inter�s institucional. Por favor l�alas cuidadosamente y seleccione la opci�n de respuesta que m�s se ajuste a su opini�n. Si usted considera que la afirmaci�n no aplica para su caso o no conoce sobre ese aspecto, seleccione la opci�n correspondiente. Adem�s, si desea complementar su respuesta puede hacerlo en el espacio disponible ubicado debajo de cada afirmaci�n.
                        <br>
                        Sus respuestas ser�n tratadas en forma confidencial. 
                        Contamos con su valiosa y decidida participaci�n.

                    </p>
                        </p>

                    </td>
                </tr>
            </table>
            <%}%>
            <table  align="center" width="90%" border="0" height="37">
                <tr>
                    <td>
                        <%if (tipo.equals("E")){%>
                        <a href="FormatoEncuestaNuevo?iden=<%=iden%>&flag1=<%=estado%>&prog=<%=prog%>&descripcion=<%=codigo%>&tipo=<%=tipo%>&id_encuestado=<%=id_encuestado%>&tipo=<%=tipo%>"><%=prog%></a> 
                        <%} else {%>
                        <a class="menuprueba" bgcolor="FFFFFF" href="Asistencia?iden=<%=iden%>&flag1=<%=estado%>&prog=<%=prog%>&descripcion=<%=codigo%>&grupo=<%=grupo%>&tipo=<%=tipo%>&id_encuestado=<%=id_encuestado%>"><%=prog%></a> 
                        <%}%>
                    </td>
                </tr>
            </table>
            <p align="center">&nbsp;
            <p align="center">
                <%}%>
                <% } else {%>
            <p>
            <center>
                Gracias por su participaci�n.
            </center>
            <%}%>
            <!-- response.sendRedirect("Mensajes?idmsj=7");-->
            <h1>&nbsp;</h1>
            <h1 align="center">&nbsp;</h1>
            <div align="center"></div>
    </body>
</html>
