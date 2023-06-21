<%@page import="BDintraeci.EmpleadoRemote"%>
<%@ include file="../secure.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
            response.setHeader("Cache-Control", "no-cache");
            String titulo = new String("Sistema de Talento Humano");            
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            EmpleadoRemote emp = conEjb.lookupEmpleadoRemote();
            emp.inicializar(((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getIdemp());
            session.setAttribute("emp", emp ) ;
            HashMap datos = emp.datosGenerales() ;
            String pc = "", nc = "" ;
            if (datos.get("fac_rhh").equals("+"))
                pc = "checked" ;
            else
                nc = "checked" ;
            //response.sendRedirect("Mensajes?idmsj=14");
%>
<html>
    <head>
        <title>Hoja de Vida Personal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script type="text/javascript" src="jscript/talentohum/empleado.js"></script>
        <script type="text/javascript" src="jscript/talentohum/aspirante.js"></script>
        <script type="text/javascript" src="jscript/talentohum/experiencia.js"></script>
        <script type="text/javascript" src="jscript/talentohum/estudios.js"></script>
        <script type="text/javascript" src="jscript/talentohum/idiomas.js"></script>
        <script type="text/javascript" src="jscript/talentohum/produccion.js"></script>
        <script type="text/javascript" src="jscript/talentohum/terceros.js"></script>
        <script language="javascript" type="text/javascript">
            var respEmpleado = false ;
            var respEstud = false ;
            var respExper = false ;
            var respEstudio = false ;
            var respPub = false ;
            var respMem = false ;
            var respProd = false ;
            var respIdi = false ;
        </script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondoblanco.gif">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezadoTalhum.jsp">
            <jsp:param name="parametro" value="<%=datos.get("nombres")%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>

        <div align="center"><strong>
            <a id="verconvo" href="#" style="display: inline;" onclick="verConvocatoria();">Aplicar a Convocatorias</a>
            <%--| <a id="admconvo" href="#" style="display: inline;" onclick="admConvocatoria();">Adm. Convocatorias</a>
            | <a id="admcompo" href="#" style="display: inline;" onclick="verCompromisos(1, 1);">Adm. Compromisos</a>
            | <a id="admcompo" href="#" style="display: inline;" onclick="verEvaluacion(5, 1);">Adm. Evaluación</a></strong>--%>
            <table border="1" class="tabla" id="tabla1" align="center" width="70%">
                <thead>
                  <th colspan="4"><div align="center"><strong>Información Empleado</strong></div></th>
                </thead>
                <form name="fempleado" action="">
                    <tr><td><strong>Documento:</strong></td>
                        <td><input disabled="true" type="text" size="12" name="idEmp" id="idEmp" value="<%=datos.get("cod_emp")%>"/></td>
                        <td><strong>Nacimiento:</strong></td>
                        <td><input disabled="true" type="text" size="12" name="fnac" id="fnac" value="<%=datos.get("fecn")%>"/>
                            <input disabled="true" type="text" size="12" name="gen" id="gen" value="<%=datos.get("gen")%>"/></td>
                    </tr>
                    <tr><td><strong>Nombre:</strong></td>
                        <td colspan="3"><input disabled="true" type="text" size="70" name="nomEmp" id="nomEmp" value="<%=datos.get("nombres")%>"/>
                                        <input disabled="true" type="text" size="20" name="estlab" id="estlab" value="<%=datos.get("est_lab")%>"/>
                                        <input disabled="true" type="text" size="18" name="catemp" id="catemp" value="<%=datos.get("categoria")%>"/></td>
                    </tr>
                    <tr><td><strong>Est.Civil</strong></td>
                        <td><input disabled="true" type="text" size="20" name="estciv" id="estciv" value="<%=datos.get("est_civ")%>"/>
                            <input type="hidden" size="3" name="eciv" id="eciv" value="<%=datos.get("eciv")%>"/>
                            <a href="#" onClick="return opcionesModal('estciv','eciv',listaECivil(),respEmpleado);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                        <td><strong>TipSangre</strong></td>
                        <td><input disabled="true" type="text" size="4" name="tsan" id="tsan" value="<%=datos.get("gru_san")%>"/>
                            <a href="#" onClick="return opcionesModal('tsan','tsan',listaTSangre(),respEmpleado);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                            <strong>Factor RH <input disabled="true" type="radio" name="facrh" id="facrh1" value="P" <%=pc%>/> +
                                              <input disabled="true" type="radio" name="facrh" id="facrh2" value="N" <%=nc%>/> -</strong></td>
                    </tr>
                    <tr><td><strong>Lib.Militar</strong></td>
                        <td><input disabled="true" type="text" size="16" name="libmil" id="libmil" value="<%=datos.get("num_lib")%>"/></td>
                        <td><strong>Clase:</strong></td>
                        <td><input disabled="true" type="text" size="4" name="clalib" id="clalib" value="<%=datos.get("cla_lib")%>"/>
                            <strong>Distrito No:</strong> <input disabled="true" type="text" size="4" name="dimlib" id="dimlib" value="<%=datos.get("dim_lib")%>"/></td>
                    </tr>
                    <tr><td><strong>Dirección:</strong></td>
                        <td><input disabled="true" type="text" size="40"  maxlength="40" name="dir" id="dir" value="<%=datos.get("dir_res")%>"/></td>
                        <td><strong>Teléfonos:</strong></td>
                        <td><input disabled="true" type="text" size="10"  maxlength="10" name="tel" id="tel" value="<%=datos.get("tel_res")%>"/>
                            <strong>Cel: :</strong> <input disabled="true" type="text" size="14"  maxlength="10" name="cel" id="cel" value="<%=datos.get("tel_celular")%>"/></td>
                    </tr>
                    <tr><td><strong>Ciudad:</strong></td>
                        <td><input type="hidden" size="10" name="ciud" id="ciud" value="<%=datos.get("ciu_res")%>"/>
                        <input disabled="true" type="text" size="35" name="cciud" id="cciud" value="<%=datos.get("nom_ciu")%>"/>
                        <a href="#" onClick="return consultasModal('cciud','ciud',respEmpleado,'101');"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                        <td><strong>Dir.Electrónica</strong></td>
                        <td><input disabled="true" type="text" size="45"  maxlength="45" name="email" id="email" value="<%=datos.get("email")%>"/>
                            <%--<input id="editarEmp" value="Editar" type="button" class="boton" onclick="editarEmpleado();"/>
                            <input id="guardarEmp" value="Guardar" style="display: none;" type="button" class="boton" onclick="guardarEmpleado();"/>--%>
                        </td>
                    </tr>
                </form>
                    <tr><td colspan="4" align="center"><strong>Ver Más Información</strong></td></tr>
                    <tr><td colspan="4" align="center">
                           <input id="Perfil" value="Perfil" type="button" class="boton" onclick="verPerfilEmp();"/>
                           <input id="Estudios" value="Estudios" type="button" class="boton" onclick="verEstudios();"/>
                           <input id="idiomas" value="Idiomas" type="button" class="boton" onclick="verIdiomas();"/>
                           <input id="explab" value="Exp.Laboral" type="button" class="boton" onclick="verExperiencia();"/>
                           <input id="public" value="Publicaciones" type="button" class="boton" onclick="verPublicacion();"/>
                           <input id="membre" value="Membresias" type="button" class="boton" onclick="verMembresia();"/>
                           <input id="distinc" value="Distinciones" type="button" class="boton" onclick="verDistinciones();"/>
                           <input id="produc" value="Producción" type="button" class="boton" onclick="verProduccion();"/>
                           <input id="histacad" value="Docencia" type="button" class="boton" onclick="verDocencia();"/>
                           <%--<input id="hcompro" value="Compromisos" type="button" class="boton" onclick="verCompromisos(0, 1);"/>
                           <input id="evalua" value="Evaluación" type="button" class="boton" onclick="verEvaluacion(0, 1);"/> </td> --%>
                       
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabperf" style="display: none;" width="100%">
                            <thead><th align="center"><strong>Perfil</strong></th></thead>
                            <tfoot>
                                <form name="fperfil" action="">
                                    <tr><td align="center">
                                        <textarea rows="6" cols="90" name="perf" id="perf"></textarea>
                                        <br><input id="GuardarPerfil" value="Guardar" type="button" class="boton" onclick="guardarPerfilEmp();"/></td>
                                    </tr>
                                </form>
                            </tfoot>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabest" style="display: none;" width="100%">
                            <thead><th align="center" colspan="5"><strong>Información de Estudios</strong></th></thead>
                            <thead>
                                <form name="festudios" action="">
                                    <tr><td colspan="3" align="center"><strong>Detalle de Información de Estudios</strong>
                                        <input type="hidden" size="6" name="idestud" id="idestud"/></td>
                                        <%--<td><input style="display: inline;" id="NuevoEstud" value="Nuevo" type="button" class="boton" onclick="nuevoEstudio();"/></td>
                                        <td><input style="display: none;" id="GuardarEstud" value="Guardar" type="button" class="boton" onclick="guardarEstudio();"/></td>--%>
                                    </tr>
                                    <tr><td><strong>Título</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="60"  maxlength="80" name="titulo" id="titulo"/>
                                          <strong>Fecha Grado: </strong><input disabled="true" type="text"  maxlength="10" size="15" name="fecgrad" id="fecgrad"/></td>
                                        <td colspan="2"><strong>Tta.Prof.</strong>
                                            <input disabled="true" value="NA" type="text" size="15"  maxlength="13" name="ntarp" id="ntarp"/></td>
                                    </tr>
                                    <tr><td><strong>Institución</strong></td>
                                        <td colspan="2"><input type="hidden" size="10" name="cinstit" id="cinstit"/>
                                            <input disabled="true" type="text" size="50" name="instit" id="instit"/>
                                            <a href="#" onClick="return consultasModal('instit','cinstit',respEstud,'102');"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                                            <strong>No.Sem: </strong><input disabled="true" type="text" size="3" maxlength="2" name="nsem" id="nsem"/>
                                            <strong><input style="visibility:hidden" disabled="true" type="checkbox" name="blqes" id="blqes"/></strong></td>
                                        <td colspan="2"><strong>Nivel:  </strong>
                                            <input disabled="true" type="text" size="17" name="niv" id="niv"/>
                                           <input type="hidden" size="5" name="cniv" id="cniv"/>
                                           <a href="#" onClick="return opcionesModal('niv','cniv',listaNivelEstud(),respEstud);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                    </tr>
                                </form>
                            </thead>
                            <tr><td colspan="5"><div style="overflow: auto; height: 220px;">
                                <table border="1" class="tabla" id="tcuerpoestud" align="center" width="100%">
                                <thead>
                                    <th width="5%"><div align="center"><strong>Nivel</strong></div></th>
                                    <th width="40%"><div align="center"><strong>Título</strong></div></th>
                                    <th width="30%"><div align="center"><strong>Universidad</strong></div></th>
                                    <th width="15%"><div align="center"><strong>FecGrado</strong></div></th>
                                    <th width="10%"><div align="center"><strong>Borrar</strong></div></th>
                                </thead>
                                <tbody id="cuerpoestud"></tbody>
                                </table></div></td></tr>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tablab" style="display: none;" width="100%">
                            <thead><th align="center" colspan="4"><strong>Experiencia Laboral</strong></th></thead>
                            <thead>
                                <form name="fexperiencia" action="">
                                    <tr><td colspan="4" align="center"><strong>Detalle de Información de Experiencia</strong>
                                        <input type="hidden" size="6" name="idhis" id="idhis"/></td>
                                    </tr>
                                    <tr><td><strong>Empresa:</strong></td>
                                        <td><input disabled="true" type="text" size="55"  maxlength="60" name="empresa" id="empresa"/></td>
                                        <td><strong>TipoCargo:</strong></td>
                                        <td><input disabled="true" type="text" size="14" name="tcargo" id="tcargo"/>
                                            <a href="#" onClick="return opcionesModal('tcargo','tcargo',listaTCargos(),respExper);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                    </tr>
                                    <tr><td><strong>Cargo:</strong></td>
                                        <td><input disabled="true" type="text" size="55"  maxlength="60" name="cargo" id="cargo"/></td>
                                        <td><strong>Nivel Doc:</strong></td>
                                        <td><input disabled="true" type="text" size="14" name="nivel" id="nivel"/>
                                            <a href="#" onClick="return opcionesModal('nivel','nivel',listaNivelEstud(),respExper);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                    </tr>
                                    <tr><td><strong>Periodo Desde:</strong></td>
                                        <td><input disabled="true" type="text" size="12" maxlength="10" name="fdesde" id="fdesde"/>
                                            <strong>Hasta</strong> <input disabled="true" type="text" size="12" maxlength="10" name="fhasta" id="fhasta"/>
                                            <strong>Congelado<input disabled="true" type="checkbox" name="blqel" id="blqel"/></strong></td>
                                        <td colspan="2"><input style="display: none;" id="GuardarExper" value="Guardar" type="button" class="boton" onclick="guardarExperiencia();"/>
                                            <input style="display: inline;" id="NuevaExper" value="Nueva Experiencia" type="button" class="boton" onclick="nuevaExperiencia();"/></td>
                                    </tr>
                                </form>
                            </thead>
                            <tr><td colspan="6"><div style="overflow: auto; height: 220px;">
                                <table border="1" class="tabla" id="tcuerpolab" align="center" width="100%">
                                <thead>
                                    <th width="15%"><div align="center"><strong>TipoCargo</strong></div></th>
                                    <th width="42%"><div align="center"><strong>Empresa</strong></div></th>
                                    <th width="25%"><div align="center"><strong>Periodo</strong></div></th>
                                    <th width="18%"><div align="center"><strong>Borrar</strong></div></th>
                                </thead>
                                <tbody id="cuerpolab"></tbody>
                                </table></div></td></tr>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabidi" style="display: none;" width="100%">
                            <thead><th align="center" colspan="7"><strong>Manejo de Otros Idiomas</strong></th></thead>
                            <thead>
                                <form name="fidioma" action="">
                                    <tr><td colspan="6" align="center"><strong>Detalle de Información de otros idiomas</strong>
                                        <input type="hidden" size="6" name="idlen" id="idlen"/></td>
                                    </tr>
                                    <tr><td><input disabled="true" type="text" size="15" name="lengua" id="lengua"/>
                                        <a href="#" onClick="return opcionesModal('lengua','lengua',listaIdiomas(),respIdi);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                        <td><strong>Certific: </strong>
                                            <input disabled="true" type="text" size="50" name="certif" id="certif"/></td>
                                        <td><strong>Fecha:</strong></td>
                                        <td colspan="3"><input disabled="true" type="text" size="15" maxlength="10" name="fcert" id="fcert"/></td>
                                    </tr>
                                    <tr><td></td>
                                        <td><strong>Entidad: </strong>
                                            <input disabled="true" type="text" size="50" maxlength="40" name="organ" id="organ"/></td>
                                        <td><strong>Puntaje:</strong></td>
                                        <td colspan="3"><input disabled="true" type="text" size="15"  maxlength="14" name="punti" id="punti"/></td>
                                    </tr>
                                    <tr><td><strong>Manejo:</strong></td>
                                        <td><strong>Lee: </strong><input disabled="true" type="text" size="2" maxlength="1" name="mlee" id="mlee"/>
                                            <strong>Escribe: </strong><input disabled="true" type="text" size="2" maxlength="1" name="mesc" id="mesc"/>
                                            <strong>Habla: </strong><input disabled="true" type="text" size="2" maxlength="1" name="mhab" id="mhab"/>
                                            <strong>Congelado <input disabled="true" type="checkbox" name="blqi" id="blqi"/></strong>
                                        </td>
                                        <td colspan="4"><input style="display: none;" id="GuardarIdi" value="Guardar" type="button" class="boton" onclick="guardarIdioma();"/>
                                            <input style="display: inline;" id="NuevoIdi" value="Nuevo" type="button" class="boton" onclick="nuevoIdioma();"/></td>
                                    </tr>
                                </form>
                            </thead>
                            <tr><td colspan="6"><div style="overflow: auto; height: 220px;">
                                <table border="1" class="tabla" id="tcuerpoidi" align="center" width="100%">
                                <thead>
                                    <th width="22%"><div align="center"><strong>Lengua</strong></div></th>
                                    <th width="61%"><div align="center"><strong>Certificación</strong></div></th>
                                    <th width="4%"><div align="center"><strong>Lee</strong></div></th>
                                    <th width="4%"><div align="center"><strong>Escr.</strong></div></th>
                                    <th width="4%"><div align="center"><strong>Habla</strong></div></th>
                                    <th width="5%"><div align="center"><strong>Borrar</strong></div></th>
                                </thead>
                                <tbody id="cuerpoidi"></tbody>
                                </table></div></td></tr>
                        </table></td>
                    </tr>
                    <tr><td colspan="5">
                        <table border="1" class="tabla" id="tabpub" style="display: none;" width="100%">
                            <thead><th align="center" colspan="5"><strong>Publicaciones</strong></th></thead>
                            <thead>
                                <form name="fpublic" action="">
                                    <tr><td colspan="5" align="center"><strong>Detalle de Información de Publicaciones</strong>
                                        <input type="hidden" size="6" name="idpub" id="idpub"/></td>
                                    </tr>
                                    <tr><td><strong>Tipo:</strong></td>
                                        <td><input disabled="true" type="text" size="15" name="tipo" id="tipo"/>
                                            <a href="#" onClick="return opcionesModal('tipo','tipo',listaTiposP(),respPub);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                                            <strong>Fecha(aaaa/mm): </strong><input disabled="true" type="text" size="8"  maxlength="7" name="fec" id="fec"/></td>
                                        <td><strong>Área:</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="13" name="arpub" id="arpub"/>
                                            <a href="#" onClick="return opcionesModal('arpub','arpub',listaAreasP(),respPub);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                    </tr>
                                    <tr><td><strong>Título</strong></td>
                                        <td><input disabled="true" type="text" size="77" maxlength="150" name="titpub" id="titpub"/></td>
                                        <td><strong>Edición/Edit:</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="28" maxlength="50" name="edic" id="edic"/></td>
                                    </tr>
                                    <tr><td><strong>Tít. Mayor</strong></td>
                                        <td><input disabled="true" type="text" size="77" maxlength="100" name="tmayor" id="tmayor"/></td>
                                        <td><strong>ISBN/ISSN:</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="15" maxlength="15" name="edit" id="edit"/></td>
                                    </tr>
                                    <tr><td><strong>Ciudad:</strong></td>
                                        <td><input disabled="true" type="text" size="20" maxlength="30" name="ciudpub" id="ciudpub"/>
                                            <strong>País: </strong> <input disabled="true" type="text" size="20" maxlength="20" name="paispub" id="paispub"/></td>
                                        <td colspan="3"><input style="display: none;" id="GuardarPub" value="Guardar" type="button" class="boton" onclick="guardarPublicacion();"/>
                                            <input style="display: inline;" id="NuevaPub" value="Nueva" type="button" class="boton" onclick="nuevaPublicacion();"/></td>
                                    </tr>
                                </form>
                            </thead>
                            <tr><td colspan="5"><div style="overflow: auto; height: 220px;">
                                <table border="1" class="tabla" id="tcuerpopub" align="center" width="100%">
                                    <thead>
                                        <th width="11%"><div align="center"><strong>Tipo</strong></div></th>
                                        <th width="60%"><div align="center"><strong>Título</strong></div></th>
                                        <th width="10%"><div align="center"><strong>Fecha</strong></div></th>
                                        <th width="15%"><div align="center"><strong>Área</strong></div></th>
                                        <th width="4%"><div align="center"><strong>Borrar</strong></div></th>
                                    </thead>
                                    <tbody id="cuerpopub"></tbody>
                                </table></div></td></tr>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabdis" style="display: none;" width="100%">
                            <thead><th align="center" colspan="5"><strong>Distinciones</strong></th></thead>
                            <thead>
                                <form name="fdistin" action="">
                                    <tr><td colspan="5" align="center"><strong>Detalle de Información de Distinciones</strong>
                                        <input type="hidden" size="6" name="iddis" id="iddis"/></td>
                                    </tr>
                                    <tr><td><strong>Nombre:</strong></td>
                                        <td><input disabled="true" type="text" size="40" maxlength="40" name="nombred" id="nombred"/></td>
                                        <td><strong>Razón:</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="54" maxlength="140" name="razon" id="razon"/></td>
                                    </tr>
                                    <tr><td><strong>Instit:</strong></td>
                                        <td><input disabled="true" type="text" size="40" maxlength="40" name="institd" id="institd"/></td>
                                        <td><strong>Descrip:</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="54" maxlength="250" name="descri" id="descri"/></td>
                                    </tr>
                                    <tr><td><strong>País:</strong></td>
                                        <td><input disabled="true" type="text" size="20" maxlength="20" name="paisd" id="paisd"/>
                                            <strong> Año: </strong><input disabled="true" type="text" size="5" maxlength="4" name="anio" id="anio"/></td>
                                        <td colspan="3"><strong>Congelado <input disabled="true" type="checkbox" name="blqd" id="blqd"/></strong>
                                            <input style="display: none;" id="GuardarDis" value="Guardar" type="button" class="boton" onclick="guardarDistincion();"/>
                                            <input style="display: inline;" id="NuevaDis" value="Crear" type="button" class="boton" onclick="nuevaDistincion();"/></td>
                                    </tr>
                                </form>
                            </thead>
                            <tr><td colspan="5"><div style="overflow: auto; height: 220px;">
                                <table border="1" class="tabla" id="tcuerpodis" align="center" width="100%">
                                <thead>
                                    <th width="5%"><div align="center"><strong>Año</strong></div></th>
                                    <th width="35%"><div align="center"><strong>Nombre</strong></div></th>
                                    <th width="15%"><div align="center"><strong>País</strong></div></th>
                                    <th width="40%"><div align="center"><strong>Institución</strong></div></th>
                                    <th width="5%"><div align="center"><strong>Borrar</strong></div></th>
                                </thead>
                                <tbody id="cuerpodis"></tbody>
                                </table></div></td></tr>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabmem" style="display: none;" width="100%">
                            <thead><th align="center" colspan="4"><strong>Membresías</strong></th></thead>
                            <thead>
                                <form name="fmembresia" action="">
                                    <tr><td colspan="4" align="center"><strong>Detalle de Información de Membresías</strong>
                                        <input type="hidden" size="6" name="idmem" id="idmem"/></td>
                                    </tr>
                                    <tr><td><strong>Nombre:</strong></td>
                                        <td><input disabled="true" type="text" size="60" maxlength="50" name="nombrem" id="nombrem"/></td>
                                        <td colspan="2"><strong>Tipo Org.: </strong>
                                            <input disabled="true" type="text" size="15" name="tipm" id="tipm"/>
                                            <a href="#" onClick="return opcionesModal('tipm','tipm',listaTMem(),respMem);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                    </tr>
                                    <tr><td><strong>País</strong></td>
                                        <td colspan="3"><input disabled="true" type="text" size="20" maxlength="20" name="paism" id="paism"/>
                                            <strong> Categoría Membresía: </strong>
                                            <input disabled="true" type="text" size="15" name="catm" id="catm"/>
                                            <a href="#" onClick="return opcionesModal('catm','catm',listaCatMem(),respMem);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                    </tr>
                                    <tr><td><strong>Periodo:</strong></td>
                                        <td><input disabled="true" type="text" size="13" maxlength="10" name="fdesm" id="fdesm"/> -
                                            <input disabled="true" type="text" size="13" maxlength="10" name="fhasm" id="fhasm"/>
                                            <strong>Congelado <input disabled="true" type="checkbox" name="blqm" id="blqm"/></strong></td>
                                        <td colspan="2">
                                            <input style="display: none;" id="GuardarMem" value="Guardar" type="button" class="boton" onclick="guardarMembresia();"/>
                                            <input style="display: inline;" id="NuevaMem" value="Crear" type="button" class="boton" onclick="nuevaMembresia();"/></td>
                                    </tr>
                                </form>
                            </thead>
                            <tr><td colspan="4"><div style="overflow: auto; height: 220px;">
                                <table border="1" class="tabla" id="tcuerpomem" align="center" width="100%">
                                <thead>
                                    <th width="20%"><div align="center"><strong>País</strong></div></th>
                                    <th width="50%"><div align="center"><strong>Organización</strong></div></th>
                                    <th width="25%"><div align="center"><strong>Periodo</strong></div></th>
                                    <th width="5%"><div align="center"><strong>Borrar</strong></div></th>
                                </thead>
                                <tbody id="cuerpomem"></tbody>
                                </table></div></td></tr>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabpro" style="display: none;" width="100%">
                            <thead><th align="center" colspan="4"><strong>Producción</strong></th></thead>
                            <thead>
                                <form name="fproducto" action="">
                                    <tr><td colspan="4" align="center"><strong>Detalle de Información de Productos o Proyectos</strong>
                                        <input type="hidden" size="6" name="idpro" id="idpro"/></td>
                                    </tr>
                                    <tr><td><strong>Producto:</strong></td>
                                        <td colspan="3"><input disabled="true" type="text" size="100" name="titp" id="titp"/></td>
                                    </tr>
                                    <tr><td colspan="4"><table class="tabla" id="tabaux">
                                                <tr><td><strong>Objetivo:</strong><br><textarea rows="4" cols="40" disabled="true" name="objp" id="objp"></textarea></td>
                                                    <td><strong>Organización:<br></strong>
                                                        <textarea rows="1" cols="40" disabled="true" name="orgp" id="orgp"></textarea>
                                                        <strong><br>Referencia:<br></strong>
                                                        <textarea rows="1" cols="40" disabled="true" name="refp" id="refp"></textarea></td></tr></table>
                                        </td>
                                    </tr>
                                    <tr><td><strong>Tipo:</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="20" name="tipp" id="tipp"/>
                                            <a href="#" onClick="return opcionesModal('tipp','tipp',listaTProd(),respProd);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                                            <strong> País: </strong><input disabled="true" type="text" size="20" maxlength="20" name="paisp" id="paisp"/>
                                            <strong> Rol: </strong><input disabled="true" type="text" size="25" name="rolp" id="rolp"/>
                                                     <a href="#" onClick="return opcionesModal('rolp','rolp',listaRoles(),respProd);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                        <td>
                                            <input style="display: inline;" id="NuevaPro" value="Nuevo" type="button" class="boton" onclick="nuevoProducto();"/></td>
                                    </tr>
                                    <tr><td><strong>Periodo:</strong></td>
                                        <td><input disabled="true" type="text" size="13" maxlength="10" name="finip" id="finip"/> -
                                            <input disabled="true" type="text" size="13" maxlength="10" name="ffinp" id="ffinp"/>
                                            <strong>  Congelado <input disabled="true" type="checkbox" name="blqp" id="blqp"/></strong></td>
                                        <td colspan="2">
                                            <input style="display: none;" id="GuardarPro" value="Guardar" type="button" class="boton" onclick="guardarProducto();"/></td>
                                    </tr>
                                </form>
                            </thead>
                            <tr><td colspan="4"><div style="overflow: auto; height: 220px;">
                                <table border="1" class="tabla" id="tcuerpopro" align="center" width="100%">
                                <thead>
                                    <th width="15%"><div align="center"><strong>Tipo</strong></div></th>
                                    <th width="55%"><div align="center"><strong>Producto</strong></div></th>
                                    <th width="25%"><div align="center"><strong>Periodo</strong></div></th>
                                    <th width="5%"><div align="center"><strong>Borrar</strong></div></th>
                                </thead>
                                <tbody id="cuerpopro"></tbody>
                                </table></div></td></tr>
                        </table></td>
                    </tr>
                    <tr><td colspan="4"><div id="tabdoc" style="display: none;">
                            <div style="overflow: auto; height: 220px;">
                        <table border="1" class="tabla" id="tabdocp" width="100%">
                            <thead><th align="center" colspan="7"><strong>Experiencia en Docencia</strong></th></thead>
                            <thead>
                                <th width="10%"><div align="center"><strong>Periodo</strong></div></th>
                                <th width="70%"><div align="center"><strong>Asignatura</strong></div></th>
                                <th width="4%"><div align="center"><strong>Grp</strong></div></th>
                                <th width="4%"><div align="center"><strong>Cant</strong></div></th>
                                <th width="4%"><div align="center"><strong>Gan</strong></div></th>
                                <th width="4%"><div align="center"><strong>Per</strong></div></th>
                                <th width="4%"><div align="center"><strong>Can</strong></div></th>
                            </thead>
                            <tbody id="cuerpodoc"></tbody>
                        </table></div></div></td>
                    </tr>
            </table>
         </div>
       
    </body>
</html>