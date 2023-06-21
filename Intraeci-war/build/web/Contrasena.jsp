<%@ include file="secureprof.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

        <%
            HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
           String periodo = request.getParameter("paramtext");
            String grupo = request.getParameter("idgrupo");
            Vector tercio = new Vector();
        %>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Gestionar contraseña de correo</title>
         <link href="css/estilo-resultadoconocimiento.css" rel="stylesheet" type="text/css" media="all">
         </head>
    <body>

         <div id="container">
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="textoimpremas">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td>
                        <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include></td>
                </tr>
            </table>
            <p></p>
            <section>
                <div id="formulario">
                    <table  align="center" width="150%" border="0">
                        <tr>
                            <td><font face="Times New Roman, Times, serif"><a href="https://gestorpasswd.escuelaing.edu.co/Manual/escuela/1_ManualUsuario.pdf" TARGET="blank">1. Consulte el manual para gestionar el cambio de contraseña</a></font></td>
                        </tr>
                       
                        <tr>
                            <td><font face="Times New Roman, Times, serif"><a href="https://gestorpasswd.escuelaing.edu.co/" TARGET="blank">2. Cambie su contraseña</a></font></td>
                        </tr>
                     
                    </table>
                      </table>
            </section>
          
               <footer>
                <span class="programa">
                    Escuela Colombiana de Ingeniería Julio Garavito
                </span>
                <span class="direccion">
                    AK.45 No.205-59 (Autopista Norte)<br/>
                    PBX: +57(1) 668 3600<br/>
                    Call Center: +57(1) 668 3600<br/>
                    Línea Nacional Gratuita: 018000112668<br/>
                    www.escuelaing.edu.co<br/>
                    Bogotá, D.C. - Colombia<br/>
                </span>
            </footer>
                                          </div>

             </body>
</html>