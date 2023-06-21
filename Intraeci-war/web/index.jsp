<%@page contentType="text/html"%>
<%@page session="false" %>
<%  
 response.setHeader("Cache-Control","no-cache"); 
   // String usuario = (String)session.getAttribute("sro");
	//String isp ;

    //if (usuario != null && !usuario.equals("")) {
	//	isp = new String((String)session.getAttribute("isp"));
String nMsg = (String)request.getParameter("msg") ;
String mensaje = new String("") ;
//response.sendRedirect("iniciar?msg=" + nMsg);
response.sendRedirect("Menu?msg=" + nMsg);
if ( nMsg != null ) {
        if ( nMsg.equals("0") ){
            mensaje = "Falta alguno de los campos" ;
        }else if ( nMsg.equals("1") ){
            mensaje = "Usuario desconocido" ;
        }else if ( nMsg.equals("2") ){
            mensaje = "El usuario no se ha autenticado correctamente" ;
        }
        else if ( nMsg.equals("4") ){
            mensaje = "Sesion Cerrada" ;
        }else if ( nMsg.equals("5") ){
            mensaje = "Error del Servidor" ;
        }else if ( nMsg.equals("6") ){
            mensaje = "No ha iniciado Sesion" ;
        }else if ( nMsg.equals("7") ){
            mensaje = "<font color='#FF0000'>Ya existia una Sesion!</font> <i>Vuelva a autenticarse</i>" ;
        }else if(nMsg.equals("8")){
            HttpSession sesion = request.getSession();
            sesion.invalidate();
        } else if (nMsg.equals("9")) {
                HttpSession sesion = request.getSession();
                sesion.invalidate();
                mensaje = "No se ha podido iniciar la sesión porque tiene bloqueadas las <br>ventanas " +
                        "emergentes para este sitio, para continuar debe permitirlas para empleados.escuelaing.edu.co<br>" +
                        "si no sabe como hacerlo haga <a href=\"html/manualintraeci.htm\">click AQUI</a>";
         }
    }
%>
<html>
<head>
<title>encabezadohtm.gif</title>
<meta http-equiv="Content-Type" content="text/html;">
<!-- Fireworks MX Dreamweaver MX target.  Created Wed Aug 16 09:51:45 GMT-0500 (Hora est. del Pacífico de SA) 2006-->
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<style type="text/css">
a{color: blue;}
a:hover{color:#3366CC; }

</style>
<body bgcolor="#ffffff">
     <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<!%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="Seguimiento Académico" />
        </jsp:include>
<p>&nbsp;</p>
<table width="640" border="0" align="center" cellpadding="0" cellspacing="0">
  <!-- fwtable fwsrc="encabezado.png" fwbase="encabezadohtm.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
 <!-- <tr>
    <td><img src="img/spacer.gif" width="163" height="1" border="0" alt=""></td>
    <td><img src="img/spacer.gif" width="20" height="1" border="0" alt=""></td>
    <td><img src="img/spacer.gif" width="216" height="1" border="0" alt=""></td>
    <td><img src="img/spacer.gif" width="241" height="1" border="0" alt=""></td>
    <td><img src="img/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>
  <tr>
    <td><img name="encabezadohtm_r1_c1" src="img/encabezadohtm_r1_c1.gif" width="163" height="70" border="0" alt=""></td>
    <td><img name="encabezadohtm_r1_c2" src="img/encabezadohtm_r1_c2.gif" width="20" height="70" border="0" alt=""></td>
    <td><img name="encabezadohtm_r1_c3" src="img/encabezadohtm_r1_c3.gif" width="216" height="70" border="0" alt=""></td>
    <td><img name="encabezadohtm_r1_c4" src="img/encabezadohtm_r1_c4.gif" width="241" height="70" border="0" alt=""></td>
    <td><img src="spacer.gif" width="1" height="70" border="0" alt=""></td>
  </tr>-->
</table>
<P align="center" class="textocom"><font size=2><b><%=mensaje%></b></font> 
<table width="600" border="0" align="center">
  <tr>
    <td>
		   <h6 class="m-t-2">Identifíquese usando su cuenta en:</h6>
                <div class="potentialidplist" id="yui_3_17_2_1_1661955999929_25">
                        <div class="potentialidp" id="yui_3_17_2_1_1661955999929_24">
                            <a href="https://campusvirtual.escuelaing.edu.co/moodle/auth/oidc/" title="Ingresar Office 365" class="btn btn-secondary btn-block" id="yui_3_17_2_1_1661955999929_23">
                                <img src="img/o365.png" alt="" width="24" height="24">
                                Ingresar Office 365
                            </a>
                        </div>
                </div>
            <div class="ag-s-content ag-o-lead  ag-o-lead_centered ">
               <div class="forgetpass m-t-1">
                    <p><h6 class="m-t-2"><a href="https://campusvirtual.escuelaing.edu.co/moodle/login/forgot_password.php">¿Olvidó su nombre de usuario o contraseña?</a></h6></p>
                </div>
            </div>
	</td>
  </tr>
</table>
<table width="640" border="0" align="center">
  <tr>
    <td><img src="img/barrahor.gif" width="640" height="5"></td>
  </tr>
</table>
<div align="center"><font face="Arial, Helvetica, sans-serif" size="1" color="#990000"><b>Av. 
  13 No. 205-59 (km. 13 autopista Norte) / PBX: +57(1) 6683600 / Call center: 
  +57(1) 6683622 / A.A. 14520<br>
  Bogot&aacute;, D.C. , Colombia</b></font><br>
</div>
</body>
</html>
