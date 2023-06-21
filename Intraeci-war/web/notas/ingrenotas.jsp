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
            String rbopciones, tercio, clanum, grupo, idgrupo, codasig, seguim, codgrupo, nomasig, terstr, idasig;
            Vector datosnotas = new Vector();
            String periodo_con = request.getParameter("periodo");
            String texto[] = new String[7];
            tercio = request.getParameter("tercio");
            if (tercio.equals("EVALUATIVA")) {
                tercio = "4";
            } else if (tercio.equals("EXAMEN FINAL")) {
                tercio = "5";
            }

            grupo = request.getParameter("idgrupo");
            clanum = request.getParameter("clavenume");
            StringTokenizer st = new StringTokenizer(grupo, "|");
            int acumul[] = new int[6];
            int i, fin = 5, tam, x = 0;
            int tipo = 1;
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
            // per = texto[6];

            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
//empleado.getPeriodo()
            Vector sumasnotas = profesor.getSumaNotas(idgrupo, periodo_con);
            Vector asignaturas = profesor.getAsignaturasNotas(periodo_con, empleado.getIdProf(), idasig, idgrupo);
            if (!clanum.equals(empleado.getClave())) {
        %>
    <b><p class="textocom">
            Clave numérica inválida</p></b>
            <%                        } else if (seguim.equals("S")) {

                for (int n = 0; n < asignaturas.size(); n++) {

                    Vector asignatura = (Vector) asignaturas.elementAt(n);
                    if ((tercio.equals("1") && asignatura.elementAt(6).equals("0")) || (tercio.equals("2") && asignatura.elementAt(7).equals("0")) || (tercio.equals("3") && asignatura.elementAt(8).equals("0")) || (tercio.equals("4") && asignatura.elementAt(5).equals("0")) || (tercio.equals("5") && (asignatura.elementAt(9).equals("0")))) {
                        out.println("Esta asignatura no debe capturar NOTA en este tercio");
                        x = 1;
                    } else {

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
                        // per = texto[6];
                        Vector horario = profesor.getHorario(empleado.getIdProf(), periodo_con);
                        //  tercio = request.getParameter("tercio");
                        Vector asigs = profesor.AsigLabAux(idasig);
                        String asg = "'" + asigs.elementAt(0) + "', '" + asigs.elementAt(1) + "', '" + asigs.elementAt(2) + "'";
                        int cant = 1;
            %>

    <html>
        <head>
            <title>Listas Estudiantes Seguimiento Académico</title>
            <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
            <link href="css/comun.css" rel="stylesheet" type="text/css">
            <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
            <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
            <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        </head>

        <body onload="preloadImg()">
            <div class="container">
                <p class="textocom">&nbsp;</p>
                <jsp:include page="encabezado">
                    <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                    <jsp:param name="doblenc" value="inicio" />
                    <jsp:param name="headerImg" value="banner.jpg" />
                </jsp:include>
                <table width="819" border="0" align="left" cellpadding="0" cellspacing="0" class="textoimpre">
                    <tr>
                        <td><strong><font size="1">Escuela Colombiana de Ingenier&iacute;a &quot;Julio
                                Garavito&quot;<br>
                                </font></strong></td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" class="textoimpre">
                                <tr>
                                    <td width="50%"><strong>Periodo Acad&eacute;mico:</strong><%=periodo_con%></td>
                                    <td width="50%"><strong>Profesor:</strong><%=empleado.getNomProf()%></td>
                                </tr>
                                <tr>
                                    <td width="50%"><strong>Asignatura:</strong><%=nomasig%> <%=codasig%></td>
                                    <td width="50%"><strong>Grupo:</strong><%=codgrupo%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="819" border="1" align="left" cellspacing="0" class="textoimpre">
                                <tr>
                                    <td width="35">
                                        <div align="center"><b>Nro</b></div>
                                    </td>
                                    <td width="100">
                                        <div align="center"><b><font size="1">CARNET</font></b></div>
                                    </td>
                                    <td width="326"><b>NOMBRE</b></td>
                                    <td width="100"><b>Foto</b></td>
                                    <td width="150"><b>Observaciones</b></td>
                                    <td width="128">
                                        <div align="center"><b>Notas</b></div>
                                    </td>
                                    <td width="128"><b>Alarmas</b></td>

                                    <%  Vector tmp;
                                        Vector alar;
                                        String marcaalar = "";
                                        //Vector estudiantes = profesor.getListaNotas(idgrupo, empleado.getPerHorario());
                                        Vector estudiantes = profesor.getListasClase(periodo_con, idasig, codgrupo);
                                        for (int a = 0; a < estudiantes.size(); a++) {

                                            Vector estudiante = (Vector) estudiantes.elementAt(a);
                                            Vector alarma = profesor.Alarmas(estudiante.elementAt(6).toString(), tercio, idasig, periodo_con, tipo);
                                            /*if (alarma.size() == 0) {
                                             alar = "N";
                                             } else {
                                             alar = alarma.elementAt(0).toString();
                                             }*/ if (alarma.size() > 0) {
                                                /* if (alarma.size() == 0) {
                                                 alar = "N";
                                                 } else {*/
                                                alar = (Vector) alarma.elementAt(0);
                                            marcaalar = alar.elementAt(0).toString();
                                        } else {
                                            marcaalar = "N";
                                        }%>

                                    <!-- if  (tercio.equals("2") && estudiante.elementAt(1).toString().equals("")) {-->
                                    <!--     <b><p class="textocom">Por favor ingrese la nota del primer tercio. </p></b>-->
                                    <%if (estudiante.elementAt(15).toString().equals("0")) {%>
                                <tr>
                                    <td width="35">
                                        <div align="center"><%=a + 1%></div>
                                    </td>
                                    <td width="100"><%=estudiante.elementAt(6)%></td>
                                    <td width="326"><%=estudiante.elementAt(0)%></td>
                                    <td width="100" align="center"><img src="http://tycho.escuelaing.edu.co/contenido/seguimiento/<%=estudiante.elementAt(6)%>_Foto.jpg" width="50" height="50"  ></td>
                                    <td width="150" align="center">
                                        <form name="form1" method="post" action="Observaciones">
                                           <input type="hidden" name="grupo" value="<%=grupo%>">
                                            <input type="hidden" name="clanum" value="<%=clanum%>">
                                            <input type="hidden" name="nombre" value="<%=estudiante.elementAt(0)%>">
                                            <input type="hidden" name="carnet" value="<%=estudiante.elementAt(6)%>">
                                            <input type="hidden" name="idasig" value="<%=idasig%>">
                                            <input type="hidden" name="per" value="<%=periodo_con%>">
                                            <input type="hidden" name="tercio" value="<%=tercio%>">
                                            <input type="hidden" name="idgrupo" value="<%=idgrupo%>">
                                            <input type="hidden" name="codg" value="<%=codgrupo%>">
                                            <input type="hidden" name="codasig" value="<%=codasig%>">
                                            <input type="hidden" name="nomasig" value="<%=nomasig%>">
                                            <input type="submit" name="Submit" value="Ingresar/Consultar">
                                        </form>
                                    </td>

                                    <td width="128">
                                        <div align="center">
                                            <!--action="NotasSeguimiento"-->
                                            <form name="form1" method="post" action="NotasSeguimiento">
                                                <!--?idasig=<!%=idasig%>&per=<!%=empleado.getPerHorario()%>&tercio=<!%=tercio%>&idgrupo=<!%=idgrupo%>&codg=<!%=codgrupo%>&nomasig=<!%=nomasig%>&codasig=<!%=codasig%>-->
                                                <input type="hidden" name="per" value="<%=periodo_con%>">
                                                <input type="hidden" name="carnet" value="<%=estudiante.elementAt(6)%>">
                                                <input type="hidden" name="idasig" value="<%=idasig%>">
                                                <input type="hidden" name="idgrupo" value="<%=idgrupo%>">
                                                <input type="hidden" name="codg" value="<%=codgrupo%>">
                                                <input type="hidden" name="tercio" value="<%=tercio%>">
                                                <input type="hidden" name="codasig" value="<%=codasig%>">
                                                <input type="hidden" name="nomasig" value="<%=nomasig%>">
                                                <input type="submit" name="Submit2" value="Registrar">
                                            </form>
                                        </div>
                                    </td>
                                    <td width="100">
                                        <form name="form2" method="post" action="">
                                            <div align="center">
                                                <%if (marcaalar.equals("S")) {%>
                                                <input type="checkbox" name="alarma" value="checkbox" checked>
                                                <% } else {%>
                                                <input type="checkbox" name="alarma" value="radiobutton" onClick="this.checked = false">
                                                <%}%>
                                            </div>
                                        </form>
                                    </td>
                                </tr>
                                <%}%>
                                <input type="hidden" name="carnet"  value="false">
                                <%}%>
                            </table>
                    <tr>
                        <td colspan="3">
                            <div align="center">
                                <jsp:include page="piepag">
                                    <jsp:param name="anterior" value="Menu" />
                                </jsp:include>
                            </div>
                        </td>
                    </tr>

                </table>
                <p>&nbsp;</p></body>
    </html>

    <%}
        }
    } else if (sumasnotas.size() > 0) {
        clanum = request.getParameter("clavenume");
        rbopciones = request.getParameter("rbopciones");
        // Vector estudiantesimp = profesor.getListaNotas(idgrupo, empleado.getPeriodo());
        Vector estudiantesimp = profesor.getListasClase(periodo_con, idasig, codgrupo);
        String periodo = empleado.getTercio();
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
        var i, j, total, tmp, valor,valor1, errlet, errcinc, errvac, dato, conv, mensj;
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
        i+1;
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
</head>
<body  onload="preloadImg()">
     <div class="container">
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
           <jsp:param name="headerImg" value="banner.jpg" />
        </jsp:include>
    <table width="819" border="0" align="center" cellspacing="0">
        <tr class="textocom">
            <td height="22">
                <div align="center">
                    <% for (int n = 0; n < asignaturas.size(); n++) {
                            Vector asignatura = (Vector) asignaturas.elementAt(n);
                            if ((tercio.equals("1") && asignatura.elementAt(6).equals("0")) || (tercio.equals("2") && asignatura.elementAt(7).equals("0")) || (tercio.equals("3") && asignatura.elementAt(8).equals("0")) || (tercio.equals("4") && asignatura.elementAt(5).equals("0"))) {
                                out.println("Esta asignatura no debe capturar NOTA en este tercio");
                                //if (tercio.equals("4") && (asignatura.elementAt(5).equals("0"))) {
                                //   if (n==0){
                                //  out.println("Esta asignatura no debe capturar NOTA DE LABORATORIO");
                                x = 1;
                            } else {
                                if (!clanum.equals(empleado.getClave())) {%>
                    <b><p class="textocom">Clave numérica inválida</p></b>
                    <% } else {
                        if ((!datosnotas.elementAt(2).equals("0") || !datosnotas.elementAt(3).equals("0")) && tercio.equals("1") || (!datosnotas.elementAt(4).equals("0") || !datosnotas.elementAt(5).equals("0")) && tercio.equals("2")
                                || (!datosnotas.elementAt(6).equals("0") || !datosnotas.elementAt(7).equals("0")) && tercio.equals("3")
                                || (!datosnotas.elementAt(8).equals("0") || !datosnotas.elementAt(9).equals("0")) && tercio.equals("4")) {
                    %>
                    <b><p class="textocom">Este tercio ya fué capturado</p></b>
                    <%} else if ((!asignatura.elementAt(6).equals("0") && datosnotas.elementAt(2).equals("0") && datosnotas.elementAt(10).equals("No disponible")) && tercio.equals("2")) {%>
                    <b><p class="textocom">Por favor ingrese las notas del primer tercio. </p></b>
                    <%  } else if (((!asignatura.elementAt(6).equals("0") && datosnotas.elementAt(2).equals("0") && datosnotas.elementAt(10).equals("No disponible")) || (!asignatura.elementAt(7).equals("0") && datosnotas.elementAt(4).equals("0") && datosnotas.elementAt(11).equals("No disponible"))) && tercio.equals("3")) {%>
                    <b><p class="textocom">Para capturar las notas de este tercio debe capturar los tercios anteriores. </p></b>

                    <% } else if (((!asignatura.elementAt(6).equals("0") && datosnotas.elementAt(2).equals("0") && datosnotas.elementAt(10).equals("No disponible")) || (!asignatura.elementAt(7).equals("0") && datosnotas.elementAt(4).equals("0") && datosnotas.elementAt(11).equals("No disponible")) || (!asignatura.elementAt(8).equals("0") && datosnotas.elementAt(6).equals("0") && datosnotas.elementAt(12).equals("No disponible"))) && tercio.equals("4")) {%>
                    <b><p class="textocom">Para capturar las notas de este tercio debe capturar los tercios anteriores. </p></b>
                    <%} else {%>

                    <form name="formnotas" method="post" action="EnviarNotas">

                        <div align="left" class="textoimpre"><strong>Periodo acad&eacute;mico:</strong><%=periodo_con%><br>
                            <strong>Profesor:</strong><%=empleado.getNomProf()%><br>
                            <strong>Asignatura:</strong><%=nomasig%> <%=codasig%> <strong>Grupo:</strong><%=codgrupo%>
                            <strong>Tercio:</strong><%=tercio%></div>

                        <table width="100%" border="1" cellspacing="1" class="textocom">
                            <tr>
                                <td width="5%"><div align="center"><strong>Nro.</strong></div></td>
                                <td width="7%"><div align="center"><strong>Carn&eacute;</strong></div></td>
                                <td width="5%"><div align="center"><strong>Nombre</strong></div></td>
                                <td width="48%"><div align="center"><strong>Niv</strong></div></td>
                                <td width="8%"><div align="center"><strong>Clave</strong></div></td>
                                <td width="7%"><div align="center"><strong>Not1</strong></div></td>
                                <td width="7%"><div align="center"><strong>Not2</strong></div></td>
                                <td width="7%"><div align="center"><strong>Not3</strong></div></td>
                                <td width="7%"><div align="center"><strong>Lab</strong></div></td>
                            </tr>
                            <% empleado.setEstudiantes(estudiantesimp);
                                tam = 0;
                                for (i = 0; i < estudiantesimp.size(); i++) {
           Vector estudianteimp = (Vector) estudiantesimp.elementAt(i);%>

                            <tr>
                                <td width="5%"><div align="center"><%=i + 1%></div></td>
                                <td width="7%"><%=estudianteimp.elementAt(6)%></td>
                                <td width="48%"><%=estudianteimp.elementAt(0)%></td>
                                <td width="5%"><%=estudianteimp.elementAt(16)%></td>
                                <td width="8%">
                                    <% if ((estudianteimp.elementAt(5).equals("Z")) || (estudianteimp.elementAt(5).equals("O")) || (estudianteimp.elementAt(5).equals("A"))) {
                                            out.println("Normal");
                                        }
                                        if (estudianteimp.elementAt(5).equals("C")) {
                 out.println("Cancelado");
             }%>
                                </td>
                                <%   for (int j = 1; j < 5; j++) {
                    terstr = String.valueOf(j);%>
                                <td width="7%">
                                    <div align="center">

                                        <%if (estudianteimp.elementAt(j).equals("No disponible") && (!tercio.equals(terstr))) {
                                                out.println("&nbsp;");
                                            } else if (!tercio.equals(terstr) && (estudianteimp.elementAt(5).equals("Z") || estudianteimp.elementAt(5).equals("O") || estudianteimp.elementAt(5).equals("A"))) {
                                                out.println(estudianteimp.elementAt(j));
                                            } else if (tercio.equals(terstr) && (estudianteimp.elementAt(5).equals("Z") || estudianteimp.elementAt(5).equals("O") || estudianteimp.elementAt(5).equals("A"))) {
                                        %>

                                        <input type="text" name="nota<%=i%>" size="2" maxlength="2" class="camponot">


                                        <% tam = tam + 1;
                                            } else if (estudianteimp.elementAt(j).equals("No disponible")) {
                                                out.println("&nbsp;");
                    }%>
                                    </div>
                                </td>
                                <% }%>
                            </tr>
                            <% }%>
                        </table>
                        <br>
                        Suma de las notas
                        <input name="suma" type="text" id="suma" size="4" maxlength="4" class="camponot">
                        <input name="tercio" type="hidden" id="tercio" value="<%=tercio%>">
                        <input name="idgrupo" type="hidden" id="idgrupo" value="<%=idgrupo%>">
                        <input name="idasig" type="hidden" id="idasig" value="<%=idasig%>">
                        <input name="codgrupo" type="hidden" id="codgrupo" value="<%=codgrupo%>">
                        <input name="peracad" type="hidden" id="codgrupo" value=" <%=periodo_con%>">

                        <br>
                        <strong>Haga Click en ENVIAR NOTAS, para que sean guardadas en el servidor</strong>
                        <p><input name="Submit" type="submit" value="Enviar Notas" onClick="return validanotas(<%=tam%>);" class="boton"></p>
                    </form>
                    <%
                            }
                        }

                    %>
                </div></td>
        </tr>

    </table>

    <%}
        }
    %>

    <div align="center">
        <jsp:include page="piepag">
            <jsp:param name="anterior" value="Menu" />
        </jsp:include>
    </div>
</div>

<%   } else {
        response.sendRedirect("Mensajes?idmsj=7");
    }%>
</div>
</body>
</html>