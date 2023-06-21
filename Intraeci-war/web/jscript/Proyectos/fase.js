function accionCrearFase(){
    if(!isDiligenciado(['nomFase','numFase','contFase','descFase','ccosfExt','anFase','miFase','diFase','mfFase','dfFase','gpFase','ogFase','invFase','ingFase'],['Nombre','Numero','Control Institucional','Descripción','Centro de Costos','Año','mes inicial','día inicial','mes final','día final','Per. Externo','Otr. Gastos','Inversión','Ingresos'])){
        return false;
    }
    var fechaIni=document.getElementById('diFase').value+'/'+document.getElementById('miFase').value+'/'+document.getElementById('anFase').value;
    var fechaFin=document.getElementById('dfFase').value+'/'+document.getElementById('mfFase').value+'/'+document.getElementById('anFase').value;
    if(!(validaFecha(fechaIni)&&(validaFecha(fechaFin))&&(difFecha(fechaIni, fechaFin)))){
        return false;
    }
    if(!isNumero(['numFase','gpFase','ogFase','invFase','ingFase'], ['Numero','Per. Externo','Otr. Gastos','InversiÃ³n','Ingresos'])){
        return false;
    }
    var url = 'grabarFase?tp=2&'+getValores(['nomFase','numFase','contFase','descFase','ccosfInt','anFase','miFase','diFase','mfFase','dfFase','gpFase','ogFase','invFase','ingFase']);
    respServlet="despCrearFase";
    conectarX(url,muestraResultado);
    return false;
}

function despCrearFase(idN){
    setVisibilidad(['crearFase=none']);
    window.location='MenuFase?idFase='+idN;
}

function accionEditarFase(){
    setReadOnly(['nomFase=','numFase=','descFase=','anFase=','miFase=','diFase=','mfFase=','dfFase=','gpFase=','ogFase=','invFase=','ingFase=']);
    setVisibilidad(['editarFase=none', 'guardarFase=inline']);
    respLinkFase=true;
    defineColorXEdicion();
    return false;
}

function accionGuardarFase(){
    var fechaIni=document.getElementById('diFase').value+'/'+document.getElementById('miFase').value+'/'+document.getElementById('anFase').value;
    var fechaFin=document.getElementById('dfFase').value+'/'+document.getElementById('mfFase').value+'/'+document.getElementById('anFase').value;
    if(!(validaFecha(fechaIni)&&(validaFecha(fechaFin))&&(difFecha(fechaIni, fechaFin)))){
        return false;
    }
    respServlet="despGuardarFase";
    var url = 'grabarFase?tp=1&casoGuardar='+casoGuardar+'&'+getValores(['nomFase','numFase','descFase','anFase','miFase','diFase','mfFase','dfFase','gpFase','ogFase','invFase','ingFase','estFase','ccosfInt']);
    conectarX(url,muestraResultado);
    return false;
}

function despGuardarFase(){
    setReadOnly(['nomFase=true','numFase=true','descFase=true','anFase=true','miFase=true','diFase=true','mfFase=true','dfFase=true','gpFase=true','ogFase=true','invFase=true','ingFase=true']);
    setVisibilidad(['editarFase=inline', 'guardarFase=none']);
    defineColorXEdicion();
    respLinkFase=false;
}

function getEstadosEnt(){
    var Datos=new Array(5);
    Datos[0]="Pendiente=Pendiente";
    Datos[1]="En Proceso=En Proceso";
    Datos[2]="Suspendido=Suspendido";
    Datos[3]="Cancelado=Cancelado";
    Datos[4]="Ejecutado=Ejecutado";
    return Datos;
}

function enviaResp(caso){
    respServlet="despEnviaResp";
    var url = 'grabarFase?tp=4&caso='+caso;
    conectarX(url,muestraResultado);
    return false;
}

function despEnviaResp(idFase){
    window.location='MenuFase?idFase='+idFase;
}