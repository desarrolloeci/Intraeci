<%-- 
    Document   : Extensiones
    Created on : 6/04/2015, 11:42:40 AM
    Author     : Lucero
--%>

<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%@ include file="secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.text.*, java.net.*;" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties,java.lang.reflect.Array " %>

<% HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    session.setAttribute("loginex", empleado.getUsrExchange());
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    String cedula = empleado.getIdemp();
    //  String user= empleado.getUsrExchange();
    Vector extensiones = admin.Extensiones();
    Vector  centro = admin.Centros();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Extensiones Telefónicas </title>
        <link href="css/comun.css" rel="stylesheet" type="text/css">

        <SCRIPT LANGUAGE="JavaScript">

            function habilita(form)
            {
            form.telefono.disabled = false;
            alert("Por favor ingrese el número de su línea directa.");

            }

            function deshabilita(form)
            {
            form.telefono.disabled = true;
            alert("No debe ingresar número de línea directa");

            }
           
            function validar() {
                var i, band, valor, valcorreo;
               
                if(document.form.nombres.value == "0"){
                    alert("Por favor seleccione el nombre");
                    document.form.nombres.style.backgroundColor= '#ffcc00';
                    document.form.nombres.focus();
                    return false;
                }
                
                 if(document.form.centro.value == "0"){
                    alert("Por favor seleccione el centro de costo");
                    document.form.centro.style.backgroundColor= '#ffcc00';
                    document.form.centro.focus();
                    return false;
                }
                
                if(document.form.extension.value == ""){
                    alert("Por favor ingrese el número de la extensión");
                    document.form.extension.style.backgroundColor= '#ffcc00';
                    document.form.extension.focus();
                    return false;
                }
                
                }

        </SCRIPT>
    </head>

    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="Inscripción a cursos Periodo Intermedio" />
        </jsp:include>
        <div align="center">
            <form name="form" method="post" action="GuardaExtensiones">
                <table width="34%" border="2" class="textocom" >
                    <tr> 
                        <td width="26%">Nombres:</td>
                        <td colspan="2">   
                            <select name="nombres">
                                <option value="0" selected>Seleccione</option>
                                <%
                                    Vector nombres = new Vector();
                                    for (int i = 0; i < extensiones.size(); i++) {
                                        nombres = (Vector) extensiones.elementAt(i);
                                %>
                                <option value="<%=nombres.elementAt(0)%>-<%=nombres.elementAt(4)%>"><%=nombres.elementAt(0)%></option>
                                <%
                                    }
                                %>

                            </select>

                        </td>
                    </tr>
                    <tr> 
                        <td width="26%">No. de Extensi&oacute;n</td>
                        <td colspan="2">

                            <input type="text" name="extension" size="3" maxlength="3">

                        </td>
                    </tr>
                    <tr> 
                        <td width="26%">Tiene l&iacute;nea Directa?</td>
                        <td width="33%">SI 
                            <input type="radio" name="directo" value="S"  onClick="habilita(this.form)"></td>
                        <td width="41%">NO
                            <input type="radio" name="directo" value="N"  onClick="deshabilita(this.form)"></td>
                    </tr>
                    <tr> 
                        <td width="26%">&nbsp;</td>
                        <td colspan="2">Si tiene por favor ingrese el n&uacute;mero: 

                            <input type="text" name="telefono" size="7" maxlength="7">

                        </td>
                    </tr>
                    <tr> 
                        <td width="26%">Bloque:</td>
                        <td colspan="2">

                            <select name="bloque">
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                                <option value="F">F</option>
                                <option value="G">G</option>
                                <option value="L">L</option>
                                <option value="COLISEO">COLISEO</option>
                            </select>

                        </td>
                    </tr>
                    <tr> 
                        <td width="26%">Centro de costo:</td>
                        <td colspan="2">

                            <select name="centro">

                                <option value="0" selected>Seleccione</option>
                                <%
                                    Vector centros = new Vector();
                                    for (int i = 0; i < centro.size(); i++) {
                                        centros = (Vector) centro.elementAt(i);
                                %>
                                <option value="<%=centros.elementAt(1)%>"><%=centros.elementAt(0)%></option>
                                <%
                                    }
                                %>

                            </select>

                        </td>
                    </tr>
                </table>

                <p>&nbsp;</p>
                <p> 
                    <input type="submit" name="Submit" value="Enviar" onClick="javascript: return validar();">
                </p>
            </form>
        </div>
    <center>
        <jsp:include page="piepag">
            <jsp:param name="anterior" value="Menu" />
        </jsp:include>
    </center>
</body>
</html>
