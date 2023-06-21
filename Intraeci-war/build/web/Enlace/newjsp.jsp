<%@page import="Dto.conciliacion"%>
<%@page import="BDintraeci.EmpleadoRemote"%>
<%@ include file="../secure.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%    response.setHeader("Cache-Control", "no-cache");
    String titulo = new String("Sistema de Talento Humano");
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    EmpleadoRemote emp = conEjb.lookupEmpleadoRemote();
    emp.inicializar(((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getIdemp());
    session.setAttribute("emp", emp);
    HashMap datos = emp.datosGenerales();
    String fechaIni = (String) session.getAttribute("fechaIni");
    String fechaFin = (String) session.getAttribute("fechaFin");
    String tipo_rol = (String) session.getAttribute("tipo_rol");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Conciliaci&oacute;n pagos ENLACE-NOVASOFT</title>
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
        <script type="text/javascript" src="jscript/Enlace/moment.min.js"></script>
        <script language="javascript" type="text/javascript">
            var respEmpleado = false;
            var respEstud = false;
            var respExper = false;
            var respEstudio = false;
            var respPub = false;
            var respMem = false;
            var respProd = false;
            var respIdi = false;
        </script>
        <script language="javascript" type="text/javascript">
            function validarDatos() {
                var tipoPago = document.getElementById("tipo_rol").value;
                var fechaIni = document.getElementById("fechaIni").value;
                var fechaFin = document.getElementById("fechaFin").value;
                sessionStorage.setItem('tipoPago',tipoPago);
                debugger;
                var fecha1 = moment(fechaIni);
                var fecha2 = moment(fechaFin);

                var dias = fecha2.diff(fecha1, 'days');


                if (tipoPago === "0") {
                    alert("Escoja un tipó de pago diferente");
                } else if (dias > 62) {
                    alert("Las fechas seleccionadas deben ser menor o igual a 2 meses");
                } else if(dias <= 0){
                    alert("La fecha final no puede ser menor o igual a la fecha inicio");
                }else{
                    return true;
                }

                return false;
            }

        </script>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#table_id').DataTable();
                $('#table_id2').DataTable();
                $("#tipo_rol").val(sessionStorage.getItem('tipoPago') === null ? '0' :sessionStorage.getItem('tipoPago'));
            });
        </script>
    </head>

    <body background="img/fondoblanco.gif">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezadoTalhum.jsp">
            <jsp:param name="parametro" value="<%=datos.get("nombres")%>" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="<%=titulo%>" />
        </jsp:include>

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
            <form name="enlaceNo" onsubmit="return validarDatos()" id="enlaceNo" method="post" action="enlaceNovasoft">
                <div border="1" class="tabla" id="tabla1" align="center" width="70%">
                    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 shadow p-3 mb-5 bg-white rounded form-group" >
                        <div align="center" style="font-size: 16px"><strong>Conciliar Pagos</strong></div>
                        <br>
                        <hr style="border-color: #990000;margin: 0;"> 
                        <br>
                        <br>
                        <br>
                        <div class="row">

                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                <h5>Metodo de pago</h5>
                                <select class="custom-select" required="" id="tipo_rol" name="tipo_rol">
                                    <option value="0">Seleccione</option>
                                    <option value="1">PSE</option>
                                </select>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                <h5>Fecha Inicio</h5>
                                <input class="form-control" placeholder="Fecha Inicio" type="date" size="70" name="fechaIni" id="fechaIni"  value="${fechaIni}" required="true"/>

                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                <h5>Fecha Fin</h5>
                                <input class="form-control" placeholder="Fecha Fin" type="date" size="70" name="fechaFin" id="fechaFin" value="${fechaFin}" required="true"/>

                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">

                                <input style="margin-top: 30px;background: #008CFF;color: white;font-weight: bold;" 
                                       class="form-control" placeholder="Fecha Fin" type="submit" size="70" name="enviarMetodo" id="enviarMetodo" value="Buscar Pagos" required=""/>

                            </div>

                        </div>
                    </div>
                </div>

                <%
                    java.util.List<conciliacion> listaNoEncontrado = (java.util.List<conciliacion>) request.getAttribute("listaNoEncontrado");
                    if (listaNoEncontrado != null && !listaNoEncontrado.isEmpty()) {
                        out.print("<div  border='1' class='tabla' id='tabla1' align='center' width='70%'>");
                        out.print("<div class='col-xs-1 col-sm-1 col-md-1 col-lg-1'></div>");
                        out.print("<div class='col-xs-10 col-sm-10 col-md-10 col-lg-10 shadow p-3 mb-5 bg-white rounded form-group' >");
                        out.print("<div align='center' style='font-size: 16px'><strong>Pagos prendientes de procesar</strong></div>");
                        out.print("<br>");
                        out.print("<hr style='border-color: #990000;margin: 0;'>");
                        out.print("<br>");
                        out.print("<table id='table_id' class='display'>");
                        out.print("<thead><tr><th>Id Alumno</th><th>Identificación</th><th>Fecha de pago</th><th>Fuente de pago</th><th>Valor de pago</th></tr></thead>");
                        out.print("<tbody>");
                        for (conciliacion c : listaNoEncontrado) {
                            out.print("<tr>");
                            out.print("<td>" + c.getEmpID() + "</td>");
                            out.print("<td>" + c.getCedula() + "</td>");
                            out.print("<td>" + c.getFechaTransaccion() + "</td>");
                            out.print("<td>" + c.getFuentePago() + "</td>");
                            out.print("<td>" + c.getValorPago() + "</td>");
                            out.print("</tr>");
                        }
                        out.print("</tbody>");
                        out.print("</table>");

                        out.print("<div class='row'>");

                        out.print("<div class='col-xs-4 col-sm-4 col-md-4 col-lg-4'>");
                        out.print("</div>");
                        out.print("<div class='col-xs-4 col-sm-4 col-md-4 col-lg-4'>");
                        out.print("<input style='background: #008CFF;color: white;font-weight: bold;' class='form-control' type='submit' name='enviarMetodo2' id='enviarMetodo2' value='Descargar Reporte'/>");
                        out.print("</div>");
                        out.print("<div class='col-xs-4 col-sm-4 col-md-4 col-lg-4'>");
                        out.print("</div>");
                        out.print("</div>");

                        out.print("</div>");
                        out.print("</div>");
                        out.print("</div>");
                    }

                %>
                <br>
                <br>
                <br>
                <%                java.util.List<conciliacion> listaEncontrado = (java.util.List<conciliacion>) request.getAttribute("listaEncontrado");
                    if (listaEncontrado != null && !listaEncontrado.isEmpty()) {
                        out.print("<div  border='1' class='tabla' id='tabla1' align='center' width='70%'>");
                        out.print("<div class='col-xs-1 col-sm-1 col-md-1 col-lg-1'></div>");
                        out.print("<div class='col-xs-10 col-sm-10 col-md-10 col-lg-10 shadow p-3 mb-5 bg-white rounded form-group' >");
                        out.print("<div align='center' style='font-size: 16px'><strong>Pagos procesados</strong></div>");
                        out.print("<br>");
                        out.print("<hr style='border-color: #990000;margin: 0;'>");
                        out.print("<br>");
                        out.print("<table id='table_id2' class='display'>");
                        out.print("<thead><tr><th>Id Alumno</th><th>Identificación</th><th>Fecha de pago</th><th>Valor de pago</th></tr></thead>");
                        out.print("<tbody>");
                        for (conciliacion c : listaEncontrado) {
                            out.print("<tr>");
                            out.print("<td>" + c.getEmpID() + "</td>");
                            out.print("<td>" + c.getCedula() + "</td>");
                            out.print("<td>" + c.getFechaTransaccion() + "</td>");
                            out.print("<td>" + c.getValorPago() + "</td>");
                            out.print("</tr>");
                        }
                        out.print("</tbody>");
                        out.print("</table>");
                        out.print("</div>");
                        out.print("</div>");
                    }

                %>
            </form>
        </div>
    </body>
</html>
