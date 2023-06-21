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
            Vector asignaturas = profesor.getListaspos(empleado.getIdProf());
            String periodo = request.getParameter("paramtext");
            String grupo = request.getParameter("idgrupo");
            Vector tercio = new Vector();
        %>
        <title>Consultar Listas de Clase Posgrado</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="JavaScript" type="text/JavaScript">


            <!--
            function enviarexcel(){
            if(document.formulario.idgrupo.value == "null"){
            alert("Seleccione el grupo");
            return false;
            }else{
            if(document.formulario.rbOpcCorreo[0].checked){
            document.formulario.target = "";
            document.formulario.action = "ListasPosSinCorreos?formato=excel";
            return true;
            }else if(document.formulario.rbOpcCorreo[1].checked){
            alert("Seleccione la opción sin correo para exportar a excel");
            return false;
            }
            }
            }

            function enviar()                                                                                                                                                                                                                                                                                          {
            if(document.formulario.idgrupo.value == "null"){
            alert("Seleccione la asignatura -grupo");
            return false;
            }if(document.formulario.rbOpcCorreo[0].checked){
            document.formulario.target = "Sincorreos";
            document.formulario.action = "ListasPosSinCorreos";
            window.open("", "Sincorreos", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
            document.formulario.submit();
            return false;
            }else if(document.formulario.rbOpcCorreo[1].checked){
            document.formulario.target = "Correos";
            document.formulario.action = "ListasPosCorreos";
            return true;
            }else{
            alert("Debe ingresar una opción. Sin correos o con correos.");
            return false
            }
            }

            //-->
        </script>

        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
    </head>
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
                        <div align="center"></div>

                        <% if (asignaturas.size() <= 0) {
                                out.println("<p>");
                                out.println("<center><b>Usted NO tiene grupos asignados</b></center>");
                            } else { %>
                        <form name="formulario" method="post" action="">

                            <table width="47%" border="0" align="center" bordercolor="#B70404" class="textocom">
                                <tr> 
                                    <td colspan="2" bordercolor="#B70404" height="34"> 
                                        <div align="center"><b>Asignatura-Grupo: </b> 
                                            <select name="idgrupo" class="campotext">
                                                <option value="null">Seleccione</option>
                                                <% for (int i = 0; i < asignaturas.size(); i++) {
                            Vector asignatura = (Vector) asignaturas.elementAt(i);%>
                                                <option value="<%=asignatura.elementAt(2)%>|<%=asignatura.elementAt(0)%>|<%=asignatura.elementAt(1)%>|<%=asignatura.elementAt(3)%>|<%=asignatura.elementAt(5)%>|<%=asignatura.elementAt(7)%>|<%=asignatura.elementAt(4)%>">
                                                    <%=asignatura.elementAt(5)%> - <%=asignatura.elementAt(0)%> 
                                                    - <%=asignatura.elementAt(1)%></option>
                                                    <%}%>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr> 
                                    <td height="28" colspan="2"> 
                                        <div align="center"><b>Sin Correos</b> 
                                            <input type="radio" checked name="rbOpcCorreo" value="1">
                                            <b> Con Correos</b> 
                                            <input type="radio" name="rbOpcCorreo" value="2">
                                        </div>
                                    </td>
                                </tr>
                                <tr bordercolor="#B70404"> 
                                    <td width="50%" height="46"> 
                                        <div align="right"> 
                                            <input type="submit" name="Submit" value="Consultar" class="boton" onclick="javascript: return enviar()">
                                        </div>
                                    </td>
                                    <td width="50%"> 
                                        <div align="left"> 
                                            <input type="reset" name="Submit2" value="Limpiar" class="boton">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="25" colspan="2"><div align="center">
                                            <input type="submit" name="Submit5" value="Exportar Listas a Excel" class="boton" onclick="javascript: return enviarexcel()">
                                        </div></td>
                                </tr>
                            </table>
                        </form>

                        <%}%>
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