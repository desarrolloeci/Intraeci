<%@ page import = "javax.servlet.http.HttpSession" %>
<%  
    String usuario = (String)session.getAttribute("usuario");
    login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness)session.getAttribute("empleado");
    if (!(usuario != null && !usuario.equals(""))) {
%>
		<jsp:forward page="cerrar?msg=4"/>
<%
    }/*else{
        if(!empleado.getMenu().equals("2")){*/
                //jsp:forward page="Menu"/>

    /*    }
    }*/
%>