function loadDataInLb( ruta,tabla,url, divName, page,columna,seccion,order){
    dojo.xhrGet({
        url: url,
        page: page,
        handleAs: "text",
        content: {
            page: page,
            ruta: ruta,
            tabla: tabla,
            columna: columna,
            seccion: seccion,
            orden:order
        },
        load: function(data) {
            var divi = document.getElementById(divName);
            divi.innerHTML = data;
        },
        error: function(error) {
            console.log("Se presento un error: "+error);
        }
    });
}
function basic(id, cont, parent, child, pest, active) {
	document.getElementById(cont + id).style.display = "block";
	fin = 1;
	dojo.animateProperty({
		node : cont + id,
		properties : {
			opacity : {
				start : 0,
				end : fin
			}
		},
		duration : 800
	}).play();
	document.getElementById(pest + id).className = active;
	var cantidad = countChildElements(parent, child);
	console.log(cantidad);
	for ( var i = 0; i < cantidad; i++, cont) {
		if (id != i) {
			hideBasic(i, cont);
			document.getElementById(pest + i).className = "";
		}
	}
}

function hideBasic(id, cont) {
	document.getElementById(cont + id).style.display = "none";
}

var est_lb1 = 0;

function lb1_1(){
	if(est_lb1 == 0){
		document.getElementById('lb1').style.display = "block";
		est_lb1 = 1;
	}else {
		document.getElementById('lb1').style.display = "none";
		est_lb1 = 0;
	}		
}


function lb2(video){
	if(est_lb1 == 0){
		document.getElementById('div_video').innerHTML='<a id=\"cerrar_lb1\" href="\javascript: lb2(\'\');\"> X </a>'+
			'<iframe width="640" height="385" src="http://www.youtube.com/embed/'+ video+'" frameborder="0" allowfullscreen></iframe>';
		document.getElementById('lb2').style.display = "block";
		est_lb1 = 1;
	}else {
		document.getElementById('div_video').innerHTML='';
		document.getElementById('lb2').style.display = "none";
		est_lb1 = 0;
	}		
}

function lb1(){
	if(est_lb1 == 0){
		//document.getElementById('lb1').innerHTML='<img src="'+foto+'" alt="" />';
		document.getElementById('lb1').style.display = "block";
		est_lb1 = 1;
	}else {
		document.getElementById('lb1').style.display = "none";
		est_lb1 = 0;
	}		
}





function switchClass(id, parent, child, label, boton, label_name){
	var cantidad = countChildElements(parent, child);
	document.getElementById(boton + id).className = "act_switch";
	document.formulario.elements[label_name].value = label +id;
	//alert(document.formulario.elements[label_name].value);
	for ( var i = 0; i < 6; i++, boton) {
		if (id != i) {
			document.getElementById(boton + i).className = "";
		}
	}
}
