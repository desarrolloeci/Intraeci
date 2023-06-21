<%@ include file="../secure.jsp" %>
<%@ page import="javax.naming.*, 
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome,
         java.text.*,
         java.util.*"%>

<%
    HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    String usuarioex = new String((String) session.getAttribute("loginex"));
    login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    empleado.setPath("correo");
    String x = "";
// Vector asignaturas = profesor.getAsignaturasLabs("2011-I", empleado.getIdProf());
   // Vector asignaturas = profesor.getAsignaturasLabs(empleado.getPerHorario(), empleado.getIdProf());
    Vector asignaturas = profesor.ListasEnvioCorreoPrePos(empleado.getIdProf(), "2020-1");
// Vector asignaturaspos = profesor.getAsignaturasPos(empleado.getIdProf(), "0");
    String clave = (String) session.getAttribute("clave");
    //out.println(clave);
    session.setAttribute("clave", clave);
    //ASI ESTABA SE CAMBIO Vector asignaturaspos = profesor.getListaspos(empleado.getIdProf());
    eci.BackupAdmin lista = new eci.BackupAdmin(usuarioex, empleado.getPath());
    otros.enviarMail enviar = new otros.enviarMail();
    String texto = empleado.getTextoCorreo();
    if (texto == null) {
        texto = "";
    }
%>
<html> 
    <head>
        <title>Correos a Estudiantes</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function MM_preloadImages() { //v3.0
            var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
            var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
            if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
            }

            function MM_swapImgRestore() { //v3.0
            var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
            }

            function MM_findObj(n, d) { //v4.01
            var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
            d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
            if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
            for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
            if(!x && d.getElementById) x=d.getElementById(n); return x;
            }

            function MM_swapImage() { //v3.0
            var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
            if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
            }
            //-->
        </script>
    </head>
    <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
    <link href="css/comun.css" rel="stylesheet" type="text/css">
    <link href="css/servicios.css" rel="stylesheet" type="text/css" media="all">
    <link rel="shortcut icon" type="image/favicon.ico" href="img/favicon.ico">
</head>
<script language="javascript">
    <!--
    function validar(){
        //validar que algún grupo fue seleccionado
        var selectedBoxes=getCheckedBoxes("cursosEnviar")
        console.info(selectedBoxes);
        if(document.getElementById("asunto").value == ""){
            alert("Ingrese por favor el Asunto del correo");
            return false;
        }else if(selectedBoxes === null){
            alert("Seleccione al menos un grupo para enviar el correo");
            return false;
        }else{
            document.formulario.action = "enviarCorreoEst";
            return true;
        }
    }

    function adjuntar(){
    document.formulario.action = "Backup";
    //window.open("", "ventanaImpreNotas", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
    ///document.formulario.submit();
    }
    
    function getCheckedBoxes(chkboxName) {
        var checkboxes = document.getElementsByName(chkboxName);
        var checkboxesChecked = [];
        // ciclo sobre checkboxes
        for (var i=0; i<checkboxes.length; i++) {
           // guardar los checkboxes activos
           if (checkboxes[i].checked) {
              checkboxesChecked.push(checkboxes[i]);
           }
        }
        // retornar el arreglo o null en caso de arreglo vacío
        return checkboxesChecked.length > 0 ? checkboxesChecked : null;
    }
    -->
