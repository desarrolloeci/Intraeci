<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, 
                 javax.rmi.PortableRemoteObject, 
                 login.InicioProfRemoteBusiness, 
                 login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<% 
    HttpSession sesion;
    response.setHeader("Cache-Control","no-cache"); 
    String grupo = request.getParameter("idgrupo");
    String formato = request.getParameter("formato");
    if((formato != null)&&(formato.equals("excel"))){
        response.setContentType("application/vnd.ms-excel");
    }
    String rbOpcCorreo, tercio, clanum,  idgrupo, codasig,codgrupo, nomasig;
    String texto[]=new String[5];
    StringTokenizer st = new StringTokenizer(grupo, "|");
    int acumul[] = new int[5];
    int i, cancel, fin = 4;
    i=0;
    while (st.hasMoreTokens()) {              
        texto[i]=st.nextToken();
        i=i+1;  
    }
    for (i=0 ; i<fin ;i++){
        acumul[i] = 0;
    }
    idgrupo = texto[0];
    codasig = texto[1];
    codgrupo = texto[2];
    nomasig = texto[3];
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    Vector asignaturas = profesor.getAsignaturas(empleado.getPerHorario(), empleado.getIdProf());
    Vector horario = profesor.getHorario(empleado.getIdProf(), empleado.getPerHorario()); 
    String periodo = request.getParameter("paramtext");
  
    int cant=1;
    String opcion;
    opcion = request.getParameter("rbOpcCorreo");

%>

<html>
<head>
<title>Listas de Clase</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function impresion(){
    document.getElementById("tablaboton").style.visibility='hidden';
    window.print();
    window.close();
}
-->
</script>
<%
    if(!((formato != null)&&(formato.equals("excel")))){
%>
<link href="css/comun.css" rel="stylesheet" type="text/css">
<%
    }
%>
</head>

<body  onload="preloadImg()">
<table width="680" border="0" cellspacing="0" class="textoimpre">
 <tr>
     <td>
         <strong>Escuela Colombiana de Ingenier&iacute;a &quot;Julio
          Garavito&quot;<br>
          Secretar&iacute;a General<br>
          Listas de clase</strong>
     </td>
     <td>
    <table width="100%" border="0" id="tablaboton">
      <tr>
        <td width="40%">
          <div align="right">
<%
    if(!((formato != null)&&(formato.equals("excel")))){
%>              
            <input name="imprimir" type="submit" id="imprimir3" value="Imprimir Listas" class="boton" onClick="impresion()">
<%
    }
%>
          </div>
        </td>
      </tr>
    </table>
    </td>
 </tr>
 <tr>
     <td colspan="2"><strong>Periodo Acad&eacute;mico:</strong><%=empleado.getPerHorario()%><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Profesor:</strong><%=empleado.getNomProf()%></td>
  </tr>
 <tr>
     <td colspan="2"><strong>Asignatura:</strong><%=nomasig%> <%=codasig%><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Grupo:</strong><%=codgrupo%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
 <tr>
     <td colspan="2"><strong>Horario:&nbsp;&nbsp;</strong>
 <%
     for ( int n=0; n<horario.size(); n ++ ){
         Vector campohorario=(Vector) horario.elementAt(n);
	 if (campohorario.elementAt(1).equals(codasig)&& (campohorario.elementAt(7).equals(idgrupo))){
            if (campohorario.elementAt(3).equals("1")){%>
            <B>Lunes:&nbsp;&nbsp;</B>(<%=campohorario.elementAt(2)%> 
            -- <%=campohorario.elementAt(4)%>) 
            <%} else if (campohorario.elementAt(3).equals("2")){%>
            <B>Martes:&nbsp;&nbsp;</B>(<%=campohorario.elementAt(2)%> 
            -- <%=campohorario.elementAt(4)%>) 
            <%} else if (campohorario.elementAt(3).equals("3")){%>
            <B>Miércoles:&nbsp;&nbsp;</B>(<%=campohorario.elementAt(2)%> -- <%=campohorario.elementAt(4)%>) 
            <%} else if (campohorario.elementAt(3).equals("4")){%>
            <B>Jueves:&nbsp&nbsp&nbsp&nbsp </B> (<%=campohorario.elementAt(2)%> 
            -- <%=campohorario.elementAt(4)%>) 
            <%} else if (campohorario.elementAt(3).equals("5")){%>
            <B>Viernes:&nbsp;&nbsp;</B>(<%=campohorario.elementAt(2)%> 
            -- <%=campohorario.elementAt(4)%>) 
            <%} else if (campohorario.elementAt(3).equals("6")){%>
            <B> Sábado:&nbsp;&nbsp;</B><%=campohorario.elementAt(2)%> 
            -- <%=campohorario.elementAt(4)%> 
            <%}
			%>
         &nbsp;&nbsp;|&nbsp;&nbsp;
<%
         }
     }
