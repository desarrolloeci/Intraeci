<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
    <head>
        <%
                    HttpSession sesion;
                    response.setHeader("Cache-Control", "no-cache");
                    String rbopciones, clanum, grupo, idgrupo, codasig, codgrupo, nomasig, terstr, idasig, peracad;
                    Vector datosnotas = new Vector();
                    String texto[] = new String[8];
                    grupo = request.getParameter("idgrupo");
                    clanum = request.getParameter("clavenume");
                    StringTokenizer st = new StringTokenizer(grupo, "|");
                    int i, fin = 3, tam;
                    i = 0;
                    while (st.hasMoreTokens()) {
                        texto[i] = st.nextToken();
                        i = i + 1;
                    }
                    nomasig = texto[4];
                    codgrupo = texto[5];
                    idasig = texto[3];
                    codasig = texto[1];
                    idgrupo = texto[0];
                    peracad = texto[2];
                    inicio.conectaEJB conEjb = new inicio.conectaEJB();
                    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
                    Vector sumasnotas = profesor.getSumaNotasPosgrado(idgrupo, peracad);
                    //empleado.getPerHorario()
                    Vector estudiantesimp = profesor.getListasClase(peracad, idasig, codgrupo);
                    // Vector estudiantesimp = profesor.getListaNotasPos(idgrupo, peracad);
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
                    <div align="center">
                        <% if (!clanum.equals(empleado.getClave())) {%>
                        <b><p class="textocom">Clave numérica inválida</p></b>
                        <%} else {
                             if (datosnotas.elementAt(2).equals("0") && (datosnotas.elementAt(3).equals("No disponible"))) {
                        %>
                        <form name="formnotas" method="post" action="EnviarNotasPosgrado">
                            <div align="left" class="textoimpre"><strong>Periodo acad&eacute;mico:</strong><%=peracad%><br>
                                <strong>Profesor:</strong><%=empleado.getNomProf()%><br>
                                <strong>Asignatura:</strong><%=nomasig%> <%=codasig%> <strong>Grupo:</strong><%=codgrupo%>
                            </div>
                            <table width="100%" border="1" cellspacing="1" class="textocom">
                                <tr>
                                    <td width="5%"><div align="center"><strong>Nro.</strong></div></td>
                                    <td width="8%"><div align="center"><strong>Carn&eacute;</strong></div></td>
                                    <td width="48%"><div align="center"><strong>Nombre</strong></div></td>
                                    <td width="3%"><div align="center"><strong>Nivel</strong></div></td>
                                    <td width="9%"><div align="center"><strong>Clave</strong></div></td>
                                    <td width="7%"><div align="center"><strong>Nota</strong></div></td>
                                </tr>
                                <%
                                                                empleado.setEstudiantes(estudiantesimp);
                                                                tam = 0;
                                                                for (i = 0; i < estudiantesimp.size(); i++) {
                                                                    Vector estudianteimp = (Vector) estudiantesimp.elementAt(i);
                                %>
                                <tr>
                                    <td width="5%"><div align="center"><%=i + 1%></div></td>
                                    <td width="8%"><%=estudianteimp.elementAt(6)%></td>
                                    <td width="48%"><%=estudianteimp.elementAt(0)%></td>
                                    <td width="3%"><%=estudianteimp.elementAt(16)%></td>
                                    <td width="9%">
                                        <%
                                                                                    if ((estudianteimp.elementAt(5).equals("Z"))) {
                                                                                        out.println("Normal");
                                                                                    }
                                                                                    if (estudianteimp.elementAt(5).equals("C")) {
                                                                                        out.println("Cancelado");
                                                                                    }
                                                                                    if (estudianteimp.elementAt(5).equals("E")) {
                                                                                        out.println("Electiva");
                                                                                    }
                                                                                    if (estudianteimp.elementAt(5).equals("O")) {
                                                                                        out.println("Opcional");
                                                                                    }



                                        %>
                                    </td>
                                    <td width="7%">
                                        <div align="center">
                                            <%
                                                                                        if (estudianteimp.elementAt(17).equals("No disponible") && (estudianteimp.elementAt(5).equals("Z") || (estudianteimp.elementAt(5).equals("E")) || (estudianteimp.elementAt(5).equals("O")))) {
                                            %>
                                            <input type="text" name="nota<%=i%>" size="2" maxlength="2" class="camponot">
                                            <%
                                                                                            tam = tam + 1;
                                                                                        }
                                            %>
                                        </div>
                                    </td>
                                </tr>
                                <%
                                                                }
                                %>
                            </table>
                            <br>
	  Suma de las notas
                            <input name="suma" type="text" id="suma" size="4" maxlength="4" class="camponot">
                            <input name="idgrupo" type="hidden" id="idgrupo" value="<%=idgrupo%>">
                            <input name="grupo" type="hidden" id="grupo" value="<%=grupo%>">
                            <input name="idasig" type="hidden" id="idasig" value="<%=idasig%>">
                            <br>
                            <strong>Haga Click en ENVIAR NOTAS, para que sean guardadas en el servidor</strong>
                            <p><input name="Submit" type="submit" value="Enviar Notas" onClick="return validanotas(<%=tam%>);" class="boton"></p>
                        </form>
                        <%
                                                    } else {
                        %>
                        <b><p class="textocom">Las notas ya fueron capturadas</p></b>
                        <%                }
                                    }
                        %>
                    </div></td>
            </tr>
            <tr>
                <td>
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="NotasPosgrado?paramtext=0" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
         </div>
    </body>
</html>
