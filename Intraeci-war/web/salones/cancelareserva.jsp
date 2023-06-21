<%@ include file="../secureprof.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,java.text.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>

<%
    response.setHeader("Cache-Control", "no-cache");
    /*String cedula = new String((String)session.getAttribute("cedula"));
     String nombre = new String((String)session.getAttribute("nombre"));			
     String ban = new String((String)session.getAttribute("ban"));*/
    PrintWriter aout = response.getWriter();
    String iduser = "";
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    String cancons = request.getParameter("cancons");
    if (empleado.getIdProf().equals("")) {
        iduser = empleado.getIdemp();
    } else {
        iduser = empleado.getIdProf();
    }
    //Fecha actual
    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
    Date currentTime_1 = new Date();
    String dateString = formatter.format(currentTime_1);
%>
<html>
    <head>
        <title>Servicio de reserva de salones</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

        <style type="text/css">
            <!--
            #fecha {
                font-family: Tahoma, Verdana, Arial;
                font-size: 12px;
                color: #000000;
            }
            -->

            <!--
            a  { text-decoration: none }
            .texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

            -->
        </style>

        <script language="javascript">
            <!--  
            /*------------------------------------------------------------------   
            function Validar Cada check box 
            ------------------------------------------------------------------*/ 
            function ValidarMod(){  
            var max = document.fmArchivos.checEli.length  
            var j = 0  
            for ( i=0 ; i<max ; i++ ){  
            if  (document.fmArchivos.checEli[i].checked == true)  
            j++ ;  
            }  
            if ( j = 0 ){  
            alert("Para modificar tiene que seleccionar un recurso")  
            }else if ( j > 1 ){  
            alert("Solo puede seleccionar un campo")  
            }else{  
            document.action = 'LA OTRA ACCION'  
            document.submit()  
            }	  
            }  
            /*------------------------------------------------------------------   
            function Validar Eliminacion del CheckBox  
            ------------------------------------------------------------------*/  
            function ValidarChk(){  
            var max = document.fmArchivos.checEli.length  
            var vall = false 
            var k = 0
            for ( i=0 ; i<max ; i++ ){  
            if  (document.fmArchivos.checEli[i].checked == true) { 
            vall =true  
            k++ ;
            }
            }  	
            if ( k > 1 ) 
            alert("Solo puede seleccionar un campo")  		
            else if ((vall == true))
            document.fmArchivos.submit()		  
            else 
            if ((vall == false) && (document.fmArchivos.checEli.checked == true) )  
            document.fmArchivos.submit()  
            else 
            alert ("Para eliminar tiene que seleccionar algun recurso")  	

            //else {		
            //document.fmArchivos.submit()
            //document.fmArchivos.submit()		
            //}
            }  
            /*-----------------------------------------------------------------   
            function Validar el CheckBox que selecciona a todos  
            ------------------------------------------------------------------*/  
            function chkAll(){  
            var max = document.fmArchivos.checEli.length  
            var vall   
            if (document.fmArchivos.chAll.checked == true)  
            vall = true  
            else  
            vall = false	  
            for ( i=0 ; i<max ; i++ ){  
            document.fmArchivos.checEli[i].checked = vall  
            }  
            }  
            /*------------------------------------------------------------------   
            function Validar Cada check box  
            ------------------------------------------------------------------*/  
            function chkUn(){  
            var max = document.fmArchivos.checEli.length  
            var vall = true  
            if (document.fmArchivos.chAll.checked == true)  
            document.fmArchivos.chAll.checked = false  
            for ( i=0 ; i<max ; i++ ){  
            vall = vall && document.fmArchivos.checEli[i].checked  
            }  
            if (vall == true)  
            document.fmArchivos.chAll.checked = true  
            }  
            //-->  



            /*function validar(){  
            var max = document.form1.checEli.length  
            var j = 0  
            for ( i=0 ; i<max ; i++ ){  
            if  (document.form1.checEli[i].checked == true)   
            j++ ;  
            }  
            if ( j == 0 ){  
            alert("Para modificar tiene que seleccionar un recurso" + j)  
            return false
            }else if ( j > 1 ){  
            alert("Solo puede seleccionar un campo")  
            return false
            }else{  
            return true 
            }	  
            } */ 



            function validar1() {
            var f = document.form1;
            var sw = false;
            var i = 0, j = 0;
            max = 1;
            var t = f.checEli.length;
            if ( f.checEli.length > 0) {
            for (i=0; i < f.checEli.length; i++) {
            if (document.form1.checEli[i].checked == true){
            j=j+1;
            sw = true;
            }
            }

            if (sw == false) {
            alert("NO seleccione: !!!" + sw + "-" +j)
            return false
            }

            if ( j > max ) {
            alert("Usted solo puede cancelar una solicitud a la vez!!!")
            return false
            }
            }		
            else {
            if (document.form1.checEli[0].checked == true)
            alert("es menor y se selecciono!!!" )
            //else{
            //	alert("es menor y NO se selecciono!!!" ) }	
            return false
            }	
            /*if (i == 0){
            if (document.form1.checEli[0].checked == true) 
            sw = true;
            else
            sw = false;
            }
            else {
            for (i=0; i < f.checEli.length; i++) {
            //if (f.checEli[i].checked == true) {
            if (eval("document.form1.checEli[" + i + "].checked") == true) {
            sw = true;				
            j = j+1;				
            }							
            }
            }	

            if ( j > max ) {
            alert("Usted solo puede cancelar una solicitud a la vez!!!")
            return false
            }

            if (sw == false) {			
            alert("No selecciono ninguna reserva para cancelar!!!" )
            return false				
            }

            //return true*/
            }
        </script>
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <link href="css/comun.css" rel="stylesheet" type="text/css">
        <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
        <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
    </head>
    <body  onLoad="preloadImg()">
       <div class="container">
         <p class="textocom">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
        <table width="90%" border="0" align="center" cellspacing="0">
            <tr class="textocom">
                <td height="22"> 
                    <div align="center">
                        <br>
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  class="textocom">
                            <tr>             
                                <td width="86%" height="96" align="center" valign="top"> <br>
                                    <%
    Vector consulta = admin.getReserva(iduser);
    if (consulta.size() > 0) {%>
                                    <form name="fmArchivos" method="post" action="EliminaReserva"> 

                                        <!--<form name="fmArchivos"  method="post" action="elimina.jsp" onSubmit="return ValidarChk()();">-->
                                        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><strong>Usted 
                                                tiene las siguientes reservas solicitadas:</strong></font></p>
                                        <table width="90%" border="1" cellspacing="0" cellpadding="0"  class="textocom">
                                            <tr bgcolor="#E6E6E6"> 
                                                <td width="5%">
                                                    <%
                                                        if (cancons.equals("cancelar")) {
                                                    %>                      
                                                    <input type="checkbox" name="chAll" onClick="chkAll()">
                                                    <%                        }
                                                    %>
                                                </td>
                                                <td width="10%"> 
                                                    <div align="center"><font size="1"><b>Id 
                                                            Reserva</b></font></div>
                                                </td>
                                                <td width="12%"> 
                                                    <div align="center"><font size="1"><b>Sal&oacute;n</b></font></div>
                                                </td>
                                                <td width="11%"> 
                                                    <div align="center"><font size="1"><b>Fecha 
                                                            de Uso</b></font></div>
                                                </td>
                                                <td width="8%"> 
                                                    <div align="center"><font size="1"><b>Hora_Ini</b></font></div>
                                                </td>
                                                <td width="8%"><font size="1"><b>Hora_Fin</b></font></td>
                                                <td width="15%"> 
                                                    <div align="center"><font size="1"><b>Tipo 
                                                            de uso</b></font></div>
                                                </td>
                                                <td width="15%"> 
                                                    <div align="center"><font size="1"><b>Asig 
                                                            - Grupo</b></font></div>
                                                </td>
                                                <td width="11%"> 
                                                    <div align="center"><font size="1"><b>Fecha solicitud</b></font></div>
                                                </td>
                                            </tr>
                                            <%
                                                String tipo = "", asig = "", idensal = "";
                                                for (int i = 0; i < consulta.size(); i++) {
                                                    Vector consul = (Vector) consulta.elementAt(i);
                                                    if (consul.elementAt(4).equals("C")) {
                                                        tipo = "Clase";
                                                    }
                                                    if (consul.elementAt(4).equals("R")) {
                                                        tipo = "Reunión";
                                                    }
                                                    if (consul.elementAt(4).equals("M")) {
                                                        tipo = "Monitoría";
                                                    }
                                                    if (consul.elementAt(4).equals("T")) {
                                                        tipo = "Taller";
                                                    }
                                                    if (consul.elementAt(4).equals("A")) {
                                                        tipo = "Académica";
                                                    }
                                                    if (consul.elementAt(4).equals("U")) {
                                                        tipo = "Cultural";
                                                    }
                                                    if (consul.elementAt(4).equals("S")) {
                                                        tipo = "Social";
                                                    }
                                                    if (consul.elementAt(6).equals("No disponible") || consul.elementAt(6).equals("AUDI")) {
                                                        asig = "-";
                                                    } else {
                                                        idensal = (String) consul.elementAt(6);
                                                        Vector nomsal = admin.getIdSalon(idensal);
                                                        if (nomsal.size() > 0) {
                                                            Vector sal = (Vector) nomsal.elementAt(0);
                                                            asig = (String) sal.elementAt(0) + "-" + (String) consul.elementAt(5);
                                                        } else {
                asig = "-";
            }
        }%>
                                            <tr> 
                                                <td width="5%"> 
                                                    <%
                                                        if (cancons.equals("cancelar")) {
                                                    %>   
                                                    <input type="checkbox" name="checEli" onClick="chkUn()"  value="<%=consul.elementAt(8)%>*<%=consul.elementAt(1)%>*<%=consul.elementAt(7)%>*<%=consul.elementAt(2)%>*<%=consul.elementAt(9)%>">
                                                    <%}
                                                    %>
                                                </td>
                                                <td width="10%"><%=consul.elementAt(8)%></td>
                                                <td width="12%"><%=consul.elementAt(7)%></td>
                                                <td width="11%"><%=consul.elementAt(1)%></td>
                                                <td width="8%"><%=consul.elementAt(2)%></font></td>
                                                <td width="8%"><%=consul.elementAt(9)%></font></td>
                                                <td width="15%"><%=tipo%></td>
                                                <td width="15%"><%=asig%></td>
                                                <td width="11%"><%=consul.elementAt(3)%></td>
                                            </tr>
                                            <%}%>
                                        </table>
                                        <%
                                            if (cancons.equals("cancelar")) {
                                        %> 
                                        <p> 
                                            <input type="button" name="Submit"  onClick="ValidarChk()" value="Enviar" class="boton">
                                            <!--<input type="Submit" name="Submit"  value="Enviar">-->
                                        </p>
                                        <%}
                                        %>
                                    </form>
                                    <%} else {%>
                                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2">Usted 
                                    no tiene ninguna reserva solicitada.</font> 
                                    <%			}

                                    %>
                                    <br>
                                    <br>
                                </td>
                            </tr>
                        </table>
                    </div></td>
            </tr>
            <tr>
                <td>
                    <div align="center">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="SolicitudSalones" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
        <p>&nbsp;</p></body>
</html>

