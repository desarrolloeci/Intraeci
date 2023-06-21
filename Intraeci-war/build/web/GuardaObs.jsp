<%-- 
    Document   : GuardaObs
    Created on : 17/01/2011, 02:31:56 PM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>

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
        PrintWriter oout = response.getWriter();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        String carnet = request.getParameter("carnet");
        String idgrupo = request.getParameter("idgrupo");
        String codg = request.getParameter("codg");
        String periodo = request.getParameter("peri");
        if(periodo==null){
            periodo=request.getParameter("per");
        }
        String idasig = request.getParameter("idasig");
        String tercio = request.getParameter("tercio");
        String obs = request.getParameter("obs");
        String obs1 = request.getParameter("obs1");
        String alarma = request.getParameter("alarma");
        String nota = request.getParameter("nota");
        String falla = request.getParameter("falla");
        String nomasig = request.getParameter("nomasig");
        String codasig = request.getParameter("codasig");
        String documento = request.getParameter("docu");
        String notas1 = request.getParameter("notas1");
        String notas2 = request.getParameter("notas2");
        String notas3 = request.getParameter("notas3");
        String notas4 = request.getParameter("notas4");
        String notas5 = request.getParameter("notas5");
        String notanva = request.getParameter("notanva");
        String texto = "Seguimiento";
        int res;
        String sec, datosasigna;
        int res1, res2, error;
        String notaEst = new String();
        int guardar = 0;
        if (!obs.equals("")) {
            guardar = profesor.InsertarObserva(carnet, idasig, obs, periodo, tercio, idgrupo, codg, alarma, documento);
        } else if (!obs1.equals("")) {
            guardar = profesor.InsertarObserva(carnet, idasig, obs1, periodo, tercio, idgrupo, codg, alarma, documento);
        }
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Seguimiento Académico</title>
    <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
    <link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<body>
    <%if (tercio.equals("0")) {%>
    <jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
        <jsp:param name="doblenc" value="inicio" />
        <jsp:param name="titulo" value="Consejeros" />
    </jsp:include>

    <%} else {%>
    <jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
        <jsp:param name="doblenc" value="inicio" />
        <jsp:param name="titulo" value="Seguimiento Académico" />
    </jsp:include>
    <%}%>

    <%if (guardar > 0) {
            if ((tercio.equals("1") && nota != null)) {
                String campo = "nota1";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                datosasigna = (idasig + "-" + idgrupo + "-" + tercio + "-" + carnet + "-" + notas1 + "-" + notanva);
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, idgrupo, carnet, notanva, campo);
                res = profesor.IngresaNotasSeg("nota1", idgrupo, carnet, nota, "falla1", falla);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, idgrupo, codg, tercio, carnet, notas1, notanva, operacion, texto);
             
            } else if ((tercio.equals("2") && nota != null)) {
                 String campo = "nota2";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                datosasigna = (idasig + "-" + idgrupo + "-" + tercio + "-" + carnet + "-" + notas2 + "-" + notanva);
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, idgrupo, carnet, notanva, campo);
                res = profesor.IngresaNotasSeg("nota2", idgrupo, carnet, nota, "falla2", falla);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, idgrupo, codg, tercio, carnet, notas2, notanva, operacion, texto);

            } else if ((tercio.equals("3") && nota != null)) {
                 String campo = "nota3";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                datosasigna = (idasig + "-" + idgrupo + "-" + tercio + "-" + carnet + "-" + notas3 + "-" + notanva);
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, idgrupo, carnet, notanva, campo);
                res = profesor.IngresaNotasSeg("nota3", idgrupo, carnet, nota, "falla3", falla);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, idgrupo, codg, tercio, carnet, notas3, notanva, operacion, texto);
            } else if ((tercio.equals("4") && nota != null)) {
                 String campo = "nota_lab";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                datosasigna = (idasig + "-" + idgrupo + "-" + tercio + "-" + carnet + "-" + notas4 + "-" + notanva);
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, idgrupo, carnet, notanva, campo);
                res = profesor.IngresaNotasSeg("nota_lab", idgrupo, carnet, nota, "falla4", falla);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, idgrupo, codg, tercio, carnet, notas4, notanva, operacion, texto);
                
            } else if ((tercio.equals("5") && nota != null)) {
                 String campo = "nota4";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                datosasigna = (idasig + "-" + idgrupo + "-" + tercio + "-" + carnet + "-" + notas5 + "-" + notanva);
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, idgrupo, carnet, notanva, campo);
                res = profesor.IngresaNotasSeg("nota4", idgrupo, carnet, nota, "falla5", falla);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, idgrupo, codg, tercio, carnet, notas5, notanva, operacion, texto);
            } else if (tercio.equals("0")) {
    %>
    <center>Los datos han sido guardados en nuestra base de datos.
        <br>
        <a href="Tutor">Regresar</a>
    </center>
    <%}
    } else {
    response.sendRedirect("EnviaNotasSeg?guardar=0&nota=" +nota);%>
    <center>Los datos NO fueron guardados correctamente. Por favor ingrese la Observación</center>

    <%}%>
    <form name="form1" method="post" action="NotasSeguimiento">
        <input type="hidden" name="documento" value="<%=empleado.getDocumProf()%>">
        <input type="hidden" name="carnet" value="<%=carnet%>">
        <input type="hidden" name="idasig" value="<%=idasig%>">
        <input type="hidden" name="idgrupo" value="<%=idgrupo%>">
        <input type="hidden" name="codg" value="<%=codg%>">
        <input type="hidden" name="tercio" value="<%=tercio%>">
        <input type="hidden" name="codasig" value="<%=codasig%>">
        <input type="hidden" name="nomasig" value="<%=nomasig%>">
        <input type="hidden" name="nombre" value="<!%=nombre%>">
        <input type="hidden" name="per" value="<%=periodo%>">
        <%if (!tercio.equals("0")) {%>
         <center>Los datos han sido guardados en nuestra base de datos.
        <br>
      
    </center>
        <div align="center">
            <input type="submit" name="Submit" value="Regresar">
        </div>
        <%}%>
    </form>
    <p align="center">&nbsp;</p>
    </p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    
    <tr>
        <td colspan="3">
            <div align="right">
            </div>
        </td>
    </tr>

    
</body>
</html>
