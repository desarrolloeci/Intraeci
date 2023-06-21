<%@ include file="../secure.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject, 
         login.InicioProfRemoteBusiness, 
         login.InicioProfRemoteHome,
         java.text.*,
         java.util.*"%>

<%
    HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");
    String loginex = session.getAttribute("loginex").toString();
    String nomarch = new String();
    String anterior = new String((String) request.getParameter("anterior"));
    eci.BackupAdmin bkAdmin;
    String spath = new String((String) request.getParameter("spath"));
    if (spath.equals("docs")) {
        empleado.setPath("domains/domain1/applications/j2ee-modules/documentos/" + spath);
    } else {
        empleado.setPath(spath);
    }
    String texto = request.getParameter("texto");
    if (texto != null) {
        empleado.setTextoCorreo(texto);
    }
    String datoprb = empleado.getPath();
    if (usuario == null)
        out.println("Usuario Nulo");
    else {
        if (spath.equals("docs")) {
            bkAdmin = new eci.BackupAdmin("eci", empleado.getPath());
        } else {
            bkAdmin = new eci.BackupAdmin(loginex, empleado.getPath());
        }
        String operacion = new String((String) request.getParameter("on"));
        if (operacion.compareTo("ar") == 0) {
            String[] chElim;
            int lngCh;
            Integer idRec;
            chElim = request.getParameterValues("chElim");
            lngCh = chElim.length;
            for (int i = 0; i < lngCh; i++) {
                if (chElim[i].compareTo("null") != 0) {
                    bkAdmin.rmArchivo((String) chElim[i]);
                }
                //out.println((String)chElim[i]);
            }%>
<html>
    <head>
        <meta target="principal" http-equiv="Refresh" content="0; url=Backup?on=n&spath=<%=spath%>&anterior=<%=anterior%>">
    </head>
</html>
<%
} else {
%>
<html> 
    <head>
        <title>Subir Archivos</title> 
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"> 
        <!-- Validaciones -->  
        <script language="JavaScript">
            <!--  
        /*------------------------------------------------------------------   
         function Validar Cada check box 
         ------------------------------------------------------------------*/
            function ValidarMod() {
                var max = document.fmArchivos.chElim.length
                var j = 0
                for (i = 0; i < max; i++) {
                    if (document.fmArchivos.chElim[i].checked == true)
                        j++;
                }
                if (j = 0) {
                    alert("Para modificar tiene que seleccionar un recurso")
                } else if (j > 1) {
                    alert("Solo puede seleccionar un campo")
                } else {
                    document.action = 'LA OTRA ACCION'
                    document.submit()
                }
            }
            /*------------------------------------------------------------------   
             function Validar Eliminacion del CheckBox  
             ------------------------------------------------------------------*/
            function ValidarChk(temp) {
                
                var max = document.fmArchivos.chElim.length
                var vall = false
                for (i = 0; i < max; i++) {
                    if (document.fmArchivos.chElim[i].checked == true)
                        vall = true
                }
                if (temp == 1) {
                    vall = true
                }
                if (vall == true)
                    document.fmArchivos.submit()
                else
                    alert("Para eliminar tiene que seleccionar algun recurso")
            }
            /*-----------------------------------------------------------------   
             function Validar el CheckBox que selecciona a todos  
             ------------------------------------------------------------------*/
            function chkAll() {
                var max = document.fmArchivos.chElim.length
                var vall
                if (document.fmArchivos.chAll.checked == true)
                    vall = true
                else
                    vall = false
                for (i = 0; i < max; i++) {
                    document.fmArchivos.chElim[i].checked = vall
                }
            }
            /*------------------------------------------------------------------   
             function Validar Cada check box  
             ------------------------------------------------------------------*/
            function chkUn() {
                var max = document.fmArchivos.chElim.length
                var vall = true
                if (document.fmArchivos.chAll.checked == true)
                    document.fmArchivos.chAll.checked = false
                for (i = 0; i < max; i++) {
                    vall = vall && document.fmArchivos.chElim[i].checked
                }
                if (vall == true)
                    document.fmArchivos.chAll.checked = true
            }

            function ventana(dir) {
                window.open(dir, "documentos", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
            }
            //-->  
        </script>  
    </head> 
    <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
    <link href="css/comun.css" rel="stylesheet" type="text/css">
    <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
    <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
    
</head>
<body background="img/fondo.gif" onLoad="preloadImg()">
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
                    <%
                        if (operacion.equals("n")) {
                            int i = 0;
                    %>
                    <table width="550" border="0" align="center" cellspacing="0" class="textocom"> 
                        <tr> 
                            <td width="120" valign="top">
                                <div align="right"><strong>Archivos Subidos:</strong></div></td>
                            <td> 
                                <form name="fmArchivos" method="post" action="Backup?loginex=<%=loginex%>&on=ar&spath=<%=spath%>&anterior=<%=anterior%>"> 
                                    <table width="100%" border=1 cellspacing="0" class="textocom">
                                        <tr> 
                                            <td width="10%"> 
                                                <div align=center> 
                                                    <input type="checkbox" name="chAll" onClick="chkAll()">
                                                </div> 
                                            </td>
                                            <td width="50%"> 
                                                <div align=center><b>Nombre</b></div> 
                                            </td> 
                                            <td width="20%"><div align="center"><strong>Tama&ntilde;o</strong></div></td>
                                            <td width="20%"><div align="center"><strong>Fecha</strong></div></td>
                                        </tr>
                                        <%
                                            for (i = 0; i < bkAdmin.nArchivos(); i++) {
                                                DateFormat dateFormatter = DateFormat.getDateInstance(DateFormat.MEDIUM);
                                                Date fec = new Date(bkAdmin.fecArchivo(i));
                                        %>

                                        <tr> 
                                            <td width="10%"> 
                                                <div align="center">  
                                                    <input type="checkbox" name="chElim" onClick="chkUn()" value = "<%=bkAdmin.nomArchivo(i)%>"> 
                                                </div> 
                                            </td>
                                            <td width="50%"> 
                                                <div align="center">
                                                    <%
                                                        if (spath.equals("docs")) {
                                                            out.println("<a href=\"#\" onclick=\"ventana('../documentos/docs/eci/" + bkAdmin.nomArchivo(i) + "')\">" + bkAdmin.nomArchivo(i) + "</a>");
                                                        } else {
                                                            out.println(bkAdmin.nomArchivo(i));
                                                        }
                                                    %>
                                                </div> 
                                            </td> 
                                            <td width="20%"><div align="center"><%=bkAdmin.tamarchH(i)%> </div></td>
                                            <td width="20%"><div align="center"><%=dateFormatter.format(fec)%></div></td>
                                        </tr>
                                        <%          }
                                        %>

                                        <tr>
                                            <td>&nbsp;</td>
                                            <td width="50%"><div align="right"><strong>Tama&ntilde;o total: </strong></div></td>
                                            <td><div align="center"><strong><%=bkAdmin.tamtotH()%></strong></div></td>
                                            <td width="20%">&nbsp;</td>
                                        </tr> 
                                        <tr> 
                                            <td colspan="4">
                                                <%if (!spath.equals("docs") || usuario.equals("aguiza")) {%>
                                                <div align="left">
                                                    <input type="button" name="eliminar" value="Eliminar" onClick="ValidarChk(<%=i%>)"  class="boton"> 
                                                </div>
                                                <%}%>
                                                <div align="center"> </div>
                                            </td> 
                                        </tr>
                                    </table> 
                                </form> 
                            </td> 
                        </tr>
                        <tr>
                            <td width="120" height="10" valign="top">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <%
                            String usrenv;
                            if (!spath.equals("docs") || usuario.equals("aguiza")) {
                                if (spath.equals("docs")) {
                              usrenv = "eci";
                          } else {
                              usrenv = loginex;
                          }%>
                        <tr>  
                            <td width="120" valign="top"><div align="right"><strong>Subir
                                        Archivos:</strong></div></td>
                        <form enctype="multipart/form-data" method="post" action="FileUpload">
                            <input name="anterior" type="hidden" value="<%=anterior%>">
                            <input name="loginex" type="hidden" value="<%=usrenv%>">
                            <input name="on" type="hidden" value="n">
                            <input name="spath" type="hidden" value="<%=spath%>">
                            <input name="fpath" type="hidden" value="<%=empleado.getPath()%>">
                            <td>  
                                <table width="100%" border="1" cellspacing="0">
                                    <tr>
                                        <td>
                                          <p align="left">
                                            <input type="file" size="30" maxlength="300" name="file1" class="campotext">
                                            <b><font face="Arial, Helvetica, sans-serif" size="1">Nombres 
                                            de archivos sin tildes</font></b>
                                          </p>
                                            <p>
                                                <input type="submit" name="uploadservlet" value="Subir Archivo"  class="boton">
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </td> 
                        </form> 
                        <%}%>
                        </tr>
                    </table> 
                    <%
                    } else {
                    %>
                    <div align="center" class="textocom"><strong>Ha ocurrido un error al subir el archivo44: </strong>
                        <br>
                        - Recuerde que el tama&ntilde;o del archivo no debe ser superior a 5  Mb<br>
                        - Compruebe la ruta de la cual esta tomando el archivo<br>
                        - Evite las rutas largas<br>
                        - <em><font color="#990000" size="1"><%=operacion%></font></em><br>
                        <a href="Backup?on=n&spath=<%=spath%>&anterior=<%=anterior%>">Volver</a></div>
                        <%
                            }
                        %>
                </div>
            </td>
        </tr>
        <tr class="textocom">
            <td height="22">
                <div align="center">
                    <jsp:include page="piepag">
                        <jsp:param name="anterior" value="<%=anterior%>" />
                    </jsp:include>
                </div>
            </td>
        </tr>
    </table>
   </div>
</body> 
</html> 
<%
        }
    }
%>
