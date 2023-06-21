<%-- 
    Document   : preinscripcion
    Created on : 1/11/2011, 09:39:00 AM
    Author     : lrodriguez
--%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<% HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        PrintWriter oout = response.getWriter();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        String carnet = request.getParameter("carnet");
        String nombre = request.getParameter("nombre");
        String perinsc = request.getParameter("perinsc");
        String mensaje = request.getParameter("mensaje");
        Vector adiciona = profesor.Preinscripcion(carnet);
        String nomas, prioas, color, cha = new String(), chb = new String(), per, asig = "";
        int i, crtot, cras, cradic, totalcred = 0;
        Vector prei = new Vector();
        Vector preadic = new Vector();%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Consultar Preinscripción</title>
    </head>
    <script language="JavaScript" type="text/JavaScript">

        /*   function ValSeleccionados(valoresSeleccionados){

            formulario = document.getElementById("formulario");

            formulario = document.getElementById("form1");
            var valoresSeleccionados=new Array();
            var contValoresSeleccionados=0;
            for(var i=0; i<formulario.elements.length; i++) {
                var elemento = formulario.elements[i];
                if(elemento.type == "checkbox") {

                    if(elemento.checked) {
                        valoresSeleccionados[i]=formulario[i].value;


                    }

                }

            }
            alert(valoresSeleccionados);
            return valoresSeleccionados;


        }*/
    </script>

    <body>
        <center>
            <font color="red"><b>Asignaturas Preinscritas</b></font>
        </center>
        <BR>
        <center>Estudiante: <%=nombre%></center>
        <!--ValidaPreinscribe?carnet=<!%=carnet%>
        onSubmit="return ValSeleccionados();" -->
        <form name="form1" method="post" action="ValidaPreinscribe?carnet=<%=carnet%>&nombre=<%=nombre%>">
            <table width="70%" border="2" class="tabla" align="center">
                <tr>
                <tr>
                    <td width=5%">
                        <div align="center">Código</div>
                    </td>
                    <td width="50%">
                        <div align="center">Nombre</div>
                    </td>
                    <td width="15%">
                        <div align="center">Autorizar</div>
                    </td>
                </tr>
                <%  crtot = 0;
        cradic = 0;
        for (i = 0; i < adiciona.size(); i++) {
            preadic = (Vector) adiciona.elementAt(i);%>

                <tr>
                    <td width="5%">
                        <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                        <%=(String) preadic.elementAt(2)%> </font> </div>
                    </td>
                    <td width="50%">
                        <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                        <%=(String) preadic.elementAt(3)%> </font> </div>
                    </td>
                    <td width="15%">
                        <div align="center">
                            <%if (preadic.elementAt(4).equals("1")) {%>
                            <input type="checkbox"  checked name="marcar<%=i%>" value="<%=(String) preadic.elementAt(1)%>" id="check<%=i%>">
                            <%} else {%>
                            <input type="checkbox"  name="marcar<%=i%>" value="<%=(String) preadic.elementAt(1)%>" id="check<%=i%>">
                            <%}%>
                            <input type="hidden" name="codasig<%=i%>" value="<%=(String) preadic.elementAt(1)%>">

                        </div>
                    </td>
                </tr>

                <%}%>
            </table>
           
                <p>&nbsp;</p>
                
    <p>
    <table>
        <tr>
    <td>
        <%if (!mensaje.equals("null")){%>
        <center><b><%=mensaje%></b></center>
        <%}%>
    </td>
</tr>
    <TR>
        <TD> 
          <div align="center">
            <input type="submit" name="agregar" value="ENVIAR" class="boton">
          </div>
        </TD>
    </TR>
          <tr>
                <td>
                    <div align="right">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="Menu" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
            </table>
    </p>
            </div>
        </form>
        <h1 align="center">&nbsp;</h1>
    </body>
</html>
