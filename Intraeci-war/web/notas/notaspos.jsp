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
            String impre = request.getParameter("paramtext");
            String formul, nomboton;
            Vector asignaturas = new Vector();
            nomboton = "Capturar";
            if (!impre.equals("0")) {
                nomboton = "Imprimir";
               // asignaturas = profesor.ImpresionPos(empleado.getIdProf());
                asignaturas = profesor.getListaspos(empleado.getIdProf());
            } else {
                //asignaturas = profesor.getAsignaturasPos(empleado.getIdProf(), impre);
                asignaturas = profesor.getListaspos(empleado.getIdProf());
                     
            }
        %>
        <title>Notas Posgrado</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
        </style>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function enviar(){
            if(document.formulario.idgrupo.value == "null"){
            alert("Seleccione el grupo");
            return false;
            }else if(document.formulario.clavenume.value==""){
            alert("No ha ingresado su clave");
            return false;
            }else{
            <%
                if (impre.equals("0")) {
            %>
            document.formulario.target = "";
            document.formulario.action = "IngresarNotasPosgrado";
            return true;
            <%    } else {
            %>
            document.formulario.target = "ventanaImpreNotasPosgrado";
            document.formulario.action = "ImprimirNotasPosgrado";
            window.open("", "ventanaImpreNotasPosgrado", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
            document.formulario.submit();
            return false;
            <%        }
            %>
            }
            }
            //-->
        </script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
    </head>
    <body  onLoad="preloadImg()">
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
                            <%
                                if (asignaturas.size() > 0) {
                                    if (impre.equals("0")) {
                            %>
                            <div align="center">
                                <strong><font color="#990000" size="3">NOTA:</font> Lea cuidadosamente
                                    <a href="" onclick="window.open('html/ayunotpos.htm', '', 'width=800,height=600, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');
            return false"> AQUI </a>antes
                                    de ingresar las notas
                                </strong></div><br>
                                <% }%>
                            <form name="formulario" method="post" action="">

                                <table width="310" border="0" class="textocom">
                                    <tr>
                                        <td width="150"><div align="right"><strong>Asignatura :</strong></div></td>
                                        <td width="10">&nbsp;</td>
                                        <td width="150">
                                            <select name="idgrupo" class="campotext">
                                                <option value="null" selected>Seleccione</option>
                                                <% for (int i = 0; i < asignaturas.size(); i++) {
                                                        Vector asignatura = (Vector) asignaturas.elementAt(i);
                                                %>
                                                <option value="<%=asignatura.elementAt(2)%>|<%=asignatura.elementAt(0)%>|<%=asignatura.elementAt(5)%>|<%=asignatura.elementAt(4)%>|<%=asignatura.elementAt(3)%>|<%=asignatura.elementAt(1)%>|">
                                                    <%=asignatura.elementAt(5)%> - <%=asignatura.elementAt(0)%> - <%=asignatura.elementAt(1)%></option>
                                                    <% }%>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td width="150"><div align="right"><strong>Clave Num&eacute;rica :</strong></div></td>
                                        <td width="10">&nbsp;</td>
                                        <td width="150">
                                            <input name="clavenume" type="password" class="campotext" id="clavenume" size="8" maxlength="5">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="10" colspan="3"><div align="right"></div>
                                            <div align="left">            </div></td>
                                    </tr>
                                    <tr>
                                        <td height="46">
                                            <div align="right">
                                                <input type="submit" name="boton" value="<%=nomboton%>" class="boton" onclick="javascript: return enviar()">
                                            </div></td>
                                        <td width="10">&nbsp;</td>
                                        <td>
                                            <div align="left">
                                                <input type="reset" name="Submit2" value="Limpiar" class="boton">
                                            </div></td>
                                    </tr>
                                </table>
                            </form>
                            <%
                            } else {
                            %>
                            <center><b><br>Usted NO tiene grupos asignados</b></center>
                                    <%        }
                                    %>
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
