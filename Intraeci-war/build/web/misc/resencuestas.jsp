<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, javax.rmi.PortableRemoteObject, login.InicioProfRemoteBusiness, login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
    <head>
        <% 
        HttpSession sesion;
        response.setHeader("Cache-Control","no-cache");
        String peracad = request.getParameter("peracad");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        Vector lisasigs = profesor.getRespEnc(empleado.getIdProf(),peracad), tmp;
        Vector obsasigs = profesor.getObsEnc(empleado.getIdProf(), peracad);
        String color;
        %>
      
       
        <title>Listas de Aconsejados</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script language="JavaScript" type="text/JavaScript">
<!--
function impresion(){
    document.getElementById("tablaboton").style.visibility='hidden';
    window.print();
    window.close();
}
-->
        </script>
        <style type="text/css">
<!--
.textocom {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-style: normal;
	color: #333333;
}
-->
        </style>
</head>
    <body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="textocom">
          <tr>
            <td width="30%">EI: Estudiantes Inscritos</td>
            <td width="30%">EE: Estudiantes Encuestados</td>
            <td width="40%">PR: Porcentaje de respuestas</td>
          </tr>
          <tr>
            <td>PP: Promedio del profesor</td>
            <td>PE: Promedio del estudiante</td>
            <td>PA: Promedio de la Asignatura</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3"><a href="http://www.escuelaing.edu.co/documentos/osiris/formatoencuesta20091.doc" target="_blank">Para ver el formato de la encuesta clic aqu&iacute;</a></td>
          </tr>
        </table>
        <b><br>
<%=empleado.getNomProf()%></b><br>
        <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" class="textocom">
            <tr>
                <td width="200">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="10" bgcolor="#EEEEEE"><div align="center"><strong>Profesor</strong></div></td>
                <td colspan="7" bgcolor="#EEEEEE"><div align="center"><strong>Estudiante</strong></div></td>
                <td colspan="8" bgcolor="#EEEEEE"><div align="center"><strong>Asignatura</strong></div></td>
                <td colspan="4" bgcolor="#EEEEEE"><div align="center"><strong>Promedios</strong></div></td>
          </tr>
            <tr>
              <td bgcolor="#EEEEEE"><div align="center"><strong>Asignaturas</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>EI</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>EE</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>PR</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A11</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A12</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A13</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A14</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A15</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A16</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A17</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A18</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A19</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A110</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A21</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A22</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A23</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A24</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A25</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A26</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A27</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A31</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A32</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A33</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A34</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A35</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A36</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A37</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>A38</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>PP</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>PE</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>PA</strong></div></td>
              <td bgcolor="#EEEEEE"><div align="center"><strong>PT</strong></div></td>
            </tr>
            <%for(int i = 0; i<lisasigs.size(); i++){
                tmp = (Vector)lisasigs.elementAt(i);
                color = "#FFFFFF";
                        %>
            <tr>
             <%if(tmp.elementAt(0).equals("9554")){
                  color = "#EEEEEE";%>
                  <td bgcolor="#EEEEEE">Promedios</td>
                  <td bgcolor="#EEEEEE">&nbsp;</td>
                  <td bgcolor="#EEEEEE">&nbsp;</td>
                  <td bgcolor="#EEEEEE">&nbsp;</td>
             <%}else{%>
              <td><%=tmp.elementAt(1)%> - <%=tmp.elementAt(2)%></td>
              <td><%=tmp.elementAt(3)%></td>
              <td><%=tmp.elementAt(4)%></td>
              <td><%=tmp.elementAt(5)%> %</td>
            <%}%>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(6)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(7)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(8)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(9)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(10)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(11)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(12)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(13)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(14)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(15)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(16)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(17)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(18)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(19)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(20)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(21)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(22)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(23)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(24)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(25)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(26)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(27)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(28)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(29)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(30)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(31).toString().substring(0, 3)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(32).toString().substring(0, 3)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(33).toString().substring(0, 3)%></td>
              <td bgcolor="<%=color%>"><%=tmp.elementAt(34).toString().substring(0, 3)%></td>
          </tr>
            <%}%>
        </table>
        <br>
       <%if(obsasigs.size()>0){%>
        <table width="100%" border="1" cellpadding="0" cellspacing="0" class="textocom">
          <tr>
            <td width="100" bgcolor="#EEEEEE"><div align="center"><strong>Asignatura</strong></div></td>
            <td width="50" bgcolor="#EEEEEE"><div align="center"><strong>Grupo</strong></div></td>
            <td bgcolor="#EEEEEE"><div align="center"><strong>Comentario</strong></div></td>
          </tr>
          <%for(int i=0; i<obsasigs.size(); i++){
              tmp = (Vector)obsasigs.elementAt(i);%>
          <tr>
            <td><%=tmp.elementAt(0)%></td>
            <td><%=tmp.elementAt(1)%></td>
            <td><%=tmp.elementAt(2)%></td>
          </tr>
          <%}%>
    </table>
        <%}%>
    <p>&nbsp;</p>
</body>
</html>