<%-- 
    Document   : PTransicion
    Created on : 3/09/2018, 11:15:48 AM
    Author     : andres.rojas
--%>


<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="utiles.Encripta"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    
    Encripta enc=new Encripta();
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    
    //Se encripta la fecha para almacenarla en la base de datos y el sistema de transicion confirme la conexion (Seguridad)
    SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");
    String date = sdf.format(new Date()); 
    date = enc.Encriptar(date);
    //Se encripta el carnet para pasarlo al sistema de transicion
    String id= (String)session.getAttribute("usuario");
    id=enc.Encriptar(id);
    profesor.PersisteToken(date, profesor.getIdProf((String)session.getAttribute("usuario")));
    Boolean esDecano=profesor.esDecano((String)session.getAttribute("usuario"));
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>CONSULTA CAMBIO USUARIO CORREO - ESCUELA COLOMBIANA DE INGENIERÍA JULIO GARAVITO</title>
        <style>
            label {
                text-align: justify;
             }
        </style>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="Content-Language" content="ES" />
        <meta name="language" content="spanish" />
        <meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
        <meta name="copyright" content="Copyright (c) 2018" />
        <meta name="description" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
        <meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="PTransicion/css/seguimiento.css">     
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="PTransicion/img/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Arsenal" rel="stylesheet">

    </head>
    <body>

    <header>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <center><img src="PTransicion/img/img-header.jpg" class="img-responsive"></center>
                </div>
            </div>
        </div>
    </header>
        <section>
            <div class="container-fluid">
            <p align="center">
            <br>
            <br>
            <br>
            Bienvenido a este espacio diseñado para facilitar el acompañamiento a los estudiantes en el proceso de decisión de transición o no, al nuevo plan de estudios de su programa. 

            Muy respetuosamente, la Escuela le solicita tener en cuenta el desarrollo del proceso en las siguientes fechas:
            <li>Desde el 18 de septiembre hasta el 28 de septiembre: Revisión y análisis en el sistema del nuevo plan de estudios y de las condiciones de transición, por parte de los estudiantes.</li>
            <li>Desde el 24 de septiembre hasta el 5 de octubre: Solicitud a través del sistema de una reunión con usted, por parte de los estudiantes que el Decano le haya asignado. Usted deberá consultar en Servicios Académicos las solicitudes de cita, agendarlas e informar a cada estudiante fecha y hora de la reunión.</li>
            <li>Desde el 8 de octubre hasta el 2 de noviembre: Reunión en la fecha por usted definida con cada estudiante. Al final de la reunión usted deberá validar, a través del sistema, la decisión del estudiante.</li>

            Tenga en cuenta que el éxito de este proceso depende, en gran medida, de la reunión que usted tenga con cada estudiante asignado. En caso de que alguno de ellos no solicite este encuentro, la Escuela cuenta con su apoyo para contactarlo, citarlo y llevar a feliz término el proceso.

            Mil gracias por su entusiasmo y compromiso con este importante proceso institucional. Si tiene dudas o inconvenientes, por favor contacte a su Decano.
            </p>
            </div>
        </section>
    <center>
        <form class="login" action="" method="post" name="myForm" id="myForm"> 
            <input  name="id" value="<%=id%>"    type="hidden">
            <select required="" name= "tipo" id="tipo">
                <option value="">Seleccione</option>
                <%if(esDecano){%><option value="1">Consejero</option>
                <option value="2">Decano</option>
                <%}%>
                <%
                    if(((String)session.getAttribute("usuario")).equals("claudia.rios")){
                %>
                    <option value="3">Vicerrectoría Académica</option>
                <%
                    }
                %>
            </select>
            <input type="button" value="Aceptar" onclick="enviar()">
        </form>
        
    </center>
    <footer class="footerContainer">
        <div class="container">        
            <div class="row">
                <article class="col-sm-7 col-md-5">
                    <p>                    
                        <strong>ESCUELA COLOMBIANA DE INGENIERÍA JULIO GARAVITO</strong><br/>
                        AK.45 No.205-59 (Autopista Norte)<br/>
                        <i>Contact center</i>: +57(1) 668 3600<br/>
                        Línea Nacional Gratuita: 018000112668<br/>
                        Información detallada en: www.escuelaing.edu.co<br/><br/>
                        <small>Personería Jurídica 086 de enero 19 de 1973. Acreditación institucional de alta calidad. Res. 20273 del 27 de noviembre de 2014. (Vigencia 4 años).<br>
                        Vigilada Mineducación.</small><br><br>
                        Bogotá, D.C. - Colombia<br/>

                </article>
                <article class="col-sm-5 col-md-7">
                    <p>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1987.9617427360993!2d-74.04338482936627!3d4.783148717834411!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f85e374627fe5%3A0x540783a0b074c84d!2sEscuela+Colombiana+de+Ingenier%C3%ADa!5e0!3m2!1ses!2ses!4v1424190444206" width="100%" height="280" frameborder="0" style="border:0"></iframe>
                    </p>
                </article>
            </div> 
        </div>       
    </footer>
    </body>
    <script>
        function enviar(){
            var select=document.getElementById("tipo").value;
            if(select=="1"){
                document.myForm.action = "http://weezer.escuelaing.edu.co/CambioPlan-0.9/Consejero/template.xhtml";
            }else if(select=="2"){
                document.myForm.action = "http://weezer.escuelaing.edu.co/CambioPlan-0.9/Decano/template.xhtml";
            }else if(select=="3"){
                document.myForm.action = "http://weezer.escuelaing.edu.co/CambioPlan-0.9/Vicerrectoria/Estadisticas.xhtml";
            }
            document.myForm.submit();
            return true;
        }
    </script>
</html>