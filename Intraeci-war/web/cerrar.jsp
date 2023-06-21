<html>
<% 
String nMsg = (String)request.getParameter("msg") ;
String mensaje = new String("") ;
%>
<head>
<link href="css/comun.css" rel="stylesheet" type="text/css">
<%
if ( nMsg != null ) {%>
    <script language="JavaScript">	
<%
    if ( nMsg.equals("0") ){%>
       alert("Falta alguno de los campos");
       window.location = "iniciar";
<%        
    }else if ( nMsg.equals("1") ){%>
       alert("Usuario desconocido");
       window.location = "iniciar";
<%
    }else if ( nMsg.equals("2") ){%>
       alert("El usuario no se ha autenticado correctamente");
       window.location = "iniciar";
<%
    }
    else if ( nMsg.equals("4") ){
        HttpSession sesion = request.getSession();
        sesion.invalidate();%>
       alert("Su sesión ha finalizado");
       window.close();
       window.document.write("Puede cerrar esta ventana si asi lo desea");
<%
        mensaje = "" ;
    }else if ( nMsg.equals("5") ){%>
       alert("Error del Servidor");
       window.location = "iniciar";
<%
    }else if ( nMsg.equals("6") ){%>
       alert("No ha iniciado Sesion");
       window.location = "iniciar";
<%
    }else if ( nMsg.equals("7") ){%>
       alert("Ya existia una Sesion! Vuelva a autenticarse");
       window.location = "iniciar";
<%
    }else if(nMsg.equals("8")){
        HttpSession sesion = request.getSession();
        sesion.invalidate();%>
       alert("Ha cerrado su sesión correctamente");
       window.close();
       //document.
<%
    }
%>
    </script>
    </head>
<%
}else{
%>
    </head>
    <p class="textocom">Puede <a href="cerrar" onclick="window.close()">cerrar</a> esta ventana si asi lo desea</p>
<%
}
%>

</html>

