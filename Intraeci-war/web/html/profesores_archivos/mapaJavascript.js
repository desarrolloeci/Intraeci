var map; 

function initialize() {
    var latlng = new google.maps.LatLng(4.782737,-74.042064);
    
    var cent = new google.maps.LatLng(4.782737,-74.042064);
    
    var myOptions = {
      zoom: 14,
      center: cent,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    
	var contentString1 = '<div class="contentjs">'+
	    '<h1>Escuela Colombiana de Ingenieria Julio Garavito</h5>'+
	    '<p> AK.45 No.205-59 (Autopista Norte  </p>'+ 
	    '<p> Bogotá - Colombia  </p>'+ 
		'<p> PBX: +57(1) 668 3600  </p>'+ 
		'<p> Call center: +57(1) 668 3622   </p>'+ 
		'<p> Línea Nacional Gratuita: 018000112668  </p>'+ 
    '</div>';
	
	
	var info1 = new google.maps.InfoWindow({
		content: contentString1
	});

	
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	var image ='/images/logos/iconLogo.png';
	var countryMarker1 = new google.maps.Marker({
      position: latlng,
      map: map,
      icon: image,
	  title:"Nombre Sede Colombia"
  });
	
  // To add the marker to the map, call setMap();
  countryMarker1.setMap(map);

  google.maps.event.addListener(countryMarker1, 'click', function() {
	  info1.open(map,countryMarker1); 
	});

  }
  
  
