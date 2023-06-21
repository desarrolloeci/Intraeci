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
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    Vector asignaturas = profesor.getAsignaturas(empleado.getPeriodo(), empleado.getIdProf());
    String periodo = empleado.getTercio();
    int per = Integer.valueOf(periodo).intValue();
    Vector tercio = new Vector();
    if(per != 0 && per < 5){
        tercio.addElement("Seleccione");
        if(per < 0){
            tercio.addElement("Periodo Intermedio");
            per = 1;
        }else{
            tercio.addElement("Primero");
            tercio.addElement("Segundo");
            tercio.addElement("Tercero");
            tercio.addElement("Laboratorios");
        }
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
function enviar(){
    if(document.formulario.idgrupo.value == "null"){
        alert("Seleccione el grupo");
        return false;
    }else if(document.formulario.tercio.value == "-1"){
        alert("Seleccione el tercio");
        return false;
    }else if(document.formulario.clavenume.value==""){
        alert("No ha ingresado su clave");
        return false;
    }else{
        if(document.formulario.rbopciones[0].checked){
            document.formulario.target = "ventanaImpreNotas";
            document.formulario.action = "ImprimirNotas";
            window.open("", "ventanaImpreNotas", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
            document.formulario.submit();
            return false;
        }else if(document.formulario.rbopciones[1].checked){
            document.formulario.target = "";
            document.formulario.action = "IngresarNotas";
            return true;
			alert("El plazo de entrega de notas ha finalizado, comuníquese con la oficina de registro");
			return false;
        }else{
            alert("Debe ingresar una opción. Imprimir o capturar notas.");
            return false
        }
    }
    
}

function enviarexcel(){
	if(document.formulario.idgrupo.value == "null"){
        alert("Seleccione el grupo");
        return false;
    }else if(document.formulario.tercio.value == "-1"){
        alert("Seleccione el tercio");
        return false;
    }else if(document.formulario.clavenume.value==""){
        alert("No ha ingresado su clave");
        return false;
    }else{
		if(document.formulario.rbopciones[0].checked){
			document.formulario.target = "";
			document.formulario.action = "ImprimirNotas?formato=excel";
			return true;
		}else if(document.formulario.rbopciones[1].checked){
			alert("Si desea capturar notas haga click sobre el boton Consultar\nSi desea exportarlas a excel seleccione Imprimir Notas")
			return false;
		}else{
			alert("Seleccione Imprimir Notas para exportar");
			return false
		}
	}
}
//-->
</script>
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<body background="img/fondo.gif" onLoad="preloadImg()">
<p class="textocom">&nbsp;</p>
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
	<jsp:param name="doblenc" value="inicio" />
        <jsp:param name="titulo" value="Notas" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
  <tr class="textocom">
    <td height="22"><form name="formulario" method="post" action="">
      <div align="left">
        <table width="100%" border="0" class="textocom">
          <tr>
            <td width="28%"><div align="right"><strong>Centro de estudios :</strong></div></td>
              <td width="2%">&nbsp;</td>
              <td width="70%">
                <select name="idgrupo" class="campotext">
                  <option value="null" selected>Seleccione</option>
                  <%                
    for ( int i=0 ;  i < asignaturas.size() ;  i++ ){
        Vector asignatura = (Vector)asignaturas.elementAt(i);
%>
                  <option value="<%=asignatura.elementAt(2)%>|<%=asignatura.elementAt(0)%>|<%=asignatura.elementAt(1)%>|<%=asignatura.elementAt(3)%>|<%=asignatura.elementAt(4)%>"> 
                    <%=asignatura.elementAt(0)%> - <%=asignatura.elementAt(1)%></option> 
                  <%
    }
%>
              </select></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Tipo de identificaci&oacute;n :</strong></div></td>    
              <td>&nbsp;</td>
              <td>   
                <select name="tercio" class="campotext">
                  <option value="-1" selected>Seleccione</option>
                  <% 
        int per_inter;
        for(int j=1; j<=per; j++){
            per_inter = j;
            if(tercio.elementAt(j).equals("Periodo Intermedio"))
                per_inter = 3;
%>       
                  <option value="<%=per_inter%>"><%=tercio.elementAt(j)%></option>
                  <% 
        }
%>
              </select></td>     
          </tr>
          <tr>
            <td><div align="right"><strong>No. de documento :</strong></div></td>    
              <td>&nbsp;</td>
              <td>&nbsp;</td>
          </tr>
          <tr>
            <td><div align="right"><strong>Lugar exp :</strong>
              </div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Nombres :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td height="46">            <div align="right"><strong>Apellidos :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Estado civil :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Sexo :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Fec nacimiento :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Nacionalidad :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Pa&iacute;s nacimiento :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Ciudad nacimiento :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Municipio nacimiento :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Tel&eacute;fono  residencia :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Direcci&oacute;n residencia :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Pais residencia :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Ciudad residencia :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Fax :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Apartado a&eacute;reo :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Correo electr&oacute;nico :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Tarjeta profesional :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Fecha actualizaci&oacute;n :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Dedicaci&oacute;n :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>Horas :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td><div align="right"><strong>M&aacute;ximo nivel de estudios :</strong></div></td>    
              <td>&nbsp;</td>
              <td>
                <div align="left"></div></td>
          </tr>
          <tr>
            <td height="30" colspan="4"><div align="center">
              <input type="submit" name="Submit5" value="Guardar" class="boton">
              </div>              </td>
            </tr>
        </table>  
      </div>
    </form></td>
    <td width="10%">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">
	<div align="right">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="Menu" />	    </jsp:include>
      </div>	</td>
  </tr>
</table>
</body>
</html>
