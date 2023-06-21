<%-- 
    Document   : NotasMod
    Created on : 24/02/2011, 09:48:41 AM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<%
    HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    String rbopciones, tercio, clanum, grupo, idgrupo, codasig, seguim, codgrupo, nomasig, terstr, idasig;
    Vector datosnotas = new Vector();
    String texto[] = new String[7];
    String peri=request.getParameter("periodo");
    tercio = request.getParameter("tercio");
    grupo = request.getParameter("idgrupo");
    clanum = request.getParameter("clavenume");
    String clave = (String) session.getAttribute("clave");
    // out.println(clave);
    session.setAttribute("clave", clave);
    StringTokenizer st = new StringTokenizer(grupo, "|");
    int acumul[] = new int[5];
    int i, fin = 4, tam, x = 0;
    i = 0;
    while (st.hasMoreTokens()) {
        texto[i] = st.nextToken();
        i = i + 1;
    }
    for (i = 0; i < fin; i++) {
        acumul[i] = 0;
    }
    idgrupo = texto[0];
    codasig = texto[1];
    codgrupo = texto[2];
    nomasig = texto[3];
    idasig = texto[4];
    seguim = texto[5];

    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    Vector sumasnotas = profesor.getSumaNotas(idgrupo, peri);
    Vector asignaturas = profesor.getAsignaturasNotas(peri, empleado.getIdProf(), idasig, idgrupo);
    if (!clanum.equals(empleado.getClave())) {
%>
<b><p class="textocom">Clave numérica inválida</p></b>
<%                        } else {

//clanum = request.getParameter("clavenume");
    rbopciones = request.getParameter("rbopciones");
    //Vector estudiantesimp = profesor.getListaNotas(idgrupo, empleado.getPeriodo());
    Vector estudiantesimp = profesor.getListasClase(peri, idasig, codgrupo);
    String periodo = empleado.getTercio();
    String documento = empleado.getDocumProf();
    int per = Integer.valueOf(periodo).intValue();
    for (i = 0; i < sumasnotas.size(); i++) {
        datosnotas = (Vector) sumasnotas.elementAt(i);

    }
%>
<title>Captura de Notas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
    a:hover{color:#3366CC; }
    a{color: blue;}
    a:link, a:visited { text-decoration: none }
</style>
<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
<script language="JavaScript" type="text/JavaScript">
    <!--
    function validanotas(tam){
    var i, j, total, tmp, valor, errlet, errcinc, errvac, dato, conv, mensj;
    errlet = 0;
    errcinc = 0;
    errvac = 0;
    total = 0;
    for(i=0;i<tam;i++){
    valor = parseInt(document.formnotas.elements[i].value, 10);
    if(document.formnotas.elements[i].value != ""){
    if(isNaN(valor)){
    document.formnotas.elements[i].style.backgroundColor= '#ffcc00';
    errlet = errlet + 1;
    }else{
    dato = document.formnotas.elements[i].value;
    tmp = "";
    for(j=0;j<dato.length;j++){
    conv = parseInt(dato.charAt(j), 10);
    if(isNaN(conv)){
    tmp = "error";
    }
    }
    if(tmp == "error"){
    document.formnotas.elements[i].style.backgroundColor= '#ffcc00';
    errlet = errlet + 1;
    }else{
    document.formnotas.elements[i].style.backgroundColor= '#f4f4f4';
    if(valor > 50){
    document.formnotas.elements[i].style.backgroundColor= '#ffcc00';
    errcinc = errcinc + 1;
    }else{
    total = total + valor;
    }
    }
    }
    }else{
    document.formnotas.elements[i].style.backgroundColor= '#ffcc00';
    errvac = errvac + 1;
    }
    }
    mensaj = "";
    if(errlet > 0 || errvac > 0 || errcinc > 0){
    if(errlet > 0){
    mensaj = mensaj + "Los campos no pueden tener letras, tiene " + errlet + " errores \n";}
    if(errvac > 0){
    mensaj = mensaj + "Los campos no pueden estar vacios, tiene " + errvac + " errores \n";}
    if(errcinc > 0){
    mensaj = mensaj + "Las notas no pueden ser superiores a 50, tiene " + errcinc + " errores \n";}
    alert(mensaj);
    return false;
    }else{
    if(document.formnotas.suma.value == ""){
    alert("No ingreso la suma de las notas");
    return false;}
    else if(document.formnotas.suma.value != total){
    alert("La suma de las notas no coincide con el valor ingresado");
    return false;}
    else{
    //alert("Todo bn");
    return true;}
    }
    }



    function valida_longitud(formnotas){

    num_caracteres = formnotas.texto.value.length
    nota =formnotas.notanva.value
    if (nota == "" || nota == "null"){
    alert("Por favor ingrese la Nota");
    return false;
    }

    if (num_caracteres <  15){
    alert("Por favor ingrese la razón del cambio de nota, recuerde que debe ingresar mínimo 15 caracteres y máximo 100.");
    return false;
    }

    return true;

    }

    -->
</script>
<link href="css/comun.css" rel="stylesheet" type="text/css">
<link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
<link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
</head>
<body  onload="preloadImg()">
     <div class="container">
    <p class="textocom">&nbsp;</p>
    <jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
        <jsp:param name="doblenc" value="inicio" />
         <jsp:param name="headerImg" value="banner.jpg" />
    </jsp:include>
    <table width="819" border="0" align="center" cellspacing="0">
        <tr class="textocom">

            <td height="22">
                <%

                    for (int n = 0; n < asignaturas.size(); n++) {

                        Vector asignatura = (Vector) asignaturas.elementAt(n);
                        if (tercio.equals("4") && (asignatura.elementAt(5).equals("0"))) {

                            out.println("Esta asignatura no debe capturar NOTA DE LABORATORIO");
                            x = 1;
                        } else {

                            if (!clanum.equals(empleado.getClave())) {
                %>
                <b>
                    <p class="textocom">Clave numérica inválida</p></b>
                    <%                        } /*else {

                     if ((!datosnotas.elementAt(2).equals("0") || !datosnotas.elementAt(3).equals("0")) && tercio.equals("1") ||
                     (!datosnotas.elementAt(4).equals("0") || !datosnotas.elementAt(5).equals("0")) && tercio.equals("2") ||
                     (!datosnotas.elementAt(6).equals("0") || !datosnotas.elementAt(7).equals("0")) && tercio.equals("3") ||
                     (!datosnotas.elementAt(8).equals("0") || !datosnotas.elementAt(9).equals("0")) && tercio.equals("4")) {*/ /*<b><p class="textocom">Este tercio ya fué capturado</p></b>*/ else {
                    %>

                <div align="left" class="textoimpre"><strong>Periodo acad&eacute;mico:</strong><%=peri%><br>
                    <strong>Profesor:</strong><%=empleado.getNomProf()%><br>
                    <strong>Asignatura:</strong><%=nomasig%> <%=codasig%> <strong>Grupo:</strong><%=codgrupo%>
                    <strong>Tercio:</strong><%=tercio%></div>

            </td>
    </table>

    <table width="100%" border="1" cellspacing="1" class="textocom" align="center">
        <tr>
            <td width="2%">
                <div align="center"><strong>Nro.</strong></div>
            </td>
            <td width="5%">
                <div align="center"><strong>Carn&eacute;</strong></div>
            </td>
            <td width="29%">
                <div align="center"><strong>Nombre</strong></div>
            </td>
            <td width="2%">
                <div align="center"><strong>Clave</strong></div>
            </td>
            <td width="6%">
                <div align="center"><strong>Nota Actual</strong></div>
            </td>
            <td width="6%">
                <div align="center"><b>Nueva Nota</b></div>
            </td>

            <td width="25%"><b>Raz&oacute;n del cambio  (M&aacute;x.100 caracteres)</b></td>
            <td width="5%">
                <div align="center"><strong>Enviar Nueva Nota</strong></div>
            </td>
        </tr>
        <%
            empleado.setEstudiantes(estudiantesimp);
            tam = 0;
            for (i = 0; i < estudiantesimp.size(); i++) {
                Vector estudianteimp = (Vector) estudiantesimp.elementAt(i);
        %>
        <form name="formnotas" method="post" action="ModificarNotas">

            <tr>
                <td width="2%">
                    <div align="center"><%=i + 1%></div>
                </td>
                <td width="5%"><%=estudianteimp.elementAt(6)%></td>
                <td width="29%"><%=estudianteimp.elementAt(0)%></td>
                <td width="2%">
                    <%
                        if ((estudianteimp.elementAt(5).equals("Z")) || (estudianteimp.elementAt(5).equals("O")) || (estudianteimp.elementAt(5).equals("A"))) {
                            out.println("Normal");
                        }
                        if (estudianteimp.elementAt(5).equals("C")) {
                            out.println("Cancelado");
                        }%>
                </td>
                <% terstr = tercio;%>
                <td width="6%">
                    <div align="center">
                        <%
                            if (tercio.equals(terstr) && (estudianteimp.elementAt(5).equals("Z") || estudianteimp.elementAt(5).equals("O") || estudianteimp.elementAt(5).equals("A"))) {
                                String notas1 = estudianteimp.elementAt(1).toString();
                                String notas2 = estudianteimp.elementAt(2).toString();
                                String notas3 = estudianteimp.elementAt(3).toString();
                                String notas4 = estudianteimp.elementAt(4).toString();
                                String notas5 = estudianteimp.elementAt(13).toString();
                                String falla1 = estudianteimp.elementAt(9).toString();
                                String falla2 = estudianteimp.elementAt(10).toString();
                                String falla3 = estudianteimp.elementAt(11).toString();
                                String falla4 = estudianteimp.elementAt(12).toString();
                                String falla5 = estudianteimp.elementAt(14).toString();
                                String nivel = estudianteimp.elementAt(16).toString();
                                String notaP = estudianteimp.elementAt(17).toString();
                                if (tercio.equals("1") && !notas1.equals("No disponible")) {%>
                        <%=estudianteimp.elementAt(1)%>
                        <%  } else if (tercio.equals("2") && !notas2.equals("No disponible")) {%>
                        <%=estudianteimp.elementAt(2)%>
                        <!-- <input type="text" name="nota<!%=i%>" value="<!%=estudianteimp.elementAt(2)%>" size="3" maxlength="2">-->
                        <%  } else if (tercio.equals("3") && !notas3.equals("No disponible")) {%>
                        <%=estudianteimp.elementAt(3)%>
                        <!--<input type="text" name="nota<!%=i%>" value="<!%=estudianteimp.elementAt(3)%>" size="3" maxlength="2">-->
                        <% } else if (tercio.equals("4") && !notas4.equals("No disponible")) {%>
                        <%=estudianteimp.elementAt(4)%>
                        <!-- <input type="text" name="nota<!%=i%>" value="<!%=estudianteimp.elementAt(4)%>" size="3" maxlength="2">-->
                        <%} else if (tercio.equals("5") && !notas5.equals("No disponible")) {%>
                        <%=estudianteimp.elementAt(13)%>
                        <!--  <input type="text" name="nota<!%=i%>" value="<!%=estudianteimp.elementAt(13)%>" size="3" maxlength="2">-->
                        <%} else {%>
                        <input type="text" name="nota<%=i%>"  size="3" maxlength="2">
                        <%}%>
                        <% tam = tam + 1;%>
                    </div>
                </td>
                <% }%>
                <% if (!estudianteimp.elementAt(5).equals("C") && estudianteimp.elementAt(15).equals("0")) {%>
                <td width="6%">
                      <div align="center">
                    <input type="text" name="notanva"  size="3" maxlength="2">
                      </div>
                    </td>
                <td width="25%">
                    <div align="center">
                        <textarea name="texto" rows="3" cols="15" ></textarea></div>
                </td>
                <%} else {%>
                
                <td width="6%">
                <div align="center">    
                    &nbsp;
                </div>
                </td>
                <td width="25%">
                    &nbsp;
                </td>
                <%}%>
                <td width="5%">
                    <div align="center">
                    <input name="Submit" type="submit" value="Enviar" onClick="return valida_longitud(this.form)">
                    </div>
                </td>
            <input name="tercio" type="hidden" id="tercio" value="<%=tercio%>">
            <input name="idgrupo" type="hidden" id="idgrupo" value="<%=estudianteimp.elementAt(18)%>">
            <input name="idgrupoPRE" type="hidden" id="idgrupo" value="<%=idgrupo%>">
            <input name="idasig" type="hidden" id="idasig" value="<%=idasig%>">
            <input name="documento" type="hidden" id="documento" value="<%=documento%>">
            <input name="carnet" type="hidden" id="carnet" value="<%=estudianteimp.elementAt(6)%>">
            <input name="notas1" type="hidden" id="notas1" value="<%=estudianteimp.elementAt(1)%>">
            <input name="notas2" type="hidden" id="notas2" value="<%=estudianteimp.elementAt(2)%>">
            <input name="notas3" type="hidden" id="notas3" value="<%=estudianteimp.elementAt(3)%>">
            <input name="notas4" type="hidden" id="notas4" value="<%=estudianteimp.elementAt(4)%>">
            <input name="notas5" type="hidden" id="notas5" value="<%=estudianteimp.elementAt(13)%>">
            <input name="s1" type="hidden" id="s1" value="<%=datosnotas.elementAt(2)%>">
            <input name="s2" type="hidden" id="s2" value="<%=datosnotas.elementAt(4)%>">
            <input name="s3" type="hidden" id="s3" value="<%=datosnotas.elementAt(6)%>">
            <input name="s4" type="hidden" id="s4" value="<%=datosnotas.elementAt(14)%>">
            <input name="s5" type="hidden" id="s5" value="<%=datosnotas.elementAt(8)%>">
            <input name="clanum" type="hidden" id="clanum" value="<%=clanum%>">
            <input name="rbopciones" type="hidden" id="rbopciones" value="<%=rbopciones%>">

            <input type="hidden" name="codgrupo" value="<%=codgrupo%>">
            <input type="hidden" name="codasig" value="<%=codasig%>">
            <input type="hidden" name="nomasig" value="<%=nomasig%>">
            <input type="hidden" name="idasig" value="<%=idasig%>">
            <input type="hidden" name="seguim" value="<%=seguim%>">
            <input type="hidden" name="periodo" value="<%=peri%>">
            <input type="hidden" name="nombre" value="<%=estudianteimp.elementAt(0)%>">
            <input type="hidden" name="nivel" value="<%=estudianteimp.elementAt(16)%>">

        </form>
        <%
            }
        %>



        <br>

        <%
            }
// }

        %>


    </table>
     </div>
    <br></body>
</html> 
<%}
    }
%>
<!--<div align="center">
    <input type="submit" name="Submit" value="Enviar">
</div>
--><div align="center">
    <jsp:include page="piepag">
        <jsp:param name="anterior" value="Menu" />
    </jsp:include>
</div>


<%
    }%>
