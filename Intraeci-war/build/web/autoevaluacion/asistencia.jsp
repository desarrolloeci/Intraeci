<%-- 
    Document   : asistencia
    Created on : 8/02/2017, 09:14:46 AM
    Author     : lucero.rodriguez
--%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.text.*, java.net.*;" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties,java.lang.reflect.Array " %>

<%HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    session.setAttribute("loginex", empleado.getUsrExchange());
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    String cedula = empleado.getIdemp();
    String prog = request.getParameter("prog");
    String iden = request.getParameter("iden");
    String grupo = request.getParameter("grupo");
    String tipo = request.getParameter("tipo");
    String descripcion = request.getParameter("descripcion");
    String id_encuestado = request.getParameter("id_encuestado");
    //Vector Datos = admin.DatosEncuestas(cedula);
    Vector FactorEnc = admin.FactoresEnc(iden);
    int totfac = FactorEnc.size();
    int maxi = 0;
    String nombreenc = "";
    String docum = "";
    String documemp = "";
    String nombreemp = "";
    String email = "";
    String validaasistencia= "";

    Vector maximo = admin.MáximoFactor(id_encuestado, iden);
    Vector DatosEnc = admin.DatosEncuestado(iden, grupo);
    int contador = DatosEnc.size();
    int contestan = DatosEnc.size();
    String max = maximo.elementAt(0).toString();
    if (max.equals("No disponible")) {
        maxi = 0;
    } else {
        maxi = Integer.parseInt(max);
    }

    int cuentafac = 0;
    String dato = "";%>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
        <title>Encuestas Autoevaluación con fines de Acreditación Institucional-Taller</title>
        <link href="css/encuestaODI.css" rel="stylesheet" type="text/css" media="all"/>
        <SCRIPT LANGUAGE="JavaScript">
            function validar(contador) {
            var i, j, band, valor, asistencia;

            for (i = 0; i <contador; i++) {
            asistencia = new String("asistencia" + i);
            if (document.forms.forminsc[asistencia].value == "null") {
            alert("Por favor seleccione si el participante asistió al desarrollo del taller ");
            document.forminsc[asistencia].style.backgroundColor = '#FFA74F';
            return false;
            }
            }
            }


        </SCRIPT>
        <style type="text/css"></style>
    </head>
    <body>
        <div id="container"> 
            <!--inicio header-->
            <header> </header> 
            <!--inicio section-->
            <center>
                <form method="post" name="forminsc" action="FormatoTaller">
                    <input type="hidden" name="iden" value="<%=iden%>">
                    <input type="hidden" name="prog" value="<%=prog%>">
                    <input type="hidden" name="descripcion" value="<%=descripcion%>">
                    <input type="hidden" name="id_encuestado" value="<%=id_encuestado%>">
                    <input type="hidden" name="grupo" value="<%=grupo%>">
                    <input type="hidden" name="tipo" value="<%=tipo%>">

                    <table width="600" border="0">
                        <tr> 
                            <td width="344"><font size="1"><b>Participante</b></font></td>
                            <td width="146"><font size="1"><b>Seleccione si asistió</b></font></td>
                            <td colspan="2"> </td>
                        </tr>
                      
                        <%
                            for (int z = 0; z < DatosEnc.size(); z++) {

                                Vector nombres = (Vector) DatosEnc.elementAt(z);
                                nombreenc = nombres.elementAt(1).toString();
                                docum = nombres.elementAt(2).toString();
                                validaasistencia= nombres.elementAt(6).toString();%>
                        <tr> 

                            <td width="344"> 
                                <p><font size="1"><%=nombreenc%> </font></p>
                            </td>

                            <%if (validaasistencia.equals("1")){%>
                                 <td width="146"> 
                                <p> <font size="1"> 
                                    <select name="asistencia<%=z%>">
                                        <option value="<%=validaasistencia%>" selected>SI</option>
                                        <option value="0|<%=docum%>">NO</option>
                                    </select>
                                    </font></p>
                            </td>
                           <% }else if (validaasistencia.equals("0")){%>
                                 <td width="146"> 
                                <p> <font size="1"> 
                                    <select name="asistencia<%=z%>">
                                        <option value="1|<%=docum%>">SI</option>
                                        <option value="<%=validaasistencia%>" selected>NO</option>
                                    </select>
                                    </font></p>
                            </td>
                            <%}else{%>
                            <td width="146"> 
                                <p> <font size="1"> 
                                    <select name="asistencia<%=z%>">
                                        <option value="null">Seleccione</option>
                                        <option value="1|<%=docum%>">SI</option>
                                        <option value="0|<%=docum%>">NO</option>
                                    </select>
                                    </font></p>
                            </td>
                          
                        </tr>
                        <%}
                            }%>
                       
                            <%Vector emplea = new Vector();
                                        Vector Empleados = admin.ConsultaEmpleados();
                            for (int n = 0; n < 4; n++) {%>
                             <tr>

                            <td width="344"><font size="1"><b>Si desea agregar un participante </b></font> 
                            </td>
                            <td width="146" > 
                                <select name="nombres<%=n%>">
                                    <option value="0" Selected>Seleccione</option>
                                    <%
                                        for (int x = 0; x < Empleados.size(); x++) {
                                            emplea = (Vector) Empleados.elementAt(x);%>
                                    <option value="<%=emplea.elementAt(0)%>|<%=emplea.elementAt(1)%>%>"><%=emplea.elementAt(2)%></option>
                                    <%}%>
                                </select>   
                            </td>
                            <%}%>
                        </tr>
                        <br>
                    
                        <br>
                        <tr> 
                            <td colspan="4"> 
                        <center>
                            <input type="submit" name="Submit" class="input boton" value="CONTINUAR"  onClick="return validar(<%=contador%>);">
                        </center>
                        </td>
                        </tr>
                    </table>
                </form>
            </center>
    </body>


