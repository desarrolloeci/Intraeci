/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import java.io.*;
import java.io.IOException;
import java.util.Vector;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.*;
import java.util.*;
import javax.servlet.http.*;
import java.util.Properties;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.activation.*;

/**
 *
 * @author lrodriguez
 * @version
 */
public class ModificarNotas extends HttpServlet {

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet enviaNotas</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet enviaNotas at " + request.getContextPath () + "</h1>");
        out.println("</body>");
        out.println("</html>");
         */
        out.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        // String host = "smtp1.escuelaing.edu.co";
        String host = "smtp.office365.com";
        //String to = "educont@escuelaing.edu.co";
        HttpSession sesion;
        int res, res1, res2, error, total = 0, total1 = 0;
        String cadena = "nota";
        String datosasigna = "";
        String sec;
        sesion = request.getSession(true);
        String descerror[] = new String[5];
        Vector estudiantes = new Vector();
        Vector sumas = new Vector();
        String consulta = new String();
        String notaEst = new String();
        String nota = new String();
        String notaact = new String();
        String variable = new String();
        String Datos = "";
        String mensaje = new String("Su solicitud ha sido enviada exitosamente, pronto le estaremos contactando");
        String tercio = request.getParameter("tercio");
        String grupo = request.getParameter("idgrupo");
        String idasig = request.getParameter("idasig");
        String codasig = request.getParameter("codasig");
        String codgrupo = request.getParameter("codgrupo");
        String nomasig = request.getParameter("nomasig");
        String seguim = request.getParameter("seguim");
        String suma = request.getParameter("suma");
        String notanva = request.getParameter("notanva");
        String documento = request.getParameter("documento");
        String notas1 = request.getParameter("notas1");
        String notas2 = request.getParameter("notas2");
        String notas3 = request.getParameter("notas3");
        String notas4 = request.getParameter("notas4");
        String notas5 = request.getParameter("notas5");
        String carnet = request.getParameter("carnet");
        String texto = request.getParameter("texto");
        String periodo = request.getParameter("periodo");
        String email = request.getParameter("email");
        String nombre = request.getParameter("nombre");
        String nivel = request.getParameter("nivel");
        String idgrupoPRE = request.getParameter("idgrupoPRE");
        final String clave = (String) sesion.getAttribute("clave");
        final String usu = (String) sesion.getAttribute("usu");
        
