<%@page import="BDintraeci.AspiranteRemote"%>
<%@page import = "javax.servlet.http.HttpSession" %>
<%@page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
        response.setHeader("Cache-Control", "no-cache");
        String titulo = new String("Sistema de Convocatoria");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        AspiranteRemote asp = conEjb.lookupAspiranteRemote();
        asp.inicializar("0") ;
%>
<html>
    <head>
        <title>Hoja de Vida Aspirantes</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script type="text/javascript" src="jscript/talentohum/aspirante.js"></script>
        <script type="text/javascript" src="jscript/talentohum/empleado.js"></script>
        <script type="text/javascript" src="jscript/talentohum/experiencia.js"></script>
        <script type="text/javascript" src="jscript/talentohum/estudioasp.js"></script>
        <script type="text/javascript" src="jscript/talentohum/idiomas.js"></script>
        <script type="text/javascript" src="jscript/talentohum/produccion.js"></script>
        <script type="text/javascript" src="jscript/talentohum/terceros.js"></script>
        <link href="css/calendario.css" type="text/css" rel="stylesheet"> 
        <script src="jscript/calendar.js" type="text/javascript"></script> 
        <script src="jscript/calendar-es.js" type="text/javascript"></script> 
        <script src="jscript/calendar-setup.js" type="text/javascript"></script> 
        <script language="javascript" type="text/javascript">
            var respAspir = false ;
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
        <jsp:include page="encAspirante">
            <jsp:param name="parametro" value="" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
        <div align="center">
            <strong>Atención: Tenga en cuenta que debe utilizar Microsoft Explorer 8 o superior o Mozilla Firefox 10 o superior.</strong>
            <form name="faspirante" action="">
            <table border="1" class="tabla" id="tabreg" align="center" style="display: none;">
                <tr><td><strong>Documento:</strong></td>
                    <td><input type="text" size="12" maxlength="12" name="idAsp" id="idAsp"/><br>Solo Números</td>
                    <td><strong>Conf. Documento:</strong></td>
                    <td><input type="text" size="12" name="cidAsp" id="cidAsp"/><br>Solo Números</td>
                    <td><strong>Correo Electrónico:</strong></td>
                    <td><input type="text" size="40" name="emAsp" maxlength="40" id="emAsp"/></td>
                </tr>
                <tr><td><strong>1er. Apellido</strong></td>
                    <td><input type="text" size="20" name="ape1" id="ape1"/></td>
                    <td><strong>2do. Apellido:</strong></td>
                    <td><input type="text" size="20" name="ape2" id="ape2"/></td>
                    <td><strong>Nombres:</strong></td>
                    <td><input type="text" size="30" name="nomasp" id="nomasp"/>
                    <input id="registrar" value="Registrar" type="button" class="boton" onclick="Registrarse();"/></td>
                </tr>
            </table>
            <table border="1" class="tabla" id="tablogin" align="center">                
                <tr><td>Si ya está registrado Ingrese al Sistema.<br>
                        Sino Regístrese aquí:<input id="verreg" value="Registrarse" type="button" class="boton" onclick="verregistro();"/></td>
                    <td><strong>Documento: </strong>
                        <input type="text" value="" size="20" name="docing" id="docing"/></td>
                    <td><strong>Correo Electrónico: </strong>
                        <input type="text" value="" size="40" maxlength="40" name="emaing" id="emaing"/>
                    <input id="ingresar" value="Ingresar" type="button" class="boton" onclick="Ingresar();"/></td>
                </tr>
                <tr><td colspan="3" align="center">
                      <a id="verconvop" href="#" style="display: inline;" onclick="verConvocatoriaP();"><font size="+0.5">Haga clic para ver las convocatorias.</font></a>
                      <br><font color="red" size="+0.5">Para participar en las convocatorias debe estar registrado e ingresar al sistema.</font>
                    </td></tr>
            </table>
            </form>
        </div>
        <div align="center">
            <table border="1" class="tabla" id="tabla1" align="center" style="display: none;">
                <thead>
                        <th colspan="4"><div align="center"><strong>Información Aspirante</strong></div></th>
                </thead>
                <form name="fempleado" action="">
                    <tr><td><strong>Documento:</strong></td>
                        <td><input type="hidden" size="3" name="tdoc" id="tdoc"/>
                            <input disabled="true" type="text" size="4" name="tpdoc" id="tpdoc"/>
                            <a href="#" onClick="return opcionesModal('tpdoc','tdoc',listaTDoc(),respAspir);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                            <input disabled="true" type="text" size="12" name="idEmp" id="idEmp"/></td>
                        <td><strong>Nacimiento:</strong></td>
                        <td><input disabled="true" type="text" size="12" maxlength="10" name="fnac" id="fnac"/>
                            <img src="img/calendario.png" width="16" height="16" border="0" title="Fecha Inicial" id="lanzador"> 
                            <!-- script que define y configura el calendario--> 
                            <script type="text/javascript"> 
                            Calendar.setup({ 
                            inputField : "fnac", // id del campo de texto 
                            ifFormat : "%d/%m/%Y", // formato de la fecha que se escriba en el campo de texto 
                            button : "lanzador" // el id del botón que lanzará el calendario 
                            }); 
                            </script> 
                            <input type="hidden" size="8" name="ciunac" id="ciunac"/>
                            <input disabled="true" type="text" size="35" name="nciunac" id="nciunac"/>
                            <a href="#" onClick="return consultasModal('nciunac','ciunac',respAspir,'101');"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                    </tr>
                    <tr><td><strong>Nombre:</strong></td>
                        <td colspan="3"><input disabled="true" type="text" size="68" name="nomEmp" id="nomEmp"/>
                        <strong>Genero (F/M): </strong><input disabled="true" type="text" size="3" maxlength="1" name="gen" id="gen"/></td>
                    </tr>
                    <tr><td><strong>Est.Civil</strong></td>
                        <td><input disabled="true" type="text" size="20" name="estciv" id="estciv"/>
                            <input type="hidden" size="3" name="eciv" id="eciv"/>
                            <a href="#" onClick="return opcionesModal('estciv','eciv',listaECivil(),respAspir);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                        <td><strong>TipSangre</strong></td>
                        <td><input disabled="true" type="text" size="4" name="tsan" id="tsan"/>
                            <a href="#" onClick="return opcionesModal('tsan','tsan',listaTSangre(),respAspir);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                            <strong>Factor RH <input disabled="true" type="radio" name="facrh" id="facrh1" value="P"/> +
                                              <input disabled="true" type="radio" name="facrh" id="facrh2" value="N"/> -</strong>
                            <input type="hidden" value="_" size="16" name="libmil" id="libmil"/>
                            <input type="hidden" value="0" size="4" name="clalib" id="clalib"/>
                            <input type="hidden" value="0" size="4" name="dimlib" id="dimlib"/></td>
                    </tr>
                    <tr><td><strong>Dirección:</strong></td>
                        <td><input disabled="true" type="text" size="40" maxlength="50" name="dir" id="dir"/></td>
                        <td><strong>Teléfonos:</strong></td>
                        <td><input disabled="true" type="text" size="10" maxlength="10" name="tel" id="tel"/>
                            <strong>Cel: :</strong> <input disabled="true" type="text" size="14" maxlength="10" name="cel" id="cel"/></td>
                    </tr>
                    <tr><td><strong>Ciudad:</strong></td>
                        <td><input type="hidden" size="8" name="ciud" id="ciud"/>
                            <input disabled="true" type="text" size="35" name="cciud" id="cciud"/>
                            <a href="#" onClick="return consultasModal('cciud','ciud',respAspir,'101');"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                        <td><strong>Dir.Electrónica</strong></td>
                        <td><input disabled="true" type="text" size="50" maxlength="40" name="email" id="email"/></td>
                    </tr>
                    <tr><td align="center" colspan="2">
                            <input id="editarEmp" value="Editar" type="button" class="boton" onclick="editarEmpleado();"/>
                            <input id="guardarEmp" value="Guardar" style="display: none;" type="button" class="boton" onclick="guardarAspirante();"/>
                            <input id="salida" value="Salir" type="button" class="boton" onclick="window.location='salir'"/></td>
                        <td align="center" colspan ="2"><a id="verconvo" href="#" style="display: inline;" onclick="verConvocatoria();"><font size="+1">Haga clic para ver las convocatorias.</font></a></td>
                    </tr>
                </form>
                    <tr><td colspan="4" align="center">Debe anexar un archivo en formato pdf que contenga la hoja de vida y todas las copias de los diplomas de los estudios de pregrado y posgrado informados<br>
                            <a id="upfile" href="#" style="display: inline;" onclick="subirArc();">Anexar</a>
                    <td></tr>
                    <tr><td colspan="4" align="center"><strong>Ver Más Información</strong></td></tr>
                    <tr><td colspan="4" align="center">Atención: Si tiene problemas usando esta herramienta, favor comunicarse al teléfono 6683600 ext. 215 o enviar un correo a
                               <a href="mailto:mario.martinez@escuelaing.edu.co">mario.martinez@escuelaing.edu.co</a><br
                           <input id="perfil" value="Perfil" type="button" class="boton" onclick="verPerfil();"/>
                           <input id="Estudios" value="Estudios" type="button" class="boton" onclick="verEstudiosAsp();"/>
                           <input id="idiomas" value="Idiomas" type="button" class="boton" onclick="verIdiomas();"/>
                           <input id="explab" value="Exp.Laboral" type="button" class="boton" onclick="verExperiencia();"/>
                           <input id="public" value="Publicaciones" type="button" class="boton" onclick="verPublicacion();"/>
                           <input id="membre" value="Membresías" type="button" class="boton" onclick="verMembresia();"/>
                           <input id="distinc" value="Distinciones" type="button" class="boton" onclick="verDistinciones();"/>
                           <input id="produc" value="Producción" type="button" class="boton" onclick="verProduccion();"/>
                           <input id="histacad" value="Docencia" type="button" class="boton" onclick="verDocencia();"/>
                        </td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabperf" style="display: none;">
                            <thead><th align="center"><strong>Perfil</strong></th></thead>
                            <tfoot>
                                <form name="fperfil" action="">
                                    <tr><td align="center">
                                        <textarea rows="6" cols="70" name="perf" id="perf"></textarea>
                                        <br><input id="GuardarPerfil" value="Guardar" type="button" class="boton" onclick="guardarPerfil();"/></td>
                                    </tr>
                                </form>
                            </tfoot>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabest" style="display: none;">
                            <thead><th align="center" colspan="5"><strong>Información de Estudios</strong></th></thead>
                            <thead>
                                <th width="5%"><div align="center"><strong>Nivel</strong></div></th>
                                <th width="40%"><div align="center"><strong>Título</strong></div></th>
                                <th width="30%"><div align="center"><strong>Universidad</strong></div></th>
                                <th width="15%"><div align="center"><strong>FecGrado</strong></div></th>
                                <th width="10%"><div align="center"><strong>Borrar</strong></div></th>
                            </thead>
                            <tfoot>
                                <form name="festudios" action="">
                                    <tr><td colspan="3" align="center"><strong>Detalle Información Estudios <font color="red">(Haga clic en Nuevo para registrar un nuevo Estudio)</font></strong>
                                        <input type="hidden" size="6" name="idestud" id="idestud"/></td>
                                        <td><input style="display: inline;" id="NuevoEstud" value="Nuevo" type="button" class="boton" onclick="nuevoEstudioAsp();"/></td>
                                        <td><input style="display: none;" id="GuardarEstud" value="Guardar" type="button" class="boton" onclick="guardarEstudioAsp();"/></td>
                                    </tr>
                                    <tr><td><strong>Título</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="60"  maxlength="75" name="titulo" id="titulo"/>
                                          <strong>FecGrado: </strong><input disabled="true" type="text" size="15" maxlength="10" value="dd/mm/aaaa" name="fecgrad" id="fecgrad"/></td>
                                        <td colspan="2"><strong>Tta.Prof.</strong>
                                            <input disabled="true" type="text" value="NA" size="15" maxlength="15" name="ntarp" id="ntarp"/></td>
                                    </tr>
                                    <tr><td><strong>Institución</strong></td>
                                        <td colspan="2"><input type="hidden" size="10" name="cinstit" id="cinstit"/>
                                            <input disabled="true" type="text" size="50" name="instit" id="instit"/>
                                            <a href="#" onClick="return consultasModal('instit','cinstit',respEstud,'102');"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                                            <strong>No.Sem: </strong><input disabled="true" type="text" size="3" maxlength="2" name="nsem" id="nsem"/>
                                            <strong>Congelado<input disabled="true" type="checkbox" name="blqes" id="blqes"/></strong></td>
                                        <td colspan="2"><strong>Nivel:  </strong>
                                            <input disabled="true" type="text" size="17" name="niv" id="niv"/>
                                           <input type="hidden" size="5" name="cniv" id="cniv"/>
                                           <a href="#" onClick="return opcionesModal('niv','cniv',listaNivelEstud(),respEstud);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                    </tr>
                                </form>
                            </tfoot>
                            <tbody id="cuerpoestud">
                            </tbody>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tablab" style="display: none;">
                            <thead><th align="center" colspan="4"><strong>Experiencia Laboral</strong></th></thead>
                            <thead>
                                <th width="15%"><div align="center"><strong>TipoCargo</strong></div></th>
                                <th width="42%"><div align="center"><strong>Empresa</strong></div></th>
                                <th width="25%"><div align="center"><strong>Periodo</strong></div></th>
                                <th width="18%"><div align="center"><strong>Borrar</strong></div></th>
                            </thead>
                            <tfoot>
                                <form name="fexperiencia" action="">
                                    <tr><td colspan="4" align="center"><strong>Detalle de Información de Experiencia <font color="red">(Haga clic en Nueva experiencia para registrar una nueva registro de experiencia laboral)</font></strong>
                                        <input type="hidden" size="6" name="idhis" id="idhis"/></td>
                                    </tr>
                                    <tr><td><strong>Empresa:</strong></td>
                                        <td><input disabled="true" type="text" size="55" maxlength="59" name="empresa" id="empresa"/></td>
                                        <td><strong>TipoCargo:</strong></td>
                                        <td><input disabled="true" type="text" size="14" name="tcargo" id="tcargo"/>
                                            <a href="#" onClick="return opcionesModal('tcargo','tcargo',listaTCargos(),respExper);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                    </tr>
                                    <tr><td><strong>Cargo:</strong></td>
                                        <td><input disabled="true" type="text" size="55" maxlength="59" name="cargo" id="cargo"/></td>
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
                            </tfoot>
                            <tbody id="cuerpolab">
                            </tbody>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabidi" style="display: none;">
                            <thead><th align="center" colspan="7"><strong>Manejo de Otros Idiomas</strong></th></thead>
                            <thead>
                                <th width="22%"><div align="center"><strong>Lengua</strong></div></th>
                                <th width="61%"><div align="center"><strong>Certificación</strong></div></th>
                                <th width="4%"><div align="center"><strong>Lee</strong></div></th>
                                <th width="4%"><div align="center"><strong>Escr.</strong></div></th>
                                <th width="4%"><div align="center"><strong>Habla</strong></div></th>
                                <th width="5%"><div align="center"><strong>Borrar</strong></div></th>
                            </thead>
                            <tfoot>
                                <form name="fidioma" action="">
                                    <tr><td colspan="6" align="center"><strong>Detalle información otros idiomas <font color="red">(Haga clic en Nuevo para registrar un nuevo idioma)</font></strong>
                                        <input type="hidden" size="6" name="idlen" id="idlen"/></td>
                                    </tr>
                                    <tr><td><input disabled="true" type="text" size="15" name="lengua" id="lengua"/>
                                        <a href="#" onClick="return opcionesModal('lengua','lengua',listaIdiomas(),respIdi);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                        <td><strong>Certific: </strong>
                                            <input disabled="true" type="text" size="50" maxlength="40" name="certif" id="certif"/></td>
                                        <td><strong>Fecha:</strong></td>
                                        <td colspan="3"><input disabled="true" type="text" size="15" maxlength="10" name="fcert" id="fcert"/></td>
                                    </tr>
                                    <tr><td></td>
                                        <td><strong>Entidad: </strong>
                                            <input disabled="true" type="text" size="50" maxlength="40" name="organ" id="organ"/></td>
                                        <td><strong>Puntaje:</strong></td>
                                        <td colspan="3"><input disabled="true" type="text" size="15" maxlength="14" name="punti" id="punti"/></td>
                                    </tr>
                                    <tr><td><strong>Manejo:</strong></td>
                                        <td><strong>Lee: </strong><input disabled="true" type="text" size="1" maxlength="1" name="mlee" id="mlee"/>
                                            <strong>Escribe: </strong><input disabled="true" type="text" size="1" maxlength="1" name="mesc" id="mesc"/>
                                            <strong>Habla: </strong><input disabled="true" type="text" size="1" maxlength="1" name="mhab" id="mhab"/>
                                            Escriba B:Bien R:Regular M:Mal
                                            <strong>Congelado <input disabled="true" type="checkbox" name="blqi" id="blqi"/></strong>
                                        </td>
                                        <td colspan="4"><input style="display: none;" id="GuardarIdi" value="Guardar" type="button" class="boton" onclick="guardarIdioma();"/>
                                            <input style="display: inline;" id="NuevoIdi" value="Nuevo" type="button" class="boton" onclick="nuevoIdioma();"/></td>
                                    </tr>
                                </form>
                            </tfoot>
                            <tbody id="cuerpoidi">
                            </tbody>
                        </table></td>
                    </tr>
                    <tr><td colspan="5">
                        <table border="1" class="tabla" id="tabpub" style="display: none;">
                            <thead><th align="center" colspan="5"><strong>Publicaciones</strong></th></thead>
                            <thead>
                                <th width="11%"><div align="center"><strong>Tipo</strong></div></th>
                                <th width="60%"><div align="center"><strong>Título</strong></div></th>
                                <th width="10%"><div align="center"><strong>Fecha</strong></div></th>
                                <th width="15%"><div align="center"><strong>Área</strong></div></th>
                                <th width="4%"><div align="center"><strong>Borrar</strong></div></th>
                            </thead>
                            <tfoot>
                                <form name="fpublic" action="">
                                    <tr><td colspan="5" align="center"><strong>Detalle de Información de Publicaciones <font color="red">(Haga clic en Nueva para registrar una nueva publicación)</font></strong>
                                        <input type="hidden" size="6" name="idpub" id="idpub"/></td>
                                    </tr>
                                    <tr><td><strong>Tipo:</strong></td>
                                        <td><input disabled="true" type="text" size="15" name="tipo" id="tipo"/>
                                            <a href="#" onClick="return opcionesModal('tipo','tipo',listaTiposP(),respPub);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a>
                                            <strong>Fecha(aaaa/mm): </strong><input disabled="true" type="text" size="8" maxlength="7" name="fec" id="fec"/></td>
                                        <td><strong>Área:</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="13" name="arpub" id="arpub"/>
                                            <a href="#" onClick="return opcionesModal('arpub','arpub',listaAreasP(),respPub);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                                    </tr>
                                    <tr><td><strong>Título</strong></td>
                                        <td><input disabled="true" type="text" size="77" maxlength="148" name="titpub" id="titpub"/></td>
                                        <td><strong>Edición/Edit:</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="28" maxlength="30" name="edic" id="edic"/></td>
                                    </tr>
                                    <tr><td><strong>Tít. Mayor</strong></td>
                                        <td><input disabled="true" type="text" size="77" name="tmayor" maxlength="95" id="tmayor"/></td>
                                        <td><strong>ISBN/ISSN</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="15" maxlength="20" name="edit" id="edit"/></td>
                                    </tr>
                                    <tr><td><strong>Ciudad:</strong></td>
                                        <td><input disabled="true" type="text" size="20" maxlength="30" name="ciudpub" id="ciudpub"/>
                                            <strong>País: </strong> <input disabled="true" type="text" size="20" maxlength="20" name="paispub" id="paispub"/></td>
                                        <td colspan="3"><input style="display: none;" id="GuardarPub" value="Guardar" type="button" class="boton" onclick="guardarPublicacion();"/>
                                            <input style="display: inline;" id="NuevaPub" value="Nueva" type="button" class="boton" onclick="nuevaPublicacion();"/></td>
                                    </tr>
                                </form>
                            </tfoot>
                            <tbody id="cuerpopub">
                            </tbody>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabdis" style="display: none;">
                            <thead><th align="center" colspan="5"><strong>Distinciones</strong></th></thead>
                            <thead>
                                <th width="5%"><div align="center"><strong>Año</strong></div></th>
                                <th width="35%"><div align="center"><strong>Nombre</strong></div></th>
                                <th width="15%"><div align="center"><strong>País</strong></div></th>
                                <th width="40%"><div align="center"><strong>Institución</strong></div></th>
                                <th width="5%"><div align="center"><strong>Borrar</strong></div></th>
                            </thead>
                            <tfoot>
                                <form name="fdistin" action="">
                                    <tr><td colspan="5" align="center"><strong>Detalle de Información de Distinciones  <font color="red">(Haga clic en Crear para registrar una distinción nueva)</font></strong>
                                        <input type="hidden" size="6" name="iddis" id="iddis"/></td>
                                    </tr>
                                    <tr><td><strong>Nombre:</strong></td>
                                        <td><input disabled="true" type="text" size="40" maxlength="40" name="nombred" id="nombred"/></td>
                                        <td><strong>Razón:</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="54" maxlength="135" name="razon" id="razon"/></td>
                                    </tr>
                                    <tr><td><strong>Instit:</strong></td>
                                        <td><input disabled="true" type="text" size="40" maxlength="40" name="institd" id="institd"/></td>
                                        <td><strong>Descrip:</strong></td>
                                        <td colspan="2"><input disabled="true" type="text" size="54" maxlength="140" name="descri" id="descri"/></td>
                                    </tr>
                                    <tr><td><strong>País:</strong></td>
                                        <td><input disabled="true" type="text" size="20" maxlength="30" name="paisd" id="paisd"/>
                                            <strong> Año: </strong><input disabled="true" type="text" size="5" name="anio" id="anio"/></td>
                                        <td colspan="3"><strong>Congelado <input disabled="true" type="checkbox" name="blqd" id="blqd"/></strong>
                                            <input style="display: none;" id="GuardarDis" value="Guardar" type="button" class="boton" onclick="guardarDistincion();"/>
                                            <input style="display: inline;" id="NuevaDis" value="Crear" type="button" class="boton" onclick="nuevaDistincion();"/></td>
                                    </tr>
                                </form>
                            </tfoot>
                            <tbody id="cuerpodis">
                            </tbody>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabmem" style="display: none;">
                            <thead><th align="center" colspan="4"><strong>Membresías</strong></th></thead>
                            <thead>
                                <th width="20%"><div align="center"><strong>País</strong></div></th>
                                <th width="50%"><div align="center"><strong>Organización</strong></div></th>
                                <th width="25%"><div align="center"><strong>Periodo</strong></div></th>
                                <th width="5%"><div align="center"><strong>Borrar</strong></div></th>
                            </thead>
                            <tfoot>
                                <form name="fmembresia" action="">
                                    <tr><td colspan="4" align="center"><strong>Detalle de Información de Membresías <font color="red">(Haga clic en Crear para registrar una membresía nueva)</font></strong>
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
                            </tfoot>
                            <tbody id="cuerpomem">
                            </tbody>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabpro" style="display: none;">
                            <thead><th align="center" colspan="4"><strong>Producción</strong></th></thead>
                            <thead>
                                <th width="15%"><div align="center"><strong>Tipo</strong></div></th>
                                <th width="55%"><div align="center"><strong>Producto</strong></div></th>
                                <th width="25%"><div align="center"><strong>Periodo</strong></div></th>
                                <th width="5%"><div align="center"><strong>Borrar</strong></div></th>
                            </thead>
                            <tfoot>
                                <form name="fproducto" action="">
                                    <tr><td colspan="4" align="center"><strong>Detalle Información de Productos o Proyectos  <font color="red">(Haga clic en Nuevo para registrar un nuevo producto)</font></strong>
                                        <input type="hidden" size="6" name="idpro" id="idpro"/></td>
                                    </tr>
                                    <tr><td><strong>Producto:</strong></td>
                                        <td colspan="3"><input disabled="true" type="text" size="100" maxlength="80" name="titp" id="titp"/></td>
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
                                        <td><input disabled="true" type="text" size="13" name="finip" id="finip"/> -
                                            <input disabled="true" type="text" size="13" name="ffinp" id="ffinp"/>
                                            <strong>  Congelado <input disabled="true" type="checkbox" name="blqp" id="blqp"/></strong></td>
                                        <td colspan="2">
                                            <input style="display: none;" id="GuardarPro" value="Guardar" type="button" class="boton" onclick="guardarProducto();"/></td>
                                    </tr>
                                </form>
                            </tfoot>
                            <tbody id="cuerpopro">
                            </tbody>
                        </table></td>
                    </tr>
                    <tr><td colspan="4">
                        <table border="1" class="tabla" id="tabdoc" style="display: none;">
                            <thead><th align="center" colspan="7"><strong>Experiencia en Docencia</strong>
                                <br>En esta opción se visualizan las experiencias docentes que el aspirante tenga dentro de la Escuela Colombiana de Ingeniería,<br>
                                                                                                              estas experiencias se registran automáticamente. Si desea registrar una experiencia que tenga en otra institución lo puede hacer <br>
                                                                                                              por la opción de Experiencias Laborales. </th></thead>
                            <thead>
                                <th width="10%"><div align="center"><strong>Periodo</strong></div></th>
                                <th width="70%"><div align="center"><strong>Asignatura</strong></div></th>
                                <th width="4%"><div align="center"><strong>Grp</strong></div></th>
                                <th width="4%"><div align="center"><strong>Cant</strong></div></th>
                                <th width="4%"><div align="center"><strong>Gan</strong></div></th>
                                <th width="4%"><div align="center"><strong>Per</strong></div></th>
                                <th width="4%"><div align="center"><strong>Can</strong></div></th>
                            </thead>
                            <tbody id="cuerpodoc">
                            </tbody>
                        </table></td>
                    </tr>
            </table>
         </div>
    </body>
</html>