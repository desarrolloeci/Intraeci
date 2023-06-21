
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
            //using Calendar Object
            String edad = "";
            String s = (fecha_nacimiento_movilidad.split(" "))[0];
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date d = sdf.parse(s);
            Date now= new Date();
            Calendar c = Calendar.getInstance();
            c.setTime(d);
            int yearb = c.get(Calendar.YEAR);
            c.setTime(now);
            int yearnow = c.get(Calendar.YEAR);
            edad = String.valueOf(yearnow-yearb);
            /**
            DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            LocalDate fechaNac = LocalDate.parse("15/08/1993", fmt);
            LocalDate ahora = LocalDate.now();
            Period periodo = Period.between(fechaNac, ahora);
            String edad = String.valueOf(periodo.getYears());
            * */
            
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
            
            //Se obtienen datos guardados anteriormente en el formulario para cargarlos a la plantilla
            String barrio_guardado="";
            String tipo_rol_guardado="";
            Boolean d_lun=false;
            Boolean d_mar=false;
            Boolean d_mrc=false;
            Boolean d_jue=false;
            Boolean d_vie=false;
            Boolean d_sab=false;
            Boolean d_dom=false;
            String hor_ing_guardado="";
            String hor_sal_guardado="";
            String modo_transp_guardado="";
            String trab_remoto_guardado="";
            HashMap datos_guardados=emp.getDatosGuardadosMovilidadERP(id_emp);
            if(!datos_guardados.isEmpty()){
                barrio_guardado=(String) datos_guardados.get("barrio");
                tipo_rol_guardado=(String) datos_guardados.get("tipo_rol");
                ciudad_movilidad=(String) datos_guardados.get("ciudad");
                direccion_movilidad=(String) datos_guardados.get("direccion");
                hor_ing_guardado=(String) datos_guardados.get("hor_ing");
                hor_sal_guardado=(String) datos_guardados.get("hor_sal");
                modo_transp_guardado=(String) datos_guardados.get("modo_transp");
                trab_remoto_guardado=(String) datos_guardados.get("trab_remoto");
                d_lun= ((String) datos_guardados.get("d_lun")).equals("1");
                d_mar= ((String) datos_guardados.get("d_mar")).equals("1");
                d_mrc= ((String) datos_guardados.get("d_mrc")).equals("1");
                d_jue= ((String) datos_guardados.get("d_jue")).equals("1");
                d_vie= ((String) datos_guardados.get("d_vie")).equals("1");
                d_sab= ((String) datos_guardados.get("d_sab")).equals("1");
                d_dom= ((String) datos_guardados.get("d_dom")).equals("1");
            }
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
                var dias_ok=false;
                var checkboxs=document.getElementsByName("dias_laborar");
                for(var i=0,l=checkboxs.length;i<l;i++){
                    if(checkboxs[i].checked){
                        dias_ok=true;
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
                }else if(!dias_ok){
                    alert("Debe seleccionar al menos un día de labores.");
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondoblanco.gif">
        <p class="textocom">&nbsp;</p>
         <jsp:include page="encabezadoTalhum.jsp">
            <jsp:param name="parametro" value="<%=datos.get("nombres")%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>
        
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
        <form name="empleadoERP" onsubmit="return validarDatos()" id="empleadoERP" method="post" action="RegistroFormularioMovilidadCovid19">
            <input type="hidden" name="hor_ing_guardado" id="hor_ing_guardado" value="<%=hor_ing_guardado%>"/>
            <input type="hidden" name="hor_sal_guardado" id="hor_sal_guardado" value="<%=hor_sal_guardado%>"/>
            <div align="center" id="div_tabla">
                <div border="1" class="tabla" id="tabla1" align="center" width="70%">
                    <!-- INICIO PRIMER MODULO INFORMACION EMPLEADO  -->   
                    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 shadow p-3 mb-5 bg-white rounded form-group" >
                     <div align="center"><strong>Información Empleado</strong></div>
                     <br>
                     <hr style="border-color: #990000;margin: 0;"> 
                     <br>
                     <div class="row">
                          <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                          Documento:
                          <input class="form-control" disabled="true" type="text" size="12" name="idEmp" id="idEmp" value="<%=datos.get("cod_emp")%>"/>
                          </div>
                          <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">            
                   Nombre:
                   <input class="form-control" disabled="true" type="text" size="70" name="nomEmp" id="nomEmp" value="<%=nombre_emp%>"/>
                          </div>
                          </div><br>
                   <input type="hidden" name="cod_emp" id="cod_emp" value="<%=id_emp%>"/>
                   <div class="row">
                      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6"> 
                        Nacimiento:
                        <div class="row"> 
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6"> 
                          <input class="form-control" disabled="true" type="text" size="12" name="fnac" id="fnac" value="<%=datos.get("fecn")%>"/>
                            </div>
                       <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">    
                          <input class="form-control" disabled="true" type="text" size="12" name="gen" id="gen" value="<%=datos.get("gen")%>"/>
                       </div>
                            </div>
                          </div>
                           <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                 Tipo de Rol (Según clasificación de la Alcaldía de Bogotá)
                                 <select class="custom-select" required="" id="tipo_rol" name="tipo_rol">
                                    <option value="">Seleccione</option>
                                    <%
                                        for (HashMap tipo : rolesCovid19) {
                                    %><option value="<%=tipo.get("CODIGO")%>" <%=(tipo_rol_guardado.equals(tipo.get("CODIGO")))?"selected":""%>><%=tipo.get("DESCRIPCION")%></option><%
                                     
                                        }
                                    %>
                                </select>
                                <input type="hidden" size="3" name="eciv" id="eciv" value="<%=datos.get("eciv")%>"/>
                     </div>
                   </div><br>
                        
                   
                      <div class="row">    
                           <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        Ciudad Residencia:
                        
                                <select class="custom-select" id="ciudad" name="ciudad" required="">
                                    <option value="">Seleccione</option>
                                        <%
                                            for (HashMap ciu : ciudadesERP) {
                                                if(ciu.get("codigo_pais").toString().equals(pais_movilidad)){
                                                    %><option value="<%=ciu.get("codigo_ciudad")%>" <%=(ciu.get("codigo_ciudad").toString().equals(ciudad_movilidad))?"selected":""%>><%=ciu.get("descripcion")%></option><%
                                                }
                                          }
                                        %>
                                </select>
                         
                           </div>
                     <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        Barrio de Residencia:
                        <input class="form-control" placeholder="Barrio" type="text" size="70" name="barrio" id="barrio" value="<%=barrio_guardado%>" required=""/>
                     </div>
                      </div><br>
                       Dirección Actual de Residencia:
                       <div style="border-style: solid;border-width: 1px"><br>
                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                           <div class="row" >   
                          <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
                              <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                       
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
                           
                                <select class="custom-select" id="lis1dir" onchange="actDir()">
                                    <option value="">Seleccione</option>
                                    <%
                                       for (HashMap tipo : lis1dir) {
                                            %><option value="<%=tipo.get("codigo")%>"><%=tipo.get("descripcion")%></option><%
                                           }
                                    %>
                                </select>
                              </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <input class="form-control" placeholder="Dirección" type="text" name="tex1dir" id="tex1dir" onchange="actDir()"/>
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <select class="custom-select" id="lisabcdir" onchange="actDir()">
                                    <option value="">Seleccione</option>
                                    <%
                                        for (HashMap tipo : lisabc) {
                                            %><option value="<%=tipo.get("descripcion")%>"><%=tipo.get("descripcion")%></option><%
                                           }
                                    %>
                                </select>
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <select class="custom-select" id="lis2dir" onchange="actDir()">
                                    <option value="">Seleccione</option>
                                    <%
                                        for (HashMap tipo : lis2dir) {
                                            %><option value="<%=tipo.get("codigo")%>"><%=tipo.get("descripcion")%></option><%
                                            }
                                    %>
                                </select>
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <input class="form-control" placeholder="Dirección" type="text" name="tex2dir" id="tex2dir" onchange="actDir()"/>
                                </div>
                                </div>
                       </div><br>
                                
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                           <div class="row" >    
                                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
                               <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <select class="custom-select" id="lisabc2dir" onchange="actDir()">
                                    <option value="">Seleccione</option>
                                    <%
                                        for (HashMap tipo : lisabc) {
                                            %><option value="<%=tipo.get("descripcion")%>"><%=tipo.get("descripcion")%></option><%
                                            }
                                    %>
                                </select>
                               </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <select class="custom-select" id="lissimbolodir" onchange="actDir()">
                                    <option value="">Seleccione</option>
                                    <option value="#">#</option>
                                    <option value="-">-</option>
                                </select>
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <input class="form-control" placeholder="Dirección" type="text" name="tex3dir" id="tex3dir" onchange="actDir()"/>
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <select class="custom-select" id="lisabc3dir" onchange="actDir()">
                                    <option value="">Seleccione</option>
                                    <%
                                        for (HashMap tipo : lisabc) {
                                            %><option value="<%=tipo.get("descripcion")%>"><%=tipo.get("descripcion")%></option><%
                                            }
                                    %>
                                </select>
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <select class="custom-select" id="lis3dir" onchange="actDir()">
                                    <option value="">Seleccione</option>
                                    <%
                                        for (HashMap tipo : lis3dir) {
                                            %><option value="<%=tipo.get("codigo")%>"><%=tipo.get("descripcion")%></option><%
                                           }
                                    %>
                                </select>
                                </div>
                           </div>
                            </div><br>
                                
                                 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                           <div class="row" >  
                                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <input class="form-control" placeholder="Dirección" type="text" name="tex4dir" id="tex4dir" onchange="actDir()"/>
                                </div>
                               <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <select class="custom-select" id="lis4dir" onchange="actDir()">
                                    <option value="">Seleccione</option>
                                    <%
                                        for (HashMap tipo : lis4dir) {
                                            %><option value="<%=tipo.get("codigo")%>"><%=tipo.get("descripcion")%></option><%
                                           }
                                    %>
                                </select>
                               </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <input class="form-control" placeholder="Dirección" type="text" name="tex5dir" id="tex5dir" onchange="actDir()"/>
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <select class="custom-select" id="lis5dir" onchange="actDir()">
                                    <option value="">Seleccione</option>
                                    <%
                                       for (HashMap tipo : lis4dir) {
                                            %><option value="<%=tipo.get("codigo")%>"><%=tipo.get("descripcion")%></option><%
                                           }
                                    %>
                                </select>
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <input class="form-control" placeholder="Dirección" type="text" name="tex6dir" id="tex6dir" onchange="actDir()"/>
                                </div>
                                </div>
                                 </div>
                                <br>
                                <label for="dir">Su dirección es: </label><input  class="form-control" placeholder="Diligencie la dirección usando los cuadros de arriba"  type="text" name="dir" id="dir" maxlength="40" value="<%=direccion_movilidad%>" disabled="true" required=""/> <div hidden="true" id="alertaDir"><font color="red" >La dirección no puede ser tan larga</font></div>
                                <input type="hidden" name="direccion" id="direccion" maxlength="40" value="<%=direccion_movilidad%>"/>
                                
                                </div>
                                
                    </div> 
                     <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>  
                    </div>     
                           <!-- FIN PRIMER MODULO INFORMACION EMPLEADO  -->     
                                
                        
                            <!-- INICIO SEGUNDO MODULO COVID  -->     
                         <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 shadow p-3 mb-5 bg-white rounded form-group">   
                   <div align="center"><strong>Movilidad Durante Pandemia COVID-19</strong></div>
                          <br>
                     <hr style="border-color: #990000;margin: 0;"> 
                     <br>
    
                     <div class="col-xs-2 col-sm-2 col-md-8 col-lg-8">
                     <table class="table table-striped" style="width: 100%">
    <thead >
      <tr>
        <th colspan="2">Días a Laborar (Seleccione los días que labora de acuerdo con su horario de trabajo)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>   Lunes
            <input style="float: right" type="checkbox" name="dias_laborar" id="lunes" value="0" <%=(d_lun)?"checked":""%>/></td>
        <td> Martes
                          <input style="float: right" type="checkbox" name="dias_laborar" id="martes" value="1" <%=(d_mar)?"checked":""%>/></td>
      </tr>
        <tr>
        <td>Miercoles
                          <input style="float: right" type="checkbox" name="dias_laborar" id="miercoles" value="2" <%=(d_mrc)?"checked":""%>/></td>
        <td> Jueves
                           <input style="float: right" type="checkbox" name="dias_laborar" id="jueves" value="3" <%=(d_jue)?"checked":""%>/></td>
      </tr>
      <tr>
        <td> Viernes
                          <input style="float: right" type="checkbox" name="dias_laborar" id="viernes" value="4" <%=(d_vie)?"checked":""%>/></td>
        <td>  Sabado
                            <input style="float: right" type="checkbox" name="dias_laborar" id="sabado" value="5" <%=(d_sab)?"checked":""%>/></td>
      </tr>
        <tr>
        <td>  Domingo
                         <input style="float: right" type="checkbox" name="dias_laborar" id="domingo" value="6" <%=(d_dom)?"checked":""%>/></td>
        <td></td>
      </tr>
    
    </tbody>
  </table>
</div>
                     
 <div align="left"><strong>Horarios a Laborar</strong></div><br>
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
 <div class="row">
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                       Hora Entrada Trabajo
                        
                                <select class="custom-select"  id="hor_ing" name="hor_ing" required>
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
      </div>
     <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                       Hora Salida Trabajo
                                <select class="custom-select"  id="hor_sal" name="hor_sal" required>
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
     </div>
     <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                         Modo de Transporte (Seleccione la opción que más utilice durante sus días laborales en el mes)
                                <select class="custom-select"  name="modo_transp" id="modo_transp" required="">
                                    <option value="">Seleccione</option>
                                    <%
                                        for (HashMap tipo : tiposTransporteCovid19) {
                                    %><option value="<%=tipo.get("CODIGO")%>" <%=(tipo.get("CODIGO").equals(modo_transp_guardado))?"Selected":""%>><%=tipo.get("DESCRIPCION")%></option><%
                                        }
                                    %>
                                </select>
     </div>
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        ¿Trabaja Remoto?
                                <select class="custom-select"  name="trab_remoto" id="trab_remoto" required="">
                                    <option value="">Seleccione</option>
                                    <option value="1" <%=(trab_remoto_guardado.equals("1"))?"selected":""%>>Si</option>
                                    <option value="0" <%=(trab_remoto_guardado.equals("0"))?"selected":""%>>No</option>
                                </select>
                                </div>
                        </div>
  </div>    <br>
                                
                   <div align="left"><strong>Autorización de Tratamiento de Información</strong></div> <br>
                       <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
 <div class="row">
     <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
      <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                           Confirmo que la información por mi consignada en este documento, es verídica y corresponde a la realidad
                          
                                <select class="custom-select"  name="inf_veridica" id="inf_veridica" required="">
                                    <option value="">Seleccione</option>
                                    <option value="1">Si</option>
                                </select>
                       Acepto el tratamiento de mis datos personales conforme a los términos de la <a target='_blank' href='https://www.escuelaing.edu.co/escuela/importantDoc/SOLICITUD_DE_AUTORIZACION_ACTUALIZACION_DATOS.pdf'>solicitud de autorización</a> y <a target='_blank' href=' https://www.escuelaing.edu.co/escuela/importantDoc/Politica_de_Tratamiento_de_Datos_Personales.pdf'>política de tratamiento</a> de datos personales
                          
                                <select class="custom-select"  name="ind_acepta" id="ind_acepta" required="">
                                    <option value="">Seleccione</option>
                                    <option value="1">Si</option>
                                </select>
      </div>
      </div>
 </div><br>
                        <input name="tip_id" id="tip_id" type="hidden" value="<%=tipo_doc_movilidad%>"/>
                        <input name="documento" id="documento" type="hidden" value="<%=doc_movilidad%>"/>
                        <input name="nombres" id="nombres" type="hidden" value="<%=nombres_movilidad%>"/>
                        <input name="apellidos" id="apellidos" type="hidden" value="<%=apellidos_movilidad%>"/>
                        <input name="genero" id="genero" type="hidden" value="<%=genero_movilidad%>"/>
                        <input name="edad" id="edad" type="hidden" value="<%=edad%>"/>
                        <input name="cargo" id="cargo" type="hidden" value="<%=cargo%>"/>
                    <div  align="center"><input class="btn btn-primary" style="background-color: #990000;border-color: #990000" name="enviar" id="enviar" type="submit" value="Guardar Datos"/></div>
                    </div>
                </div>
             </div>
            <script lang="javascript">
                var opt_hor_ing = document.getElementById("hor_ing").options;
                var hor_ing_guardado = document.getElementById("hor_ing_guardado").value;
                for (var i = 0, max = opt_hor_ing.length; i < max; i++) {
                    if(hor_ing_guardado===(opt_hor_ing[i].value.replace(".", "").replace(".", ""))){
                        opt_hor_ing[i].setAttribute("selected", "selected");
                    }
                }
                var opt_hor_sal = document.getElementById("hor_sal").options;
                var hor_sal_guardado = document.getElementById("hor_sal_guardado").value;
                for (var i = 0, max = opt_hor_sal.length; i < max; i++) {
                    if(hor_sal_guardado===(opt_hor_sal[i].value.replace(".", "").replace(".", ""))){
                        opt_hor_sal[i].setAttribute("selected", "selected");
                    }
                }
            </script>
        </form>
                        </div>
    </body>
</html>