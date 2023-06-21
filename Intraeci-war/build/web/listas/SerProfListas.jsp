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
            //Vector asignaturas = profesor.getAsignaturasLabs("2015-I", empleado.getIdProf());
            Vector asignaturas = profesor.getAsignaturasLabs(empleado.getPerHorario(), empleado.getIdProf());
            String periodo = request.getParameter("paramtext");
            String per=empleado.getPerHorario();
            String grupo = request.getParameter("idgrupo");
            Vector tercio = new Vector();
        %>
        <title>Listas de Clase</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="JavaScript" type="text/JavaScript">

            
            function enviarexcel(){
            if(document.formulario.idgrupo.value == "null"){
            alert("Seleccione el grupo");
            return false;
            }else{
            if(document.formulario.rbOpcCorreo[0].checked){
            document.formulario.target = "";
            document.formulario.action = "Listassincorreos?formato=excel";
            return true;
            }else if(document.formulario.rbOpcCorreo[1].checked){
            alert("Seleccione la opción sin correo para exportar a excel");
            return false;
            }
            }
            }

            function enviar(){
            if(document.formulario.idgrupo.value == "null"){
            alert("Seleccione la asignatura -grupo");
            return false;
            }
            if(document.formulario.rbOpcCorreo[0].checked){
            document.formulario.target = "Sincorreos";
            document.formulario.action = "Listassincorreos";
            window.open("", "Sincorreos", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
            document.formulario.submit();
            return false;
            }else if(document.formulario.rbOpcCorreo[1].checked){
            document.formulario.target = "Correos";
            document.formulario.action = "ListasCorreos";
            return true;
            }else{
            alert("Debe ingresar una opción. Sin correos o con correos.");
            return false
            }
            }
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
            <table width="819" border="0" align="center" cellspacing="0">
                <tr class="textocom">
                    <td height="22">
                        <div align="center">
                            <form name="formulario" method="post" action="">
                                <input type="hidden" name="periodo" id="periodo" value="<%=per%>"/>
                                <table width="310" border="0" bordercolor="#B70404" class="textocom">
                                    <tr>
                                        <td width="155" height="34"><div align="right"><strong>Asignatura :</strong></div></td>

                                        <td width="145">
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
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td height="33" colspan="4">
                                            <div align="center"><b>Sin Correos</b>
                                                <input type="radio" checked name="rbOpcCorreo" value="1">
                                                <b>Con correos</b>
                                                <input type="radio" checked name="rbOpcCorreo" value="2">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="46">
                                            <div align="right">
                                                <input type="submit" name="Submit" value="Consultar" class="boton" onclick="javascript: return enviar()">
                                            </div></td>
                                        <td>
                                            <div align="left">
                                                <input type="reset" name="Submit2" value="Limpiar" class="boton">
                                            </div></td>
                                    </tr>
                                    <tr>
                                        <td height="25" colspan="2"><div align="center">
                                                <input type="submit" name="Submit5" value="Exportar notas a Excel" class="boton" onclick="javascript: return enviarexcel()">
                                            </div></td>
                                    </tr>
                                </table>
                            </form>
                        </div></td>
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
