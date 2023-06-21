<%@page import="inicio.conectaEJB"%>
<%@page import="BDintraeci.BDadministrativoRemoteBusiness"%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios-Consulta Documentos Estudiante</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>

        <!-- CSS -->
        <link rel="stylesheet" href="css/comun.css" type="text/css" />
         <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            //-->
        </script>
    </head>
    <body id="public">
            <%
                response.setHeader("Cache-Control", "no-cache");
                conectaEJB conEjb = new inicio.conectaEJB();
                String iden_est = request.getParameter("iden_est");
                BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
                Vector data = admin.getPerRealCarne(iden_est);
                Vector periodos = admin.getPeriodos();
                Boolean estudianteEncontrado = false;
                String per_ingreal="";
                String nom_est="";
                String subfolder="";
                if(data.size()>0){
                    Vector temp=(Vector) data.get(0);
                    estudianteEncontrado = true;
                    per_ingreal= (String) temp.get(0);
                    nom_est= (String) temp.get(1);
                    subfolder = (((String) temp.get(2)).equals("P"))?"postgrados/":"";
                }
                //Definimos la carpeta donde buscar los documentos
                String folder="/mnt/docestpla/"+subfolder+per_ingreal+"/";
                //Se buscan renovaciones ICETEX
                HashMap<String, String> renovaciones=new HashMap<String, String>();
                for (Object per : periodos) {
                    String periodo=((Vector) per).get(0).toString();
                    if((new File(("/mnt/docestpla/"+subfolder+periodo+"/"+"ri"+iden_est+".pdf"))).exists()){
                        renovaciones.put(periodo, "documentosEstudiantes?idenEst="+iden_est+"&pathDoc=/mnt/docestpla/"+subfolder+periodo+"/"+"ri"+iden_est+".pdf");
                    }
                }
            %>
          <div class="container">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="headerImg" value="banner.jpg" />
        </jsp:include>
            <%if(estudianteEncontrado){%>
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">     
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    Estudiante: <%=nom_est%>
                                    <label id="msj"></label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        <br>
                        <strong><center>Por seleccione el tipo de documento que desea abrir:</center></strong>
                        <br>
                        <center>
                            <%if((new File((folder+"d"+iden_est+".pdf"))).exists()){%>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>d<%=iden_est%>.pdf">Documentos Básicos de Admisión</a>
                            <%}if((new File((folder+"f"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>f<%=iden_est%>.pdf">Documentos Financieros</a>
                            <%}if((new File((folder+"t"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>t<%=iden_est%>.pdf">Documentos de Transferencia</a>
                            <%}if((new File((folder+"m"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>m<%=iden_est%>.pdf">Documentos de Readmisión</a>
                            <%}if((new File((folder+"r"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>r<%=iden_est%>.pdf">Documentos de Seguimiento Académico</a>
                            <%}if((new File((folder+"e"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>e<%=iden_est%>.pdf">Documentos de Reintegro</a>
                            <%}if((new File((folder+"a"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>a<%=iden_est%>.pdf">Actas de Devolución</a>
                            <%}if((new File((folder+"x"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>x<%=iden_est%>.pdf">Distinciones Especiales</a>
                            <%}if((new File((folder+"s"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>s<%=iden_est%>.pdf">Sanciones</a>
                            <%}if((new File((folder+"n"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>n<%=iden_est%>.pdf">Novedades Académicas</a>
                            <%}if((new File((folder+"g"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>g<%=iden_est%>.pdf">Segundo Calificador</a>
                            <%}if((new File((folder+"h"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>h<%=iden_est%>.pdf">Validación de Asignaturas</a>
                            <%}if((new File((folder+"w"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>w<%=iden_est%>.pdf">Documentos de Graduado</a>
                            <%}if((new File((folder+"p"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>p<%=iden_est%>.pdf">Documentos de Transición de Plan</a>
                            <%}if((new File((folder+"i"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>i<%=iden_est%>.pdf">Documentos de ICETEX</a>
                            <%}if((new File((folder+"b"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>b<%=iden_est%>.pdf">Documentos de Becas Externas</a>
                            <%}if((new File((folder+"c"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>c<%=iden_est%>.pdf">Documentos de Apoyos Financieros Académicos</a>
                            <%}if((new File((folder+"j"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>j<%=iden_est%>.pdf">Documentos de Requerimientos Judiciales</a>
                            <%}if((new File((folder+"c1_"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>c1_<%=iden_est%>.pdf">Primera Carta de Recomendación Posgrados</a>
                            <%}if((new File((folder+"c2_"+iden_est+".pdf"))).exists()){%>
                            <br>
                            <a href="documentosEstudiantes?idenEst=<%=iden_est%>&pathDoc=<%=folder%>c2_<%=iden_est%>.pdf">Segunda Carta de Recomendación Posgrados</a>
                            <%}if(renovaciones.size()>0){%>
                            <br>
                            <a id="renovaIcetex" href="" onclick="return false">Renovaciones ICETEX (Debe selecciconar un periodo)</a>
                            <br>
                            <select name="per_renovacion" id="per_renovacion" onchange="setPeriodoRenovacion()" required="">
                                <option value="">Seleccione</option>
                                <%for (String per : renovaciones.keySet()) {%>
                                    <option value="<%=renovaciones.get(per)%>"><%=per%></option>
                                <%    }
                                %>
                            </select>

                            <script lang="javascript">
                                function setPeriodoRenovacion(){
                                    var e = document.getElementById("per_renovacion");
                                    var perSel = e.options[e.selectedIndex].value;
                                    document.getElementById("renovaIcetex").href=perSel;
                                    document.getElementById("renovaIcetex").onclick="";
                                    return;
                                }
                            </script>
                            <%}%>
                            <br>

                        </center>
                    </td>

                </tr>
                <tr>
                <td>
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="Menu" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
                <tr>
                    <td bgcolor="#EEEEEE"><img src="img/bottom.gif" alt="" width="770" height="10" id="bottom" /></td>
                </tr>
            </table>
            <%}else{%>
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">     
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    No se encontró al estudiante.
                                    <label id="msj"></label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                <td>
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="Menu" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
                <tr>
                    <td bgcolor="#EEEEEE"><img src="img/bottom.gif" alt="" width="770" height="10" id="bottom" /></td>
                </tr>
            </table>
            <%}%>
        </div><!--container-->
    </body>

</html>
</html>
