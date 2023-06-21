<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="proyectos.General"%>
<%@include file="../secure.jsp" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.HashMap"%>
<%@page import="BDintraeci.BDproyectoRemote"%>

<%
            BDproyectoRemote proyecto = (BDproyectoRemote) session.getAttribute("proyecto");
            proyecto.setIdFase(request.getParameter("idp"));
            HashMap[] seguimientos = proyecto.getLisSeguimiento(proyecto.getIdFase(), "F");
            HashMap seguimiento;
            String fa=proyecto.getIdFase();
%>
<html>
    <head>
        <title>Menu Seguimiento</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1; no-cache">
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
        <link href="css/proyectos/seguimiento.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script type="text/javascript" src="jscript/Proyectos/seguimiento.js"></script>
        <script type="text/javascript" src="jscript/Proyectos/dedicacionSeguimiento.js"></script>
        <script type="text/javascript"  language="javascript">
            function cargarAcciones(){
                document.getElementById('editarDedi').onclick=accionEditarDedi;
                document.getElementById('guardarDedi').onclick=accionGrabarDedi;
                document.getElementById('nuevaDedi').onclick=accionNuevaDedi;
                document.getElementById('crearDedi').onclick=accionCrearDedi;
                document.getElementById('editarObsvDir').onclick=accionEditarObsvDir;
                document.getElementById('guardarObsvDir').onclick=accionGrabarObsvDir;
                defineColorXEdicion();
                verSeguimiento(<%=seguimientos[seguimientos.length-1].get("idsgpr")%>, "F");
            }

            function getAvance(){
                var Datos = new Array(21);
            <%for (int i = 0; i <= 20; i++) {%>
                    Datos[<%=i%>]=5*(<%=i%>)+" %="+5*(<%=i%>);
            <%}%>
                    return Datos;
                }
                
        </script>
    </head>
    <body background="img/fondoblanco.gif" onload="cargarAcciones();">
        <a href="InicioPlanes" > <img alt=""  src="img/inicio.gif" name="inicio" width="60" height="20" border="0"></a>
        <a href="MenuFase?idFase=<%=proyecto.getIdFase()%>"> <img alt=""  src="img/atras.gif" name="atras" width="60" height="20" border="0"></a>
        <div id="conFase">
            <div id="Fase">
                <table border="1" class="tabla" width="100%">
                    <thead>
                        <tr><th colspan="4"><strong id="tituloF"><%=request.getParameter("nombre")%></strong></th></tr>
                        <tr>
                            <th width="25%"><div align="center"><strong>Seguimiento</strong></div></th>
                            <th width="25%"><div align="center"><strong>Avance</strong></div></th>
                            <th width="25%"><div align="center"><strong>Estado</strong></div></th>
                            <th width="25%"><div align="center"><strong>Fecha</strong></div></th>
                        </tr>
                    </thead>
                    <%for (int i = 0; i < seguimientos.length; i++) {
                                    seguimiento = seguimientos[i];
                    %>
                    <tr id="fila<%=seguimiento.get("idsgpr")%>" bgcolor="<%=General.getColorSemSegui(seguimiento.get("semsg").toString())%>">
                        <td><a href="#" onclick="verSeguimiento(<%=seguimiento.get("idsgpr")%>, 'F')"><%=seguimiento.get("corte")%></a></td>
                        <!--td id="etapa< %=seguimiento.get("idsgpr")%>">< %=seguimiento.get("etapasg")%></td-->
                        <td id="avance<%=seguimiento.get("idsgpr")%>"><%=seguimiento.get("avance")%> %</td>
                        <td id="estado<%=seguimiento.get("idsgpr")%>"><%=seguimiento.get("estado")%></td>
                        <td id="fecha<%=seguimiento.get("idsgpr")%>"><%=seguimiento.get("fecha")%></td>
                    </tr>
                    <%              }       /* Del ciclo de recorrido de seguimientos */
                    %>
                    <tr><td colspan="4" align="center"><strong>Detalle de Seguimiento Id. interno: <input readonly type="text" size="5" name="identF" id="identF"/></strong></td></tr>
                    <tr>
                        <td>Corte: <input readonly type="text" size="10" name="corte" id="corteF"/></td>
                        <td>F.Límite:<input readonly type="text" size="10" name="flim" id="flimF"/></td>
                        <td>Últ. Registro:<input readonly type="text" size="10" name="fecs" id="fecsF"/></td>
                        <td># Mods: <input readonly type="text" size="10" name="movs" id="movsF"/></td>
                    </tr>
                    <tr>
                    <input type="hidden" name="etas" id="etasF"/>
                    <td>Avance del alcance:</td><td><input type="hidden" id="avanceIntF"/><input readonly type="text" size="12" id="avanceExtF"/><a href="#" onClick="return opcionesModal('avanceExtF', 'avanceIntF', getAvance(), respLinkF);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                    <td>Estado:</td><td><input type="hidden" id="estsIntF"/><input readonly type="text" size="12" name="ests" id="estsExtF"/><a href="#" onClick="return opcionesModal('estsExtF','estsIntF',getEstados(),respLinkF);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                    </tr>
                    <tr>
                        <td>Resultado</td>
                        <td colspan="3"><textarea readonly rows="3" cols="65"  name="ress" id="ressF"></textarea><br></td>
                    </tr>
                    <tr>
                        <td>Nivel de alerta</td><td colspan="3"><input readonly type="text" size="35" name="alertaExt" id="alertaExtF"/><input type="hidden" name="alertaInt" id="alertaIntF"/><a href="#" onClick="return opcionesModal('alertaExtF','alertaIntF',getSemaforo(),respLinkF);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                    </tr>
                    <tr>
                        <td>GastPers Interno.:</td> <td colspan="3"><input readonly type="text" size="20" id="costIntF"/></td>
                    </tr>
                    <tr>
                        <td>Ingresos</td><td><input readonly type="text" size="12" name="ing" id="ingF"/></td>
                        <td>Inversión</td><td><input readonly type="text" size="12" name="inv" id="invF"/></td>
                    </tr>
                    <tr>
                        <td>GastPers Ext.</td><td><input readonly type="text" size="12" name="gper" id="gperF"/></td>
                        <td>Otros G</td><td><input readonly type="text" size="12" name="otrg" id="otrgF"/></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <input type="hidden" name="aciTom" id="aciTomF" value="_"/><input type="hidden" name="sopor" id="soporF" value="_"/>
                            <input id="editarF" disabled value="Editar Resultado" type="button" class="boton" onclick="accionEditarSegui('F')"/>
                            <input id="guardarF" style="display: none;" value="Guardar Resultado" type="button" class="boton" onclick="accionGrabarSegui('F')"/>
                        </td>                        
                    </tr>
                    <tr>
                        <td colspan="4" align="center"><strong>Observaciones del Responsable:</strong>
                            <textarea readonly rows="3" cols="65" name="obsvDir" id="obsvDirF"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <input id="editarObsvDir"  value="Editar Observación" type="button" class="boton"/>
                            <input id="guardarObsvDir" style="display: none;" value="Guardar Observacion" type="button" class="boton"/>
                        </td>
                    </tr>
                     <tr>
                        <td colspan="4" align="center"><strong>Adjuntar documento general de soporte en formato PDF</strong>
                           
                        </td>
                    </tr>
                    <tr>
              <td colspan="4"class="textocom">
               El sistema admite solo un Archivo PDF, asegúrese que dentro de ese archivo se encuentren todos los documentos requeridos. <br><br>
              </td>
            </tr>
            <%--
            <tr>
                <td colspan="1"class="textocom" align="right"><FONT SIZE=2>Ingrese un documento PDF:</FONT></td>
              
              <td colspan="3" align="left" class="textocom">
                   <form name='cargarRut' method='POST' ENCTYPE='multipart/form-data' action='cargarDocSoporte?idp=<%=proyecto.getIdFase()%>&nombre=<%=request.getParameter("nombre")%>' >
                       <input class='inputlargo' type='file' name='RutEmp' id='RutEmp'>
                       <input id='subFor1' value='Enviar Pdf' type='submit'/> 
                   </form>
                       <br>
                       <%
                  
                   //String sFichero = "C:/Users/Luis Salas/Desktop/DocSeguimeinto/Doc-"+proyecto.getIdFase()+"-Sop.pdf";
              String sFichero = "/usr/local/SUN/2/glassfish/domains/domain1/docroot/DocSeguimeinto/Doc-"+proyecto.getIdFase()+"-Sop.pdf";
           File fichero = new File(sFichero);

           //Hashmap datosgenGrad= emp.
           //nom_est, tel_residencia, dir_residencia, email, cel, ciudad_residencia, perfil
           if (fichero.exists()){%>
              
                <a href='http://tycho.escuelaing.edu.co/DocSeguimeinto/Doc-<%=proyecto.getIdFase()%>-Sop.pdf' target='_blank'> ver documento adjunto</a> 
                
              <%}%>
                       <br>
              </td>
              
            </tr>--%>  
                </table>
            </div>
            <div id="ListaDed">
                <table border="1" class="tabla" width="100%">
                    <thead>
                        <tr>
                            <th colspan="3"><strong id="tituloD">Dedicación</strong></th>
                        </tr>
                        <tr>
                            <th width="47%"><div align="center"><strong>Nombre</strong></div></th>
                            <th width="47%"><div align="center"><strong>Horas</strong></div></th>
                            <th width="6%"><div align="center"><strong>&nbsp;</strong></div></th>
                        </tr>
                    </thead>
                    <tr>
                        <td colspan="3">
                            <div style="height: 320px; overflow: auto;">
                                <table width="100%" border="1" class="tabla">
                                    <tbody id="dedicacion">
                                        <tr id="camposNuevaDedi" style="display: none;">
                                            <td colspan="3">Personal: <input type="text" readonly size="50" id="recurExt"/><input type="hidden" id="recurInt"/><input type="hidden" id="uniRecurExt"/><a href="#" id="imgRecur" onClick="return empleadosModal('recurExt','recurInt','uniRecurExt','uniRecurExt', true);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tfoot>
                        <tr>
                            <td align="center">
                                <input id="nuevaDedi"  value="Nueva Dedicación" type="button" class="boton"/>
                                <input id="crearDedi" style="display: none;" value="Crear Dedicación" type="button" class="boton"/>
                            </td>
                            <td align="center">
                                <input id="editarDedi" disabled value="Editar Dedicación" type="button" class="boton"/>
                                <input id="guardarDedi" style="display: none;" value="Guardar Dedicación" type="button" class="boton"/>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <div id="conEnt">
            <div id="ListaEnt">
                <table border="1" class="tabla" width="100%">
                    
                        <tr>
                            <td colspan="1"><th><div align="center"><strong>Entregables de la Fase</strong></div></th><td>
                    
                        </tr>
                    
                    <tbody id="cuerpoEntregables">
                        <%
                    int numdoc=0;
                    int numdocext=0;
                        for (HashMap entrega : proyecto.getLisEntregas() ) {
                            
                            //Pruebas
                            //String sFichero = "C:/archivosContextos/DocSeguimeintoEnt/Doc-"+entrega.get("ident")+"-Ent.pdf";
                            //Producción
                            String sFichero = "/usr/local/SUN/2/glassfish/domains/domain1/docroot/DocSeguimeintoEnt/Doc-"+entrega.get("ident")+"-Ent.pdf";
                            
                            File ficheros = new File(sFichero);
                            String nomdoc=(String)entrega.get("ident");
                   
                            numdoc = 0;
                            while(ficheros.exists()) {
                                    numdoc ++;
                                    nomdoc = (String) entrega.get("ident")+"_"+String.valueOf(numdoc);

                                    //Pruebas
                                    //sFichero = "C:/archivosContextos/DocSeguimeintoEnt/Doc-"+nomdoc+"-Ent.pdf";
                                    //Producción
                                    sFichero = "/usr/local/SUN/2/glassfish/domains/domain1/docroot/DocSeguimeintoEnt/Doc-"+nomdoc+"-Ent.pdf";

                                    ficheros = new File(sFichero);
                            }
                        %>
                        <tr>
                            <td><a href="#" onclick="return verListSeguiEnt(<%=entrega.get("ident")%>)" id="ent<%=entrega.get("ident")%>"><%=entrega.get("noment")%></a></td>
                         <td >
                            
                        <div name="UpFileE" id="UpFileE<%=entrega.get("ident")%>" rows="2" cols="55" readonly>
              
               <form name='cargarSopEnt' method='POST' ENCTYPE='multipart/form-data' action='cargaDocSoporteEnt'>
                   <input type="hidden" name="idp" value="<%=nomdoc%>">
                   <input type="hidden" name="idseg" value="<%=proyecto.getIdFase()%>">
                   <input type="hidden" name="nombre" value="<%=request.getParameter("nombre")%>">
                   <input class='inputlargo' type='file' name='SopEnt' id='SopEnt'>
                   <input id='subFor2' value='Enviar PDF' type='submit'/>
               </form>
                   <%
           
           //Pruebas
           //String eFichero = "C:/archivosContextos/DocSeguimeintoEnt/Doc-"+entrega.get("ident")+"-Ent.pdf";
           //Producción
           String eFichero = "/usr/local/SUN/2/glassfish/domains/domain1/docroot/DocSeguimeintoEnt/Doc-"+entrega.get("ident")+"-Ent.pdf";
           
           File ficheroe = new File(eFichero);
                      //Hashmap datosgenGrad= emp.
           //nom_est, tel_residencia, dir_residencia, email, cel, ciudad_residencia, perfil
           numdocext=0;
           nomdoc=(String) entrega.get("ident");
           while (ficheroe.exists()) {
                    long ms = ficheroe.lastModified();
                    Date d = new Date(ms);
                    Calendar c = new GregorianCalendar(); 
                    c.setTime(d);
                    String dia = Integer.toString(c.get(Calendar.DATE));
                    String mes = Integer.toString(c.get(Calendar.MONTH)+1);
                    String annio = Integer.toString(c.get(Calendar.YEAR));
                    String hora = Integer.toString(c.get(Calendar.HOUR_OF_DAY));
                    String minuto = Integer.toString(c.get(Calendar.MINUTE));
                   
                   %>
            <a href='http://tycho.escuelaing.edu.co/DocSeguimeintoEnt/Doc-<%=nomdoc%>-Ent.pdf' target='_blank'> ver documento del Entregable <%=nomdoc%></a>(<%=mes%>/<%=annio%>)<br>            
           <%      numdocext=numdocext+1;
                   nomdoc=(String)entrega.get("ident")+"_"+String.valueOf(numdocext);
                   
                   //Pruebas
                   //eFichero = "C:/archivosContextos/DocSeguimeintoEnt/Doc-"+nomdoc+"-Ent.pdf";
                   //Producción
                   eFichero = "/usr/local/SUN/2/glassfish/domains/domain1/docroot/DocSeguimeintoEnt/Doc-"+nomdoc+"-Ent.pdf";
                   
                   ficheroe = new File(eFichero);
            }%>
                            </div>
                        </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
            <div id="Ent">
                <table border="1" class="tabla" width="100%">
                    <tr>
                        <td colspan="4">
                            <table width="100%" border="1" class="tabla" id="tabla" align="center">
                                <thead>
                                    <tr><th colspan="4"><strong id="tituloE">_</strong></th></tr>
                                    <tr>
                                        <th width="8%"><div align="center"><strong>Seguimiento</strong></div></th>
                                        <th width="30%"><div align="center"><strong>Avance</strong></div></th>
                                        <th width="30%"><div align="center"><strong>Estado</strong></div></th>
                                        <th width="10%"><div align="center"><strong>Fecha</strong></div></th>
                                    </tr>
                                </thead>
                                <tbody id="listSegEnt"></tbody>
                            </table>
                        </td>
                    </tr>
                    <tr><td colspan="4" align="center"><strong>Detalle de Seguimiento</strong></td></tr>
                    <tr><td><input readonly type="text" size="5" name="ident" id="identE"/></td>
                        <td>Corte: <input readonly type="text" size="12" name="corte" id="corteE"/></td>
                        <td>F.Límite:</td><td><input readonly type="text" size="14" name="flim" id="flimE"/></td>
                    </tr>
                    <tr> <td colspan="2">Último Registro: <input readonly type="text" size="12" name="fecs" id="fecsE"/></td>
                        <td># Mods:</td><td><input readonly type="text" size="5" name="movs" id="movsE"/></td>
                    </tr>
                    <tr>
                        <td>Avance del alcance:</td><td><input type="hidden" name="etas" id="etasE"/><input type="hidden" id="avanceIntE"/><input readonly type="text" size="12" id="avanceExtE"/><a href="#" onClick="return opcionesModal('avanceExtE', 'avanceIntE', getAvance(), respLinkE);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                        <td>Estado:</td><td><input type="hidden" id="estsIntE"><input readonly type="text" size="12" name="ests" id="estsExtE"><a href="#" onClick="return opcionesModal('estsExtE','estsIntE',getEstados(),respLinkE);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                    </tr>
                    <tr>
                            <td>Resultado</td>
                        <td colspan="3"><textarea readonly rows="3" cols="65"  name="ress" id="ressE"></textarea><br></td>
                    </tr>
                    <tr>
                        <td>Nivel de alerta</td><td colspan="3"><input readonly type="text" size="35" name="alertaExt" id="alertaExtE"/><input type="hidden" name="alertaInt" id="alertaIntE"/><a href="#" onClick="return opcionesModal('alertaExtE','alertaIntE',getSemaforo(),respLinkE);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                    </tr>
                    <tr>
                        <td colspan="4">GastPers Interno: <input readonly type="text" size="10" id="costIntE"/></td>
                    </tr>
                    <tr>
                        <td>Ingresos: <input readonly type="text" size="10" id="ingE"/></td>
                        <td>Inversión: <input readonly type="text" size="10" id="invE"/></td>
                        <td>GastPers Ext.: <input readonly type="text" size="10" id="gperE"/></td>
                        <td>Otros G: <input readonly type="text" size="10" id="otrgE"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">Acciones a tomar:<br>                            
                            <textarea readonly rows="3" cols="35" name="aciTom" id="aciTomE"></textarea>
                        </td>
                        <td colspan="2">Soporte: <br>
                            <textarea readonly rows="3" cols="35" name="sopor" id="soporE"></textarea>
                        </td>
                    </tr>                    
                    <tr>
                        <td>
                            Observaciones:
                        </td>
                        <td colspan="3">
                            <textarea name="obsvDirE" id="obsvDirE" rows="2" cols="55" readonly> </textarea>
                        </td>
                    </tr>
                    
                        <td colspan="4" align="center">
                            <input id="editarE" disabled value="Editar Resultado" type="button" class="boton" onclick="accionEditarSegui('E')"/>
                            <input id="guardarE" style="display: none;" value="Guardar Resultado" type="button" class="boton" onclick="accionGrabarSegui('E')"/>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>