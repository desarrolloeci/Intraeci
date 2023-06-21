<%-- 
    Document   : ObservaTutores
    Created on : 5/04/2011, 11:54:06 AM
    Author     : lrodriguez
--%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        PrintWriter oout = response.getWriter();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        String carnet = request.getParameter("carnet");
        String periodo = empleado.getTercio();
        String idasig = request.getParameter("idasig");
        String peri = request.getParameter("per");
        String tercio = request.getParameter("tercio");
        String idgrupo = request.getParameter("idgrupo");
        String codg = request.getParameter("codg");
        String nota = request.getParameter("nota");
        String falla = request.getParameter("falla");
        String nombre = request.getParameter("nombre");
        String nomasig = request.getParameter("nomasig");
        String codasig = request.getParameter("codasig");
        int per = Integer.valueOf(periodo).intValue();
        int tipo= 2;
        %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Observaciones - Tutores</title>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function validar() {

                if((document.form1.obs.value == "" ||  document.form1.obs.value == "null") && (document.form1.obs1.value == "")){
                    alert("Por favor seleccione una observación o ingrese una nueva según el caso");
                    return false;
                }
            }
            //-->
        </script>

    </head>
    <body>
         <div class="container">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
           <jsp:param name="headerImg" value="banner.jpg" />
            
        </jsp:include>
        <form name="form1" method="post" action="GuardaObs">
             <input type="hidden" name="docu" value="<%=empleado.getDocumProf()%>">
            <input type="hidden" name="peri" value="<%=empleado.getPerHorario()%>">
            <input type="hidden" name="carnet" value="<%=carnet%>">
            <input type="hidden" name="peri" value="<%=peri%>">
            <input type="hidden" name="idasig" value="0">
            <input type="hidden" name="idgrupo" value="0">
            <input type="hidden" name="tercio" value="0">
            <input type="hidden" name="codg" value="0">
            <input type="hidden" name="nota" value="<%=nota%>">
            <input type="hidden" name="falla" value="<%=falla%>">
            <input type="hidden" name="nomasig" value="<%=nomasig%>">
            <input type="hidden" name="codasig" value="<%=codasig%>">
            <br>
  <table width="46%" border="0" class="textocom"  align="center">
    <tr> 
        <td width="14%"> Estudiante: </td>
      <td colspan="3">
          <p>&nbsp;</p>
          <p><b><%=nombre%></b> </p>
          <p>&nbsp;</p>
        </td>
    </tr>
    <br>
    <tr> 
        <td width="14%">
          <p>Observaci&oacute;n Estandar</p>
          </td>
      <td colspan="3"> 
          <p>&nbsp; </p>
          <p>
            <select name="obs"  class="textocom">
              <option value="">Seleccione de la lista o ingrese una nueva Observación</option>
              <option value="El estudiante no entra a clase">El estudiante no 
              entra a clase</option>
              <option value="Falta con frecuencia">Falta con frecuencia</option>
              <option value="Es de fuera de la ciudad y no se ha adaptado a las nuevas condiciones">Es 
              de fuera de la ciudad y no se ha adaptado a las nuevas condiciones</option>
              <option value="El estudiante no pone atenci&oacute;n">El estudiante 
              no pone atenci&oacute;n</option>
              <option value="No ha comprendido la metodologia, no prepara los ejercicios para la clase, y no hace los ejercicios">No 
              ha comprendido la metodolog&iacute;a, no prepara los ejercicios 
              para la clase, y no hace los ejercicios</option>
              <option value="No es constante preparando los temas de la clase">No 
              es constante preparando los temas de la clase</option>
              <option value="A&uacute;n no tiene metodolog&iacute;a de estudio">A&uacute;n 
              no tiene metodolog&iacute;a de estudio</option>
              <option value="Argumenta problemas de salud">Argumenta problemas 
              de salud</option>
              <option value="Requiere de ayuda fuera de clase">Requiere de ayuda 
              fuera de clase</option>
              <option value="No hace preguntas">No hace preguntas</option>
              <option value="Es indisciplinado">Es indisciplinado</option>
            </select>
          </p>
          <p>&nbsp; </p>
        </td>
    </tr>
    <tr> 
        <td width="14%">
          <p>&nbsp;</p>
          <p>Observaci&oacute;n Manual</p>
          <p>&nbsp;</p>
        </td>
      <td colspan="3"> 
        <input type="text" name="obs1" size="120" value="" maxlength="120">
      </td>
    </tr>
    <tr> 
        <td width="14%">Activar Alarma</td>
        <td width="8%"> 
          <p>NO : 
          <input type="radio"  CHECKED name="alarma" value="N">
        </p>
      </td>
      <td width="30%">SI: &nbsp; 
        <input type="radio" name="alarma" value="S">
      </td>
      <td width="48%"> 
        <p>&nbsp; </p>
        <p> 
          <input type="submit" name="Submit" value="Ingresar Observaciones" onClick="javascript: return validar();">
        </p>
        <p>&nbsp; </p>
      </td>
    </tr>
   </table>
          
    <table  border ="1"  align="center" class="textocom" width="714">
      <%Vector alarma = profesor.Alarmas(carnet, tercio, idasig, empleado.getPerHorario(), tipo);%>
      <tr>
        <td width="66%"> 
          <p>&nbsp;</p>
        <p>OBSERVACIONES REGISTRADAS</p>
        <p>&nbsp;</p>
        </td>
        <td width="34%"> 
          <div align="center">ALARMAS </div>
      </td>
    </tr>
         
           <% if (alarma.size()>0){%>
        <% for (int j = 0; j < alarma.size(); j++) {
                 Vector datos = (Vector) alarma.elementAt(j);%>
        <br>
         <tr> 
        <td width="66%"> 
          <div align="left"> 
        <%=datos.elementAt(1)%> 
          </div>
      </td>
        <td width="34%"> 
          <%if (datos.elementAt(0).equals("S")){%>
          <div align="center"> SI </div>
        <%}else if (datos.elementAt(0).equals("N")){%>
         <div align="center"> NO </div>
        <%  }%>
         </tr>
        <%}
           }else{%>
           <tr>
      <td colspan="2">
            No existen OBSERVACIONES registradas en el sistema. 
      </td>
           </tr>
           
        <%}%>
        
         </table>
    
        <div align="center"> 
          <jsp:include page="piepag"> 
          <jsp:param name="anterior" value="Tutor" />
          </jsp:include>
        </div>
     
        </form>
         </div>
    </body>
</html>
