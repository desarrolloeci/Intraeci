<html>
    <head>
        <title>Hoja de Vida Profesores</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <link href="css/comunProye.css" rel="stylesheet" type="text/css">
     <script language="javascript" type="text/javascript">
         function CargarHojaDeVida(){
             var url=document.getElementById("cod_emp").value;
            document.getElementById("iframehojadevida").src="HojaVidaProf?paramtext=0&cod_emp="+url;
         }
     </script>
    </head>
    <body background="img/fondoblanco.gif">
        <p class="textocom">&nbsp;</p>
        <jsp:include page="encabezadoTalhum.jsp">
            <jsp:param name="parametro" value="parametro" />
            <jsp:param name="doblenc" value="parametro" />
            <jsp:param name="titulo" value="parametros" />
        </jsp:include>
        <div align="center">
            <label>Numero de documento</label>
            <input type="text"  maxlength="12" name="codigo_empleado" id="cod_emp"/>
            <button type="button" onclick="CargarHojaDeVida()">Buscar</button>
             <br>
             <iframe  id="iframehojadevida" width="1000" height="500"></iframe>
        </div>
    </body>
</html>