<%-- 
    Document   : unete
    Created on : 07-may-2020, 13:22:26
    Author     : andres.rojas
--%>

<%@page import="java.util.HashMap"%>
<%@page import="BDintraeci.EmpleadoRemote"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    EmpleadoRemote emp = conEjb.lookupEmpleadoRemote();
    emp.inicializar(((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getIdemp());
    session.setAttribute("emp", emp ) ;
    HashMap datos = emp.datosGenerales() ;
    String id_emp=(String) datos.get("cod_emp");
    String respuesta = request.getParameter("respuesta");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Ayuda Mutua </title>
	<meta name="viewport" content="width=device-width, user-scalable=no, shrink-to-fit=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="Content-Language" content="ES" />
	<meta name="language" content="spanish" />
	<meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
	<meta name="copyright" content="Copyright (c) 2020" />
	<meta name="description" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
	<meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge; IE=11; IE=10; IE=EmulateIE10; IE=9; IE=EmulateIE9; IE=8; IE=EmulateIE8; IE=7; IE=EmulateIE7; IE=5" >
	<link rel="stylesheet" href="unete/css/estilos-referido.css">    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="shortcut icon" type="image/x-icon" href="unete/img/favicon.ico">
	<link href='https://fonts.googleapis.com/css?family=Fjalla+One' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,700" rel="stylesheet">
        <script lang="javascript">
            <%
                if(respuesta!=null){
                    if(respuesta.equals("1")){
                        %>
                            alert("Tus datos han sido guardados, gracias por aportar a esta gran causa.");
                        <%
                    }else if(respuesta.equals("0")){
                        %>
                            alert("Hubo un error al guardar tus datos, probablemente ya los guardaste anteriormente.");
                        <%
                    }
                }
            %>
        </script>
</head>

<body>

	<header>
		<div class="container-fluid">
			<div class="row" style="background-color: #CEE81C">
				<div class="col-xs-12 col-md-12">
					<center><img src="unete/img/logo-escuela.png" alt="logoEvento" class="img-responsive"></center>
				</div>
			</div>
			<div class="row">
				<div class="container">
					<div class="row">
						<div class="col-md-12 img-responsive" >
							<img src="unete/img/ayuda.jpg">
						</div>
					</div>
				</div>		
			</div>
		</div>
	</header>



	<section>
            <div class="container contenidos">
                <div class="row">
                    <div class="col-md-8">
                            <p><br><br><small>“Casi todas las cosas buenas que suceden en el mundo, nacen de una actitud de aprecio por los demás”<br>
                            (Dalai Lama)</small></p>
                            <p>Con tu aporte al Fondo de Solidaridad, hemos podido apoyar a nuestros estudiantes en su sueño de cursar una carrera profesional, hoy queremos decirte Gracias, ahora más que nunca esperamos seguir contando contigo.</p>
                            <p><strong>¿Cómo Apoyar?</strong>
                                    <br>Puede realizar su donación a través de descuento de nómina
                            </p>
                            <p><strong>¿De cuánto debe ser el aporte?</strong>
                                    <br>La cantidad a donar es establecida por cada uno de los aportantes según sus capacidades.
                            </p>
                            <p><strong>¿Por cuánto tiempo debo donar?</strong>
                                    <br>No hay un tiempo mínimo o máximo para realizar las donaciones, usted como aportante decide.
                            </p>
                            <p><strong>Piense en algunos gastos en los cuales no ha tenido que incurrir durante el aislamiento, por ejemplo:</strong>
                                    <ul>
                                            <li>¿Posee vehículo y paga mensualidad de parqueadero en la Escuela? Durante el aislamiento no se realizará descuento de nómina por ese concepto, ¿qué tal si lo pudiera donar?
                                            </li>
                                            <br>
                                            <li>Durante el aislamiento hemos trabajado desde la casa, ¿Qué tal si donaras el 50% de lo que antes gastábamos en transporte?
                                            </li>
                                    </ul>
                            </p>
                    </div>
                    
                    
                    <div class="col-xs-12 col-sm-12 col-md-4">
                        <form action="CapturaDatosDonacion" method="post" id="form1">
                            <input type="hidden" name="cod_emp" id="cod_emp" value="<%=id_emp%>">
                                <div class="form-group formulario">
                                        <div class="row txt-contenido">
                                                <div class="col-xs-12 col-md-12">
                                                        <label for="valor">Valor</label>
                                                        <input type="number" required="" onchange="return fixValor()" class="form-control" name="valor" placeholder="Donación $" id="valor">
                                                </div>
                                        </div>
                                </div>
                                <div class="form-group formulario" id="nomina_definida">
                                    <div class="row txt-contenido">
                                            <div class="col-xs-12 col-md-12">
                                                    <strong style="color: #666666">Nómina 2021 durante los meses de:</strong><br><br>
                                                    <label class="checkbox-inline">
                                                    <input type="checkbox" name="meses" value="1" onchange="verifica_periodo()">Ene</label>
                                                    <label class="checkbox-inline">
                                                    <input type="checkbox" name="meses" value="2" onchange="verifica_periodo()">Feb</label>
                                                    <label class="checkbox-inline">
                                                    <input type="checkbox" name="meses" value="3" onchange="verifica_periodo()">Mar</label>
                                                    <label class="checkbox-inline">
                                                    <input type="checkbox" name="meses" value="4" onchange="verifica_periodo()">Abr</label>
                                            </div>
                                            <div class="col-xs-12 col-md-12">
                                                    <label class="checkbox-inline">
                                                    <input type="checkbox" name="meses" value="5" onchange="verifica_periodo()">May</label>
                                                    <label class="checkbox-inline">
                                                    <input type="checkbox" name="meses" value="6" onchange="verifica_periodo()">Jun</label>
                                                    <label class="checkbox-inline">
                                                    <input type="checkbox" name="meses" value="7" onchange="verifica_periodo()">Jul</label>
                                                    <label class="checkbox-inline">
                                                    <input type="checkbox" name="meses" value="8" onchange="verifica_periodo()">Ago</label>
                                            </div>
                                            <div class="col-xs-12 col-md-12">
                                                    <label class="checkbox-inline">
                                                    <input type="checkbox" name="meses" value="9" onchange="verifica_periodo()">Sep</label>
                                                    <label class="checkbox-inline">
                                                    <input type="checkbox" name="meses" value="10" onchange="verifica_periodo()">Oct</label>
                                                    <label class="checkbox-inline">
                                                    <input type="checkbox" name="meses" value="11" onchange="verifica_periodo()">Nov</label>
                                                    <label class="checkbox-inline">
                                                    <input type="checkbox" name="meses" value="12" onclick="verifica_periodo()">Dic</label>
                                            </div>
                                    </div>
                                </div>
                                <div class="form-group formulario" id='nomina_indefinida'>
                                        <div class="row txt-contenido">
                                                <div class="col-xs-12 col-md-12">
                                                        <strong style="color: #666666">Donación indefinida</strong><br>Si quieres aportar indefinidamente, a partir de la nómina de:<br><br>
                                                        <select name="cobro_indefinido" id="cobro_indefinido" class="form-control" onchange="verifica_periodo()">
                                                                <option value="">Seleccione</option>
                                                                <option value="1">Enero</option>
                                                                <option value="2">Febrero</option>
                                                                <option value="3">Marzo</option>
                                                                <option value="4">Abril</option>
                                                                <option value="5">Mayo</option>
                                                                <option value="6">Junio</option>
                                                                <option value="7">Julio</option>
                                                                <option value="8">Agosto</option>
                                                                <option value="9">Septiembre</option>
                                                                <option value="10">Octubre</option>
                                                                <option value="11">Noviembre</option>
                                                                <option value="12">Diciembre</option>
                                                        </select>
                                                </div>
                                        </div>
                                </div>
                                <script lang="javascript">
                                    var mes_seleccionado=false;
                                    var datos_invalidos=true;
                                    function verifica_periodo(){
                                        var div_cobro_definido=document.getElementById('nomina_definida');
                                        var div_cobro_indefinido=document.getElementById('nomina_indefinida');
                                        var mes_seleccionado=false;
                                        var meses = document.getElementsByName('meses');
                                        var cobro_indefinido=document.getElementById('cobro_indefinido');
                                        for(var i=0; i < meses.length; i++){
                                            if(meses[i].checked) {
                                                    mes_seleccionado = true;
                                            }
                                        }
                                        if(mes_seleccionado){
                                            div_cobro_indefinido.style.display = 'none';
                                            div_cobro_definido.style.display = 'block';
                                            datos_invalidos=false;
                                        }else if(cobro_indefinido.value!==''){
                                            div_cobro_indefinido.style.display = 'block';
                                            div_cobro_definido.style.display = 'none';
                                            datos_invalidos=false;
                                        }else{
                                            div_cobro_indefinido.style.display = 'block';
                                            div_cobro_definido.style.display = 'block';
                                            datos_invalidos=true;
                                        }
                                    }
                                    
                                    function fixValor(){
                                        var valor = document.getElementById("valor").value;
                                        valor = valor.replace('.', "");
                                        valor = valor.replace(',', "");
                                    }
                                    
                                    function valida_datos(){
                                        var valor = document.getElementById("valor").value;
                                        valor = valor.replace('.', "");
                                        valor = valor.replace(',', "");
                                        if(datos_invalidos){
                                            alert('Revisa tus datos, por favor.');
                                            return false;
                                        }else if(valor === ""){
                                            alert('Debes diligenciar el campo de valor.');
                                            return false;
                                        }
                                    }
                                </script>
                                <div class="col-xs-12 col-md-12">
                                    <center><input class="btn btn-success btn-lg" onclick="return valida_datos()" type="submit" value="Donar ahora"/></center>
                                </div>
                        </form>
                </div>
            </div>
	</section>

	<!--FOOTER-->
	<footer>
		<div class="container">		
			<div class="row">
				<article class="redes col-xs-12 col-md-6">								
					ESCUELA COLOMBIANA DE INGENIERÍA JULIO GARAVITO<br/>
					AK.45 No.205-59 (Autopista Norte)<br/>
					Contact Center: +57(1) 668 3600<br/>
					Línea Nacional Gratuita: 018000112668<br/>
					www.escuelaing.edu.co<br/><br/>
					Bogotá, D.C. - Colombia<br/>

				</article>
				<article class="iframe-video col-xs-12 col-md-6">
					<p>
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1987.9617427360993!2d-74.04338482936627!3d4.783148717834411!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f85e374627fe5%3A0x540783a0b074c84d!2sEscuela+Colombiana+de+Ingenier%C3%ADa!5e0!3m2!1ses!2ses!4v1424190444206" width="100%" height="auto" frameborder="0" style="border:0"></iframe>
					</p>
				</article>
			</div>
		</div>
	</footer>



	<!-- Modal -->
<div id="gracias" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
          <p id="modal_final"></p>
      </div>
    </div>

  </div>
</div>




	<script src="unete/js/jquery.js"></script>
  	<script src="http://code.jquery.com/jquery-latest.jS"></script>
	<script src="unete/js/bootstrap.min.js"></script>
</body>
</html>