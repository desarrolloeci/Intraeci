<%@ page import = "javax.servlet.http.HttpSession" %>
<%  
    String usuario = (String)session.getAttribute("usuario");
    //login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness)session.getAttribute("empleado");
    if (!(usuario != null && !usuario.equals(""))) {
%>
		<jsp:forward page="cerrar?msg=4"/>
<%
    }else {
        if(session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")){
        %>
		<jsp:forward page="cerrar?msg=4"/>
<%
        }
    }
%>

