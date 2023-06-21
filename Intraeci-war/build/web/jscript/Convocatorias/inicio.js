function accionCrearConvocatoria(){
    if(!isDiligenciado(['nombre','descrip','fecIni','fecFin','tipo','perAcad'], ['Nombre','Descripción','Inicio','Fin','Tipo','Periodo Académico'])) return false;
    if(document.getElementById('tipo').value=="Catedra")if(!isDiligenciado(['nomAsig'], ['Asignatura']))return false;
    var fechaIni=document.getElementById('fecIni').value;
    var fechaFin=document.getElementById('fecFin').value;
    if(!(validaFecha(fechaIni)&&(validaFecha(fechaFin))&&(difFecha(fechaIni, fechaFin)))) return false;
    var url = 'iniciaProceso?'+getValores(['nombre','descrip','fecIni','fecFin','tipo','perAcad','idAsig']);
    respServlet="despCrearConvocatoria";
    conectarX(url,muestraResultado);
    setVisibilidad(['crear=none']);
    return false;
}

function despCrearConvocatoria(){
    setVisibilidad(['formulario=none','mensaje=inline']);
}

function getTipo(){
    var visi='none';
    opcionesModal('tipo','tipo',['Planta','Catedra','Administrativo'],true);
    if(document.getElementById('tipo').value=='Catedra'){
        visi='inline';
    }
    setVisibilidad(['titAsig='+visi,'camAsig='+visi]);
    return false;
}