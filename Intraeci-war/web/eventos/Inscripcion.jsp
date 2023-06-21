<%-- 
    Document   : InscripcionPI
    Created on : 9/05/2012, 10:31:58 AM
    Author     : lrodriguez
--%>

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
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
// Vector asignaturas = profesor.getAsignaturas(empleado.getPerHorario(), empleado.getIdProf());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Inscripción Cursos Periodo Intermedio</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="JavaScript" type="text/JavaScript">

            /*------------------------------------------------------------------
            function Validar Eliminacion del CheckBox
            ------------------------------------------------------------------*/
            function ValidarChk(){
            var max = document.fmArchivos.checEli.length
            var vall = false
            var k = 0
            for ( i=0 ; i<max ; i++ ){
            if  (document.fmArchivos.checEli[i].checked == true) {
            vall =true
            k++ ;
            }
            }
            if ( k > 1 )
            alert("Solo puede seleccionar un campo")
            else if ((vall == true))
            document.fmArchivos.submit()
            else
            if ((vall == false) && (document.fmArchivos.checEli.checked == true) )
            document.fmArchivos.submit()
            else
            alert ("Para eliminar tiene que seleccionar algun recurso")

            //else {
            //document.fmArchivos.submit()
            //document.fmArchivos.submit()
            //}
            }
            /*-----------------------------------------------------------------
            function Validar el CheckBox que selecciona a todos
            ------------------------------------------------------------------*/
            function chkAll(){
            var max = document.fmArchivos.checEli.length
            var vall
            if (document.fmArchivos.chAll.checked == true)
            vall = true
            else
            vall = false
            for ( i=0 ; i<max ; i++ ){
            document.fmArchivos.checEli[i].checked = vall
            }
            }
            /*------------------------------------------------------------------
            function Validar Cada check box
            ------------------------------------------------------------------*/
            function chkUn(){
            var max = document.fmArchivos.checEli.length
            var vall = true
            if (document.fmArchivos.chAll.checked == true)
            document.fmArchivos.chAll.checked = false
            for ( i=0 ; i<max ; i++ ){
            vall = vall && document.fmArchivos.checEli[i].checked
            }
            if (vall == true)
            document.fmArchivos.chAll.checked = true
            }
            //-->
        </script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
    </head>

    <body background="img/fondo.gif" onLoad="preloadImg()">
        <div class="container">
            <p class="textocom" align="center">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />

            </jsp:include>

            <table width="100%" border="1" id="tablaboton" align="center" class="textocom">
                <!--jsp:param name="titulo" value="Inscripción a cursos Periodo Intermedio" /-->
                <form name="fmArchivos" method="post" action="Eliminacurso">
                    <!--empleado.getPerHorario() periodo "2019-I"  para PI-->
                    <%  Vector inscritosemp = admin.EventosInscritos(empleado.getPerHorario(), empleado.getIdemp());
                        // Vector inscritosemp = admin.EventosInscritos(empleado.getIdemp());%>

                    <%if (inscritosemp.size() > 0) {%>
                    <tr>
                        <td colspan="3"><b>Usted se encuentra preinscrito a los siguientes cursos:</b></td>
                        <td>Salón</td>
                    </tr>
                    <% Vector cursoi = new Vector();
                        if (inscritosemp.size() > 0) {
                            for (int j = 0; j < inscritosemp.size(); j++) {
                                cursoi = (Vector) inscritosemp.elementAt(j);%>
                    <tr>
                        <td>
                            <input type="checkbox" name="checEli" onClick="chkUn()"  value="<%=cursoi.elementAt(0)%>*<%=cursoi.elementAt(1)%>">
                        </td>
                        <td><%=j + 1%> </td>
                        <td><%=cursoi.elementAt(1)%></td>
                        <td><%=cursoi.elementAt(2)%> </td>
                    </tr>
                    <%}%>
                    <tr>
                        <td width="40%" colspan="4">
                            <div align="center">
                                <input type="button" name="Submit"  onClick="ValidarChk()" value="Cancelar Inscripción" class="boton">
                            </div>
                        </td>
                    </tr>
                    <%  }
                        }%>
                </form>
                <%Vector departa = new Vector();
                    //empleado.getPerHorario()/"2019-I"
                    Vector deptos = admin.departamentos(empleado.getPerHorario());%>
                <form name="formulario" method="post" action="Inscrito">
                    <tr>
                        <td colspan="4">
                            <p>&nbsp;</p>
                            <p>Seleccione la dependencia que quiere consultar:
                                <select name="dpto" class="campotext">
                                    <option value="0" Selected><font size="3">Seleccione</font></option>
                                    <%   for (int j = 0; j < deptos.size(); j++) {
                                            departa = (Vector) deptos.elementAt(j);%>
                                    <option value="<%=departa.elementAt(0)%>"><font size="3"><%=departa.elementAt(1)%></font></option>
                                    <%
                                        }%>
                                </select>
                            </p>
                            <p align="center">
                                <input type="submit" name="Submit2" value="Enviar">
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div align="center"> </div>
                        </td>
                    </tr>
                </form>

            </table>

            <div align="center">
                <jsp:include page="piepag">
                    <jsp:param name="anterior" value="Menu" />
                </jsp:include>
            </div>

        </div>
    </body>
</html>
