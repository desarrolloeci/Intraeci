<%--
    Document   : SegEstudRegistro
    Created on : 13/01/2016, 09:50:52 AM
    Author     : Mario Martínez
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<%@ include file="../secure.jsp" %>
<%@ page import="javax.naming.*, 
    javax.rmi.PortableRemoteObject, 
    login.InicioProfRemoteBusiness, 
    login.InicioProfRemoteHome, 
    BDintraeci.EmpleadoRemote"
%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
    <head>
        <%
            response.setHeader("Cache-Control", "no-cache");
            
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            
            login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");
            session.setAttribute("loginex", empleado.getUsrExchange());
            
            EmpleadoRemote empleado2 = conEjb.lookupEmpleadoRemote();
            empleado2.inicializar(((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getIdemp());
            session.setAttribute("empleado2", empleado2);
            
            BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
            
            //Valida la existencia del empleado en la lista de admitidos.
            Vector access = null;
            try {
                access = (Vector) admin.getSegEstEmpAdmitido(empleado.getIdemp()).elementAt(0);
                if (access.elementAt(0).toString().equals("0")) access = null;
            } catch (Exception e) {
                access = null;
            }

            /* Tipo de Empleado para obtención del tipo de consulta
             * -1 = No tiene tipo adicional (Únicamente se usa con tipoEmpAd)
             * 0 = Académica
             * 1 = Salud
             * 2 = Psicología
             * 3 = Acompañamiento
             */
            int tipoEmp = 0;
            int tipoEmpAd = -1;
            String[] tipoConsulta = {"Académica", "Salud", "Psicología", "Acompañamiento"};
            
            /* Rol de Empleado para permisos sobre el formulario
             * 0 = Usuario
             * 1 = Decano
             * 2 = Administrador
             */
            int rolEmp = 0;
            
            //Departamento si es profesor. Por defecto y si no es profesor es 0
            int idDpto = 0;
            
            //Si no tiene Id de profesor, quiere decir que es un administrativo.
            boolean isProf = !empleado.getIdProf().equals("");

            //Verifica que si el empleado no se encuentra en la tabla y no es un profesor, no está admitido.
            boolean admitido = true;
            if (access == null && !isProf) admitido = false;
            
            //Si se encontró en la tabla, e independientemente de si es un profesor, obtenemos el tipo y el rol.
            if (access != null) {
                if (isProf) {
                    try {
                        tipoEmpAd = Integer.parseInt(access.elementAt(1).toString());
                    } catch(Exception e) {}
                    
                    rolEmp = Integer.parseInt(access.elementAt(2).toString());
                    idDpto = Integer.parseInt(access.elementAt(3).toString());
                    session.setAttribute("departamento",idDpto);
                } else { 
                    tipoEmp = Integer.parseInt(access.elementAt(1).toString());
                }
            }

            String usuario1 = (String) session.getAttribute("usuario");
            String clave = (String) session.getAttribute("clave");

            session.setAttribute("usuario", usuario1);
            session.setAttribute("clave", clave);

            Calendar today = Calendar.getInstance();
            String fechaHoy = Integer.toString(today.get(Calendar.DAY_OF_MONTH)) + "/" + Integer.toString(today.get(Calendar.MONTH)+1) + "/" + Integer.toString(today.get(Calendar.YEAR));
            
        %>

        <title>Registro de Consultas a Profesores</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="fonts/stylesheet.css" rel="stylesheet" type="text/css">
        <link href="css/RegConsulta.css" rel="stylesheet" type="text/css">
        <link href="css/calendario.css" type="text/css" rel="stylesheet">
        <script>
            var perAcad = '<%=empleado.getPeriodo()%>';
        </script>
        <script src="jscript/conectar.js"></script>
        <script src="jscript/SegEstud/main.js"></script>
        <script src="jscript/calendar.js"></script>
        <script src="jscript/calendar-es.js"></script>
        <script src="jscript/calendar-setup.js"></script>
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="headerImg" value="head_regconsultas.jpg" />
        </jsp:include>
        <div id="formulario">
            <%
                if (!admitido) {
            %>
            <div class="title">ACCESO RESTRINGIDO</div>
            <div class="subtitle" style="width: 100%; text-align: center;">
                Usted no se encuentra habilitado para utilizar esta opción.
            </div>
            <%
                } else {
            %>
            <div id="formContent" style="display: table; opacity: 1;">
                <div class="title">REGISTRAR CONSULTA</div>
                <div class="subtitle">Fecha de consulta:</div>
                <div class="input">
                    <input id="fechaCons" name="fechaCons" type="text" style="text-align: center; width: 20%;" maxlenght="10" value="<%=fechaHoy%>" disabled>
                    <img id="lanzador" src="img/SegEstud/calendar.png" border="0" title="Fecha de Consulta" onload="initCalendar();">
                </div>
                <div class="subtitle"><%=tipoEmp == 0?"Profesor":"Quien registra"%>:</div>
                <div class="inputAuto"><%=empleado.getNomemp().toUpperCase() + " " + empleado.getApeemp().toUpperCase()%></div>
                <div class="subtitle">Carné o documento:</div>
                <div class="input" style="width: 15%;">
                    <input id="carneEst" name="carneEst" type="text" style="text-align: center;" maxlenght="10">
                </div>
                <div class="required" style="margin-left: 10px;">*</div>
                <div id="cancelEst" onclick="cancelEst();" style="opacity: 0; display: none;">X</div>
                <div id="divCarne" class="btnInput" style="display: block; opacity: 1;">
                    <input id="btnCarne" type="button" value="Consultar" onclick="consultarEstudiante();" style="width: 120px;">
                </div>
                <div id="divHistEst" class="btnInput" style="opacity: 0; display: none;">
                    <input id="btnHistEst" type="button" value="Histórico del estudiante" onclick="getHistoricoEst();">
                </div>
                <div class="subtitle">Nombre del estudiante:</div>
                <div id="nomEst" class="inputAuto">-</div>
                <div class="subtitle">Programa del estudiante:</div>
                <div id="progEst" class="inputAuto">-</div>
                <div class="subtitle">El estudiante vino:</div>
                <div id="visitaCons" class="inputAuto">
                    <input type="radio" name="tVisita" checked>Voluntario
                    <input type="radio" name="tVisita">Remitido
                </div>
                <div class="subtitle">Tipo de consulta:</div>
                <%
                    if (tipoEmpAd <= 0) {
                %>
                <div id="tipoCons" class="inputAuto"><%=tipoConsulta[tipoEmp]%></div>
                <%
                    } else if (tipoEmpAd > 0) {
                %>
                <div class="input">
                    <select id="tipoConsList" name="tipoConsList" onchange="changeTipo();">
                        <option value="<%=tipoConsulta[tipoEmp]%>" selected><%=tipoConsulta[tipoEmp]%></option>
                        <option value="<%=tipoConsulta[tipoEmpAd]%>"><%=tipoConsulta[tipoEmpAd]%></option>
                    </select>
                </div>
                <%
                    }
                %>
                <div id="lisMatEstT" class="subtitle" <%=tipoEmp != 0?"style=\"display: none;\"":""%>>Asignatura consultada:</div>
                <div id="lisMatEstI" class="input" <%=tipoEmp != 0?"style=\"display: none;\"":""%>>
                    <select id="matCons" name="matCons" style="float: left;">
                        <option value="0" selected>_</option>
                    </select>
                </div>
                <div class="subtitle">Temática de la consulta:</div>
                <div class="input">
                    <input id="temaCons" name="asuntoCons" type="text" maxlength="100" style="float: left;">
                    <div class="required">*</div>
                </div>
                <div class="subtitle">Observaciones:</div>
                <div class="input" style="height: 65px;">
                    <textarea id="obsCons" name="obsCons" placeholder="Escriba aquí las observaciones y detalles que desea agregar sobre la consulta"></textarea>
                </div>
                <div class="btnInput" style="width: 100%; text-align: center; margin: 50px 0px;">
                    <input id="btnSend" type="button" value="Registrar consulta" onclick="regConsulta();">
                </div>
                <%
                    if (rolEmp == 2 || rolEmp == 1) {
                %>
                <div id="divHistDec" class="btnInput">
                    <input id="btnHistDec" type="button" value="Histórico de <%=rolEmp == 2?"consultas":"decanatura"%>" onclick="getHistoricoDec();">
                </div>
                <%
                    }
                %>
                <div id="divHistProf" class="btnInput">
                    <input id="btnHistProf" type="button" value="Histórico del <%=tipoEmp == 0?"profesor":"administrativo"%>" onclick="getHistoricoProf();">
                </div>
                <div id="footer" align="center">
                    <jsp:include page="piepag">
                        <jsp:param name="anterior" value="Menu" />
                    </jsp:include>
                </div>
            </div>
            <div id="formHistEst" style="opacity: 0; display: none;">
                <div class="title">HISTÓRICO DE CONSULTAS DEL ESTUDIANTE</div>
                <div id="titleHistEst" class="title"></div>
                <div class="subtitle" style="width: 100%;">Periodo: <%=empleado.getPeriodo()%></div>
                <div id="loadingHistEst" class="subtitle" style="width: 100%; text-align: center;">
                    Se están cargando las consultas del estudiante, espere un momento por favor...
                </div>
                <div id="goBackHistEst" class="btnInput">
                    <input id="btnSend" type="button" value="< Volver" onclick="goBackHistoricoEst();" style="width: 120px;">
                </div>
                <div id="exportHistEst" class="btnInput">
                    <a id="xlsHistEstLink" href="" target="_blank">
                        <input id="btnExport" type="button" value="Exportar a Excel">
                    </a>
                </div>
                <table id="tblHistEst" style="display: none;">
                    <tr>
                        <th style="width: 10%;">Fecha</th>
                        <th style="width: 15%;">Profesor</th>
                        <th style="width: 15%;">Estudiante</th>
                        <th style="width: 10%;">Carné</th>
                        <th style="width: 10%;">Tipo</th>
                        <th style="width: 10%;">Asignatura</th>
                        <th style="width: 30%;">Temática</th>
                    </tr>
                </table>
            </div>
            <div id="formHistProf" style="opacity: 0; display: none;">
                <div class="title">HISTÓRICO DE CONSULTAS DEL PROFESOR</div>
                <div id="titleHistProf" class="title"><%=empleado.getNomemp().toUpperCase() + " " + empleado.getApeemp().toUpperCase()%></div>
                <div class="subtitle" style="width: 100%;">Periodo: <%=empleado.getPeriodo()%></div>
                <div id="loadingHistProf" class="subtitle" style="width: 100%; text-align: center;">
                    Se están cargando las consultas del profesor, espere un momento por favor...
                </div>
                <div id="goBackHistProf" class="btnInput">
                    <input id="btnSend" type="button" value="< Volver" onclick="goBackHistoricoProf();" style="width: 120px;">
                </div>
                <div id="exportHistProf" class="btnInput">
                    <a href="xlsHistProf" target="_blank">
                        <input id="btnExport" type="button" value="Exportar a Excel">
                    </a>
                </div>
                <table id="tblHistProf" style="display: none;">
                    <tr>
                        <th style="width: 10%;">Fecha</th>
                        <th style="width: 15%;">Profesor</th>
                        <th style="width: 15%;">Estudiante</th>
                        <th style="width: 10%;">Carné</th>
                        <th style="width: 10%;">Tipo</th>
                        <th style="width: 10%;">Asignatura</th>
                        <th style="width: 30%;">Temática</th>
                    </tr>
                </table>
            </div>
            <div id="formHistDec" style="opacity: 0; display: none;">
                <div class="title">HISTÓRICO DE CONSULTAS</div>
                <div class="subtitle" style="width: 100%;">Periodo: <%=empleado.getPeriodo()%></div>
                <div id="loadingHistDec" class="subtitle" style="width: 100%; text-align: center;">
                    Se están cargando las consultas, espere un momento por favor...
                </div>
                <div id="goBackHistDec" class="btnInput">
                    <input id="btnSend" type="button" value="< Volver" onclick="goBackHistoricoDec();" style="width: 120px;">
                </div>
                <div id="exportHistDec" class="btnInput">
                    <a href="xlsHistDec" target="_blank">
                        <input id="btnExport" type="button" value="Exportar a Excel">
                    </a>
                </div>
                <table id="tblHistDec" style="display: none;">
                    <tr>
                        <th style="width: 10%;">Fecha</th>
                        <th style="width: 15%;">Profesor</th>
                        <th style="width: 15%;">Estudiante</th>
                        <th style="width: 10%;">Carné</th>
                        <th style="width: 10%;">Tipo</th>
                        <th style="width: 10%;">Asignatura</th>
                        <th style="width: 30%;">Temática</th>
                    </tr>
                </table>
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>