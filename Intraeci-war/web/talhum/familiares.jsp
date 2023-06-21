<%-- 
    Document   : familiares
    Created on : 13-nov-2019, 15:54:49
    Author     : andres.rojas
--%>

<%@page import="java.util.HashMap"%>
<%@page import="BDintraeci.EmpleadoRemote"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ include file="../secure.jsp" %>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache");
    String respuesta=request.getParameter("respuesta");
    String titulo = new String("Sistema de Talento Humano");            
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    EmpleadoRemote emp = conEjb.lookupEmpleadoRemote();
    emp.inicializar(((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getIdemp());
    session.setAttribute("emp", emp );
    HashMap datos = emp.datosGenerales() ;
    String id_emp=(String) datos.get("cod_emp");
    HashMap[] parentescosERP=emp.getParentescosERP();
    HashMap[] generosERP=emp.getGenerosERP();
    HashMap[] tipos_iden = emp.getTiposDocERP();
    HashMap[] ocupaciones = emp.getOcupacionesERP();
    HashMap[] familiaresEMP = emp.getFamiliaresEmpERP(id_emp);
    HashMap[] estadosCivilesERP = emp.getEstCivilERP();
    HashMap[] clasesEstudioERP = emp.getClasesEstudioERP();
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
        <script type="text/javascript">
        <%
            if(respuesta!=null && respuesta.equals("1")){
                %>alert("La información de familares fue guardada satisfactoriamente.");<%
            }else if(respuesta!=null && respuesta.equals("0")){
                %>alert("Hubo un error al intentar registrar su información, revise los datos ingresados");<%
            }
        %>
            function ValidarFamiliar(numDoc){
                  <%
                for (HashMap fam : familiaresEMP) {
                     %>
                     var numDocVal= parseInt(<%=fam.get("num_ced")%>);
                     console.log(numDocVal);
                     if(numDocVal==numDoc){
                         window.alert("Ya existe un familiar con este numero de documento");
                         document.getElementById('num_ced').value='';
                     }
                     <%
                    }

                    %>
            }
            function EliminarFamiliar(num_ced){
                num_ced=num_ced.trim();
              document.location.href = '${pageContext.request.contextPath}/EliminarFamiliar?num_ced='+num_ced;
              
                    
                }
        </script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondoblanco.gif">
        <form name="familiares" method="post" action="GuardaFamiliarERP">
            <table border="1" class="tabla" id="tabla1" align="center" width="70%">
                <thead>
                    <th colspan="15"><div align="center"><strong>Familiares Empleado</strong></div></th>
                </thead>
                <tr>
                    <td><strong>Primer Apellido</strong></td>
                    <td><strong>Segundo Apellido</strong></td>
                    <td><strong>Nombres</strong></td>
                    <td><strong>Parentesco</strong></td>
                    <td><strong>Tipo de documento</strong></td>
                    <td><strong>Número de documento</strong></td>
                    <td><strong>Fecha de nacimiento</strong></td>
                    <td><strong>Género</strong></td>
                    <td><strong>Estado civil</strong></td>
                    <td><strong>Ocupación</strong></td>
                    <!--td><strong>Salario</strong></td-->
                    <td><strong>Recibe Subsidio</strong></td>
                    <td><strong>Es Beneficiario POS</strong></td>
                    <td><strong>Convive Conmigo</strong></td>
                    <td><strong>Nivel de Estudios</strong></td>
                    <td><strong>Terminó Estudios</strong></td>
                     <td><strong>Eliminar</strong></td>
                </tr>
            <%
                for (HashMap fam : familiaresEMP) {
                    String parentesco="";
                    String genero="";
                    String tipoDoc="";
                    String ocupacion="";
                    String estado_civil="";
                    String clase_estudio="";
                    for (HashMap par : parentescosERP) {
                        if(fam.get("tip_fam").equals(par.get("cod_par"))){
                            parentesco=(String) par.get("nom_par");
                        }
                    }
                    for (HashMap gen : generosERP) {
                        if(fam.get("sex_fam").equals(gen.get("cod_gen"))){
                            genero=(String) gen.get("des_gen");
                        }
                    }
                    for (HashMap tip_ide : tipos_iden) {
                        if(fam.get("tip_ide").equals(tip_ide.get("cod_tip"))){
                            tipoDoc=(String) tip_ide.get("des_tip");
                        }
                    }
                    for (HashMap ocupa : ocupaciones) {
                        if(fam.get("ocu_fam").equals(ocupa.get("cod_ocu"))){
                            ocupacion=(String) ocupa.get("des_ocu");
                        }
                    }
                    for (HashMap est_civ : estadosCivilesERP) {
                        if(fam.get("est_civ").equals(est_civ.get("codigo"))){
                            estado_civil=(String) est_civ.get("descripcion");
                        }
                    }
                    for (HashMap cla_estud: clasesEstudioERP){
                        if(fam.get("niv_est").equals(cla_estud.get("tip_est"))){
                            clase_estudio=(String) cla_estud.get("des_est");
                        }
                    }

                    %>
                    <tr>
                        <td><%=fam.get("ap1_fam")%></td>
                        <td><%=fam.get("ap2_fam")%></td>
                        <td><%=fam.get("nom_fam")%></td>
                        <td><%=parentesco%></td>
                        <td><%=tipoDoc%></td>
                        <td><%=fam.get("num_ced")%></td>
                        <td><%=fam.get("fec_nac")%></td>
                        <td><%=genero%></td>
                        <td><%=estado_civil%></td>
                        <td><%=ocupacion%></td>
                        <!--td><%=fam.get("sal_bas")%></td-->
                        <td><%=((String) (fam.get("ind_sub"))).equals("1")?"Si":"No"%></td>
                        <td><%=((String) (fam.get("ind_pro"))).equals("1")?"Si":"No"%></td>
                        <td><%=((String) (fam.get("ind_conv"))).equals("1")?"Si":"No"%></td>
                        <td><%=clase_estudio%></td>
                        <td><%=((String) (fam.get("ind_comp"))).equals("1")?"Si":"No"%></td>
                        <td><button type="button" onclick="EliminarFamiliar('<%=fam.get("num_ced")%>');" >Eliminar</button> </td>
                    </tr>
                    <%
                }
            %>
                <tr>
                    <th colspan="15"><div align="center"><strong>Nuevo Familiar</strong></div></th>
                </tr>
                <tr>
                    <td><strong>Primer Apellido</strong></td>
                    <td><strong>Segundo Apellido</strong></td>
                    <td><strong>Nombres</strong></td>
                    <td><strong>Parentesco</strong></td>
                    <td><strong>Tipo de documento</strong></td>
                    <td><strong>Número de documento</strong></td>
                    <td><strong>Fecha de nacimiento</strong></td>
                    <td><strong>Género</strong></td>
                    <td><strong>Estado civil</strong></td>
                    <td><strong>Ocupación</strong></td>
                    <!--td><strong>Salario</strong></td-->
                    <td><strong>Recibe Subsidio</strong></td>
                    <td><strong>Es Beneficiario POS</strong></td>
                    <td><strong>Convive Conmigo</strong></td>
                    <td><strong>Nivel de Estudios</strong></td>
                    <td><strong>Terminó Estudios</strong></td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="ap1_fam" name="ap1_fam" maxlength="15" required=""/>
                    </td>
                    <td>
                        <input type="text" id="ap2_fam" name="ap2_fam" maxlength="15" required=""/>
                    </td>
                    <td>
                        <input type="text" id="nom_fam" name="nom_fam" maxlength="30" required=""/>
                    </td>
                    <td>
                        <select name="tip_fam" id="tip_fam" required="">
                            <option value="">Seleccione</option>
                            <%
                            for (HashMap parentesco : parentescosERP) {  
                                %>
                                <option value="<%=parentesco.get("cod_par")%>"><%=parentesco.get("nom_par")%></option>
                                <%
                            }
                            %>
                        </select>
                    </td>
                    <td>
                        <select name="tip_ide" id="tip_ide" required="">
                            <option value="">Seleccione</option>
                            <%
                            for (HashMap tip_ide : tipos_iden) {  
                                %>
                                <option value="<%=tip_ide.get("cod_tip")%>"><%=tip_ide.get("des_tip")%></option>
                                <%
                            }
                            %>
                        </select>
                    </td>
                    <td>
                        <input type="number" id="num_ced" name="num_ced" maxlength="12" required="" onchange="ValidarFamiliar(value);"/>
                    </td>
                    <td>
                        <input type="date" id="fec_nac" name="fec_nac" required=""/>
                    </td>
                    <td>
                        <select name="sex_fam" id="sex_fam" required="">
                            <option value="">Seleccione</option>
                            <%
                            for (HashMap genero : generosERP) {  
                                %>
                                <option value="<%=genero.get("cod_gen")%>"><%=genero.get("des_gen")%></option>
                                <%
                            }
                            %>
                        </select>
                    </td>
                    <td>
                        <select name="est_civ" id="est_civ" required="">
                            <option value="">Seleccione</option>
                            <%
                            for (HashMap est_civ : estadosCivilesERP) {  
                                %>
                                <option value="<%=est_civ.get("codigo")%>"><%=est_civ.get("descripcion")%></option>
                                <%
                            }
                            %>
                        </select>
                    </td>
                    <td>
                        <select name="ocu_fam" id="ocu_fam" required="">
                            <option value="">Seleccione</option>
                            <%
                            for (HashMap ocupa : ocupaciones) {  
                                %>
                                <option value="<%=ocupa.get("cod_ocu")%>"><%=ocupa.get("des_ocu")%></option>
                                <%
                            }
                            %>
                        </select>
                    </td>
                    <!--td-->
                        <input type="hidden" id="sal_bas" value="0" name="sal_bas"/>
                    <!--/td-->
                    <td>
                        <select name="ind_sub" id="ind_sub" required="">
                            <option value="">Seleccione</option>
                            <option value="1">Si</option>
                            <option value="0">No</option>
                        </select>
                    </td>
                    <td>
                        <select name="ind_pro" id="ind_pro" required="">
                            <option value="">Seleccione</option>
                            <option value="1">Si</option>
                            <option value="0">No</option>
                        </select>
                    </td>
                    <td>
                        <select name="ind_conv" id="ind_conv" required="">
                            <option value="">Seleccione</option>
                            <option value="1">Si</option>
                            <option value="0">No</option>
                        </select>
                    </td>
                    <td>
                        <select name="niv_est" id="niv_est" required="">
                            <option value="">Seleccione</option>
                            <%
                            for (HashMap clas_est : clasesEstudioERP) {  
                                %>
                                <option value="<%=clas_est.get("tip_est")%>"><%=clas_est.get("des_est")%></option>
                                <%
                            }
                            %>
                        </select>
                    </td>
                    <td>
                        <select name="ind_comp" id="ind_comp" required="">
                            <option value="">Seleccione</option>
                            <option value="1">Si</option>
                            <option value="0">No</option>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="hidden" id="cod_emp" name="cod_emp" value="<%=id_emp%>"/>
            <input type="submit" name="guarda_fam" id="guarda_fam" value="Guardar Familiar"/>
            <br>
            <input type="button" name="volver" id="volver" onclick="window.close()" value="Volver"/>
        </form>
    </body>
</html>
