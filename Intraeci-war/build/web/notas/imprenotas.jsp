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
            String rbopciones, tercio, clanum, grupo, idgrupo, codasig, idasig, codgrupo, nomasig;
            String periodo = request.getParameter("periodo");
            Vector datosnotas = new Vector();
            String texto[] = new String[7];
            String formato = request.getParameter("formato");
            //String formato = "excel";
            if ((formato != null) && (formato.equals("excel"))) {
                response.setContentType("application/vnd.ms-excel");
            }
            tercio = request.getParameter("tercio");
            grupo = request.getParameter("idgrupo");
            clanum = request.getParameter("clavenume");
            rbopciones = request.getParameter("rbopciones");
            StringTokenizer st = new StringTokenizer(grupo, "|");
            int acumul[] = new int[13];
            int i, cancel, fin = 5;
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
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
            Vector sumasnotas = profesor.getSumaNotas(idgrupo, periodo);
            // Vector estudiantesimp = profesor.getListaNotas(idgrupo, empleado.getPeriodo());
            Vector estudiantesimp = profesor.getListasClase(periodo, idasig, codgrupo);
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
            function enfocar(){
            window.focus();
            preloadImg();
            }

            function impresion(){
            document.getElementById("tablaboton").style.visibility='hidden';
            window.print();
            window.close();
            }
            -->
        </script>
        <%
            if (!((formato != null) && (formato.equals("excel")))) {
        %>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <%    }
        %>
    </head>
    <body onload="enfocar()">

        <div class="container">
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
            <table width="819" border="0" align="left" cellspacing="0" class="textoimpre">
                <tr>
                    <td width="381" height="22"><font size="1"><strong>Escuela Colombiana de Ingenier&iacute;a &quot;Julio
                            Garavito&quot;<br>
                            Secretar&iacute;a General<br>
                            Proceso de Captura e Impresi&oacute;n de Notas</strong></font> 	</td>
                    <td width="255"><table width="100%" border="0" id="tablaboton">
                            <tr>
                                <td width="40%">
                                    <div align="right">
                                        <%
                                            if (!((formato != null) && (formato.equals("excel")))) {
                                        %>              
                                        <input name="imprimir" type="submit" id="imprimir3" value="Imprimir notas" class="boton" onClick="impresion()">
                                        <%    }
                                        %>
                                    </div>
                                </td>
                            </tr>
                        </table></td>
                </tr>
                <tr>
                    <td colspan="2"> 
                        <strong>Periodo Acad&eacute;mico:</strong><%=periodo%>&nbsp;&nbsp;&nbsp;&nbsp;<strong>Profesor:</strong><%=empleado.getNomProf()%><br><strong>Asignatura:</strong><%=nomasig%> <%=codasig%>
                        <strong>Grupo:</strong><%=codgrupo%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Tercio:</strong><%=tercio%>     </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table width="100%" border="1" cellspacing="0" class="textoimpre">
                            <tr>
                                <td width="5%"><div align="center"><strong>Nro.</strong></div></td>
                                <td width="10%"><div align="center"><strong>Carn&eacute;</strong></div></td>
                                <td width="49%"><div align="center"><strong>Nombre</strong></div></td>
                                <td width="6%"><div align="center"><strong>Fallas</strong></div></td>
                                <td width="6%"><div align="center"><strong>Clave</strong></div></td>
                                <td width="6%"><div align="center"><strong>Not1</strong></div></td>
                                <td width="6%"><div align="center"><strong>Not2</strong></div></td>
                                <td width="6%"><div align="center"><strong>Not3</strong></div></td>
                                <td width="6%"><div align="center"><strong>Lab-Not4</strong></div></td>
                                <td width="6%"><div align="center"><strong>Not5</strong></div></td>
                            </tr>
                            <%
                                cancel = 0;
                                Vector estudianteimp = new Vector();
                                for (i = 0; i < estudiantesimp.size(); i++) {
                                    estudianteimp = (Vector) estudiantesimp.elementAt(i);
                            %>
                            <tr>
                                <td width="5%"><%=i + 1%></td>
                                <td width="10%"><%=estudianteimp.elementAt(6)%></td>
                                <td width="49%"><%=estudianteimp.elementAt(0)%></td>
                                <td width="6%">--</td>
                                <td width="6%">
                                    <%
                                        if ((estudianteimp.elementAt(5).equals("Z")) || (estudianteimp.elementAt(5).equals("O")) || (estudianteimp.elementAt(5).equals("A"))) {
                                            out.println("N");
                                        }
                                        if (estudianteimp.elementAt(5).equals("C")) {
                                            cancel = cancel + 1;
                                            out.println("C");
                                        }
                                    %>     
                                </td>

                                <%
                                    for (int j = 1; j < 5; j++) {
                                %>
                                <td width="6%">
                                    <div align="center">
                                        <%
                                            if (estudianteimp.elementAt(j).equals("No disponible")) {
                                                out.println("&nbsp;");
                                                acumul[j - 1] = acumul[j - 1];
                                            } else {
                                                out.println(estudianteimp.elementAt(j));
                                                acumul[j - 1] = acumul[j - 1] + (new Integer((String) estudianteimp.elementAt(j))).intValue();
                                            }

                                        %>
                                    </div>
                                </td>
                                <%
    }
    int n = 13;%>

                                <td width="6%">
                                    <div align="center">
                                        <% if (estudianteimp.elementAt(n).equals("No disponible")) {
                                                out.println("&nbsp;");
                                                acumul[n - 1] = acumul[n - 1];
                                            } else {
                                                out.println(estudianteimp.elementAt(n));
                                                acumul[n - 1] = acumul[n - 1] + (new Integer((String) estudianteimp.elementAt(n))).intValue();
                                            }

                                        %>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            %>      
                        </table></td>
                </tr>
                <tr>
                    <td height="32"> N = Normal C = Cancelado </td>
                </tr>
                <tr>   
                    <td height="54"> <b> <font color="#990033">Not5: Aplica para algunas asignaturas 
                            de seguimiento Académico que deben capturar 5 notas.</font></b> </td>
                </tr>
                <tr>
                    <td colspan="2"><table width="100%" border="0" class="textoimpre">
                            <tr>
                                <td width="16%">&nbsp;</td>
                                <td width="21%"><div align="center"><strong>1er Tercio</strong></div></td>
                                <td width="21%"><div align="center"><strong>2do Tercio</strong></div></td>
                                <td width="21%"><div align="center"><strong>3er Tercio</strong></div></td>
                                <td width="21%"><div align="center"><strong>Lab o T4</strong></div></td>
                                <td width="21%"><div align="center"><strong>5to Tercio</strong></div></td>
                            </tr>
                            <tr>
                                <td width="16%"><div align="right"><strong>Suma de notas:</strong></div></td>
                                <td width="21%"><div align="center"><%=acumul[0]%></div></td>
                                <td width="21%"><div align="center"><%=acumul[1]%></div></td>
                                <td width="21%"><div align="center"><%=acumul[2]%></div></td>
                                <td width="21%"><div align="center"><%=acumul[3]%></div></td>
                                <td width="21%"><div align="center"><%=acumul[12]%></div></td>
                            </tr>
                            <tr>
                                <td width="16%"><div align="right"><strong>Fecha de Captura:</strong></div></td>
                                <td width="21%"><div align="center"><%=datosnotas.elementAt(10)%></div></td>
                                <td width="21%"><div align="center"><%=datosnotas.elementAt(11)%></div></td>
                                <td width="21%"><div align="center"><%=datosnotas.elementAt(12)%></div></td>
                                <td width="21%"><div align="center"><%=datosnotas.elementAt(13)%></div></td>
                                <td width="21%"><div align="center"><%=datosnotas.elementAt(16)%></div></td>
                            </tr>
                            <tr>
                                <td colspan="5"><div align="center">
                                        <hr size="1">
                                    </div></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <strong>Total de registros procesados: </strong><%=estudiantesimp.size()%>
                                </td>
                                <td colspan="2"><strong>Cancelaciones: </strong><%=cancel%></td>
                            </tr>
                            <tr>
                                <td height="5" colspan="3"><strong>Entregado el:</strong> ____ / ____
                                    / ____ <font size="1">(DD|MM|AAAA)</font></td>
                                <td height="5"><strong>Firma Profesor:</strong></td>
                                <td height="5">________________</td>
                            </tr>
                        </table></td>
                </tr>
            </table>
        </div>
    </body>
</html>
