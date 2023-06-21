
//Verifica campos vacios
function comprueba(){

	if ( document.forms.form1.fecha.value == '') {
		alert("Usted debe seleccionar la fecha de reserva.");
		return false;
	} 

///**************************
//if ( !document.forms.form1.fecha.value == '') {
	var fechaActual = new Date(); // Fecha actual
	//fecha solicitada
	var ja = new Array();
	var fech = document.form1.fecha.value;
	ja = fech.split("-");	
	//var mes =parseInt(ja[1]) - 1;		
	var mes = ja[1]-1;
	var fecha1 = new Date(ja[2], mes, ja[0]);
	var msegActual = fechaActual.getTime();
	var msegFecha1 = fecha1.getTime();
	//var Diferencia = msegActual - msegFecha1;
	var Diferencia =  msegFecha1 - msegActual;
	Diferencia /= 86400000;
	//Diferencia = Math.abs(Diferencia);
	Diferencia = parseInt(Diferencia);
	//alert("Diferencia: " + Diferencia);
	if (msegFecha1 <= msegActual) {
		alert("La fecha seleccionada es menor o igual a la actual");
		return false;	
	}
	if (Diferencia < 0) {
		alert("La fecha seleccionada es menor que la fecha actual");
		return false;										
	}
	if(Diferencia < 2){
		alert("Debe solicitar la reserva con minimo 3 dias de anticipación");
		return false;
        }

//***************
//Valida que hora final no sea menor a la inicial
var f1 = parseInt(document.forms.form1.hini.value);
var f2 = parseInt(document.forms.form1.hfin.value);
if ( f1 > f2){
		alert("La hora final no puede ser menor o igual a la hora inicial");
		return false;
}
var f3 = parseInt(document.forms.form1.mini.value);
var f4 = parseInt(document.forms.form1.mfin.value);
if ( f1 == f2){
	if (f3 >= f4) {
			alert("La hora final no puede ser menor o igual a la hora inicial");
			return false;
		}
}
var dato, j, conv;
var valor = parseInt(document.forms.form1.cap.value);
if ( document.forms.form1.cap.value != ""){
	if (isNaN(valor)) {
		document.forms.form1.cap.style.backgroundColor= '#ffcc00';
		alert("La cantidad de asistentes debe ser un número");
		return false;
	}else{
		dato = document.forms.form1.cap.value;
		for(j=0;j<dato.length;j++){
			conv = parseInt(dato.charAt(j));
			if(isNaN(conv)){
				document.forms.form1.cap.style.backgroundColor= '#ffcc00';
				alert("La cantidad de asistentes debe ser un número");
				return false;
			}
		}
		document.forms.form1.cap.style.backgroundColor= '#f4f4f4';
		if(valor > 340){
			document.forms.form1.cap.style.backgroundColor= '#ffcc00';
			alert("La cantidad de asistentes debe ser menor o igual a 340");
			return false;
		}
	}
}else{
	document.forms.form1.cap.style.backgroundColor= '#ffcc00';
	alert("Usted debe seleccionar la cantidad de asistentes");
	return false;
}

valor = parseInt(document.forms.form1.idgrp.value);
if ( document.forms.form1.idgrp.value != ""){
	if (isNaN(valor)) {
		document.forms.form1.idgrp.style.backgroundColor= '#ffcc00';
		alert("La cantidad de puestos debe ser un número");
		return false;
	}else{
		dato = document.forms.form1.idgrp.value;
		for(j=0;j<dato.length;j++){
			conv = parseInt(dato.charAt(j));
			if(isNaN(conv)){
				document.forms.form1.idgrp.style.backgroundColor= '#ffcc00';
				alert("La cantidad de puestos debe ser un número");
				return false;
			}
		}
		document.forms.form1.idgrp.style.backgroundColor= '#f4f4f4';
		if(valor > 20){
			document.forms.form1.idgrp.style.backgroundColor= '#ffcc00';
			alert("La cantidad de puestos debe ser menor o igual a 20");
			return false;
		}
	}
}

valor = parseInt(document.forms.form1.asig.value);
if ( document.forms.form1.asig.value != ""){
	if (isNaN(valor)) {
		document.forms.form1.asig.style.backgroundColor= '#ffcc00';
		alert("La cantidad de microfonos debe ser un número");
		return false;
	}else{
		dato = document.forms.form1.asig.value;
		for(j=0;j<dato.length;j++){
			conv = parseInt(dato.charAt(j));
			if(isNaN(conv)){
				document.forms.form1.asig.style.backgroundColor= '#ffcc00';
				alert("La cantidad de microfonos debe ser un número");
				return false;
			}
		}
		document.forms.form1.asig.style.backgroundColor= '#f4f4f4';
		if(valor > 20){
			document.forms.form1.asig.style.backgroundColor= '#ffcc00';
			alert("La cantidad de microfonos debe ser menor o igual a 20");
			return false;
		}
	}
} 
var requ;
if (document.forms.form1.uno.checked)
	requ = "1";
else
	requ = "0"; 
if (document.forms.form1.dos.checked)
	requ = requ + "1";
else
	requ = requ + "0"; 
if (document.forms.form1.tres.checked)
	requ = requ + "1";
else
	requ = requ + "0"; 
if (document.forms.form1.cuatro.checked)
	requ = requ + "1";
else
	requ = requ + "0"; 
if (document.forms.form1.cinco.checked)
	requ = requ + "1";
else
	requ = requ + "0"; 
if (document.forms.form1.seis.checked)
	requ = requ + "1";
else
	requ = requ + "0"; 
if (document.forms.form1.siete.checked)
	requ = requ + "1";
else
	requ = requ + "0"; 
if (document.forms.form1.ocho.checked)
	requ = requ + "1";
else
	requ = requ + "0"; 
if (document.forms.form1.nueve.checked)
	requ = requ + "1";
else
	requ = requ + "0"; 
document.forms.form1.req.value = requ;
} //cierra función

function fecha(){
fecha = new Date()
mes = fecha.getMonth()
diaMes = fecha.getDate()
diaSemana = fecha.getDay()
anio = fecha.getFullYear()
dias = new Array('Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sábado')
meses = new Array('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre')
document.write('<span id="fecha">')
document.write (dias[diaSemana] + ", " + diaMes + " de " + meses[mes] + " de " + anio )
document.write ('</span>')
}

function dia1(){
certo_dia = new Date("May 15, 1998")
certo_dia.setDate(25)
document.write('<span id="fecha">')
document.write ("dia mes" + certo_dia.setDate(25) )
document.write ('</span>')
}

function dian(){
//new Date (año, mes, dia);
var fechaAux = new Date(2005, 9, 11);
document.write (Dia_semana(fechaAux.getDay()) )

}

function Dia_semana(dia){ 
			// dia es un entero que representa la día de la semana (0=domingo y 6=sábado)
			var aux="";
			switch (dia) {
				case 0: aux="Domingo"; break;
				case 1: aux="Lunes"; break;
				case 2: aux="Martes"; break;
				case 3: aux="Miércoles"; break;
				case 4: aux="Jueves"; break;
				case 5: aux="Viernes"; break;
				case 6: aux="Sábado"; break;
				default: aux="Error";
			}
			return aux;
		}

function SetDateDemo(newdate){
   var d, s;                  //Declare variables.
   d = new Date();            //Create date object.
   d.setDate(newdate);        //Set date to newdate.
   s = "Current setting is ";
   s += d.toLocaleString(); 
   document.write ("dia mes" + s )
   return(s);                                //Return newly set date.
}