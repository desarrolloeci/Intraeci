<%-- 
    Document   : CursoMoodle
    Created on : 22/10/2010, 02:29:25 PM
    Author     : Juan Pablo Garcia
--%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    //response.sendRedirect("https://serviciosti.escuelaing.edu.co/USDKV8/#/login/1");
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    Vector asignaturas = profesor.getAsignaturasLabs(empleado.getPeriodo(), empleado.getIdProf());
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Curso Moodle</title>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <style type="text/css">
            select,option{
                width: 320px;
            }
        </style>
        <script language="JavaScript" type="text/JavaScript">
            function enviar(form){
            if(form.categoria.value == "null"){
            alert("Seleccione la Categoria");
            return false;
            }else if(form.asignatura.value == "null"){
            alert("Seleccione la Asignatura");
            return false;
            }else if(form.clave.value==""){
            alert("No ha diligenciado la Clave");
            return false;
            }else{
            return true;
            }
            }
        </script>
    </head>
    <body background="img/fondo.gif" onLoad="preloadImg()">
        <div class="container">
            <p class="textocom">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>

            <table width="640" border="0" align="center" cellspacing="0">
                <tr class="textocom">
                    <td height="22">
                        <div align="center"><br>
                            <form name="formulario" method="post" action="EnviaSolicitudMoodle">
                                <table width="450" border="0" class="textocom">
                                    <tr>
                                        <td width="200">
                                            <div align="left"><strong>Categor�a :</strong></div>
                                        </td>
                                        <td width="11">&nbsp;</td>
                                        <td width="137">
                                            <select name="categoria" class="campotext">
                                                <option value="null" selected>Seleccione</option>
                                                <option value="Administracion">Administraci�n</option>
                                                <option value="Bienestar Universitario">Bienestar Universitario</option>
                                                <option value="Ciencias Basicas">Ciencias B�sicas</option>
                                                <option value="Economia">Econom�a</option>
                                                <option value="Editorial Escuela Colombiana de Ingenieria">Editorial Escuela Colombiana de Ingenier�a</option>
                                                <option value="Especializacion de vias y transporte">Especializaci�n de v�as y transporte</option>
                                                <option value="Especializacion en Economia">Especializaci�n en Econom�a</option>
                                                <option value="Especializacion en Telematica">Especializaci�n en Telem�tica</option>
                                                <option value="Humanidades">Humanidades</option>
                                                <option value="Ingenieria Biomedica">Ingenier�a Biom�dica</option>
                                                <option value="Ingenieria Civil">Ingenier�a Civil</option>
                                                <option value="Ingenieria de Sistemas">Ingenier�a de Sistemas</option>
                                                <option value="Ingenieria Electrica">Ingenier�a El�ctrica</option>
                                                <option value="Ingenieria Electronica">Ingenier�a Electr�nica</option>
                                                <option value="Ingenieria Industrial">Ingenier�a Industrial</option>
                                                <option value="Ingenieria Mecanica">Ingenier�a Mec�nica</option>
                                                <option value="Maestria Desarrollo y Gerencia Integral de Proyectos">Maestr�a Desarrollo y Gerencia Integral de Proyectos</option>
                                                <option value="Maestria Gesti�n de Informaci�n">Maestr�a Gesti�n de Informaci�n</option>
                                                <option value="Maestria Ingenieria Civil">Maestr�a de Ingenier�a Civil</option>
                                                <option value="Maestria Ingenieria Electr�nica">Maestr�a en Ingenier�a Electr�nica</option>                                         
                                                <option value="Maestria Ingenier�a Industrial">Maestr�a Ingenier�a Industrial</option>
                                                <option value="Miscellaneous">Miscellaneous</option>
                                                <option value="Oficina de Desarrollo Institucional">Oficina de Desarrollo Institucional</option>
                                                <option value="Proyectos y Gerencia de Proyectos">Proyectos y Gerencia de Proyectos</option>
                                                <option value="Recursos Humanos">Recursos Humanos</option>
                                                <option value="Unidad de Gesti�n Externa">Unidad de Gesti�n Externa</option>
                                                <option value="Unidad de Proyectos">Unidad de Proyectos</option>
                                                <option value="Vicerrectoria Academica">Vicerrectoria Acad�mica</option>
                                                <option value="Graduados">Graduados</option>
                                                <option value="Especializaci�n en Gesti�n Integrada QSHE">Especializaci�n en Gesti�n Integrada QSHE</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="200">
                                            <div align="left"><strong>Asignatura :</strong></div>
                                        </td>
                                        <td width="11">&nbsp;</td>
                                        <td width="137">
                                            <select name="asignatura" class="campotext">
                                                <option value="null" selected>Seleccione</option>
                                                <%
                                                    for (int i = 0; i < asignaturas.size(); i++) {
                                                        Vector asignatura = (Vector) asignaturas.elementAt(i);
                                                %>
                                                <option value="<%=asignatura.elementAt(3)%> - <%=asignatura.elementAt(0)%> - <%=asignatura.elementAt(1)%>">
                                                    <%=asignatura.elementAt(3)%> - <%=asignatura.elementAt(0)%> - <%=asignatura.elementAt(1)%></option>
                                                    <%
                                                        }
                                                    %>
                                                <option value="Otros" selected>Otros</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="200">
                                            <div align="left"><strong>Contrase�a para inscripci�n al curso:</strong></div>
                                        </td>
                                        <td width="11">&nbsp;</td>
                                        <td width="137">
                                            <input name="clave" type="text" class="campotext" id="clavenume" size="60">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="50%">
                                            <div align="left"><%--<strong>Matricular Estudiantes :</strong>--%> </div>
                                        </td>
                                        <td width="25%">&nbsp;</td>
                                        <td width="25%">
                                            <div align="left" style="display:none">
                                                <table width="100%" border="0">
                                                    <tr>
                                                        <td width="50%" class="textocom"><div align="center">
                                                                <label><strong>Si</strong></label>
                                                                <input type="radio" name="estudiantes" value="1">
                                                            </div>
                                                        </td>
                                                        <td width="50%">
                                                            <div align="center">
                                                                <label><strong>No</strong></label>
                                                                <input type="radio" name="estudiantes" value="0" checked="checked">
                                                            </div></td>
                                                    </tr>                                           
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="200">
                                            <div align="left"><strong>Observaciones:</strong></div>
                                        </td>
                                        <td width="11">&nbsp;</td>
                                        <td width="137">
                                            <textarea name="observ" cols="35" rows="4"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="30" colspan="3">
                                            <div align="center">
                                                <input type="submit" name="Submit5" value="Enviar Solicitud" class="boton" onclick="javascript: return enviar(this.form)">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </td>
                </tr>
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