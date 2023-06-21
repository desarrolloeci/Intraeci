<%-- 
    Document   : Autoevaluacion
    Created on : 10/10/2011, 04:53:40 PM
    Author     : lrodriguez
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
        
            <font size="4" color="#800000"> Encuesta Institucional Autoevaluación</font>

                    <p align="justify">El proceso de Autoevaluación es de carácter participativo, 
                        integral, reflexivo, crítico y constructivo. Con los aportes de todos los miembros de nuestra comunidad, 
                        podremos identificar las fortalezas y oportunidades de mejora institucionales y de los programas académicos, 
                        así como la formulación de nuevos planes y acciones que nos mantengan a la vanguardia en todos los ámbitos de la 
                        Educación Superior.
                        <br>
                        A continuación encontrará una serie de afirmaciones sobre temas de interés institucional. 
                        Por favor léalas cuidadosamente y seleccione la opción de respuesta que más se ajuste a su opinión. 
                        Si usted considera que la afirmación no aplica para su caso o no conoce sobre ese aspecto, seleccione 
                        la opción correspondiente. Además, si desea complementar su respuesta, puede hacerlo en el espacio 
                        disponible ubicado debajo de cada afirmación. 
                        <br>
                        Sus respuestas serán tratadas en forma confidencial. Contamos con su valiosa y decidida participación para el éxito de éste proceso.

                    </p>
                  
            
        <!--FormatoEncuestaotros-->
        <form name="form1"  method="post"  action="EncuestasOtros">
             <div align="center"> 
            <table border="0" cellpadding="0" cellspacing="2" width="50%"  class="textocom">
                <tr bgcolor="#F3F3F3">
                    <td  bgcolor="#F3F3F3" width="50%" height="38">
                        <p><strong><font size="2">Documento Identidad&nbsp; <br>
                                (Sin puntos, ni comas, ni guiones):</font></strong>
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
