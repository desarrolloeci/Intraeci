<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
                 javax.rmi.PortableRemoteObject, 
                 login.InicioProfRemoteBusiness, 
                 login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
<head>
<% 
    HttpSession sesion;
    response.setHeader("Cache-Control","no-cache"); 
    String grupo, idgrupo, codasig, peracad,codgrupo, nomasig, idasig, fechas;
    
    Vector datosnotas = new Vector();
    String texto[]=new String[8];
    grupo = request.getParameter("idgrupo");
    StringTokenizer st = new StringTokenizer(grupo, "|");
    int acumul;
    int i, cancel;
    i=0;
    while (st.hasMoreTokens()) {              
        texto[i]=st.nextToken();
        i=i+1;  
    }
    nomasig = texto[4];
    codgrupo = texto[5];
    idasig = texto[3];
    codasig=texto[1];
    idgrupo= texto[0];
    peracad=texto[2];
    
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    Vector sumasnotas = profesor.getSumaNotasPosgrado(idgrupo, peracad);
   // Vector estudiantesimp = profesor.getListaNotasPos(idgrupo, peracad);
    //empleado.getPerHorario() SE DEJA PERACAD PARA POSGRADO YA QUE SE TOMA ES EL PERIODO DE CADA ASIGNATURA
     Vector estudiantesimp = profesor.getListasClase (peracad, idasig, codgrupo);
     
    for ( i=0 ;  i < sumasnotas.size() ;  i++ ){      
        datosnotas = (Vector)sumasnotas.elementAt(i);     
       // fechas= datosnotas.elementAt(3).toString();
    }
    
%>
<title>Captura de Notas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
a:hover{color:#3366CC; }
a{color: blue;}
a:link, a:visited { text-decoration: none }
</style>
<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function enfocar(){
    window.focus();
    preloadImg();
}

function impresion(){
    document.getElementById("tablaboton").style.visibility='hidden';
    window.print();
    window.close();
}
-->
</script>
<link href="css/comun.css" rel="stylesheet" type="text/css">
<link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
</head>
<body onload="enfocar()">
     <div class="container">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
            <jsp:param name="doblenc" value="inicio" />
             <jsp:param name="headerImg" value="banner.jpg" />
        </jsp:include>
<table width="819" border="0" align="left" cellspacing="0" class="textoimpre">
  <tr>
    <td height="22"><font size="2"><strong>Escuela Colombiana de Ingenier&iacute;a &quot;Julio
            Garavito&quot;<br>
            Secretar&iacute;a General<br>
            Proceso de Captura e Impresi&oacute;n de Notas Posgrado</strong></font></td>
    <td><table width="100%" border="0" id="tablaboton">
      <tr>
        <td width="40%">
          <div align="right">
            <input name="imprimir" type="submit" id="imprimir3" value="Imprimir notas" class="boton" onClick="impresion()">
          </div>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2">   
        <table width="100%" border="0" class="textoimpre">
            <tr>
              <td width="50%"><strong>Periodo Acad&eacute;mico:</strong><%=peracad%></td>
              <td width="50%"><strong>Profesor:</strong><%=empleado.getNomProf()%></td>
        </tr>
            <tr>
              <td width="50%"><strong>Asignatura:</strong><%=nomasig%> <%=codasig%></td>
              <td width="50%"><strong>Grupo:</strong><%=codgrupo%></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="2">
    <table width="100%" border="1" cellspacing="0" class="textoimpre">
      <tr>
        <td width="5%"><div align="center"><strong>Nro.</strong></div></td>
        <td width="15%"><div align="center"><strong>Carn&eacute;</strong></div></td>
        <td width="60%"><div align="center"><strong>Nombre</strong></div></td>
        <td width="10%"><div align="center"><strong>Clave</strong></div></td>
        <td width="10%"><div align="center"><strong>Nota</strong></div></td>
      </tr>
<%
    acumul = 0;
    for (i=0 ;  i < estudiantesimp.size() ;  i++ ){ 
        Vector estudianteimp = (Vector)estudiantesimp.elementAt(i);
%>
      <tr>
        <td width="5%"><%=i+1%></td>
        <td width="10%"><%=estudianteimp.elementAt(6)%></td>
        <td width="49%"><%=estudianteimp.elementAt(0)%></td>
        <td width="6%">
<% 
        if ((estudianteimp.elementAt(5).equals("Z"))){
            out.println("Normal");
        }
        if (estudianteimp.elementAt(5).equals("C")){
            out.println("Cancelado");
        }
%>     
        </td>
        <td width="6%">
            <div align="center">
<%
        if (!estudianteimp.elementAt(17).equals("No disponible") && (estudianteimp.elementAt(5).equals("Z"))){
                out.println(estudianteimp.elementAt(17));
                acumul = acumul + (new Integer(estudianteimp.elementAt(17).toString())).intValue();
        }
%>
            </div>
        </td>
      </tr>
<%
    }
%>      
    </table></td>
  </tr>
  <tr>
    <td colspan="2"><table width="100%" border="0" class="textoimpre">
      <tr>
        <td width="25%"><div align="right"><strong>Suma de notas:</strong></div></td>
        <td colspan="3">         
          <div align="left"><%=acumul%></div></td>
        </tr>
      <tr>
        <td width="25%"><div align="right"><strong>Fecha de Captura:</strong></div></td>
        <td colspan="3"><div align="center"></div>          
          <div align="left"><%=datosnotas.elementAt(3)%></div>          <div align="center"></div></td>
        </tr>
      <tr>
        <td height="5" colspan="2"><strong>Entregado el:</strong> ____ / ____
          / ____ <font size="1">(DD|MM|AAAA)</font></td>
        <td width="18%" height="5"><strong>Firma Profesor:</strong></td>
        <td width="28%" height="5">_____________________</td>
      </tr>
      
      <tr>
                <td>
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="NotasPosgrado?paramtext=0" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
    </table></td>
  </tr>
</table>
     </div>
</body>
</html>
