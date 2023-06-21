<%-- 
    Document   : EncuestasOtros
    Created on : 10/02/2015, 10:36:04 AM
    Author     : Lucero
--%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>


<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.text.*, java.net.*;" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties,java.lang.reflect.Array " %>

<%inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    String cedula = request.getParameter("cedula");
    Vector Datos = admin.DatosEncuestas(cedula);
    String dato = "";%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Encuestas Autoevaluación con fines de Acreditación Institucional</title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/encuestaODI.css" rel="stylesheet" type="text/css" media="all"/>
    </head>
    <body>
        <div id="container">
            <header>
            </header>

            <p class="textocom">&nbsp;</p>          
            <p>&nbsp;</p>
            <p>
                <% if (Datos.size() > 0) {

                        for (int i = 0; i < Datos.size(); i++) {
                            Vector aplica = (Vector) Datos.elementAt(i);
                            String iden = aplica.elementAt(1).toString();
                         //   String flag1 = aplica.elementAt(2).toString();
                             String estado = aplica.elementAt(2).toString();
                            String prog = aplica.elementAt(3).toString();
                            String codigo = aplica.elementAt(4).toString();
                            String tipo = aplica.elementAt(5).toString(); 
                            String id_encuestado =aplica.elementAt(6).toString();
                            String grupo = aplica.elementAt(7).toString();%>
                     
            </p>
            <%if (i == 0 && iden.equals("168")) {%>
            <div align="center">
                <table width="100%" border="0" height="143"  class="textocom">
                    <tr>
                        <td>
                            <p align="left"><b>Apreciados Directivos</b>
                                <br><br>

                                Los invitamos a contestar la siguiente encuesta para el proceso de Autoevaluación con fines de Renovación de la Acreditación de los programas académicos de pregrado.
                                <br>
                                Debido a que estas respuestas serán utilizadas para los programas que adelantan dicho proceso en el presente año,  les solicitamos amablemente contesten la encuesta, pensando en la globalidad de todos los programas de pregrado de la Escuela.
                                <br><br>
                                Les agradecemos sus aportes, los cuales contribuirán en este proceso tan importante para la institución

                        </td>
                    </tr>
                </table>
            </div>

            <% } else if (i == 0 && iden.equals("174") || (i == 0 && iden.equals("175")) || (i == 0 && iden.equals("177")) || (i == 0 && iden.equals("178")) || (i == 0 && iden.equals("179")) || (i == 0 && iden.equals("180")) || (i == 0 && iden.equals("181")) || (i == 0 && iden.equals("183")) || (i == 0 && iden.equals("184")) || (i == 0 && iden.equals("185")) || (i == 0 && iden.equals("186")) || (i == 0 && iden.equals("187"))) {%>
            <div align="center">
                <table width="100%" border="0" height="143"  class="textocom">
                    <tr>
                        <td>
                            <p align="left">En el marco del proceso de autorregulación con fines de autoevaluación para la renovación del Registro Calificado del programa de
                                Ingeniería Biomédica el cual se realiza en convenio entre la Universidad del Rosario y la Escuela Colombiana de Ingeniería Julio Garavito, 
                                la evaluación que haga la comunidad sobre la calidad del programa es de gran importancia.<br><br>
                                Por este motivo, ha sido usted seleccionado para que desde el rol que desempeñe y teniendo en cuenta el conocimiento que tiene del programa de Ingeniería Biomédica, evalúe su calidad respondiendo la siguiente encuesta.
                                Es importante resaltar que la información que usted suministre es confidencial, se trata entonces de evaluar de manera objetiva las fortalezas y oportunidades de mejoramiento del programa.
                                <br><br>Por favor conteste todas las preguntas y si desconoce alguno de los temas o considera que no aplican, marque las opciones correspondientes.
                            <p><br><br>
                                Muchas gracias por su valiosa participación.
                                <br><br>
                            </p>

                        </td>
                    </tr>
                </table>
            </div>
            <% } else if (i == 0 && iden.equals("200") || (i == 0 && iden.equals("201")) || (i == 0 && iden.equals("205")) || (i == 0 && iden.equals("206")) || (i == 0 && iden.equals("207")) || (i == 0 && iden.equals("209")) || (i == 0 && iden.equals("198")) || (i == 0 && iden.equals("204"))) {%>
            <div align="center">
                <table width="100%" border="0" height="143" class="textocom">
                    <tr>
                        <td>
                            <p align="left">La Escuela y la Universidad del Rosario vienen adelantando el proceso de Autoevaluación con fines de renovación del Registro Calificado del programa de Ingeniería Biomédica ofrecido en convenio entre ambas instituciones. Por tal motivo, los invitamos a responder la siguiente encuesta. Su opinión es muy importante para precisar fortalezas y oportunidades de mejoramiento sobre diferentes aspectos del Programa y la Institución.
                                <br><br>
                                Es importante que se contesten todas las preguntas; en caso de que no haya conocimiento sobre algunos temas o considere que no aplique, marque las opciones correspondientes. Sus respuestas serán tratadas de forma CONFIDENCIAL.
                                <br><br>
                                Agradecemos su participación.

                            </p>

                        </td>
                    </tr>
                </table>
            </div>
            <%} else if (i == 0 && !iden.equals("168")) {%>
            <div align="center">
                <table width="90%" border="0" height="143" align="center" class="textocom">
                <tr>
                    <td>
                            <font size="4" color="#800000"> Encuesta Institucional Autoevaluación</font>
                            <br><br>
                    <p align="justify">El proceso de Autoevaluación Institucional es de carácter participativo, integral, reflexivo, crítico y constructivo. 
                        Con los aportes de todos los miembros de nuestra comunidad, la Escuela Colombiana de Ingeniería logrará identificar las fortalezas y oportunidades 
                        de mejora institucionales y de los programas académicos, así como la formulación de nuevos planes y acciones que nos mantengan a la vanguardia en todos los ámbitos de la Educación Superior.<br><br>
                        A continuación encontrará una serie de afirmaciones sobre temas de interés institucional. Por favor léalas cuidadosamente y seleccione la opción de respuesta que más 
                        se ajuste a su opinión. Si usted considera que la afirmación no aplica para su caso o no conoce sobre ese aspecto, 
                        seleccione la opción correspondiente. Además, si desea complementar su respuesta,  puede hacerlo en el espacio disponible ubicado debajo de cada afirmación.
                        <br><br>
                        Sus respuestas serán tratadas en forma confidencial. Contamos con su valiosa y decidida participación para el éxito de éste proceso.<br><br>
                    </p>
                        </p>

                    </td>
                </tr>
            </table>
            </div>
            <%}%>
            
             <table  align="center" width="80%" border="0" height="37">
                <tr>
                    <td>
                        <%if (tipo.equals("E")){%>
                        <a class="menuprueba" bgcolor="FFFFFF" href="FormatoEncuestaotros?iden=<%=iden%>&flag1=<%=estado%>&prog=<%=prog%>&descripcion=<%=codigo%>&tipo=<%=tipo%>&id_encuestado=<%=id_encuestado%>&cedula=<%=cedula%>"><%=prog%></a> 
                        <%} else {%>
                        <a class="menuprueba" bgcolor="FFFFFF" href="Asistencia?iden=<%=iden%>&flag1=<%=estado%>&prog=<%=prog%>&descripcion=<%=codigo%>&grupo=<%=grupo%>&tipo=<%=tipo%>&id_encuestado=<%=id_encuestado%>&cedula=<%=cedula%>"><%=prog%></a> 
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
                No se encuentra habilitado para este proceso. Gracias por su participación.
            </center>
            <%}%>
            <!-- response.sendRedirect("Mensajes?idmsj=7");-->
                   </div>
                       <div id="container">
                           <center>
            <table align="center" width="220">
                <tr>

                    <td> 
                        <div align="right">
                            <input class="boton" type="submit" name="Submit" value= " SALIR " onClick="window.location='http://www.escuelaing.edu.co'">
                        </div>
                    </td>
                </tr>
            </table>
                           </center>
                           
        </div>

    </body>
</html>
