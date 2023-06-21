<%@page import="utiles.Correo"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*" %>
<% try{
            String titulo = request.getParameter("titulo");
            String parametro = request.getParameter("parametro");
            String doblenc = request.getParameter("doblenc");
%>
<%SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy'-'hh:mm:ss");
            Date currentTime_1 = new Date();
            String dateString = formatter.format(currentTime_1);%>
<script language="JavaScript" type="text/JavaScript">
    <!--
    function MM_openBrWindow(theURL,winName,features) { //v2.0
        window.open(theURL,winName,features);
    }
    //-->
</script>
<script language="JavaScript">
    <!--
    function MM_preloadImages() { //v3.0
        var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
            var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
                if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
        }

        function MM_swapImgRestore() { //v3.0
            var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
        }

        function MM_findObj(n, d) { //v4.0
            var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
                d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
            if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
            for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
            if(!x && document.getElementById) x=document.getElementById(n); return x;
        }

        function MM_swapImage() { //v3.0
            var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
                if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
        }
        //-->
</script>
<body bgcolor="#ffffff">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" media="screen" href="css/estilos.css?v=2" />
<table width="640" border="0" align="center" cellpadding="0" cellspacing="0">
    <!-- fwtable fwsrc="encabezado.png" fwbase="encabezadohtm.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
    <tr>        
        <td><img src="img/profesores_empleados.jpg" width="793" height="228" border="0" alt="" >
            <!-- <map name="m_CABEZOTE">
              <area shape="rect" coords="616,57,765,72" href="http://www.escuelaing.edu.co/es/financiacion" >
              <area shape="rect" coords="545,60,607,72" href="http://www.escuelaing.edu.co/es/programas/admisiones" >
              <area shape="rect" coords="476,60,539,73" href="http://www.escuelaing.edu.co/es/programas" >
              <area shape="rect" coords="407,59,470,73" href="http://www.escuelaing.edu.co/es/comunidad/profesores" >
              <area shape="rect" coords="366,59,402,72" href="http://www.escuelaing.edu.co" >
            </map>-->
        </td>
        <!-- <td><img src="img/spacer.gif" width="163" height="1" border="0" alt=""></td>
        <td><img src="img/spacer.gif" width="20" height="1" border="0" alt=""></td>
        <td><img src="img/spacer.gif" width="216" height="1" border="0" alt=""></td>
        <td><img src="img/spacer.gif" width="241" height="1" border="0" alt=""></td>
        <td><img src="img/spacer.gif" width="1" height="1" border="0" alt=""></td>
    </tr>
    <tr>
        <td><img name="encabezadohtm_r1_c1" src="img/encabezadohtm_r1_c1.gif" width="163" height="70" border="0" alt=""></td>
        <td><img name="encabezadohtm_r1_c2" src="img/encabezadohtm_r1_c2.gif" width="20" height="70" border="0" alt=""></td>
        <td><img name="encabezadohtm_r1_c3" src="img/encabezadohtm_r1_c3.gif" width="216" height="70" border="0" alt=""></td>
        <td><img name="encabezadohtm_r1_c4" src="img/encabezadohtm_r1_c4.gif" width="241" height="70" border="0" alt=""></td>
        <td><img src="spacer.gif" width="1" height="70" border="0" alt=""></td>
    </tr>-->
</table>
<div>

    <table width="794" border="0" align="center" height="72">
        <tr>
            <td colspan="3">
                <%
                            if (!doblenc.equals("no")) {
                %>

                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <!-- fwtable fwsrc="barmenusup.png" fwbase="barmenusup.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
                    <tr>
                        <td><img src="img/spacer.gif" width="226" height="1" border="0" alt=""></td>
                        <td><img src="img/spacer.gif" width="82" height="1" border="0" alt=""></td>
                        <td><img src="img/spacer.gif" width="83" height="1" border="0" alt=""></td>
                        <td><img src="img/spacer.gif" width="83" height="1" border="0" alt=""></td>
                        <td><img src="img/spacer.gif" width="83" height="1" border="0" alt=""></td>
                        <td><img src="img/spacer.gif" width="83" height="1" border="0" alt=""></td>
                        <td><img src="img/spacer.gif" width="1" height="1" border="0" alt=""></td>
                    </tr>
                    <tr>
                        <!--<td colspan="6"><img name="barmenusup_r1_c1" src="img/barmenusup_r1_c1.gif" width="640" height="7" border="0" alt=""></td>-->

                        <td><img src="img/spacer.gif" width="1" height="7" border="0" alt=""></td>
                    </tr>
                    <tr>
                    <div  id="menu2" >
                        <ul>
                            <li>
                                <a href="Menu"><b>INICIO</b></a>
                            </li>
                            <li>
                                <a href="AdminConvoca"><b>APLICANTES CONVOCATORIAS</b></a>
                            </li>
                            <li>
                                <a href="https://siaci-escuelaing.azurewebsites.net/Account/Login?ReturnUrl=%2F" target="_blank"><b>SIACI</b></a>
                            </li>
                            <li>
                                <a href="InicioPlanes"><b>PLANES</b></a>
                            </li> 
                            <li>
                                <a href="presupuesto"><b>PRESUPUESTO</b></a>
                            </li>
                            <li>
                                <a href="http://copernico.escuelaing.edu.co/software/"><b>DESCARGAS</b></a>
                            </li>
                            <li>
                                <a href="salir"><b>SALIR</b></a>
                            </li>
                        </ul>
                    </div>	<div style="float: left;"><gcse:search></gcse:search>
                    </div>
                    <!--  <td rowspan="2"><img name="barmenusup_r2_c1" src="img/barmenusup_r2_c1.gif" width="226" height="38" border="0" alt=""></td>
          <td><a href="Backup?on=n&spath=backup&anterior=Menu" onMouseOver="MM_swapImage('barmenusup_r2_c2','','img/barmenusup_r2_c2a.gif',0)" onMouseOut="MM_swapImgRestore()"><img name="barmenusup_r2_c2" src="img/barmenusup_r2_c2.gif" width="82" height="22" border="0" alt=""></a></td>

<td><a href="" onclick="return false;" onMouseOver="MM_swapImage('barmenusup_r2_c11','','img/bg2.png',0)" onMouseOut="MM_swapImgRestore()"><img name="barmenusup_r2_c11" src="img/barmenusup_r2_c11.gif" width="82" height="22" border="0" alt=""></a></td>
            <td><a href="InicioPlanes" onMouseOver="MM_swapImage('barmenusup_r2_c9','','img/barmenusup_r2_c9a.gif',0)" onMouseOut="MM_swapImgRestore()"><img name="barmenusup_r2_c9" src="img/barmenusup_r2_c9.gif" width="82" height="22" border="0" alt=""></a></td>
            <td><a href="" onclick="window.open('http://exchange.escuelaing.edu.co/owa/','','width=800,height=600, toolbar=yes,scrollbars=yes,location=yes,directories=yes,status=yes,menubar=yes,resizable=yes');return false" onMouseOver="MM_swapImage('barmenusup_r2_c3','','img/barmenusup_r2_c3a.gif',0)" onMouseOut="MM_swapImgRestore()"><img name="barmenusup_r2_c3" src="img/barmenusup_r2_c3.gif" width="83" height="22" border="0" alt=""></a></td>
            <td><a href="" onclick="window.open('http://osiris.osirescuelaing.edu.co/empleados/jsp/inicio.jsp','','width=800,height=600, toolbar=yes,scrollbars=yes,location=yes,directories=yes,status=yes,menubar=yes,resizable=yes');return false" onMouseOver="MM_swapImage('barmenusup_r2_c4','','img/barmenusup_r2_c4a.gif',1)" onMouseOut="MM_swapImgRestore()"><img name="barmenusup_r2_c4" src="img/barmenusup_r2_c4.gif" width="83" height="22" border="0" alt=""></a></td>
            <td><a href="" onclick="window.open('http://copernico.escuelaing.edu.co/software/','','width=800,height=600, toolbar=yes,scrollbars=yes,location=yes,directories=yes,status=yes,menubar=yes,resizable=yes');return false" onMouseOver="MM_swapImage('barmenusup_r2_c5','','img/barmenusup_r2_c5a.gif',1)" onMouseOut="MM_swapImgRestore()"><img name="barmenusup_r2_c5" src="img/barmenusup_r2_c5.gif" width="83" height="22" border="0" alt=""></a></td>
            <td><a href="salir" onMouseOver="MM_swapImage('barmenusup_r2_c6','','img/barmenusup_r2_c6a.gif',0)" onMouseOut="MM_swapImgRestore()"><img name="barmenusup_r2_c6" src="img/barmenusup_r2_c6.gif" width="83" height="22" border="0" alt=""></a></td>
            <td><img src="img/spacer.gif" width="1" height="22" border="0" alt=""></td>-->
        </tr>
        <tr>
            <td colspan="5"><img name="barmenusup_r3_c2" src="img/barmenusup_r3_c2.gif" width="414" height="16" border="0" alt=""></td>
            <td><img src="img/spacer.gif" width="1" height="16" border="0" alt=""></td>
        </tr>
    </table>
    <table>
        <tr>
            <td width="213"><b><font size="1" color="#666666" face="Verdana, Arial, Helvetica, sans-serif"><%=parametro%></font></b></td>
            <td width="213"><div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699"><!%=titulo%></font></b></div></td>
            <td width="214"><div align="right" class="textocom"><strong><%= dateString%></strong></div></td>
        </tr>
    </table>
</td>
</tr>
</table>
</div>
<%            }
%>
<div align="center"></div>
<%
            } catch (Exception e) {
                Correo correo = new Correo();
                correo.enviar("Encabezado Intraeci", e.getMessage());
            }
%>