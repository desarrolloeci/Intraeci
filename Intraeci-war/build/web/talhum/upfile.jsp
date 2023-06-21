<%-- 
    Document   : Participación en Convocatoria por el Aspirante
    Created on : 20/09/2011, 10:05:44 AM
    Author     : Julián Garcia
--%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <title>Subir Archivo de diplomas</title>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
        <style type="text/css" >
            #tbody{
                height: 250px;
                overflow: auto;
            }
        </style>
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script language="javascript" type="text/javascript">
            var Datos=new Array();
            function inicializar(){
                Datos = dialogArguments;
                cargarconvoca() ;
            }
        </script>
    </head>
    <body background="img/fondo.gif">
<%
    String res = (String) request.getParameter("res");
%>
    <%=res%> <br><form name="cargarpdf" method="POST" ENCTYPE="multipart/form-data" action="SubirArchivo">
        <input type="file" size="60" maxlength="300" name="arcupload" id="arcupload" class="campotext">
        <input id="subpdf" value="Anexar Pdf" type="submit" class="boton"/> </form>   
    </body>
</html>