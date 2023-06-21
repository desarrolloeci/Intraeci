<%-- 
    Document   : Empleador
    Created on : 5/06/2017, 04:49:59 PM
    Author     : lucero.rodriguez
--%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Encuestas Autoevaluación</title>
        <link href="css/encuestaODI.css" rel="stylesheet" type="text/css" media="all"/>
    </head>
    <body>

        <div id="container">
            <header>
            </header>
   
        <!--FormatoEncuestaotros-->
        <form name="form1"  method="post"  action="EncuestasOtros">
             <div align="center"> 
            <table border="0" cellpadding="0" cellspacing="2" width="50%"  class="textocom">
                <tr bgcolor="#F3F3F3">
                    <td  bgcolor="#F3F3F3" width="50%" height="38">
                        <p><strong><font size="2">Código Empleador <br>
                                (Ingrese en código de empleador asignado):</font></strong>
                    </td>
                    <td  bgcolor="#F3F3F3" width="50%" height="38"><strong>
                            <input type="text" name="cedula" size="15" class="campotext"></strong></td>
                </tr>
                <tr>
                    <td colspan="3">
                <center>
                    <input type="submit" name="Submit" class="input boton" value="Enviar">
                </center>
                </td>
                </tr>
                <p>&nbsp;</p>
            </table>
             </div>
        </form>
             </div>
    </body>
</html>
