<%-- 
    Document   : DesarrolloProf
    Created on : 3/08/2015, 10:02:24 AM
    Author     : Lucero
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
            String dpto = "126";
// Vector asignaturas = profesor.getAsignaturas(empleado.getPerHorario(), empleado.getIdProf());
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <title>Inscripción Cursos Periodo Intermedio</title>

        <script language="JavaScript" type="text/JavaScript">
        
            function comprueba( ){

                if (!document.forms.formulario.medio.checked ) {
                    alert("Por favor seleccione el curso al que desea inscribirse");
                    return false;

                    return true;
                }

        </script>
        
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
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">

    </head>

    <body>
        <p class="textocom" align="center">&nbsp;</p>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="Inscripción a cursos Periodo Intermedio" />
        </jsp:include>
         <table width="50%" border="1" id="tablaboton" align="center" class="textocom">
            <form name="fmArchivos" method="post" action="EliminacursoVice">
                <!--CAMBIAR PARA INTERSEMESTRAL  empleado.getPerHorario() periodo "2020-I"  para PI-->
                <%  Vector inscritosemp = admin.EventosInscritos(empleado.getPerHorario(), empleado.getIdemp());
                           // Vector inscritosemp = admin.EventosInscritos(empleado.getIdemp());%>

                <%if (inscritosemp.size() > 0) {%>
                <tr>
                    <td colspan="3"><b>Usted se encuentra preinscrito a los siguientes cursos:</b></td>
                    <td>Salón</td>
                </tr>
                <% Vector cursoi = new Vector();
                    if (inscritosemp.size() > 0) {
                        
                        for (int j = 0; j < inscritosemp.size();
                                j++) {
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
         </table>
        <!--CAMBIAR PARA INTERSEMESTRAL "2020-I" empleado.getPerHorario()-->
        <%Vector curso = admin.InscripEventosVice(dpto, empleado.getPerHorario());%>
        <%  if (curso.size() <= 0) {%>
        <center> No hay programación de cursos disponibles en el momento.</center>
        <p>

            <%} else {%>

        <p><center>Seleccione el curso al cual desea inscribirse : </center></p>

    <table width="50%" border="1" id="tablaboton" align="center" class="textocom">
        <form name="formulario" method="post" action="RespuestaInscripcionVice">
            <input name="nombres" type="hidden" id="nombres" value="<%=empleado.getNomemp()%>">
            <input name="ape" type="hidden" id="ape" value="<%=empleado.getApeemp()%>">
            <input name="doc" type="hidden" id="doc" value="<%=empleado.getIdProf()%>">
            <input name="vinculo" type="hidden" id="vinculo" value="PROF">

            <tr>
                <td><b>Nombre del curso</b></td>
                <td><b>Profesor:</b></td>
                <td><b>Horario</b></td>
                <td><b>Lugar</b></td>
                <td><b>Fec.Ini.</b></td>
                <td><b>Fec.Fin.</b></td>

                <td><b>Seleccione</b></td>
            <p>
                <%   Vector cursos = new Vector();

                      for (int x = 0; x < curso.size(); x++) {
                          cursos = (Vector) curso.elementAt(x);%>

            </p>
            </tr>
            <tr>
                <td><%=cursos.elementAt(1)%></td>
                <td><%=cursos.elementAt(9)%></td>
                <td><%=cursos.elementAt(8)%></td>
                <td><%=cursos.elementAt(4)%></td>
                <td><%=cursos.elementAt(2)%></td>
                <td><%=cursos.elementAt(3)%></td>
                <td>
                    <input type="radio" name="medio" value="<%=cursos.elementAt(0)%>-<%=cursos.elementAt(5)%>">
                </td>
            </tr>
            <%
                            }
                        }%>
            <tr>
                <td colspan="8">
                    <div align="center">
                        <input type="submit" name="Submit" value="Inscribirse">
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                    <div align="right">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="Inscrito" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </form>
    </table>

</body>
</html>
