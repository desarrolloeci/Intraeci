<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
                 javax.rmi.PortableRemoteObject, 
                 login.InicioProfRemoteBusiness, 
                 login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%
response.setHeader("Cache-Control","no-cache");
String nombre = "";			
PrintWriter aout = response.getWriter() ;
//Profesor prof = new Profesor(IdProf) ;getIdProf
if (empleado.getIdProf().equals(""))
    nombre = empleado.getNomemp();
else
    nombre = empleado.getNomProf();
//Fecha actual
inicio.conectaEJB conEjb = new inicio.conectaEJB();
BDintraeci.BDadministrativoRemoteBusiness bdadm = conEjb.lookupBDadministrativoBean();
Vector infovec = bdadm.getEstudiosFormales(empleado.getDocumProf()), tmp;
Hashtable ht = new Hashtable();
ht.put("01","POSTDOCTORADO" );
ht.put("02","DOCTORADO" );
ht.put("03","MAESTRIA" );
ht.put("04","ESPECIALIZACI&Oacute;N" );
ht.put("05","PROFESIONAL" );
ht.put("06","LICENCIATURA" );
ht.put("07","TECN&Oacute;LOGO" );
ht.put("08","T&Eacute;CNICO" );
%>
<html>
<head>
<title>Estudios Formales</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
a:hover{color:#3366CC; }
a{color: blue;}
a:link, a:visited { text-decoration: none }
</style>
<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
<script language="javascript" type="text/javascript">
function preguntar(){
	if(confirm("�Seguro desea borrar este registro?")){
		return true;
	}else{
		return false;
	}
}
</script>
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<body background="img/fondo.gif" onLoad="preloadImg()">
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
	<jsp:param name="doblenc" value="inicio" />
        <jsp:param name="titulo" value="Estudios Formales" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
  <tr class="textocom">
    <td height="22"> 
    <div align="center">
      <table width="100%" border="1" cellspacing="0" cellpadding="0" class="textocom">
        <tr>
          <td width="30%" bgcolor="#CCCCCC"><div align="center">Programa</div></td>
          <td width="30%" bgcolor="#CCCCCC"><div align="center">Instituci&oacute;n</div></td>
          <td width="20%" bgcolor="#CCCCCC"><div align="center">Nivel de Formaci&oacute;n</div></td>
          <td width="10%" bgcolor="#CCCCCC"><div align="center"></div></td>
        </tr>
        <%
     if(infovec.size()>0){
        for(int i=0; i<infovec.size(); i++){
            tmp = (Vector)infovec.elementAt(i);
            %>
        <tr>
          <td><div align="center"><a href="VerEstudioForm?idd=<%=tmp.elementAt(0)%>"><%=tmp.elementAt(3)%></a></div></td>
          <td><div align="center"><%=tmp.elementAt(9)%></div></td>
          <td><div align="center"><%
          if(ht.get(tmp.elementAt(2)) != null)
            out.println(ht.get(tmp.elementAt(2)));
          else
            out.println(tmp.elementAt(2));  %></div></td>
          <td><div align="center"><a href="GuardaEmpleado?tipo=estform&idd=<%=tmp.elementAt(0)%>&idusr=<%=empleado.getDocumProf()%>" onClick="javascript: return preguntar();">Borrar</a></div></td>
        </tr>
        <%}%>
     <%}else{%>
        <tr>
          <td>
              <div align="center"><b>No se encontr&oacute; informaci&oacute;n</b></div>
          </td>
        </tr>
     <%}%>
      </table>
	  <div align="left"><br>
	      <a href="VerEstudioForm"><strong>[ Ingresar nuevo estudio  ]</strong></a><br>
	    
    </div></div></td>
  </tr>
  <tr>
    <td>
	<div align="right">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="InfoEmpleado" />
	    </jsp:include>
      </div>
	</td>
  </tr>
</table>
<p>&nbsp;</p></body>
</html>

