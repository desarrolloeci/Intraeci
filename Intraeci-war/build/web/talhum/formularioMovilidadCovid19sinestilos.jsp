<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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
            HashMap[] rolesCovid19 = emp.getRolesCovid19();
            HashMap[] tiposTransporteCovid19 = emp.getTiposTransporteCOVID19();
            HashMap datosBasicosMovilidad = emp.getDatosBasicosMovilidadERP(id_emp);
            String nombres_movilidad = (String) datosBasicosMovilidad.get("NOMBRES");
            String apellidos_movilidad = (String) datosBasicosMovilidad.get("APELLIDOS");
            String tipo_doc_movilidad = (String) datosBasicosMovilidad.get("TIPO_DOC");
            String doc_movilidad = (String) datosBasicosMovilidad.get("DOC");
            String genero_movilidad = (String) datosBasicosMovilidad.get("GENERO");
            String fecha_nacimiento_movilidad = (String) datosBasicosMovilidad.get("FECHA_NACIMIENTO");
            DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            LocalDate fechaNac = LocalDate.parse("15/08/1993", fmt);
            LocalDate ahora = LocalDate.now();
            Period periodo = Period.between(fechaNac, ahora);
            String edad = String.valueOf(periodo.getYears());
            String direccion_movilidad = (String) datosBasicosMovilidad.get("DIRECCION");
            String ciudad_movilidad = (String) datosBasicosMovilidad.get("CIUDAD");
            String pais_movilidad = (String) datosBasicosMovilidad.get("PAIS");
            String concat_estudios_pregrado="";
            String concat_estudios_posgrado="";
            
            for (HashMap estudio : estudiosEmpleado) {
                if(((String) estudio.get("nivel_estudio")).equals("05")||((String) estudio.get("nivel_estudio")).equals("06")||((String) estudio.get("nivel_estudio")).equals("07")||((String) estudio.get("nivel_estudio")).equals("08")){
                    concat_estudios_pregrado=concat_estudios_pregrado+((String) estudio.get("titulo")).trim()+" conferido por "+((String) estudio.get("institucion")).trim()+"\n";
                }else if(((String) estudio.get("nivel_estudio")).equals("01")||((String) estudio.get("nivel_estudio")).equals("02")||((String) estudio.get("nivel_estudio")).equals("03")||((String) estudio.get("nivel_estudio")).equals("04")){
                    concat_estudios_posgrado=concat_estudios_posgrado+((String) estudio.get("titulo")).trim()+" conferido por "+((String) estudio.get("institucion")).trim()+"\n";
                }
            }
            
            String cvlac = "";
            String linkedin = "";
            String youtube = "";
            String researchgate="";
            
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
        <title>Formulario Movilidad COVID-19</title>
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
        <script language="javascript" type="text/javascript">
            function validarDatos(){
                var direccion=document.getElementById("direccion").value;
                var hor_ing = document.getElementById("hor_ing");
                var hor_ing_orden = hor_ing.options[hor_ing.selectedIndex].getAttribute("orden");
                var hor_sal = document.getElementById("hor_sal");
                var hor_sal_orden = hor_sal.options[hor_sal.selectedIndex].getAttribute("orden");
                
                var checkboxs=document.getElementsByName("c1");
                var okay=false;
                for(var i=0,l=checkboxs.length;i<l;i++)
                {
                    if(checkboxs[i].checked)
                    {
                        okay=true;
                        break;
                    }
                }
                
                
                if((direccion.trim().length===0)){
                    alert("La dirección no puede estar vacía.");
                    return false;
                }else if(((direccion.trim().length>40))){
                    alert("La dirección no puede tener más de 40 caracteres.");
                    return false;
                }else if(hor_ing_orden>=hor_sal_orden){
                    alert("La hora de ingreso no puede ser posterior a la de salida.");
                    return false;
                }else{
                    return true;
                }
            }
        </script>
        <script type="text/javascript">
        <%
            if(respuesta!=null && respuesta.equals("1")){
                %>alert("La información fue guardada satisfactoriamente");
                window.location="Menu";
                <%
            }else if(respuesta!=null && respuesta.equals("0")){
                %>alert("Hubo un error al intentar registrar su información, revise los datos ingresados");<%
            }
        %>
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
        
        <form name="empleadoERP" onsubmit="return validarDatos()" id="empleadoERP" method="post" action="RegistroFormularioMovilidadCovid19">
            <div align="center" id="div_tabla">
                <table border="1" class="tabla" id="tabla1" align="center" width="70%">
                    <thead>
                      <th colspan="4"><div align="center"><strong>Información Empleado</strong></div></th>
                    </thead>
                        <input type="hidden" name="cod_emp" id="cod_emp" value="<%=id_emp%>"/>
                        <tr><td>Documento:</td>
                            <td><input disabled="true" type="text" size="12" name="idEmp" id="idEmp" value="<%=datos.get("cod_emp")%>"/></td>
                            <td>Nacimiento:</td>
                            <td><input disabled="true" type="text" size="12" name="fnac" id="fnac" value="<%=datos.get("fecn")%>"/>
                                <input disabled="true" type="text" size="12" name="gen" id="gen" value="<%=datos.get("gen")%>"/></td>
                        </tr>
                        <tr><td>Nombre:</td>
                            <td colspan="3"><input disabled="true" type="text" size="70" name="nomEmp" id="nomEmp" value="<%=nombre_emp%>"/></td>
                        </tr>
                        <tr><td>Tipo de Rol</td>
                            <td><select required="" id="tipo_rol" name="tipo_rol">
                                    <option value="">Seleccione</option>
                                    <%
                                        for (HashMap tipo : rolesCovid19) {
                                    %><option value="<%=tipo.get("CODIGO")%>"><%=tipo.get("DESCRIPCION")%></option><%
                                        }
                                    %>
                                </select>
                            </td>
                            <td>Ciudad Residencia:</td>
                            <td colspan="3">
                                <select id="ciudad" name="ciudad" required="">
                                    <option value="">Seleccione</option>
                                        <%
                                            for (HashMap ciu : ciudadesERP) {
                                                if(ciu.get("codigo_pais").toString().equals(pais_movilidad)){
                                                    %><option value="<%=ciu.get("codigo_ciudad")%>" <%=(ciu.get("codigo_ciudad").toString().equals(ciudad_movilidad))?"selected":""%>><%=ciu.get("descripcion")%></option><%
                                                }
                                            }
                                        %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">Barrio de Residencia:</td>
                            <td><input type="text" maxlength="99" name="barrio" id="barrio" required=""/></td>
                        </tr>
                        <tr><td>Dirección Actual de Residencia:</td>
                            <script lang="javascript">
                                function actDir(){


                                    var e = document.getElementById("lis1dir");
                                    var lis1 = e.options[e.selectedIndex].value;

                                    var tex1 = document.getElementById("tex1dir").value;

                                    e = document.getElementById("lisabcdir");
                                    var lisabc = e.options[e.selectedIndex].value;

                                    e = document.getElementById("lis2dir");
                                    var lis2 = e.options[e.selectedIndex].value;

                                    var tex2 = document.getElementById("tex2dir").value;

                                    e = document.getElementById("lisabc2dir");
                                    var lisabc2 = e.options[e.selectedIndex].value;

                                    e = document.getElementById("lissimbolodir");
                                    var lissimbolo = e.options[e.selectedIndex].value;

                                    var tex3 = document.getElementById("tex3dir").value;

                                    e = document.getElementById("lisabc3dir");
                                    var lisabc3 = e.options[e.selectedIndex].value;

                                    e = document.getElementById("lis3dir");
                                    var lis3 = e.options[e.selectedIndex].value;

                                    var tex4 = document.getElementById("tex4dir").value;

                                    e = document.getElementById("lis4dir");
                                    var lis4 = e.options[e.selectedIndex].value;

                                    var tex5 = document.getElementById("tex5dir").value;

                                    e = document.getElementById("lis5dir");
                                    var lis5 = e.options[e.selectedIndex].value;

                                    var tex6 = document.getElementById("tex6dir").value;

                                    document.getElementById("direccion").value= (lis1+" "+tex1+" "+lisabc+" "+lis2+" "+tex2+" "+lisabc2+" "+lissimbolo+" "+tex3+" "+lisabc3+" "+lis3+" "+tex4+" "+lis4+" "+tex5+" "+lis5+" "+tex6).trim();
                                    document.getElementById("dir").value= (lis1+" "+tex1+" "+lisabc+" "+lis2+" "+tex2+" "+lisabc2+" "+lissimbolo+" "+tex3+" "+lisabc3+" "+lis3+" "+tex4+" "+lis4+" "+tex5+" "+lis5+" "+tex6).trim();
                                    document.getElementById("direccion").size=(document.getElementById("direccion").value.length)+1;
                                    if(document.getElementById("direccion").size>=40){
                                        document.getElementById("alertaDir").hidden=false;
                                    }else{
                                        document.getElementById("alertaDir").hidden=true;
                                    }
                                }
                            </script>
                            <td colspan="3">
                                <select id="lis1dir" onchange="actDir()">
                                    <option value=""></option>
                                    <%
                                        for (HashMap tipo : lis1dir) {
                                            %><option value="<%=tipo.get("codigo")%>"><%=tipo.get("descripcion")%></option><%
                                            }
                                    %>
                                </select>
                                <input type="text" name="tex1dir" id="tex1dir" onchange="actDir()"/>
                                <select id="lisabcdir" onchange="actDir()">
                                    <option value=""></option>
                                    <%
                                        for (HashMap tipo : lisabc) {
                                            %><option value="<%=tipo.get("descripcion")%>"><%=tipo.get("descripcion")%></option><%
                                            }
                                    %>
                                </select>
                                <select id="lis2dir" onchange="actDir()">
                                    <option value=""></option>
                                    <%
                                        for (HashMap tipo : lis2dir) {
                                            %><option value="<%=tipo.get("codigo")%>"><%=tipo.get("descripcion")%></option><%
                                            }
                                    %>
                                </select>
                                <input type="text" name="tex2dir" id="tex2dir" onchange="actDir()"/>
                                <select id="lisabc2dir" onchange="actDir()">
                                    <option value=""></option>
                                    <%
                                        for (HashMap tipo : lisabc) {
                                            %><option value="<%=tipo.get("descripcion")%>"><%=tipo.get("descripcion")%></option><%
                                            }
                                    %>
                                </select>
                                <select id="lissimbolodir" onchange="actDir()">
                                    <option value=""></option>
                                    <option value="#">#</option>
                                    <option value="-">-</option>
                                </select>
                                <input type="text" name="tex3dir" id="tex3dir" onchange="actDir()"/>
                                <select id="lisabc3dir" onchange="actDir()">
                                    <option value=""></option>
                                    <%
                                        for (HashMap tipo : lisabc) {
                                            %><option value="<%=tipo.get("descripcion")%>"><%=tipo.get("descripcion")%></option><%
                                            }
                                    %>
                                </select>
                                <select id="lis3dir" onchange="actDir()">
                                    <option value=""></option>
                                    <%
                                        for (HashMap tipo : lis3dir) {
                                            %><option value="<%=tipo.get("codigo")%>"><%=tipo.get("descripcion")%></option><%
                                            }
                                    %>
                                </select>
                                <input type="text" name="tex4dir" id="tex4dir" onchange="actDir()"/>
                                <select id="lis4dir" onchange="actDir()">
                                    <option value=""></option>
                                    <%
                                        for (HashMap tipo : lis4dir) {
                                            %><option value="<%=tipo.get("codigo")%>"><%=tipo.get("descripcion")%></option><%
                                            }
                                    %>
                                </select>
                                <input type="text" name="tex5dir" id="tex5dir" onchange="actDir()"/>
                                <select id="lis5dir" onchange="actDir()">
                                    <option value=""></option>
                                    <%
                                        for (HashMap tipo : lis4dir) {
                                            %><option value="<%=tipo.get("codigo")%>"><%=tipo.get("descripcion")%></option><%
                                            }
                                    %>
                                </select>
                                <input type="text" name="tex6dir" id="tex6dir" onchange="actDir()"/>
                                <br>
                                <label for="dir">Su dirección es: </label><input type="text" name="dir" id="dir" maxlength="40" value="<%=direccion_movilidad%>" disabled="true" required=""/> <div hidden="true" id="alertaDir"><font color="red" >La dirección no puede ser tan larga</font></div>
                                <input type="hidden" name="direccion" id="direccion" maxlength="40" value="<%=direccion_movilidad%>"/>
                            </td>
                        </tr>
                        <tr>
                        <th colspan="4"><div align="center"><strong>Movilidad Durante Pandemia COVID-19</strong></div></th>
                        </tr>
                        <tr>
                        <th colspan="4"><div align="left">Días a Laborar</div></th>
                        </tr>
                        <tr>
                            <td colspan="1">Lunes</td>
                            <td colspan="1"><input type="checkbox" name="dias_laborar" id="lunes" value="0"/></td>
                            <td colspan="1">Martes</td>
                            <td colspan="1"><input type="checkbox" name="dias_laborar" id="martes" value="1"/></td>
                        </tr>
                        <tr>
                            <td colspan="1">Miercoles</td>
                            <td colspan="1"><input type="checkbox" name="dias_laborar" id="miercoles" value="2"/></td>
                            <td colspan="1">Jueves</td>
                            <td colspan="1"><input type="checkbox" name="dias_laborar" id="jueves" value="3"/></td>
                        </tr>
                        <tr>
                            <td colspan="1">Viernes</td>
                            <td colspan="1"><input type="checkbox" name="dias_laborar" id="viernes" value="4"/></td>
                            <td colspan="1">Sabado</td>
                            <td colspan="1"><input type="checkbox" name="dias_laborar" id="sabado" value="5"/></td>
                        </tr>
                        <tr>
                            <td colspan="1">Domingo</td>
                            <td colspan="3"><input type="checkbox" name="dias_laborar" id="domingo" value="6"/></td>
                        </tr>
                        <tr>
                        <th colspan="4"><br><br></th>
                        </tr>
                        <tr>
                        <th colspan="4"><div align="left"><strong>Horarios a Laborar</strong></div></th>
                        </tr>
                        <tr>
                            <td colspan="1">Hora Entrada Trabajo</td>
                            <td colspan="1">
                                <select id="hor_ing" name="hor_ing" required="">
                                    <option orden="0" value="">Seleccione</option>
                                    <option orden="1"value="12:00 a.m.">12:00 a.m.</option>
                                    <option orden="2"value="12:30 a.m.">12:30 a.m.</option>
                                    <option orden="3"value="1:00 a.m.">1:00 a.m.</option>
                                    <option orden="4"value="1:30 a.m.">1:30 a.m.</option>
                                    <option orden="5"value="2:00 a.m.">2:00 a.m.</option>
                                    <option orden="6"value="2:30 a.m.">2:30 a.m.</option>
                                    <option orden="7"value="3:00 a.m.">3:00 a.m.</option>
                                    <option orden="8"value="3:30 a.m.">3:30 a.m.</option>
                                    <option orden="9"value="4:00 a.m.">4:00 a.m.</option>
                                    <option orden="10"value="4:30 a.m.">4:30 a.m.</option>
                                    <option orden="11"value="5:00 a.m.">5:00 a.m.</option>
                                    <option orden="12"value="5:30 a.m.">5:30 a.m.</option>
                                    <option orden="13"value="6:00 a.m.">6:00 a.m.</option>
                                    <option orden="14"value="6:30 a.m.">6:30 a.m.</option>
                                    <option orden="15"value="7:00 a.m.">7:00 a.m.</option>
                                    <option orden="16"value="7:30 a.m.">7:30 a.m.</option>
                                    <option orden="17"value="8:00 a.m.">8:00 a.m.</option>
                                    <option orden="18"value="8:30 a.m.">8:30 a.m.</option>
                                    <option orden="19"value="9:00 a.m.">9:00 a.m.</option>
                                    <option orden="20"value="9:30 a.m.">9:30 a.m.</option>
                                    <option orden="21"value="10:00 a.m.">10:00 a.m.</option>
                                    <option orden="22"value="10:30 a.m.">10:30 a.m.</option>
                                    <option orden="23"value="11:00 a.m.">11:00 a.m.</option>
                                    <option orden="24"value="11:30 a.m.">11:30 a.m.</option>
                                    <option orden="25"value="12:00 p.m.">12:00 p.m.</option>
                                    <option orden="26"value="12:30 p.m.">12:30 p.m.</option>
                                    <option orden="27"value="1:00 p.m.">1:00 p.m.</option>
                                    <option orden="28"value="1:30 p.m.">1:30 p.m.</option>
                                    <option orden="29"value="2:00 p.m.">2:00 p.m.</option>
                                    <option orden="30"value="2:30 p.m.">2:30 p.m.</option>
                                    <option orden="31"value="3:00 p.m.">3:00 p.m.</option>
                                    <option orden="32"value="3:30 p.m.">3:30 p.m.</option>
                                    <option orden="33"value="4:00 p.m.">4:00 p.m.</option>
                                    <option orden="34"value="4:30 p.m.">4:30 p.m.</option>
                                    <option orden="35"value="5:00 p.m.">5:00 p.m.</option>
                                    <option orden="36"value="5:30 p.m.">5:30 p.m.</option>
                                    <option orden="37"value="6:00 p.m.">6:00 p.m.</option>
                                    <option orden="38"value="6:30 p.m.">6:30 p.m.</option>
                                    <option orden="39"value="7:00 p.m.">7:00 p.m.</option>
                                    <option orden="40"value="7:30 p.m.">7:30 p.m.</option>
                                    <option orden="41"value="8:00 p.m.">8:00 p.m.</option>
                                    <option orden="42"value="8:30 p.m.">8:30 p.m.</option>
                                    <option orden="43"value="9:00 p.m.">9:00 p.m.</option>
                                    <option orden="44"value="9:30 p.m.">9:30 p.m.</option>
                                    <option orden="45"value="10:00 p.m.">10:00 p.m.</option>
                                    <option orden="46"value="10:30 p.m.">10:30 p.m.</option>
                                    <option orden="47"value="11:00 p.m.">11:00 p.m.</option>
                                    <option orden="48"value="11:30 p.m.">11:30 p.m.</option>
                                </select>
                            </td>
                            <td colspan="1">Hora Salida Trabajo</td>
                            <td colspan="1">
                                <select id="hor_sal" name="hor_sal" required="">
                                    <option orden="0" value="">Seleccione</option>
                                    <option orden="1"value="12:00 a.m.">12:00 a.m.</option>
                                    <option orden="2"value="12:30 a.m.">12:30 a.m.</option>
                                    <option orden="3"value="1:00 a.m.">1:00 a.m.</option>
                                    <option orden="4"value="1:30 a.m.">1:30 a.m.</option>
                                    <option orden="5"value="2:00 a.m.">2:00 a.m.</option>
                                    <option orden="6"value="2:30 a.m.">2:30 a.m.</option>
                                    <option orden="7"value="3:00 a.m.">3:00 a.m.</option>
                                    <option orden="8"value="3:30 a.m.">3:30 a.m.</option>
                                    <option orden="9"value="4:00 a.m.">4:00 a.m.</option>
                                    <option orden="10"value="4:30 a.m.">4:30 a.m.</option>
                                    <option orden="11"value="5:00 a.m.">5:00 a.m.</option>
                                    <option orden="12"value="5:30 a.m.">5:30 a.m.</option>
                                    <option orden="13"value="6:00 a.m.">6:00 a.m.</option>
                                    <option orden="14"value="6:30 a.m.">6:30 a.m.</option>
                                    <option orden="15"value="7:00 a.m.">7:00 a.m.</option>
                                    <option orden="16"value="7:30 a.m.">7:30 a.m.</option>
                                    <option orden="17"value="8:00 a.m.">8:00 a.m.</option>
                                    <option orden="18"value="8:30 a.m.">8:30 a.m.</option>
                                    <option orden="19"value="9:00 a.m.">9:00 a.m.</option>
                                    <option orden="20"value="9:30 a.m.">9:30 a.m.</option>
                                    <option orden="21"value="10:00 a.m.">10:00 a.m.</option>
                                    <option orden="22"value="10:30 a.m.">10:30 a.m.</option>
                                    <option orden="23"value="11:00 a.m.">11:00 a.m.</option>
                                    <option orden="24"value="11:30 a.m.">11:30 a.m.</option>
                                    <option orden="25"value="12:00 p.m.">12:00 p.m.</option>
                                    <option orden="26"value="12:30 p.m.">12:30 p.m.</option>
                                    <option orden="27"value="1:00 p.m.">1:00 p.m.</option>
                                    <option orden="28"value="1:30 p.m.">1:30 p.m.</option>
                                    <option orden="29"value="2:00 p.m.">2:00 p.m.</option>
                                    <option orden="30"value="2:30 p.m.">2:30 p.m.</option>
                                    <option orden="31"value="3:00 p.m.">3:00 p.m.</option>
                                    <option orden="32"value="3:30 p.m.">3:30 p.m.</option>
                                    <option orden="33"value="4:00 p.m.">4:00 p.m.</option>
                                    <option orden="34"value="4:30 p.m.">4:30 p.m.</option>
                                    <option orden="35"value="5:00 p.m.">5:00 p.m.</option>
                                    <option orden="36"value="5:30 p.m.">5:30 p.m.</option>
                                    <option orden="37"value="6:00 p.m.">6:00 p.m.</option>
                                    <option orden="38"value="6:30 p.m.">6:30 p.m.</option>
                                    <option orden="39"value="7:00 p.m.">7:00 p.m.</option>
                                    <option orden="40"value="7:30 p.m.">7:30 p.m.</option>
                                    <option orden="41"value="8:00 p.m.">8:00 p.m.</option>
                                    <option orden="42"value="8:30 p.m.">8:30 p.m.</option>
                                    <option orden="43"value="9:00 p.m.">9:00 p.m.</option>
                                    <option orden="44"value="9:30 p.m.">9:30 p.m.</option>
                                    <option orden="45"value="10:00 p.m.">10:00 p.m.</option>
                                    <option orden="46"value="10:30 p.m.">10:30 p.m.</option>
                                    <option orden="47"value="11:00 p.m.">11:00 p.m.</option>
                                    <option orden="48"value="11:30 p.m.">11:30 p.m.</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="1">Modo de Transporte</td>
                            <td colspan="1">
                                <select name="modo_transp" id="modo_transp" required="">
                                    <option value="">Seleccione</option>
                                    <%
                                        for (HashMap tipo : tiposTransporteCovid19) {
                                    %><option value="<%=tipo.get("CODIGO")%>"><%=tipo.get("DESCRIPCION")%></option><%
                                        }
                                    %>
                                </select>
                            </td>
                            <td colspan="1">¿Trabaja Remoto?</td>
                            <td colspan="1">
                                <select name="trab_remoto" id="trab_remoto" required="">
                                    <option value="">Seleccione</option>
                                    <option value="1">Si</option>
                                    <option value="0">No</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                        <th colspan="4"><br><br></th>
                        </tr>
                        <tr>
                        <th colspan="4"><div align="left"><strong>Autorización de Tratamiento de Información</strong></div></th>
                        </tr>
                        <tr>
                            <td colspan="3">Confirmo que la información por mi consignada en este documento, es verídica y corresponde a la realidad</td>
                            <td colspan="1">
                                <select name="inf_veridica" id="inf_veridica" required="">
                                    <option value="">Seleccione</option>
                                    <option value="1">Si</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">Acepto el tratamiento de mis datos personales conforme a los términos de la <a target='_blank' href='https://www.escuelaing.edu.co/escuela/importantDoc/SOLICITUD_DE_AUTORIZACION_ACTUALIZACION_DATOS.pdf'>solicitud de autorización</a> y <a target='_blank' href=' https://www.escuelaing.edu.co/escuela/importantDoc/Politica_de_Tratamiento_de_Datos_Personales.pdf'>política de tratamiento</a> de datos personales</td>
                            <td colspan="1">
                                <select name="ind_acepta" id="ind_acepta" required="">
                                    <option value="">Seleccione</option>
                                    <option value="1">Si</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                        <th colspan="4"><br><br></th>
                        </tr>
                        <input name="tip_id" id="tip_id" type="hidden" value="<%=tipo_doc_movilidad%>"/>
                        <input name="documento" id="documento" type="hidden" value="<%=doc_movilidad%>"/>
                        <input name="nombres" id="nombres" type="hidden" value="<%=nombres_movilidad%>"/>
                        <input name="apellidos" id="apellidos" type="hidden" value="<%=apellidos_movilidad%>"/>
                        <input name="genero" id="genero" type="hidden" value="<%=genero_movilidad%>"/>
                        <input name="edad" id="edad" type="hidden" value="<%=edad%>"/>
                        <input name="cargo" id="cargo" type="hidden" value="<%=cargo%>"/>
                        
                        <tr><td colspan="4"><div  align="center"><input name="enviar" id="enviar" type="submit" value="Guardar Datos"/></div></td>
                        </tr>
                </table>
             </div>
        </form>
    </body>
</html>