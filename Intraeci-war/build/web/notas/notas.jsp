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
                    response.setHeader("Cache-Control", "no-cache");
                    inicio.conectaEJB conEjb = new inicio.conectaEJB();
                    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
                    Vector asignaturas = profesor.getAsignaturas(empleado.getPeriodo(), empleado.getIdProf());
                    //String periodo = empleado.getTercio();
                    String periodo = empleado.getPeriodo();
//out.println(periodo);
                    String segui = "";
                    //int per = Integer.valueOf(periodo).intValue();
                    // out.println(periodo);
                    Vector tercio = new Vector();
                    /*   if (per != 0 && per < 5) {
                    tercio.addElement("Seleccione");
                    if (per < 0) {
                    tercio.addElement("Periodo Intermedio");
                    per = 1;
                    } else {
                    tercio.addElement("Primero");
                    tercio.addElement("Segundo");
                    tercio.addElement("Tercero");
                    tercio.addElement("Laboratorios");
                    }
                    }*/
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

            function MostrarTercio(){
                var indice = document.forms.formulario.idgrupo.selectedIndex,selector,opcion,texto;
                var valor=document.forms.formulario.idgrupo.value;
                valor=valor.split('|');
                if (valor[6]=='2019-I'){
                    selector = document.getElementById("opciones");
                    for(var i=selector.length-1;i>0;i++){
                        selector.removeChild(selector[i]);
                    }
                    var tercios=new Array("1");
                    var longi=tercios.length;
                    for(var i=0;i<tercios.length;i++){
                        opcion=document.createElement("option");
                        texto=document.createTextNode(tercios[i]);
                        opcion.appendChild(texto);
                        selector.appendChild(opcion);
                    }
                }else if (valor[5]=='S' && (valor[4] == '11030' || valor[4] == '9565' ||  valor[4] == '9660' || valor[4]=='9702' || valor[4] == '9703' || valor[4] == '9704' || valor[4]=='9715' || valor[4]=='9875' || valor[4]=='9933' || valor[4]=='10908' || valor[4]=='11003' || valor[4]=='11228')){
                    selector = document.getElementById("opciones");
                    for(var i=selector.length-1;i>0;i--){
                        selector.removeChild(selector[i]);
                    }
                    var tercios=new Array("1","2","3","EVALUATIVA","EXAMEN FINAL");
                    var longi=tercios.length;
                    for(var i=0;i<tercios.length;i++){
                        opcion=document.createElement("option");
                        texto=document.createTextNode(tercios[i]);
                        opcion.appendChild(texto);
                        selector.appendChild(opcion);
                    }
                } else if (valor[5]=='S' && (valor[4] != '11030' && valor[4]!='9704' &&  valor[4]!='9703' && valor[4]!='9565' && valor[4]!= '9660' && valor[4]!='9715' && valor[4]!='9694' )){
                    selector = document.getElementById("opciones");
                    for(var i=selector.length-1;i>0;i--){
                        selector.removeChild(selector[i]);
                    }
                    var tercios=new Array("1","2","3");
                    var longi=tercios.length;
                    for(var i=0;i<tercios.length;i++){
                        opcion=document.createElement("option");
                        texto=document.createTextNode(tercios[i]);
                        opcion.appendChild(texto);
                        selector.appendChild(opcion);
                    }
                }else if (valor[5]=='S' && (valor[4]=='9694' )){
                    selector = document.getElementById("opciones");
                    for(var i=selector.length-1;i>0;i--){
                        selector.removeChild(selector[i]);
                    }
                    var nombres = new Array("Primero", "Segundo", "Tercero", "Laboratorios");
                    var tercios=new Array("1","2","3", "4");
                    var longi=tercios.length;
                    for(var i=0;i<tercios.length;i++){
                        opcion=document.createElement("option");
                        opcion.setAttribute("value", tercios[i])
                        texto=document.createTextNode(nombres[i]);
                        opcion.appendChild(texto);
                        selector.appendChild(opcion);
                    }
                }
                else if(valor[5]=='No disponible' || (valor[5]=='N')){
                    selector = document.getElementById("opciones");
                    for(var i=selector.length-1;i>0;i--){
                        selector.removeChild(selector[i]);
                    }
                    //, "Segundo", "Tercero", "Laboratorios"
                    //,"2","3", "4"
                    var nombres = new Array("Primero", "Segundo", "Tercero", "Laboratorios");
                    var tercios=new Array("1", "2", "3", "4" );
                    var longi=tercios.length;
                    for(var i=0;i<tercios.length;i++){
                        opcion=document.createElement("option");
                        opcion.setAttribute("value", tercios[i])
                        // texto=document.createTextNode("1");
                        texto=document.createTextNode(nombres[i]);
                        opcion.appendChild(texto);
                        selector.appendChild(opcion);
                    }
                }else{}
            }

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
        <div align="center" class="textocom">    
        <strong><font color="#990000" size="3">NOTA:</font> Lea cuidadosamente
                            <a href="" onclick="window.open('html/ayunot.htm','','width=800,height=600, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false"> AQUI </a>antes
                            de ingresar las notas    </strong></div>
            <!--<table align="center" width="350" border="1" cellspacing="1" bordercolor="#990000" class="textocom">
                <tr>
                    <td height="30"><strong><font color="#990000" size="3">NOTA:</font> Lea cuidadosamente
                            <a href="" onclick="window.open('html/ayunot.htm','','width=800,height=600, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false"> AQUI </a>antes
                            de ingresar las notas    </strong>
                    </td>
                </tr>
            </table>--><br>
            <div align="center">
            <form name="formulario" method="post" action="">
                <input type="hidden" name="periodo" id="periodo" value="<%=periodo%>"/>
                <table align="center" width="310" border="0" class="textocom">
                    <tr>
                        
                        <td width="148">
                            <div align="right"><strong>Asignatura :</strong></div>
                        </td>
                        <td width="11">&nbsp;</td>
                        <td width="137">
                            <select name="idgrupo" class="campotext" onclick="MostrarTercio();">
                                <option value="null" selected>Seleccione</option>
                                <%
                                            for (int i = 0; i < asignaturas.size(); i++) {
                                                Vector asignatura = (Vector) asignaturas.elementAt(i);
                                %>
                                <option value="<%=asignatura.elementAt(2)%>|<%=asignatura.elementAt(0)%>|<%=asignatura.elementAt(1)%>|<%=asignatura.elementAt(3)%>|<%=asignatura.elementAt(4)%>|<%=asignatura.elementAt(6)%>|<%=periodo%>">
                                    <%=asignatura.elementAt(0)%> - <%=asignatura.elementAt(1)%></option>
                                    <%  segui = asignatura.elementAt(6).toString();%>

                                <%  }
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
                            <select name="tercio" class="campotext" id="opciones">
                                <option value="-1" selected>Seleccione</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="148">
                            <div align="right"><strong>Clave Num&eacute;rica :</strong></div>
                        </td>
                        <td width="11">&nbsp;</td>
                        <td width="137">
                            <input name="clavenume" type="password" class="campotext" id="clavenume" size="8" maxlength="5">
                        </td>
                    </tr>
                    <tr>
                        <td width="148">
                            <div align="right"><strong>Imprimir Notas :</strong> </div>
                        </td>
                        <td width="11">&nbsp;</td>
                        <td width="137">
                            <div align="left">
                                <input type="radio" name="rbopciones" value="1">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="148">
                            <div align="right"><strong>Capturar Notas :</strong></div>
                        </td>
                        <td width="11">&nbsp;</td>
                        <td width="137">
                            <div align="left">
                                <input type="radio" name="rbopciones" value="2">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="46">
                            <div align="right">
                                <input type="submit" name="Submit" value="Consultar" class="boton" onclick="javascript: return enviar()">
                            </div>
                        </td>
                        <td width="11">&nbsp;</td>
                        <td>
                            <div align="left">
                                <input type="reset" name="Submit2" value="Limpiar" class="boton">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" colspan="3">
                            <div align="center">
                                <input type="submit" name="Submit5" value="Exportar notas a Excel" class="boton" onclick="javascript: return enviarexcel()">
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
                            
                <div align="center">
                    <jsp:include page="piepag">
                        <jsp:param name="anterior" value="Menu" />
                    </jsp:include>
                </div>
           
        </div>
</body>
</html>
