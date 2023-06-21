<%-- 
    Document   : observiciones
    Created on : 21/09/2011, 10:50:07 AM
    Author     : Juan Pablo Garcia
--%>

<%@page import="java.util.HashMap"%>
<%@page import="BDintraeci.BDproyectoRemote"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            BDproyectoRemote proyecto = (BDproyectoRemote) session.getAttribute("proyecto");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Comentario</title>
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
            }

            function despCrearComen(){
                window.returnValue = Datos;
                window.close();
                return false;
            }

            function crearComentario(){
                if(!isDiligenciado(['comentario'], ['Comentario'])) return false;
                respServlet="despCrearComen";
                var url = 'setComentario?'+getValores(['comentario']);
                conectarX(url,muestraResultado);
                return false;
            }
        </script>
    </head>
    <body background="img/fondoblanco.gif" onload="inicializar();">
        <table class="tabla" border="1" id="tablaP" align="center" width="605px">
            <thead>
                <tr>
                    <th width="50px"><div align="center"><strong>Comentario</strong></div></th>
                </tr>
            </thead>
            <tbody id="cuerpo">
                <tr>
                    <td><div align="center"><textarea cols="80" rows="6" id="comentario"></textarea></div></td>
                </tr>
                <tr>
                    <td>
                        <div align="center"><input name="crear" type="submit" value="Aceptar" onClick="return crearComentario();" class="boton"><input name="cancelar" type="submit" value="Cancelar" onClick="window.close();" class="boton"></div>
                    </td>
                </tr>
            </tbody>
        </table>
        <table class="tabla" border="1" id="tablaC" align="center" width="605px">
            <caption><strong>Historial de comentarios</strong></caption>
            <thead>
                <tr>
                    <th width="50px"><div align="center"><strong>Empleado</strong></div></th>
                    <th width="50px"><div align="center"><strong>Comentario</strong></div></th>
                    <th width="50px"><div align="center"><strong>Fecha</strong></div></th>
                </tr>
            </thead>
            <tbody id="cuerpoC">
                <%for (HashMap comentario : proyecto.getListComentario()) {%>
                <tr>
                    <td width="50px"><div align="left"><%=comentario.get("nombres")%></div></td>
                    <td width="50px"><div align="left"><%=comentario.get("descrip")%></div></td>
                    <td width="50px"><div align="left"><%=comentario.get("fecha")%></div></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