        /*String s3 = request.getParameter("s3");
        String s4 = request.getParameter("s4");
        String s5 = request.getParameter("s5");*/
        String clanum = request.getParameter("clanum");
        String idgrupo = "";
        String rbopciones = request.getParameter("rbopciones");
        login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) sesion.getAttribute("empleado");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet enviaModificacionNotas</title>");
        out.println("</head>");
        out.println("<body>");
  
         final String correo = usu + "@escuelaing.edu.co";
                 //empleado.getUsrname() + "@escuelaing.edu.co";
     //   final String correo = "lucero.rodriguez" + "@escuelaing.edu.co";
        //  out.println(correo);
        estudiantes = empleado.getEstudiantes();
        error = 0;

        if (estudiantes.size() > 0) {
            Date fecha = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy'-'hh:mm:ss");
            String cadenaFecha = formatter.format(fecha);
            //String grupo= estudiantes.elementAt(18).toString();
            Date currentTime_1 = new Date();
            String dateString = formatter.format(currentTime_1);
            String smtp;
            if ((tercio.equals("1") && notanva != null && nivel.equals("PRE"))) {
                Datos = Datos + "Estudiante: " + nombre + "\n\n" + "Nota Anterior: " + notas1 + "\n\n" + "Nueva Nota: " + notanva + "\n\n" + "Fecha: " + cadenaFecha + "\n\n";
                datosasigna = (idasig + "-" + grupo + "-" + tercio + "-" + carnet + "-" + notas1 + "-" + notanva);
                res = profesor.IngresaNotas("nota1", grupo, carnet, notanva);
                String campo = "nota1";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, grupo, carnet, notanva, campo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, grupo, codgrupo, tercio, carnet, notas1, notanva, operacion, texto);
                try {
                    smtp = "smtp.office365.com";
                    MimeMultipart multipart = new MimeMultipart();
                    Properties properties = new Properties();
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");
                    properties.put("mail.smtp.host", smtp);
                    properties.put("mail.smtp.port", "587");
                    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(correo, clave);
                        }
                    });
                    String asunto = "Modificación de Notas Tercio 1- " + codasig;
                    session.setDebug(true);
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(correo));
                    msg.setRecipients(Message.RecipientType.BCC, correo);
                    msg.setSubject(asunto, "UTF-8");
                    msg.setSentDate(new Date());
                    texto = Datos + "\n\n";
                    msg.setText(texto, "UTF-8");
                    Transport.send(msg);
                    mensaje = "ok";
                    /*  try {
                    Properties prop = new Properties();
                    prop.put("mail.smtp.host", host);
                    String to = correo;
                    Session ses1 = Session.getDefaultInstance(prop, null);
                    MimeMessage msg = new MimeMessage(ses1);
                    msg.setFrom(new InternetAddress(correo));
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    String asunto = "Modificación de Notas Tercio 1- " + codasig;
                    String texto1 = Datos + "\n\n";
                    msg.setSubject(asunto);
                    msg.setText(texto1);
                    Transport.send(msg);*/

                } catch (Exception e) {
                    mensaje = "error: " + e.getMessage();
                }

                if (res <= 0) {
                    error = error + 1;
                }
            } else if ((tercio.equals("1") && notanva != null && nivel.equals("POST"))) { //modificar posgrado
                Datos = Datos + "Estudiante: " + nombre + "\n\n" + "Nota Anterior: " + notas1 + "\n\n" + "Nueva Nota: " + notanva + "\n\n" + "Fecha: " + cadenaFecha + "\n\n";
                datosasigna = (idasig + "-" + grupo + "-" + tercio + "-" + carnet + "-" + notas1 + "-" + notanva);
                res = profesor.IngresaNotasPregradoPOS("nota1", codgrupo, carnet, clanum, idasig, notanva);

                String campo = "nota1";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                res1 = profesor.InsertarlogauditPos(documento, datosasigna, texto, idasig, carnet, notanva, campo, codgrupo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, grupo, codgrupo, tercio, carnet, notas1, notanva, operacion, texto);
                try {
                    smtp = "smtp.office365.com";
                    MimeMultipart multipart = new MimeMultipart();
                    Properties properties = new Properties();
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");
                    properties.put("mail.smtp.host", smtp);
                    properties.put("mail.smtp.port", "587");
                    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(correo, clave);
                        }
                    });
                    String asunto = "Modificación de Notas Tercio 1- " + codasig;
                    session.setDebug(true);
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(correo));
                    msg.setRecipients(Message.RecipientType.BCC, correo);
                    msg.setSubject(asunto);
                    msg.setSentDate(new Date());
                    texto = Datos + "\n\n";
                    msg.setText(texto);
                    Transport.send(msg);
                    mensaje = "ok";
                } catch (Exception e) {
                    mensaje = "error: " + e.getMessage();
                }

                if (res <= 0) {
                    error = error + 1;
                }
            } else if ((tercio.equals("2") && notanva != null && nivel.equals("PRE"))) {
                Datos = Datos + "Estudiante: " + nombre + "\n\n" + "Nota Anterior: " + notas2 + "\n\n" + "Nueva Nota: " + notanva + "\n\n" + "Fecha: " + cadenaFecha + "\n\n";
                datosasigna = (idasig + "-" + grupo + "-" + tercio + "-" + carnet + "-" + notas2 + "-" + notanva);
                res = profesor.IngresaNotas("nota2", grupo, carnet, notanva);
                String campo = "nota2";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, grupo, carnet, notanva, campo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, grupo, codgrupo, tercio, carnet, notas2, notanva, operacion, texto);
               try {
                    smtp = "smtp.office365.com";
                    MimeMultipart multipart = new MimeMultipart();
                    Properties properties = new Properties();
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");
                    properties.put("mail.smtp.host", smtp);
                    properties.put("mail.smtp.port", "587");
                    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(correo, clave);
                        }
                    });
                    String asunto = "Modificación de Notas Tercio 2- " + codasig;
                    session.setDebug(true);
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(correo));
                    msg.setRecipients(Message.RecipientType.BCC, correo);
                    msg.setSubject(asunto);
                    msg.setSentDate(new Date());
                    texto = Datos + "\n\n";
                    msg.setText(texto);
                    Transport.send(msg);
                    mensaje = "ok";
                } catch (Exception e) {
                    mensaje = "error: " + e.getMessage();
                }
                if (res <= 0) {
                    error = error + 1;
                }
            } else if ((tercio.equals("2") && notanva != null && nivel.equals("POST"))) { //modificar posgrado
                Datos = Datos + "Estudiante: " + nombre + "\n\n" + "Nota Anterior: " + notas2 + "\n\n" + "Nueva Nota: " + notanva + "\n\n" + "Fecha: " + cadenaFecha + "\n\n";
                datosasigna = (idasig + "-" + grupo + "-" + tercio + "-" + carnet + "-" + notas2 + "-" + notanva);
                res = profesor.IngresaNotasPregradoPOS("nota2", codgrupo, carnet, clanum, idasig, notanva);

                String campo = "nota2";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                res1 = profesor.InsertarlogauditPos(documento, datosasigna, texto, idasig, carnet, notanva, campo, codgrupo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, grupo, codgrupo, tercio, carnet, notas2, notanva, operacion, texto);
               try {
                    smtp = "smtp.office365.com";
                    MimeMultipart multipart = new MimeMultipart();
                    Properties properties = new Properties();
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");
                    properties.put("mail.smtp.host", smtp);
                    properties.put("mail.smtp.port", "587");
                    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(correo, clave);
                        }
                    });
                    String asunto = "Modificación de Notas Tercio 2- " + codasig;
                    session.setDebug(true);
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(correo));
                    msg.setRecipients(Message.RecipientType.BCC, correo);
                    msg.setSubject(asunto);
                    msg.setSentDate(new Date());
                    texto = Datos + "\n\n";
                    msg.setText(texto);
                    Transport.send(msg);
                    mensaje = "ok";
                } catch (Exception e) {
                    mensaje = "error: " + e.getMessage();
                }
                if (res <= 0) {
                    error = error + 1;
                }
            } else if ((tercio.equals("3") && notanva != null && nivel.equals("PRE"))) {
                Datos = Datos + "Estudiante: " + nombre + "\n\n" + "Nota Anterior: " + notas3 + "\n\n" + "Nueva Nota: " + notanva + "\n\n" + "Fecha: " + cadenaFecha + "\n\n";
                datosasigna = (idasig + "-" + grupo + "-" + tercio + "-" + carnet + "-" + notas3 + "-" + notanva);
                res = profesor.IngresaNotas("nota3", grupo, carnet, notanva);
                String campo = "nota3";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, grupo, carnet, notanva, campo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, grupo, codgrupo, tercio, carnet, notas3, notanva, operacion, texto);
                try {
                    smtp = "smtp.office365.com";
                    MimeMultipart multipart = new MimeMultipart();
                    Properties properties = new Properties();
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");
                    properties.put("mail.smtp.host", smtp);
                    properties.put("mail.smtp.port", "587");
                    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(correo, clave);
                        }
                    });
                    String asunto = "Modificación de Notas Tercio 3- " + codasig;
                    session.setDebug(true);
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(correo));
                    msg.setRecipients(Message.RecipientType.BCC, correo);
                    msg.setSubject(asunto);
                    msg.setSentDate(new Date());
                    texto = Datos + "\n\n";
                    msg.setText(texto);
                    Transport.send(msg);
                    mensaje = "ok";
                } catch (Exception e) {
                    mensaje = "error: " + e.getMessage();
                }

                if (res <= 0) {
                    error = error + 1;
                }
            } else if ((tercio.equals("3") && notanva != null && nivel.equals("POST"))) { //modificar posgrado
                Datos = Datos + "Estudiante: " + nombre + "\n\n" + "Nota Anterior: " + notas3 + "\n\n" + "Nueva Nota: " + notanva + "\n\n" + "Fecha: " + cadenaFecha + "\n\n";
                datosasigna = (idasig + "-" + grupo + "-" + tercio + "-" + carnet + "-" + notas3 + "-" + notanva);
                res = profesor.IngresaNotasPregradoPOS("nota3", codgrupo, carnet, clanum, idasig, notanva);

                String campo = "nota3";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                res1 = profesor.InsertarlogauditPos(documento, datosasigna, texto, idasig, carnet, notanva, campo, codgrupo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, grupo, codgrupo, tercio, carnet, notas3, notanva, operacion, texto);
                try {
                    smtp = "smtp.office365.com";
                    MimeMultipart multipart = new MimeMultipart();
                    Properties properties = new Properties();
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");
                    properties.put("mail.smtp.host", smtp);
                    properties.put("mail.smtp.port", "587");
                    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(correo, clave);
                        }
                    });
                    String asunto = "Modificación de Notas Tercio 3- " + codasig;
                    session.setDebug(true);
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(correo));
                    msg.setRecipients(Message.RecipientType.BCC, correo);
                    msg.setSubject(asunto);
                    msg.setSentDate(new Date());
                    texto = Datos + "\n\n";
                    msg.setText(texto);
                    Transport.send(msg);
                    mensaje = "ok";
                } catch (Exception e) {
                    mensaje = "error: " + e.getMessage();
                }
                if (res <= 0) {
                    error = error + 1;
                }
            } else if ((tercio.equals("4") && notanva != null && nivel.equals("PRE"))) {
                Datos = Datos + "Estudiante: " + nombre + "\n\n" + "Nota Anterior: " + notas4 + "\n\n" + "Nueva Nota: " + notanva + "\n\n" + "Fecha: " + cadenaFecha + "\n\n";
                datosasigna = (idasig + "-" + grupo + "-" + tercio + "-" + carnet + "-" + notas4 + "-" + notanva);
                res = profesor.IngresaNotas("nota_lab", grupo, carnet, notanva);
                String campo = "nota_lab";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, grupo, carnet, notanva, campo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, grupo, codgrupo, tercio, carnet, notas4, notanva, operacion, texto);
               try {
                    smtp = "smtp.office365.com";
                    MimeMultipart multipart = new MimeMultipart();
                    Properties properties = new Properties();
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");
                    properties.put("mail.smtp.host", smtp);
                    properties.put("mail.smtp.port", "587");
                    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(correo, clave);
                        }
                    });
                    String asunto = "Modificación de Notas Tercio 4- " + codasig;
                    session.setDebug(true);
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(correo));
                    msg.setRecipients(Message.RecipientType.BCC, correo);
                    msg.setSubject(asunto);
                    msg.setSentDate(new Date());
                    texto = Datos + "\n\n";
                    msg.setText(texto);
                    Transport.send(msg);
                    mensaje = "ok";
                } catch (Exception e) {
                    mensaje = "error: " + e.getMessage();
                }

                if (res <= 0) {
                    error = error + 1;
                }
            } else if ((tercio.equals("4") && notanva != null && nivel.equals("POST"))) { //modificar posgrado
                Datos = Datos + "Estudiante: " + nombre + "\n\n" + "Nota Anterior: " + notas4 + "\n\n" + "Nueva Nota: " + notanva + "\n\n" + "Fecha: " + cadenaFecha + "\n\n";
                datosasigna = (idasig + "-" + grupo + "-" + tercio + "-" + carnet + "-" + notas4 + "-" + notanva);
                res = profesor.IngresaNotasPregradoPOS("nota_lab", codgrupo, carnet, clanum, idasig, notanva);
                String campo = "nota_lab";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                res1 = profesor.InsertarlogauditPos(documento, datosasigna, texto, idasig, carnet, notanva, campo, codgrupo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, grupo, codgrupo, tercio, carnet, notas4, notanva, operacion, texto);
                try {
                    smtp = "smtp.office365.com";
                    MimeMultipart multipart = new MimeMultipart();
                    Properties properties = new Properties();
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");
                    properties.put("mail.smtp.host", smtp);
                    properties.put("mail.smtp.port", "587");
                    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(correo, clave);
                        }
                    });
                    String asunto = "Modificación de Notas Tercio 4- " + codasig;
                    session.setDebug(true);
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(correo));
                    msg.setRecipients(Message.RecipientType.BCC, correo);
                    msg.setSubject(asunto);
                    msg.setSentDate(new Date());
                    texto = Datos + "\n\n";
                    msg.setText(texto);
                    Transport.send(msg);
                    mensaje = "ok";
                } catch (Exception e) {
                    mensaje = "error: " + e.getMessage();
                }

                if (res <= 0) {
                    error = error + 1;
                }
            } else if ((tercio.equals("5") && notanva != null && nivel.equals("PRE"))) {
                Datos = Datos + "Estudiante: " + nombre + "\n\n" + "Nota Anterior: " + notas5 + "\n\n" + "Nueva Nota: " + notanva + "\n\n" + "Fecha: " + cadenaFecha + "\n\n";
                datosasigna = (idasig + "-" + grupo + "-" + tercio + "-" + carnet + "-" + notas5 + "-" + notanva);
                res = profesor.IngresaNotas("nota4", grupo, carnet, notanva);
                String campo = "nota4";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, grupo, carnet, notanva, campo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, grupo, codgrupo, tercio, carnet, notas5, notanva, operacion, texto);
                try {
                    smtp = "smtp.office365.com";
                    MimeMultipart multipart = new MimeMultipart();
                    Properties properties = new Properties();
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");
                    properties.put("mail.smtp.host", smtp);
                    properties.put("mail.smtp.port", "587");
                    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(correo, clave);
                        }
                    });
                    String asunto = "Modificación de Notas - " + codasig;
                    session.setDebug(true);
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(correo));
                    msg.setRecipients(Message.RecipientType.BCC, correo);
                    msg.setSubject(asunto);
                    msg.setSentDate(new Date());
                    texto = Datos + "\n\n";
                    msg.setText(texto);
                    Transport.send(msg);
                    mensaje = "ok";
                } catch (Exception e) {
                    mensaje = "error: " + e.getMessage();
                }
                if (res <= 0) {
                    error = error + 1;
                }
            } else if ((tercio.equals("5") && notanva != null && nivel.equals("POST"))) { //modificar posgrado
                Datos = Datos + "Estudiante: " + nombre + "\n\n" + "Nota Anterior: " + notas5 + "\n\n" + "Nueva Nota: " + notanva + "\n\n" + "Fecha: " + cadenaFecha + "\n\n";
                datosasigna = (idasig + "-" + grupo + "-" + tercio + "-" + carnet + "-" + notas5 + "-" + notanva);
                res = profesor.IngresaNotasPregradoPOS("nota4", codgrupo, carnet, clanum, idasig, notanva);
                String campo = "nota4";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                res1 = profesor.InsertarlogauditPos(documento, datosasigna, texto, idasig, carnet, notanva, campo, codgrupo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, grupo, codgrupo, tercio, carnet, notas5, notanva, operacion, texto);
                try {
                    smtp = "smtp.office365.com";
                    MimeMultipart multipart = new MimeMultipart();
                    Properties properties = new Properties();
                    properties.put("mail.smtp.auth", "true");
                    properties.put("mail.smtp.starttls.enable", "true");
                    properties.put("mail.smtp.host", smtp);
                    properties.put("mail.smtp.port", "587");
                    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(correo, clave);
                        }
                    });
                    String asunto = "Modificación de Notas - " + codasig;
                    session.setDebug(true);
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(correo));
                    msg.setRecipients(Message.RecipientType.BCC, correo);
                    msg.setSubject(asunto);
                    msg.setSentDate(new Date());
                    texto = Datos + "\n\n";
                    msg.setText(texto);
                    Transport.send(msg);
                    mensaje = "ok";
                } catch (Exception e) {
                    mensaje = "error: " + e.getMessage();
                }

                if (res <= 0) {
                    error = error + 1;
                }
            }

            if (tercio.equals("1")) {
                sumas = profesor.IngresaAcumModPrePos("nota1", idgrupoPRE, idasig, grupo, periodo);
                if (sumas.size() > 0) {
                    for (int i = 0; i < sumas.size(); i++) {
                        Vector dato = (Vector) sumas.elementAt(i);

                        String datos = dato.elementAt(0).toString();
                        if (!datos.equals("No disponible")) {
                            int dato1 = Integer.parseInt(datos);
                            if (i == 0) {
                                total1 = dato1;
                            } else {
                                total1 = dato1 + total1;
                            }

                        }
                    }

                }
                /*    int not1 = Integer.parseInt(notas1);
                int notnva = Integer.parseInt(notanva);
                int sumas = Integer.parseInt(s1);
                int nvasuma = (sumas - not1 + notnva);
                suma = String.valueOf(nvasuma).toString();*/

                res = profesor.IngresaAcumMod("s1", total1, idgrupoPRE, idasig);
                if (res <= 0) {
                    descerror[error] = "ErrorIngre1";
                    error = error + 1;
                }
            } else if ((tercio.equals("2"))) {
                sumas = profesor.IngresaAcumModPrePos("nota2", idgrupoPRE, idasig, grupo, periodo);
                if (sumas.size() > 0) {
                    for (int i = 0; i < sumas.size(); i++) {
                        Vector dato = (Vector) sumas.elementAt(i);

                        String datos = dato.elementAt(0).toString();
                        if (!datos.equals("No disponible")) {
                            int dato1 = Integer.parseInt(datos);
                            if (i == 0) {
                                total1 = dato1;
                            } else {
                                total1 = dato1 + total1;
                            }

                        }
                    }

                }
                res = profesor.IngresaAcumMod("s2", total1, idgrupoPRE, idasig);
                if (res <= 0) {
                    descerror[error] = "ErrorIngre2";
                    error = error + 1;
                }
            } else if ((tercio.equals("3"))) {
                sumas = profesor.IngresaAcumModPrePos("nota3", idgrupoPRE, idasig, grupo, periodo);
                if (sumas.size() > 0) {
                    for (int i = 0; i < sumas.size(); i++) {
                        Vector dato = (Vector) sumas.elementAt(i);

                        String datos = dato.elementAt(0).toString();
                        if (!datos.equals("No disponible")) {
                            int dato1 = Integer.parseInt(datos);
                            if (i == 0) {
                                total1 = dato1;
                            } else {
                                total1 = dato1 + total1;
                            }

                        }
                    }

                }
                res = profesor.IngresaAcumMod("s3", total1, idgrupoPRE, idasig);
                if (res <= 0) {
                    descerror[error] = "ErrorIngre3";
                    error = error + 1;
                }
            } else if ((tercio.equals("4"))) {
                sumas = profesor.IngresaAcumModPrePos("nota_lab", idgrupoPRE, idasig, grupo, periodo);
                if (sumas.size() > 0) {
                    for (int i = 0; i < sumas.size(); i++) {
                        Vector dato = (Vector) sumas.elementAt(i);

                        String datos = dato.elementAt(0).toString();
                        if (!datos.equals("No disponible")) {
                            int dato1 = Integer.parseInt(datos);
                            if (i == 0) {
                                total1 = dato1;
                            } else {
                                total1 = dato1 + total1;
                            }

                        }
                    }
                }
                res = profesor.IngresaAcumMod("sl", total1, idgrupoPRE, idasig);
                if (res <= 0) {
                    descerror[error] = "ErrorIngre4";
                    error = error + 1;
                }
            } else if ((tercio.equals("5"))) {
                sumas = profesor.IngresaAcumModPrePos("nota4", idgrupoPRE, idasig, grupo, periodo);
                if (sumas.size() > 0) {
                    for (int i = 0; i < sumas.size(); i++) {
                        Vector dato = (Vector) sumas.elementAt(i);

                        String datos = dato.elementAt(0).toString();
                        if (!datos.equals("No disponible")) {
                            int dato1 = Integer.parseInt(datos);
                            if (i == 0) {
                                total1 = dato1;
                            } else {
                                total1 = dato1 + total1;
                            }

                        }
                    }

                }
                res = profesor.IngresaAcumMod("s4", total1, idgrupoPRE, idasig);
                if (res <= 0) {
                    descerror[error] = "ErrorIngre5";
                    error = error + 1;
                }
            }

            empleado.limpiaVariables();
            if (error == 0) {
                if (tercio.equals("1") || (tercio.equals("2")) || (tercio.equals("3")) || (tercio.equals("4") || (tercio.equals("5")))) {
                    idgrupo = (grupo + "|" + codasig + "|" + codgrupo + "|" + nomasig + "|" + idasig + "|" + seguim);
                    response.sendRedirect("Mensajes?idmsj=11&tercio=" + tercio + "&idgrupo=" + idgrupo + "&clavenume=" + clanum + "&rbopciones=" + rbopciones + "&periodo="+periodo);

                } else {
                    response.sendRedirect("Mensajes?idmsj=2");
                }
            } else {
                out.println("Ha ocurrido un error, por favor comuníquese con la oficina de registro académico ");
            }
        } else {
            out.println("Ha ocurrido un error, no hay registros");
        }
        out.println("</body>");
        out.println("</html>");
    }

    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