</script>
<body background="img/fondo.gif" onLoad="preloadImg(); MM_preloadImages('img/atachmenta.gif')">
    
     <div class="container">
            <p class="textocom">&nbsp;</p>
            <jsp:include page="encabezado">
                <jsp:param name="parametro" value="<%=empleado.getNomemp()%>" />
                <jsp:param name="doblenc" value="inicio" />
                <jsp:param name="headerImg" value="banner.jpg" />
            </jsp:include>
    
    <table width="819" border="0" align="center" cellspacing="0">
        <tr class="textocom">
            <td height="22">
                <div align="center">
                    <form action="" method="post" name="formulario" id="formulario">
                        <input name="on" type="hidden" id="on" value="n">
                        <input name="spath" type="hidden" id="spath" value="correo">
                        <input name="anterior" type="hidden" id="anterior" value="EnviarCorreoEstud">
                        <input name="id" type="hidden" id="id" value="x">
                        <br>
                        <br>
                        <br>
                        <p align="left"><b><font color="#990000" size="2">Para sistema operativo 
                            windows puede utilizar navegador Mozilla firefox y 
                            Google chrome .</font></b></p>
                          <p align="left"><font color="#990000" size="2"><b>Para sistema operativo 
                            MAC puede utilizar navegador safari y Mozilla firefox</b></font></p>
                          <br>
                          <br>
                          <br>
                        <table width="550" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
                            <tr>
                                <td></td>
                                <td width="20%" height="25" valign="top">
                                <h><b>Seleccione uno o varios grupos para enviar el correo: &nbsp;&nbsp;&nbsp;</b></h>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td width="80%" valign="center">
                                        <%
                                            for (int i = 0; i < asignaturas.size(); i++) {

                                                Vector asignatura = (Vector) asignaturas.elementAt(i);%>
                                                <input type="checkbox" name="cursosEnviar" value="<%=asignatura.elementAt(0)%>|<%=asignatura.elementAt(1)%>|<%=asignatura.elementAt(2)%>|<%=asignatura.elementAt(3)%>"/>
                                                <%=asignatura.elementAt(3)%> - <%=asignatura.elementAt(2)%>

                                        <%
                                            }%>
                                           

                                    </select>
                                </td>
                            </tr>
                            <tr style="height: 25px;">
                            </tr>
                            <!--tr>
                                <td width="20%" height="25" valign="top">
                                    <div align="right"><strong>Para:&nbsp;&nbsp;&nbsp;</strong></div>
                                </td>
                                <td width="80%" valign="top">
                                    <select name="paragrupo" class="campotext" id="paragrupo">
                                        <option value="null" selected>Seleccione</option>
                                        <!%
                                            for (int i = 0; i < asignaturas.size(); i++) {

                                                Vector asignatura = (Vector) asignaturas.elementAt(i);%>
                                        <option value="<!%=asignatura.elementAt(0)%>|<!%=asignatura.elementAt(1)%>|<!%=asignatura.elementAt(2)%>">
                                            <!%=asignatura.elementAt(3)%> - <!%=asignatura.elementAt(2)%></option>

                                        <!%
                                            }%>
                                           

                                    </select>
                                </td>
                            </tr-->
                            <tr>
                                <td width="20%" height="25" valign="top">
                                    <div align="right"><strong>De:&nbsp;&nbsp;&nbsp;</strong></div>
                                </td>
                                <td valign="top"><%=usuarioex%>@escuelaing.edu.co</td>
                            </tr>
                            <tr>
                                <td width="20%" height="25" valign="top"><div align="right"><strong>Asunto:&nbsp;&nbsp;&nbsp;</strong></div></td>
                                <td valign="top">
                                    <input name="asunto" type="text" class="campotext" id="asunto" size="50" maxlength="80"></td>
                            </tr>
                            <tr valign="middle">
                                <td height="50" colspan="2"><div align="center">

                                        <input type="submit" name="adjSubmit" value="Adjuntar" onClick="javascript: return adjuntar();" class="boton">
                                        <p><!--a href="Backup?on=n&spath=correo&anterior=EnviarCorreoEstud&texto=<%=texto%>" onMouseOver="MM_swapImage('ImageAta','','img/atachmenta.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="img/atachment.gif" name="ImageAta" width="100" height="25" border="0" id="ImageAta"></a--></p>
                                    </div></td>
                            </tr>
                            <tr>
                                <td valign="top"><div align="right"><strong>Texto:&nbsp;&nbsp;&nbsp;
                                        </strong></div></td>
                                <td valign="top"><textarea name="texto" cols="60" rows="7" class="campotext" id="texto"><%=texto%></textarea></td>
                            </tr>
                            <tr>
                                <td height="30" valign="top"><div align="right"><strong>Archivos&nbsp;&nbsp;&nbsp;<br>Adjuntos:&nbsp;&nbsp;&nbsp;</strong></div></td>
                                <td height="30" valign="top">
                                    <%
                                        for (int i = 0; i < lista.nArchivos(); i++) {
                                    %>
                                    &nbsp;<%=lista.nomArchivo(i)%> - <%=lista.tamarch(i)%> Kb<br>      <%
                                        }
                                    %>
                                </td>
                            </tr>
                            <tr align="center" valign="middle">
                                <td colspan="2" valign="middle"><div align="center">
                                        <p>
                                            <input name="userimpre" type="hidden" id="userimpre" value="<%=empleado.getUsrname()%>">
                                            <input name="bi" type="submit" class="boton" id="bi" value="Enviar Correo" onClick="javascript: return validar();">
                                        </p>
                                    </div></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </td>
        </tr>
        <tr class="textocom">
            <td>
                <div align="center">
                    <jsp:include page="piepag">
                        <jsp:param name="anterior" value="Menu" />
                    </jsp:include>
                </div>
            </td>
        </tr>
    </table>
     </div>
</body>
</html> 