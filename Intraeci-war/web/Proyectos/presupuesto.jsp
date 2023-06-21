<%@include file="../secure.jsp" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.HashMap"%>
<%@page import="BDintraeci.EmpleadoRemote"%>
<%@page import="java.util.ArrayList"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");
    String titulo = "Presupuesto";
    EmpleadoRemote empleado2 = conEjb.lookupEmpleadoRemote();
    empleado2.inicializar(((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getIdemp());
    session.setAttribute("empleado2", empleado2) ;
%>
<html>
<head>
    <title>Informe de Presupuesto</title>
    <!--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">-->
    <script type="text/javascript" src="jscript/conectar.js"></script>
    <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
    <script language="javascript" type="text/javascript" src="jscript/Proyectos/presupuesto.js"></script>
    <link href="css/comunProye.css" rel="stylesheet" type="text/css">
</head>
<body onload="cargarLista('0');">
    <p class="textocom"><!--&nbsp;--></p>
    
    <jsp:include page="encabezadoPresupuesto">
        <jsp:param name="parametro" value="<%=empleado.getNomemp() + " " + empleado.getApeemp()%>" />
        <jsp:param name="doblenc" value="inicio" />
        <jsp:param name="titulo" value="<%=titulo%>" />
    </jsp:include>
    
    <div align="center" style="text-align: center;">
        <div id="searchDiv">
            <div class="Div_Header">Parámetros de búsqueda</div>

            <div>
            <form action="javascript:void(0);" style="width: 794px; display: inline;">

                <div class="searchDiv_Inner">
                    Escoja la vigenciaa:&nbsp;
                    <select id="vig" onchange="cargarLista('0');">                      
                        <option>2022</option>
                        <option>2023</option>                    
                    </select>
                    <!--<input id="vig" size="5" value="2015" type="text" onchange="cargarLista('0');" disabled>-->
                </div>

                <div class="searchDiv_Inner">

                    Centros:&nbsp;
                    <select id="lcen" style="width: 300px;" onchange="cargarLista('1');"></select>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    Rubros:&nbsp;
                    <select id="lrubro" style="width: 300px;"></select>
                </div>

                <div class="searchDiv_Inner_Btn">
                    <input id="Consultar" value="Consultar Rubro" type="button" class="boton" onclick="cdps();">
                    &nbsp;&nbsp;
                    <input id="ResPres" value="Resumen del Presupuesto" type="button" class="boton" onclick="respres();">
                </div>

            </form>
            </div>
        </div>

        <div id="resultDiv">

            <div class="Div_Header" align="center">Resultado de la consulta</div>

            <div id="loadingText">
                <p id="loadingP">No se ha realizado ninguna consulta.</p>
            </div>

            <div id="resultDiv_Resume">
                <table>
                    <tbody>
                    <tr>
                        <td>
                            <div id="desconv0" style="display: inline;"></div>
                        </td>
                        <td>
                            <div id="desconv1" style="display: inline;"></div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div id="resultDiv_Result">

                <div id="btnExportar">
                    <form action="" style="margin: 0px;"><input value="Exportar XLS" class="boton" onclick="exportExcel();" type="button"></form>
                </div>

                <div id="resultDiv_Tables">
                    <table class="tabla" id="tPresupuesto" align="center" style="display: none;">
                        <thead>
                            <tr>
                                <th style="width: 10%;"><div style="text-align: center;"><strong>Número</strong></div></th>
                                <th style="width: 52%;"><div style="text-align: center;"><strong>Detalle</strong></div></th>
                                <th style="width: 10%;"><div style="text-align: center;"><strong>Proveedor</strong></div></th>
                                <th style="width: 10%;"><div style="text-align: center;"><strong>Fecha</strong></div></th>
                                <th style="width: 10%;"><div style="text-align: center;"><strong>Valor</strong></div></th>
                                <th style="width: 200px;"><div style="text-align: center;"><strong>Estado</strong></div></th>
                            </tr>
                        </thead>

                        <tbody id="cpresupuesto"></tbody>
                    </table>

                    <table class="tabla" id="rPres" align="center" style="display: none;">
                        <thead>
                            <tr>
                                <th style="width: 8%;"><div style="text-align: center;"><strong>CodRub</strong></div></th>
                                <th style="width: 50%;"><div style="text-align: center;"><strong>Rubro</strong></div></th>
                                <th style="width: 14%;"><div style="text-align: center;"><strong>Apropiación</strong></div></th>
                                <th style="width: 14%;"><div style="text-align: center;"><strong>Ejecución</strong></div></th>
                                <th style="width: 200px;"><div style="text-align: center;"><strong>Disponible</strong></div></th>
                            </tr>
                        </thead>

                        <tbody id="crpres"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    <div id="footer_Div" align="center">
        <jsp:include page="piepag">
            <jsp:param name="anterior" value="Menu" />
        </jsp:include>
    </div>
    
</body>
</html>