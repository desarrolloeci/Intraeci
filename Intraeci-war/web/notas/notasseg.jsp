<%-- 
    Document   : notasseg
    Created on : 28/01/2011, 12:13:01 PM
    Author     : lrodriguez
--%>

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
    Vector asignaturas = profesor.getAsignaturasSeg(empleado.getPeriodo(), empleado.getIdProf());
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
<title>Captura de Notas Segumiento</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
a:hover{color:#3366CC; }
a{color: blue;}
a:link, a:visited { text-decoration: none }
</style>
<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
<script language="JavaScript" type="text/JavaScript">

</script>
<link href="css/comun.css" rel="stylesheet" type="text/css">
</head>
<body  onLoad="preloadImg()">
<p class="textocom">&nbsp;</p>
<jsp:include page="encabezado">
        <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
	<jsp:param name="doblenc" value="inicio" />
        <jsp:param name="titulo" value="Notas" />
</jsp:include>
<table width="640" border="0" align="center" cellspacing="0">
  <tr class="textocom">
    <td height="22">
    <div align="center">
	<table width="430" border="1" cellspacing="1" bordercolor="#990000" class="textocom">
	  <tr>
            <td height="30"><div align="center"><strong><font color="#990000" size="3">NOTA:</font> Lea cuidadosamente
                <a href="" onclick="window.open('html/ayunot.htm','','width=800,height=600, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false"> AQUI </a>antes
          de ingresar las notas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       </strong></div></td>
	    </tr>
	  </table><br>

	<form name="formulario" method="post" action="Menu">
          <table width="310" border="0" class="textocom">
            <tr>
              <td width="148">
                <div align="right"><strong>Asignatura :</strong></div>
              </td>
              <td width="11">&nbsp;</td>
              <td width="137">
                <select name="idgrupo" class="campotext">
                  <option value="null" selected>Seleccione</option>
                  <%
    for ( int i=0 ;  i < asignaturas.size() ;  i++ ){
        Vector asignatura = (Vector)asignaturas.elementAt(i);
%>
                  <option value="<%=asignatura.elementAt(2)%>|<%=asignatura.elementAt(0)%>|<%=asignatura.elementAt(1)%>|<%=asignatura.elementAt(3)%>|<%=asignatura.elementAt(4)%>|<%=asignatura.elementAt(6)%>">
                  <%=asignatura.elementAt(0)%> - <%=asignatura.elementAt(1)%></option>
                  <%
    }
%>
                </select>
              </td>
            </tr>
            <tr>
              <td width="148">
                <div align="right"><strong>Tercio :</strong></div>
              </td>
              <td width="11">&nbsp;</td>
              <td width="137">
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
                </select>
              </td>
            </tr>

            <tr>
              <td height="46">
                <div align="right">
                  <input type="submit" name="Submit" value="Enviar" class="boton" >
                </div>
              </td>
              <td width="11">&nbsp;</td>
              <td>
                <div align="left">
                  <input type="reset" name="Submit2" value="Limpiar" class="boton">
                </div>
              </td>
            </tr>
          </table>
	</form>
	</div></td>
  </tr>
  <tr>
    <td>
	<div align="center">
	    <jsp:include page="piepag">
		  <jsp:param name="anterior" value="Menu" />
	    </jsp:include>
      </div>
	</td>
  </tr>
</table>
</body>
</html>
