<%-- 
    Document   : Autoevaluacion
    Created on : 10/10/2011, 04:53:40 PM
    Author     : lrodriguez
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Encuestas Autoevaluaci�n</title>
        <link href="css/encuestaODI.css" rel="stylesheet" type="text/css" media="all"/>
    </head>
    <body>

        <div id="container">
            <header>
            </header>
        
            <font size="4" color="#800000"> Encuesta Institucional Autoevaluaci�n</font>

                    <p align="justify">El proceso de Autoevaluaci�n es de car�cter participativo, 
                        integral, reflexivo, cr�tico y constructivo. Con los aportes de todos los miembros de nuestra comunidad, 
                        podremos identificar las fortalezas y oportunidades de mejora institucionales y de los programas acad�micos, 
                        as� como la formulaci�n de nuevos planes y acciones que nos mantengan a la vanguardia en todos los �mbitos de la 
                        Educaci�n Superior.
                        <br>
                        A continuaci�n encontrar� una serie de afirmaciones sobre temas de inter�s institucional. 
                        Por favor l�alas cuidadosamente y seleccione la opci�n de respuesta que m�s se ajuste a su opini�n. 
                        Si usted considera que la afirmaci�n no aplica para su caso o no conoce sobre ese aspecto, seleccione 
                        la opci�n correspondiente. Adem�s, si desea complementar su respuesta, puede hacerlo en el espacio 
                        disponible ubicado debajo de cada afirmaci�n. 
                        <br>
                        Sus respuestas ser�n tratadas en forma confidencial. Contamos con su valiosa y decidida participaci�n para el �xito de �ste proceso.

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