%>
 </tr>
 <tr>
    <td colspan="2">
        <table width="680" border="1" cellspacing="0" class="textoimpre">
          <tr> 
          <td width="2"> 
           <div align="center"><b>Nro.</b></div>
          </td>
          <td width="320"> 
            <div align="center"><b>NOMBRE</b></div>
          </td>
          <td width="40"> 
            <div align="center"><b>CARRERA</b></div>
          </td>
          <td width="30"> 
            <div align="center"><b>CLAVE</b></div>
          </td>
          <td colspan="5"> 
            <div align="center"><b>FALLAS</b></div>
          </td>
          <td colspan="5"> 
            <div align="center"><b>NOTAS PARCIALES</b></div>
          </td>
          <td colspan="3"> 
            <div align="center"><b>PREV EXAM ND</b></div>
          </td>
       </tr>
       <tr> 
          <td width="2">&nbsp;</td>
          <td width="320">&nbsp;</td>
          <td width="40">&nbsp;</td>
          <td width="30">&nbsp;</td>
          <td width="8"> 
          <div align="center">1</div>
          </td>
          <td width="8"> 
          <div align="center">2</div>
          </td>
          <td width="8"> 
            <div align="center">3</div>
          </td>
          <td width="8"> 
            <div align="center">4</div>
          </td>
          <td width="8"> 
            <div align="center">5</div>
          </td>
          <td width="19"> 
            <div align="center">1</div>
          </td>
          <td width="19"> 
            <div align="center">2</div>
          </td>
          <td width="19"> 
            <div align="center">3</div>
          </td>
          <td width="19"> 
            <div align="center">4</div>
          </td>
          <td width="19"> 
            <div align="center">5</div>
          </td>
          <td width="19">&nbsp;</td>
          <td width="19">&nbsp;</td>
          <td width="19">&nbsp;</td>
        </tr>
      <%Vector estudiantes = profesor.getListaNotas(idgrupo, empleado.getPerHorario());
        for ( int a=0 ;  a < estudiantes.size() ;  a++ ){
          Vector estudiante = (Vector)estudiantes.elementAt(a);
%>
            <tr> 
            <td width="2"> 
            <div align="center"><%=a+1%></div>
            </td>
            <td width="320"><%=estudiante.elementAt(0)%></td>
            <td width="40"> 
            <div align="center"><%=estudiante.elementAt(7)%></div>
            </td>
            <td width="30"> 
            <% if (estudiante.elementAt(5).equals("Z")){ %>
            <div align="center">Normal</div>
            <%} %>
            <% if (estudiante.elementAt(5).equals("C")){%>
            <div align="center">Cancelado</div>
            <%}%>
            </td>
            <td width="8">&nbsp;</td>
            <td width="8">&nbsp;</td>
            <td width="8">&nbsp;</td>
            <td width="8">&nbsp;</td>
            <td width="8">&nbsp;</td>
            <td width="19">&nbsp;</td>
            <td width="19">&nbsp;</td>
            <td width="19">&nbsp;</td>
            <td width="19">&nbsp;</td>
            <td width="19">&nbsp;</td>
            <td width="35">&nbsp;</td>
            <td width="35">&nbsp;</td>
            <td width="35">&nbsp;</td>
           </tr>
<%}%>
   </table>
    </td>
            </tr>
	</table>
</body>
</html>