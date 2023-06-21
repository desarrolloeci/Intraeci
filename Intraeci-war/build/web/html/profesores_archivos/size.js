var winW = 630, winH = 460;

function size(){	
    if (document.body && document.body.offsetWidth) {
     winW = document.body.offsetWidth;
     winH = document.body.offsetHeight;
    }
    if (document.compatMode=='CSS1Compat' &&
        document.documentElement &&
        document.documentElement.offsetWidth ) {
     winW = document.documentElement.offsetWidth;
     winH = document.documentElement.offsetHeight;
    }
    if (window.innerWidth && window.innerHeight) {
     winW = window.innerWidth;
     winH = window.innerHeight;
    }
    var izq = (winW-1146)/2;	var foot_w = (winW-17);
    document.getElementById("cont_master").style.paddingLeft = izq + "px";
    try {
    	document.getElementById("footer").style.width = foot_w + "px";
    } catch (e) {
    	//console.log(e);
    }	try {
    	document.getElementById("footer2").style.width = foot_w + "px";
    } catch (e) {
    	//	console.log(e);	
    }
}
window.onresize = function(event) {
    size();
};