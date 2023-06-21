<%@page import="BDintraeci.EmpleadoRemote,BDintraeci.EmpleadoInfoTemp"%>
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
            emp.inicializar(request.getParameter("cod_emp").toString());
            session.setAttribute("emp", emp ) ;
            HashMap datos = emp.datosGenerales() ;
            HashMap[] tiposEmpleado=emp.getTiposEmpleadoERP();
            HashMap[] lis1dir=emp.getLis1DirEmpleadoERP();
            HashMap[] lis2dir=emp.getLis2DirEmpleadoERP();
            HashMap[] lis3dir=emp.getLis3DirEmpleadoERP();
            HashMap[] lis4dir=emp.getLis4DirEmpleadoERP();
            HashMap[] lisabc=emp.getLisABCDirEmpleadoERP();
            String id_emp=(String) datos.get("cod_emp");
            HashMap datosERP=emp.getDatosBasicosEmpleadoERP(id_emp);
            String nombre_emp=(String) datosERP.get("nombre");
            String tipo_emp=(String) datosERP.get("tipo");
            String e_mail=(String) datosERP.get("e_mail");
            String area_emp=(String) datosERP.get("area");
            String cargo=(String) datosERP.get("cargo");
            String direccion=(String) datosERP.get("direccion");
            String telefono=(String) datosERP.get("telefono");
            HashMap datosUsrErp=emp.getDatosUsrERP(id_emp);
            String ubicacion= (String) datosUsrErp.get("ubicacion");
            String extension= (String) datosUsrErp.get("extension");
            String respuesta=request.getParameter("respuesta");
            HashMap[] areasERP=emp.getAreasEmpleadoERP();
            HashMap[] redesSociales=emp.getRedesSocialesEmpleadoERP(id_emp);
            HashMap[] areasInteresERP=emp.getAreasInteresERP(area_emp);
            HashMap[] interesesEmpERP=emp.getInteresesEmpleadoERP(id_emp);
            HashMap cargoPerfil= emp.getCargoERP(cargo);
            HashMap[] estadosCivilesERP = emp.getEstCivilERP();
            HashMap datosAdicionalesERP = emp.getDatosAdicionalesERP(id_emp);
            HashMap[] paisesERP = emp.getPaisesERP();
            HashMap[] ciudadesERP = emp.getCiudadesERP();
            HashMap[] departamentosERP = emp.getDepartamentosERP();
            HashMap[] estudiosEmpleado = emp.getEstudiosERP(id_emp);
          
            
            String cvlac = "";
            String linkedin = "";
            String youtube = "";
            String researchgate="";
            String facebook="";
            String googleScholar="";
            //Se obtienen las redes sociales del usuario
            for (HashMap red : redesSociales) {
                if(red.get("codigo").equals("4")){
                    cvlac=(String) red.get("usuario");
                }else if(red.get("codigo").equals("5")){
                    linkedin=(String) red.get("usuario");
                }else if(red.get("codigo").equals("6")){
                    youtube=(String) red.get("usuario");
                }else if(red.get("codigo").equals("7")){
                    researchgate=(String) red.get("usuario");
                }else if(red.get("codigo").equals("3")){
                    facebook=(String) red.get("usuario");
                }else if(red.get("codigo").equals("8")){
                    googleScholar=(String) red.get("usuario");
                }
                
            }
            
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
        <script language="javascript" type="text/javascript">
           
            function validarDatos(){
                document.getElementById("submit_form").style.display = 'none';
                document.getElementById("inf_veridica").value=inf_veridica;
                document.getElementById("ind_acepta").value=ind_acepta;
                document.getElementById("ind_modifica").value=ind_modifica;
                var cvlac=document.getElementById("cvlac").value;
                var linkedin=document.getElementById("linkedin").value;
                var youtube=document.getElementById("youtube").value;
                var researchgate=document.getElementById("researchgate").value;
                var facebook=document.getElementById("Facebook").value;
                var googlescholar=document.getElementById("GoogleScholar").value;
                var ubicacion=document.getElementById("ubicacion").value;
                var extension=document.getElementById("ext").value;
                
              if(cvlac.length>100){
                    alert("El enlace a CVLac no puede tener más de 100 caracteres.");
                    div_tabla.style.display = 'block';
                    div_editar_perfil.style.display = 'none';
                    div_modificacion_perfil.style.display = 'none';
                    div_tratamiento_informacion.style.display = 'none';
                    return false;
                }else if(facebook.length>100){
                    alert("El enlace a facebook no puede tener más de 100 caracteres.");
                    div_tabla.style.display = 'block';
                    div_editar_perfil.style.display = 'none';
                    div_modificacion_perfil.style.display = 'none';
                    div_tratamiento_informacion.style.display = 'none';
                    return false;
                }else if(googlescholar.length>100){
                    alert("El enlace a googlescholar no puede tener más de 100 caracteres.");
                    div_tabla.style.display = 'block';
                    div_editar_perfil.style.display = 'none';
                    div_modificacion_perfil.style.display = 'none';
                    div_tratamiento_informacion.style.display = 'none';
                    return false;
                }else if(linkedin.length>100){
                    alert("El enlace a LinkedIn no puede tener más de 100 caracteres.");
                    div_tabla.style.display = 'block';
                    div_editar_perfil.style.display = 'none';
                    div_modificacion_perfil.style.display = 'none';
                    div_tratamiento_informacion.style.display = 'none';
                    return false;
                }else if(youtube.length>100){
                    alert("El enlace a YouTube no puede tener más de 100 caracteres.");
                    div_tabla.style.display = 'block';
                    div_editar_perfil.style.display = 'none';
                    div_modificacion_perfil.style.display = 'none';
                    div_tratamiento_informacion.style.display = 'none';
                    return false;
                }else if(researchgate.length>100){
                    alert("El enlace a ResearchGate no puede tener más de 100 caracteres.");
                    div_tabla.style.display = 'block';
                    div_editar_perfil.style.display = 'none';
                    div_modificacion_perfil.style.display = 'none';
                    div_tratamiento_informacion.style.display = 'none';
                    return false;
                }else if(ubicacion.length>50){
                    alert("El campo ubicación no puede tener más de 50 caracteres.");
                    div_tabla.style.display = 'block';
                    div_editar_perfil.style.display = 'none';
                    div_modificacion_perfil.style.display = 'none';
                    div_tratamiento_informacion.style.display = 'none';
                    return false;
                }else if(extension.length>8){
                    alert("El campo extensión no puede tener más de 8 caracteres.");
                    div_tabla.style.display = 'block';
                    div_editar_perfil.style.display = 'none';
                    div_modificacion_perfil.style.display = 'none';
                    div_tratamiento_informacion.style.display = 'none';
                    return false;
                }else{
                    return ultima_confirmacion();
                }
            }
        </script>
        <script type="text/javascript">
        <%
            if(respuesta!=null && respuesta.equals("1")){
                %>alert("La información fue guardada satisfactoriamente, si no la ve reflejada en este formulario, es debido a que primero será validada.");
                window.location="Menu";
                <%
            }else if(respuesta!=null && respuesta.equals("0")){
                %>alert("Hubo un error al intentar registrar su información, revise los datos ingresados");<%
            }
        %>
        </script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondoblanco.gif" onload="BotonActualizar();">
        <p class="textocom">&nbsp;</p>
        <form onsubmit="return confirmacion_definitiva()" name="empleadoERP" id="empleadoERP" method="post" action="ActualizaDatosEmpleadoProfERP">
        <div align="center" id="div_tabla"><strong>
            <!--a id="verconvo" href="#" style="display: inline;" onclick="verConvocatoria();">Aplicar a Convocatorias</a-->
            <%--| <a id="admconvo" href="#" style="display: inline;" onclick="admConvocatoria();">Adm. Convocatorias</a>
            | <a id="admcompo" href="#" style="display: inline;" onclick="verCompromisos(1, 1);">Adm. Compromisos</a>
            | <a id="admcompo" href="#" style="display: inline;" onclick="verEvaluacion(5, 1);">Adm. Evaluación</a></strong>--%>
            <table border="1" class="tabla" id="tabla1" align="center" width="70%">
                <thead>
                  <th colspan="4"><div align="center"><strong>Información Empleado</strong></div></th>
                </thead>
                    <input type="hidden" name="cod_emp" id="cod_emp" value="<%=id_emp%>"/>
                    <tr><td><strong>Documento:</strong></td>
                        <td><input disabled="true" type="text" size="12" name="idEmp" id="idEmp" value="<%=datos.get("cod_emp")%>"/></td>
                        <td><strong>Nacimiento:</strong></td>
                        <td><input disabled="true" type="text" size="12" name="fnac" id="fnac" value="<%=datos.get("fecn")%>"/>
                            <input disabled="true" type="text" size="12" name="gen" id="gen" value="<%=datos.get("gen")%>"/></td>
                    </tr>
                    <tr><td><strong>Nombre:</strong></td>
                        <td colspan="3"><input disabled="true" type="text" size="70" name="nomEmp" id="nomEmp" value="<%=nombre_emp%>"/></td>
                    </tr>
                    <tr><td><strong>Tipo de Empleado</strong></td>
                        <td><select required="" id="tipo_empleado" disabled="true">
                                <%
                                    for (HashMap tipo : tiposEmpleado) {
                                %><option value="<%=tipo.get("CODIGO")%>" <%=(tipo.get("CODIGO").equals((tipo_emp.toString()).trim()))?"selected":""%>><%=tipo.get("NOMBRE")%></option><%
                                    }
                                %>
                            </select>
                            <input type="hidden" size="3" name="eciv" id="eciv" value="<%=datos.get("eciv")%>"/>
                            <!--a href="#" onClick="return opcionesModal('estciv','eciv',listaECivil(),respEmpleado);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a--></td>
                        <td><strong>Correo Electrónico</strong></td>
                        <td><input disabled="true" type="email" name="email" id="email" value="<%=e_mail%>"/>
                            <!--a href="#" onClick="return opcionesModal('tsan','tsan',listaTSangre(),respEmpleado);"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a-->
                            <!--strong>Factor RH <input disabled="true" type="radio" name="facrh" id="facrh1" value="P" <%=pc%>/> +
                                              <input disabled="true" type="radio" name="facrh" id="facrh2" value="N" <%=nc%>/> -</strong--></td>
                    </tr>
                    <th colspan="4"><div align="center"><strong>Redes Sociales</strong></div></th>
                    <tr><td><strong>Link del CVLAC:</strong></td>
                        <td><input type="text"  maxlength="100" name="cvlac" id="cvlac" value="<%=cvlac%>"/></td>
                        <td><strong>LinkedIn:</strong></td>
                        <td><input type="text"  maxlength="100" name="linkedin" id="linkedin" value="<%=linkedin%>"/></td>
                    </tr>
                    <tr><td><strong>YouTube:</strong></td>
                        <td><input type="text" maxlength="100" name="youtube" id="youtube" value="<%=youtube%>"/></td>
                        <td><strong>researchGate:</strong></td>
                        <td><input type="text" maxlength="100" name="researchgate" id="researchgate" value="<%=researchgate%>"/></td>
                    </tr>
                     <tr><td><strong>Facebook:</strong></td>
                        <td><input type="text" maxlength="100" name="Facebook" id="Facebook" value="<%=facebook%>"/></td>
                        <td><strong>Google Scholar:</strong></td>
                        <td><input type="text" maxlength="100" name="GoogleScholar" id="GoogleScholar" value="<%=googleScholar%>"/></td>
                    </tr>
                    <th colspan="4"><div align="center"><strong>Perfil Empleado</strong></div></th>
                  
                    <tr><td colspan="3"><strong>Perfil Completo:</strong><button type="button" onclick="return switchEditarPerfil()">Editar Perfil</button></td>
                        <td><textarea name="perfil_completo" id="perfil_completo" disabled=""></textarea></td>
                        <input type="hidden" name="perfil_completo_input" id="perfil_completo_input"/>
                    </tr>
                    <script language="javascript" type="text/javascript">

                        var perfil_completo_texto="";
                        function cambiaPerfil(){
                            var titulo_pre=document.getElementById("titulo_pre").value;
                            var titulo_pos=document.getElementById("titulo_pos").value;
                            var membresias=document.getElementById("membresias").value;
                            var cargos_dir=document.getElementById("cargos_dir").value;
                            var reconocimientos=document.getElementById("reconocimientos").value;
                            var eol="\n";
                            perfil_completo_texto="";
                            perfil_completo_texto=perfil_completo_texto+"Título de pregrado y universidad que lo confirió: "+eol+titulo_pre+eol;
                            perfil_completo_texto=perfil_completo_texto+"Títulos de posgrado: "+eol+titulo_pos+eol;
                            perfil_completo_texto=perfil_completo_texto+"Membresías: "+eol+membresias+eol;
                            perfil_completo_texto=perfil_completo_texto+"Cargos directivos o dirección de proyectos destacados: "+eol+cargos_dir+eol;
                            perfil_completo_texto=perfil_completo_texto+"Reconocimientos: "+eol+reconocimientos+eol;
                            
                            
                        }
                        cambiaPerfil();
                    </script>
                    <tr>
                        <td><strong>Publicaciones:</strong></td>
                        <td colspan="3"><a href="VerPublicaciones?profesor=valido&cod_emp=<%=request.getParameter("cod_emp").toString()%>" target="_blank"><button type="button">Registrar Publicaciones</button></a></td>
                    </tr>  
                    <tr>
                        <td><strong>Estudios:</strong></td>
                        <td colspan="3"><a href="EstudiosProf?cod_emp=<%=request.getParameter("cod_emp").toString()%>" target="_blank"><button type="button">Registrar Estudios</button></a></td>
                    </tr>  
                    <tr>
                        <td colspan="3"><strong>Ubicación (Bloque y oficina):</strong></td>
                        <td><input type="text" name="ubicacion" id="ubicacion" value="<%=ubicacion%>" required="" maxlength="50"/></td>
                    </tr>
                    <tr>
                        <td><strong>Área a la que pertenece:</strong></td>
                        <td>
                            <select disabled="true" required="" id="area" name="area">
                                <%
                                    for (HashMap area : areasERP) {
                                        %><option value="<%=area.get("codigo")%>" <%=(area.get("codigo").equals(area_emp))?"selected":""%>><%=area.get("nombre")%></option><%
                                        }
                                %>
                            </select>
                        </td>
                        <td><strong>Cargo:</strong></td>
                        <td><input disabled="true" type="text"  maxlength="8" name="cargo" id="cargo" value="<%=cargoPerfil.get("nombre")%>"/></td>
                    </tr>
                    <tr><td colspan="3"><strong>Extensión:</strong></td>
                        <td><input type="text"  maxlength="8" name="ext" id="ext" value="<%=extension%>"/></td>
                    </tr>
                    <tr><td colspan="3"><strong>Áreas de Interés:</strong></td>
                        <td>
                        <%
                            Integer id_interes=0;
                            for (HashMap area : areasInteresERP) {
                                Boolean inteFlag=false;
                                for (HashMap inte : interesesEmpERP) {
                                    if(area.get("codigo").equals(inte.get("codigo"))){
                                        inteFlag=true;
                                    }
                                }
                        %><%=area.get("DESCRIPCION")%><input type="checkbox" name="intereses" id="intereses" value="<%=area.get("codigo")%>" <%=(inteFlag)?"checked='true'":""%>/><br><%
                                id_interes++;
                            }
                        %>
                        </td>
                    </tr>
                    <tr><td colspan="3"><button type="button" onclick="validarDatos()" id="BtnGuardarCambios">Guardar Cambios</button> </td>
                    </tr>
            </table>
         </div>
        <div id="editar_perfil" align="center">
            <h3>Editar Perfil</h3>
            <textarea style="display: none" rows="20" cols="100" id="perfil_bloqueado" disabled=""></textarea>
            <br>
            <br>
            <h1>PERFIL</h1>
            <br>
            <br>
            <a href="https://www.escuelaing.edu.co/escuela/importantDoc/instructivos/Perfil_de_profesor.pdf" target="_blank">
                <button type="button">Ejemplo para un Profesor</button>
            </a>
            <br>
            <br>
            <br>
            <a href="https://www.escuelaing.edu.co/escuela/importantDoc/instructivos/Perfil_de_decano.pdf" target="_blank">
                <button type="button">Ejemplo para un Decano</button>
            </a>
            <br>
            <h5><%=nombre_emp%></h5>
            <br>
            <label for="titulos">Cargo y último título de grado obtenido(Máx. 200 caracteres):</label>
            <br>
            <textarea placeholder="ej. Decano de Economía/Economista/Ph. D. cum laude" name="titulos" id="titulos" minlength="1" maxlength="200" rows="3" cols="100"></textarea>
            <br>
            <br>
            <br>
            <label for="parrafo_1">Párrafo 1(Máx. 1000 caracteres):</label>
            <br>
            <textarea placeholder="ej. Economista y magíster en Economía de la Universidad Nacional de Colombia y licenciado en Ciencias Sociales y Ph. D. (cum laude) de la Universidad Pompeu Fabra (España). Ha escrito tres libros, capítulos de libros y artículos sobre ciencias sociales, humanas, agrícolas y políticas; historia y arqueología; administración pública y economía y negocios. Fue investigador principal en el Observatorio Agrocadenas del Ministerio de Agricultura y el IICA-OEA, asesor en ministerios como el de Comercio Exterior y Agricultura y consultor en el Banco Mundial, la Agencia de los Estados Unidos para el Desarrollo Internacional (USAD), el Banco Interamericano de Desarrollo (BID) y gremios asociados a la SAC y a la ANDI. Piensa que, si una persona desarrolla competencias en lectura, matemáticas y escritura, tiene el mundo abierto." name="parrafo_1" id="parrafo_1" minlength="1" maxlength="1000" rows="20" cols="100"></textarea>
            <br>
            <br>
            <br>
            <!--
            <label for="entrecomillado">Entrecomillado(Máx. 100 caracteres):</label>
            <br>
            <textarea placeholder="ej. Mi trabajo es hacer que a los estudiantes les vaya muy bien" name="entrecomillado" id="entrecomillado" minlength="1" maxlength="100" rows="3" cols="100"></textarea>
            -->
            <br>
            <br>
            <br>
            <label for="parrafo_2">Párrafo 2(Máx. 1500 caracteres):</label>
            <br>
            <textarea placeholder="ej. Pedagogo comprometido con afianzar en sus estudiantes la lectura habitual, el respeto por el conocimiento, el pensamiento crítico, las competencias ciudadanas, el razonamiento cuantitativo; la concentración, la disciplina y el esfuerzo como características de las matemáticas y la aplicación de la economía con ética y responsabilidad social. Busca cambiar modelos educativos tradicionales por medio de la cercanía con sus aprendices. Cuenta con una amplia experiencia en el ejercicio de la docencia y desde 2017 es decano del Programa de Economía. Recuerda con aprecio a Josep Fontana, historiador español y profesor universitario fallecido en 2018, con quien fortaleció su formación personal y académica." name="parrafo_2" id="parrafo_2" minlength="1" maxlength="1500" rows="20" cols="100"></textarea>
            <br>
            <br>
            <br>
            <br>
            <button type="button" onclick="return switchEditarPerfil()">Guardar</button>
            <br>
            <br>
            <br>
        </div>
        <div id="modificacion_perfil" align="center">
            <br>
            <br>
            <br>
            <br>
            <h1>CONFIRMACION</h1>
            <br>
            <br>
            <br>
            <br>
            <label for="ind_modifica">Adicionó usted estudios  diferentes a los que fueron consultados desde Gestión Humana</label>
            <select name="ind_modifica" id="ind_modifica">
                <option value="">Seleccione</option>
                <option value="1">Si</option>
                <option value="0">No</option>
            </select>
            <br>
            <br>
            <br>
            <button type="button" onclick="return confirmacion_perfil()">Aceptar</button>
            <br>
            <br>
            <br>
        </div>
        <div id="tratamiento_informacion" align="center">
            <br>
            <br>
            <br>
            <br>
            <h1>CONFIRMACION</h1>
            <br>
            <br>
            <br>
            <br>
            <label for="inf_veridica">Confirmo que la información por mi consignada en este documento, es verídica y corresponde a la realidad</label>
            <select name="inf_veridica" id="inf_veridica" required="" onchange="mostrar_boton_final()">
                <option value="">Seleccione</option>
                <option value="1">Si</option>
                <option value="0">No</option>
            </select>
            <br>
            <br>
            <br>
            <br>
            <label for="ind_acepta">Acepto el tratamiento de mis datos personales conforme a los términos de la <a target='_blank' href='https://www.escuelaing.edu.co/escuela/importantDoc/SOLICITUD_DE_AUTORIZACION_ACTUALIZACION_DATOS.pdf'>solicitud de autorización</a> y <a target='_blank' href=' https://www.escuelaing.edu.co/escuela/importantDoc/Politica_de_Tratamiento_de_Datos_Personales.pdf'>política de tratamiento</a> de datos personales</label>
            <select name="ind_acepta" id="ind_acepta" required="" onchange="mostrar_boton_final()">
                <option value="">Seleccione</option>
                <option value="1">Si</option>
                <option value="0">No</option>
            </select>
            <br>
            <br>
            <br>
            <!--button type="submit" onclick="return confirmacion_definitiva()">Aceptar</button-->
            <input name="submit_form" onclick="mostrar_tabla_final()" id="submit_form" type="submit" value="Aceptar">
            <br>
            <br>
            <br>
        </div>
        </form>
    </body>
    <script lang="javascript">
        var tabla_visible = true;
        document.getElementById("submit_form").style.display = 'none';
        var div_tabla = document.getElementById("div_tabla");
        var div_editar_perfil = document.getElementById("editar_perfil");
        var div_modificacion_perfil = document.getElementById("modificacion_perfil");
        var div_tratamiento_informacion = document.getElementById("tratamiento_informacion");
        div_tabla.style.display = 'block';
        div_editar_perfil.style.display = 'none';
        div_modificacion_perfil.style.display = 'none';
        div_tratamiento_informacion.style.display = 'none';
        function switchEditarPerfil(){  
            tabla_visible=!tabla_visible;
            if(tabla_visible){
                if(document.getElementById("titulos").value.length===0){
                    alert("Debe diligenciar el campo titulos");
                    tabla_visible=!tabla_visible;
                    return false;
                }else if(document.getElementById("parrafo_1").value.length===0){
                    alert("Debe diligenciar el campo párrafo 1");
                    tabla_visible=!tabla_visible;
                    return false;
                }/**else if(document.getElementById("entrecomillado").value.length===0){
                    alert("Debe diligenciar el campo entrecomillado");
                    tabla_visible=!tabla_visible;
                    return false;
                }*/else if(document.getElementById("parrafo_2").value.length===0){
                    alert("Debe diligenciar el campo párrafo 2");
                    tabla_visible=!tabla_visible;
                    return  false;
                }else{
                    div_editar_perfil.style.display = 'none';
                    div_modificacion_perfil.style.display = 'block';
                    return true;
                }
            }else{
                document.getElementById("perfil_bloqueado").value=perfil_completo_texto;
                div_tabla.style.display = 'none';
                div_editar_perfil.style.display = 'block';
            }
            return true;
        }
        
        var inf_veridica;
        var ind_acepta;
        var ind_modifica;
        
        function confirmacion_perfil(){
            if(document.getElementById("ind_modifica").value===""){
                alert("Por favor seleccione una opción");
                return false;
            }else{
                var perfil_definitivo="";
                inf_veridica=document.getElementById("inf_veridica").value;
                ind_acepta=document.getElementById("ind_acepta").value;
                ind_modifica=document.getElementById("ind_modifica").value;
                perfil_definitivo=perfil_definitivo+"Títulos de Grado más Relevantes: "+document.getElementById("titulos").value+"\n";
                perfil_definitivo=perfil_definitivo+"Párrafo 1: "+document.getElementById("parrafo_1").value+"\n";
                //perfil_definitivo=perfil_definitivo+"Entrecomillado: "+document.getElementById("entrecomillado").value+"\n";
                perfil_definitivo=perfil_definitivo+"Párrafo 2: "+document.getElementById("parrafo_2").value+"\n";
                document.getElementById("perfil_completo").value=perfil_definitivo;
                document.getElementById("perfil_completo_input").value=document.getElementById("perfil_completo").value;
                div_tabla.style.display = 'block';
                div_editar_perfil.style.display = 'none';
                div_modificacion_perfil.style.display = 'none';
                return true;
            }
        }
        
        function ultima_confirmacion(){
            div_tabla.style.display = 'none';
            div_editar_perfil.style.display = 'none';
            div_modificacion_perfil.style.display = 'none';
            div_tratamiento_informacion.style.display = 'block';
            
        }
        
        function mostrar_boton_final(){
            if(document.getElementById("inf_veridica").value==="1"&&document.getElementById("ind_acepta").value==="1"){
                document.getElementById("submit_form").style.display = 'block';
            }else{
                document.getElementById("submit_form").style.display = 'none';
            }
        }
        
        function mostrar_tabla_final(){
            div_tabla.style.display = 'block';
            div_editar_perfil.style.display = 'none';
            div_modificacion_perfil.style.display = 'none';
            div_tratamiento_informacion.style.display = 'none';
        }
        
        function confirmacion_definitiva(){
            if(document.getElementById("inf_veridica").value!=="1"){
                alert("No puede continuar si no confirma la veracidad de la información ingresada");
                return false;
            }else if(document.getElementById("ind_acepta").value!=="1"){
                alert("No puede continuar si no acepta el tratamiento de sus datos por parte de la Escuela Colombiana de Ingeniería Julio Garavito");
                return false;
            }else{
                if(document.getElementById("perfil_completo").value.length===0){
                    document.getElementById("perfil_completo").value="No Aplica";
                    document.getElementById("perfil_completo_input").value="No Aplica";
                }
                if(document.getElementById("ind_modifica").value.length===0){
                    document.getElementById("ind_modifica").value=0;
                }
                div_tabla.style.display = 'block';
                div_editar_perfil.style.display = 'none';
                div_modificacion_perfil.style.display = 'none';
                div_tratamiento_informacion.style.display = 'none';
                return true;
            }
        }
    </script>
</html>