<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios-Consulta Documentos Estudiante</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>

        <!-- CSS -->
        <link rel="stylesheet" href="css/comun.css" type="text/css" />
         <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            //-->
        </script>
    </head>
    <body id="public">
          <div class="container">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="headerImg" value="banner.jpg" />
        </jsp:include>
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">     
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    Documentación del Estudiante
                                    <label id="msj"></label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        <br>
                        <strong><center>Por favor digite el número de carnet del estudiante:</center></strong>
                        <br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form method="post" action="mostrarDocumentosEstudiante">
                            <br>
                            <center><input name="iden_est" id="iden_est" type="number" min="0" required=""/></center>
                            <br>
                            <center><input name="submit" id="submit" type="submit"/></center>
                            <br>
                        </form>
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
                <tr>
                    <td bgcolor="#EEEEEE"><img src="img/bottom.gif" alt="" width="770" height="10" id="bottom" /></td>
                </tr>
            </table>
        </div><!--container-->
    </body>

</html>
</html>
