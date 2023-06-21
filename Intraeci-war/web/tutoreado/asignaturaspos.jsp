<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*, javax.rmi.PortableRemoteObject, login.InicioProfRemoteBusiness, login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<html>
    <head>
        <% 
        HttpSession sesion;
        response.setHeader("Cache-Control","no-cache");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        String idest = request.getParameter("carnet");
        String upd;
        if(request.getParameter("up") == null){
            upd = "";
        }else{
            upd = request.getParameter("up");
        }
        Vector asigs = profesor.getAsignaturasPos(idest);
        Vector datosest = profesor.datosEst(idest);
        String plan=datosest.elementAt(5).toString();
        String cohorte=datosest.elementAt(7).toString();
        Vector per=profesor.getperaca(plan, cohorte);
        String periodo =per.elementAt(0).toString();
        Vector pro=profesor.getIdprog(plan);
        String idprog=pro.elementAt(0).toString();
       // String idprog= "260";
                      Vector na=profesor.getNuevaAsig(plan,idprog, idest);

        int i;        %>
           
        <title>Listas de Aconsejados</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script language="JavaScript" type="text/JavaScript">
<!--
function validar(){
    if(document.getElementById("anniop").value == "0" || document.getElementById("perp").value == "null"){
    	alert("Error al ingresar el período, por favor ingrese año y periodo");
		return false;
	}else{
		return true;
	}
}

function mensaje(){
    alert("Información guardada");
}
-->
        </script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
         <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
</head>
    <body>
         <div class="container">
         <p class="textocom">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>

<%if(asigs.size()>0){  %>
        <table width="819" border="0" align="center" cellspacing="0" class="textocom">
            <tr>
                <td height="22">
                Nombre del estudiante: <strong><%=datosest.elementAt(0)%> - Estado: <%=datosest.elementAt(4)%></strong><br>
                <br> 
                <form name="formu1" action="GuardaAsigPos" method="POST">
                    <table width="819" border="1" cellspacing="0" align="center"  class="textoimpre">
                        <tr> 
                            <td width="25%">
                                <div align="center">Asignatura</div>
                            </td>
                            <td width="7%">
                                <div align="center">Código</div>
                            </td>
                            <td width="7%">
                                <div align="center">Período</div>
                            </td>
                            <td width="10%">
                                <div align="center">Clave</div>
                            </td>
                            <td width="9%">
                                <div align="center">Nota</div>
                            </td>
                            <td width="7%">
                                <div align="center">Créditos</div>
                            </td>
                            <td width="35%"> 
                            <div align="center">&nbsp;</div>
                            </td>
                        </tr>
                        <%
                        for ( int n=0; n<asigs.size(); n ++ ){
                            Vector campo=(Vector)asigs.elementAt(n);%>
                        <tr> 
                            <td> 
                               <b> <%=campo.elementAt(1)%></b>
                            </td>
                            <td> 
                                <div align="center"><%=campo.elementAt(2)%></div>
                            </td>
                            <td> 
                                <div align="center"><%=campo.elementAt(4)%></div>
                            </td>
                            <td> 
                                <div align="center"><%=campo.elementAt(6)%></div>
                            </td>
                            <td>
                                <div align="center"><%=campo.elementAt(7)%></div>
                            </td>
                            <td>
                                <div align="center"><%=campo.elementAt(8)%></div>
                            </td>
                            <td>&nbsp;
                                <%if(campo.elementAt(5).equals("G")){%>
                            <div align="center"><input type="checkbox" name="asigpos<%=n%>" value="<%=campo.elementAt(0)%>" /><br>Para preinscripci&oacute;n</div>
                    <input type="hidden" name="nvclave<%=n%>" value="P" />
                            <%}
                            else if(campo.elementAt(5).equals("P")){%>
                            <div align="center"><input type="checkbox" name="asigpos<%=n%>" value="<%=campo.elementAt(0)%>" /><br>Para <font color="ff0000">retirar</font> de preinscripci&oacute;n</div>
                    <input type="hidden" name="nvclave<%=n%>" value="G" />
                            <%}%>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                    <input type="hidden" name="tamch" value="<%=asigs.size()%>" />
                    <input type="hidden" name="idest" value="<%=idest%>" />
																				<br> <br>
                    <div align="center">
																				<font color="#000000" size="2" face="Times New Roman, Times, serif"><strong>Asignaturas adicionales al plan de estudios:
																				</strong></font><br> 
																				<br>																				
                      <select name="newasig" size="4" id="newasig">
                        <option value="null" selected>--- Seleccione ---</option>
                        <% Vector nasig;
                           if (na.size()>0){
                                for (i = 0; i < na.size(); i++) {
                                    nasig = (Vector) na.elementAt(i);%>
                                    <option value="<%=nasig.elementAt(0).toString().trim()%>"><%=nasig.elementAt(2)%>-<%=nasig.elementAt(1)%></option>
                        <%  }
                          }%>
                      </select>
																						<br> <br>
                          <input type="submit" value="Guardar" name="bi" onClick="javascript: return validar();"/>
                    <br> 
                  </div>                    
                  <div align="right">
                          <!--label><strong><br>
                          Per&iacute;odo para asignar a la preinscripci&oacute;n</strong>
                          <select name="anniop" id="anniop">
                            <option value="0">Seleccione</option>
                            <option value="2009" selected>2009</option>
                            <option value="2010">2010</option>
                            <option value="2011">2011</option>
                            <option value="2012">2012</option>
                                                                              </select>
                          -
                          <select name="perp" id="perp">
                            <option value="null">Seleccione</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3" selected>3</option>
                            <option value="4">4</option>
                          </select>
                          </label-->
                          
                   <input type="hidden" name="plan" value="<%=plan%>">
                   <input type="hidden" name="cohorte" value="<%=cohorte%>">
                   <input type="hidden" name="peraca" value="<%=periodo%>">
                  </div>
			 </form>
                </td>
          </tr>
            
        <%} else         
                out.println("<center><b>No se encontraron registros. Por Favor comuníquese con la Oficina de Registro.</b></center>");
            %>
            <tr>
                <td>
                    <div align="center">	   
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="ListaAconsejados" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </body>
</html>
