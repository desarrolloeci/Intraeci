<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>

<%
    String titulo = request.getParameter("titulo");
    String parametro = request.getParameter("parametro");
    String doblenc = request.getParameter("doblenc");
%>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy'-'hh:mm:ss");
    Date currentTime_1 = new Date();
    String dateString = formatter.format(currentTime_1);
%>

<script language="JavaScript" type="text/JavaScript">
    <!--
    function MM_openBrWindow(theURL,winName,features) { //v2.0
    window.open(theURL,winName,features);
    }
    //-->
</script>
<body bgcolor="#ffffff">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/estilos.css?v=2" />
    <table width="640" border="0" align="center" cellpadding="0" cellspacing="0">
        <!-- fwtable fwsrc="encabezado.png" fwbase="encabezadohtm.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
        <tr>        
            <td><img src="img/consulta-presupuesto.jpg" width="793" height="228" border="0" alt="" >

            </td>

    </table>
    <div>
        <table width="794" border="0" align="center" height="72">
            <tr>
                <td colspan="3">
                    <%
                        if (!doblenc.equals("no")) {
                    %>

                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <!-- fwtable fwsrc="barmenusup.png" fwbase="barmenusup.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->

                        <tr>
                        <div  id="menu2" >
                            <ul>
                                <li>
                                    <a href="Menu"><b>INICIO</b></a>
                                </li>
                                <li>
                                    <a href="AdminConvoca"><b>APLICANTES CONVOCATORIAS</b></a>
                                </li>
                                <li>
                                    <a href="https://siaci-escuelaing.azurewebsites.net/Account/Login?ReturnUrl=%2F" target="_blank"><b>SIACI</b></a>
                                </li>
                                <li>
                                    <a href="InicioPlanes"><b>PLANES</b></a>
                                </li> 
                                <li>
                                    <a href="presupuesto"><b>PRESUPUESTO</b></a>
                                </li>
                                <li>
                                    <a href="#" onclick="document.getElementById('myForm').submit();"><b> PROYECTOS </b></a> 
                                    <form target="_blank" class="login" action="https://tycho.escuelaing.edu.co/planeacion/Login" method="post" id="myForm"> 
                                        <input  name="usr" value="<%=session.getAttribute("usuario")%>"    type="hidden">
                                        <input  name="passwd" value="<%=session.getAttribute("clave")%>"   type="hidden">
                                    </form>

                                </li>
                                <li>
                                    <a href="http://copernico.escuelaing.edu.co/software/"><b>DESCARGAS</b></a>
                                </li>
                                <li>
                                    <a href="salir"><b>SALIR</b></a>
                                </li>
                            </ul>
                        </div>	<div style="float: left;"><gcse:search></gcse:search>
                        </div>

            </tr>        
        </table>
        <table>
            <tr>
                <td width="213"><b><font size="1" color="#666666" face="Verdana, Arial, Helvetica, sans-serif"><%=parametro%></font></b></td>
                <td width="213"><div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><!%=titulo%></font></b></div></td>
                <td width="214"><b><font size="1" color="#666666" face="Verdana, Arial, Helvetica, sans-serif"><%= dateString%></font></b></td>
            </tr>
        </table>

    </table>

</div>
<%            }
%>
<div align="center"></div>