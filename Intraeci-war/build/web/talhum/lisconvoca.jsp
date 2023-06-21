<%-- 
    Document   : Participación en Convocatoria por el Aspirante
    Created on : 20/09/2011, 10:05:44 AM
    Author     : Julián Garcia
--%>
<%@page import="BDintraeci.EmpleadoRemote"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    HttpSession sesion = request.getSession(true);
    EmpleadoRemote emp = conEjb.lookupEmpleadoRemote();
    emp.inicializar("-1");
    sesion.setAttribute("emp", emp ) ;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script type="text/javascript" src="jscript/talentohum/aspirante.js"></script>
        <title>Convocatorias</title>
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
                listarconvoca() ;
            }
        </script>
    </head>
    <body background="img/fondo.gif" onload="inicializar();">
        <jsp:include page="encAspirante">
            <jsp:param name="parametro" value="" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="Consulta Convocatorias" />
        </jsp:include>

        <table border="1" class="tabla" id="tabconva">
            <thead>
                <th width="85%"><div align="center"><strong>Convocatorias Abiertas</strong></div></th>
                <th width="10%"><div align="center"><strong>Fec.Lim.</strong></div></th>
            </thead>
            <tbody id="cuerpoconva">
            </tbody>
        </table>
        <br>
        <div align="center"><input id="salida" value="Salir" type="button" class="boton" onclick="window.location='salir'"/>
        </div>
    </body>
</html>
