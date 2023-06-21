<%-- 
    Document   : ActualizaCurso
    Created on : 5/02/2016, 11:14:41 AM
    Author     : Lucero
--%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<%HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    session.setAttribute("loginex", empleado.getUsrExchange());
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    String cedula = empleado.getIdemp();
    String id = request.getParameter("id");
    String nombre = request.getParameter("nombre");
    String salon = request.getParameter("salon");
    nombre = nombre + "*" + id + "*" + salon;
    String califica = new String();
    String cadena = "califica";
    int actualiza = 0;
    String estadoc = new String();

    String dato = new String();
    String variable = new String();
    //String cedula = request.getParameter("cedula");
    //empleado.getPerHorario()/2015-I
    Vector Datos = admin.InscritosEvento(id);


    for (int i = 0; i < Datos.size(); i++) {
        Vector inscrito = (Vector) Datos.elementAt(i);

        String documento = (inscrito.elementAt(6).toString());
        estadoc = (inscrito.elementAt(7).toString());
        califica = String.valueOf(i);
        variable = (String) cadena.concat(califica);
        dato = request.getParameter(variable);
        if (estadoc.equals("NULL") || estadoc.equals("No disponible")) {
            actualiza = admin.ApruebaRepruebaCurso(id, documento, dato);
            //response.sendRedirect("ListaCurso?curso=" + nombre);
            //i=Datos.size();
        } else {
            //actualiza = admin.ApruebaRepruebaCurso(id, documento, dato);
            response.sendRedirect("ListaCurso?curso=" + nombre);
            i = Datos.size();
        }
    }

    if (actualiza > 0) {
        response.sendRedirect("ListaCurso?curso=" + nombre);
    }
%>
