<%-- 
    Document   : Participación en Convocatoria por el Aspirante
    Created on : 20/09/2011, 10:05:44 AM
    Author     : Julián Garcia
--%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <!--script type="text/javascript" src="jscript/conectar.js"></script>
        <script type="text/javascript" src="jscript/talentohum/aspirante.js"></script>
        <script type="text/javascript" src="jscript/talentohum/empleado.js"></script-->
        <script type="text/javascript" src="jscript/talentohum/convaspirante.js"></script>
        <title>Convocatorias</title>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
        <style type="text/css" >
            #tbody{
                height: 250px;
                overflow: auto;
            }
        </style>
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script language="javascript" type="text/javascript">
            var Datos=new Array();
            function inicializar(){
                Datos = dialogArguments;
                cargarconvoca() ;
            }
        </script>
    </head>
    <body background="img/fondo.gif" onload="inicializar();">
      <table border="1" width="99%" class="tabla" id="tabla" align="center">
      <tr><td colspan="2" align="center"><strong>Información de Convocatorias</strong></td></tr>
      <tr>
        <td width="50%">
        <form name="finscribe" action="">
        <table border="1" class="tabla" id="tabconva">
            <thead><th align="center" colspan="3"><strong>Convocatorias Abiertas</strong></th></thead>
            <thead>
                <th width="85%"><div align="center"><strong>Convocatoria</strong></div></th>
                <th width="10%"><div align="center"><strong>Fec.Lim.</strong></div></th>
                <th width="5%"><div align="center"><strong>Insc.</strong></div></th>
            </thead>
            <tfoot>
                    <tr><td colspan="3" align="center"><input id="Binscribir" value="Inscribir -->" type="button" class="boton" onclick="return inscConvoca(1);"/></td>
                    </tr>
            </tfoot>
            <tbody id="cuerpoconva">
            </tbody>
        </table>
        </form>
        </td>
        <td width="50%">
            <form name="fdesincribe" action="">
            <table border="1" class="tabla" id="tabconvp">
            <thead><th align="center" colspan="4"><strong>Convocatorias en las que participa</strong></th></thead>
            <thead>
                <th width="80%"><div align="center"><strong>Convocatoria</strong></div></th>
                <th width="10%"><div align="center"><strong>Fec.Lim.</strong></div></th>
                <th width="5%"><div align="center"><strong>Estado</strong></div></th>
                <th width="5%"><div align="center"><strong>DesInsc.</strong></div></th>
            </thead>
            <tfoot>
                    <tr><td colspan="4" align="center"><input id="Bdesincribir" value="<-- Desinscribir" type="button" class="boton" onclick="inscConvoca(2);"/></td>
                    </tr>
            </tfoot>
            <tbody id="cuerpoconvp">
            </tbody>
        </table>
        </form>
        </td>
      </tr>
      <tr><td colspan="2" align="center"><strong>Detalle de la Convocatoria y su Estado</strong><br>
          <textarea disabled="true" rows="12" cols="90" name="desconv" id="desconv"></textarea>
          </td></tr>
      </table>
    </body>
</html>