<%--
    Document   : Institucional
    Created on : 5/06/2013, 10:55:39 AM
    Author     : Lucero
--%>
<%@ include file="secureprof.jsp" %>
<%@ page import="javax.naming.*,
                 javax.rmi.PortableRemoteObject,
                 login.InicioProfRemoteBusiness,
                 login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
<head>
<%
    HttpSession sesion;
    response.setHeader("Cache-Control","no-cache");
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
  //  Vector asignaturas = profesor.getAsignaturasLabs("2012-I", empleado.getIdProf());
    Vector asignaturas = profesor.getAsignaturasLabs(empleado.getPerHorario(), empleado.getIdProf());
    String periodo = request.getParameter("paramtext");
    String grupo = request.getParameter("idgrupo");
    Vector tercio = new Vector();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Documentos Institucionales</title>
         <link href="css/forms.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/tablas.css"/>
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
         <script language="JavaScript" type="text/JavaScript">
         function enfocar(){
                window.focus();
                preloadImg();
            }
                 </script>
         <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body onLoad="enfocar()">
         <div class="container">
       <p class="textocom">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
    
<table width="100%" border="0" align="center" >
  <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/estatutos/AnexosInformeGestion2011.pdf" TARGET="blank"><font color="#000000">Anexos 
      Informe de Gesti&oacute;n 2011</font></a></td>
  </tr>
  <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/estatutos/BoletinEstadistico2008-2014.pdf" TARGET="blank"><font color="#000000">Bolet&iacute;n
      Estad&iacute;stico 2008-2014</font></a></td>
  </tr>
  <tr>
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/estatutos/Boletin_estadistico_2010_2016.pdf" TARGET="blank"><font color="#000000">Boletín Estadístico 2010-2016</font></a></td>
  </tr>
  <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/estudiantes/ConsultaBoletinProfesor?evsesion=8600348113" TARGET="blank"><font color="#000000">Boletines 
      Consejo Directivo</font></a></td>
  </tr>
 <!-- <tr>
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/EstatutosGeneralesdelaEscuela.pdf" TARGET="blank"><font color="#000000">Estatutos 
      Generales de la Escuela</font></a></td>
  </tr>
  <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/estatutos/ESTATUTOS_DE_PROFESORES_V5.pdf" TARGET="blank"><font color="#000000">Estatutos
      de Profesores-Pol&iacute;ticas y procedimientos</font></a></td>
  </tr>-->
  
  <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/estatutos/InformeGestion2013.pdf" TARGET="blank"><font color="#000000">Informe
      de Gesti&oacute;n 2013</font></a></td>
  </tr>
  <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/estatutos/InformeGestion2014.pdf" TARGET="blank"><font color="#000000">Informe
      de Gesti&oacute;n 2014</font></a></td>
  </tr>
   <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/estatutos/InformeGestion2015.pdf" TARGET="blank"><font color="#000000">Informe
      de Gesti&oacute;n 2015</font></a></td>
  </tr>
   <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/estatutos/InformeGestion2016.pdf" TARGET="blank"><font color="#000000">Informe
      de Gesti&oacute;n 2016</font></a></td>
  </tr>
   <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/estatutos/InformeGestion2016Digital.pdf" TARGET="blank"><font color="#000000">Informe
      de Gesti&oacute;n 2016 Versión Digital</font></a></td>
  </tr>
  <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/estatutos/InformeGestion2017.pdf" TARGET="blank"><font color="#000000">Informe
      de Gesti&oacute;n 2017 </font></a></td>
  </tr>
  <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/estatutos/InformeGestion2018.pdf" TARGET="blank"><font color="#000000">Informe
      de Gesti&oacute;n 2018 </font></a></td>
  </tr>
    <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/estatutos/InformeGestion2022.pdf" TARGET="blank"><font color="#000000">Informe
      de Gesti&oacute;n 2022 </font></a></td>
  </tr>
  
  
  
  
  
   <!-- <tr>
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/Lineamientoscurriculares2013.pdf" TARGET="blank"><font color="#000000">Lineamientos Curriculares 2013 </font></a></td>
  </tr>
  <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/OrganigramadelaEscuela.pdf" TARGET="blank"><font color="#000000">Organigrama 
      de la Escuela</font></a></td>
  </tr>-->
  <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/PersoneriaJuridicadelaEscuela.pdf" TARGET="blank"><font color="#000000">Personer&iacute;a 
      Jur&iacute;dica de la Escuela</font></a></td>
  </tr>
  <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/ReglamentoHigieneSeguridaddelaEscuela.pdf" TARGET="blank"><font color="#000000">Reglamento 
      de Higiene y Seguridad Industrial de la Escuela</font></a></td>
  </tr>
  
  <tr> 
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/Reglamentodetrabajo.pdf" TARGET="blank"><font color="#000000">Reglamento 
      de trabajo</font></a></td>
  </tr>
  <tr>
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/PlandeDesarrollo2010-2020.pdf" TARGET="blank"><font color="#000000">Plan
      de desarrollo 2010-2020 Resumido</font></a></td>
  </tr>
   <tr>
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/2016_2025_Plan_Desarrollo.pdf" TARGET="blank"><font color="#000000">Plan de Desarrollo 2016-2025</font></a></td>
  </tr>
  <tr>
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/PoliticasPropiedadIntelectualECI.pdf" TARGET="blank"><font color="#000000">Políticas
      Propiedad Intelectual </font></a></td>
  </tr>
  
  <tr>
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/POLITICACONSERVACIONPRUEBASYEVALUACIONESACADEMICASDEESTUDIANTES.pdf" TARGET="blank"><font color="#000000"> Política de conservación de pruebas 
            y evaluaciones de estudiantes </font></a></td>
  </tr>
  <tr>
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/Membrete_Escuela.docx" TARGET="blank"><font color="#000000"> Membrete para comunicaciones institucionales </font></a></td>
  </tr>
  
  <!--tr>
    <td colspan="2" class="menuprueba"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/reglamentacionviajes.pdf" TARGET="blank"><font color="#000000"> Reglamentación de viajes internacionales </font></a></td>
  </tr-->
   <tr>
                <td colspan="3">
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
