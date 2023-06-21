function cleanCampo(campo,texto){		
	if(campo.value == texto)	
		campo.value = '';	
	}
function limpiarFormulario() {    document.forms['formulario'].reset();};
function fillCampo(campo,texto){
	if(campo.value == '')			
		campo.value = texto;
	}
function cargarguia(id){	$.ajax({		url: "/programas/cargarguia?id="+id,	    success: function(data) {		    $('#cargardiv').html(data);		    		    		  },	  	statusCode: {	    	404: function() {	      	errorProd(404);	    }	  }	});	}function limpiardiv(){	$.ajax({		url: "/programas/limpiardiv",	    success: function(data) {		    $('#cargardiv').html(data);		    		    		  },	  	statusCode: {	    	404: function() {	      	errorProd(404);	    }	  }	});	}function cargarexamen(id){	$.ajax({		url: "/programas/cargarexamen?id="+id,	    success: function(data) {		    $('#cargardiv').html(data);		    		    		  },	  	statusCode: {	    	404: function() {	      	errorProd(404);	    }	  }	});	}
//funcion para convertir datos en 'px' a numero entero

function ConvertCssPxToInt(cssPxValueText) {
	// Set valid characters for numeric number.
	var validChars = "0123456789.";
	// If conversion fails return 0.
	var convertedValue = 0;
	// Loop all characters of
	for ( var i = 0; i < cssPxValueText.length; i++) {
		// Stop search for valid numeric characters, when a none numeric number
		// is found.
		if (validChars.indexOf(cssPxValueText.charAt(i)) == -1) {
			// Start conversion if at least one character is valid.
			if (i > 0) {
				// Convert validnumbers to int and return result.
				convertedValue = parseInt(cssPxValueText.substring(0, i));
				return convertedValue;
			}
		}
	}
	return convertedValue;
}

// fin


function countChildElements(parent, child) {
	var parent = document.getElementById(parent);
	if (parent != null) {
		var childCount = parent.getElementsByTagName(child).length;
		return childCount;
	} else {
		return 1;
	}
}


$(function()
		{
			$('.scroll-pane').jScrollPane(
				{
					verticalDragMinHeight: 8,
					verticalDragMaxHeight: 8,
					horizontalDragMinWidth: 8,
					horizontalDragMaxWidth: 8,
					autoReinitialise: true
				}
			);
		});
