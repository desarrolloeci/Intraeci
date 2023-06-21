/*
 * enviarMail.java
 *
 * Created on 2 de febrero de 2007, 04:09 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package otros;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Vector;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/**
 *
 * @author 
 */
public class enviarMail {

    /** Creates a new instance of enviarMail */
    public enviarMail() {
    }

    /*  public String enviar(String to, String asunto, String texto, String cc, String from, String peracad, String extfr, final String clave) throws Exception{
    //      String host = "smtp1.escuelaing.edu.co";
    String host = "smtp.office365.com";
    String mensaje = "Mensaje Enviado";
    Vector despestud = new Vector();
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
    final String origen;
    origen = from +  "@escuelaing.edu.co";
    //Vector listaestud = profesor.getListaNotas(to, peracad);
    Vector listaestud = profesor.getListaEnviarCorreo(to, peracad);
    //String filename = new String("C:\\Sun\\correo");
    String filename = new String("/usr/local/SUN/correo");
    int i = 0, j=0;
    eci.BackupAdmin lista = new eci.BackupAdmin(origen, filename);
    //    try{


    MimeMultipart multipart = new MimeMultipart();
    Properties properties = new Properties();
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.host", host);
    properties.put("mail.smtp.port", "587");
    Session session = Session.getInstance(properties,new javax.mail.Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication(origen, clave);
    }
    });
    session.setDebug(true);

    // Properties prop = new Properties();

    // prop.put("mail.smtp.host", host);

    Session ses1 = Session.getDefaultInstance(properties, null);
    MimeMessage msg = new MimeMessage(ses1);
    msg.setFrom(new InternetAddress(origen.trim() ));
    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(origen.trim() ));
    for(int h=0; h < listaestud.size(); h++){
    despestud = (Vector)listaestud.elementAt(h);
    if(!despestud.elementAt(8).toString().contains("@"))
    msg.addRecipient(Message.RecipientType.BCC, new InternetAddress(despestud.elementAt(8) + "@mail.escuelaing.edu.co"));
    }
    msg.setSubject(asunto);
    if(lista.nArchivos()>0){
    BodyPart msgBP = new MimeBodyPart();
    msgBP.setText(texto);
    Multipart mpart = new MimeMultipart();
    mpart.addBodyPart(msgBP);
    for (j=0 ; j < lista.nArchivos() ; j++ ){
    msgBP = new MimeBodyPart();
    DataSource src = new FileDataSource(filename + "/" + origen + "/" + lista.nomArchivo(j));
    msgBP.setDataHandler(new DataHandler(src));
    msgBP.setFileName(lista.nomArchivo(j));
    mpart.addBodyPart(msgBP);
    msg.setContent(mpart);
    }
    //lista.totArchivo();
    }else{
    msg.setText(texto);
    }

    try {

    // MimeMessage msg = new MimeMessage(session);
    msg.setFrom(new InternetAddress(origen));
    msg.setRecipients(Message.RecipientType.BCC,new InternetAddress(origen.trim()));
    //msg.setRecipients(Message.RecipientType.CC, copia);
    msg.setSubject(asunto);
    msg.setSentDate(new Date());

    // BODY

    Transport.send(msg);
    mensaje = "ok";

    //Transport.send(msg);
    //mensaje = "ok";
    } catch (Exception e) {
    mensaje = "error: " + filename + "/" + from + "/" + " ---- " + e.getMessage();
    * 
    }
    return mensaje;
    //return enviarprueba();
    }*/
    public String enviar(String to, String asunto, String texto, String cc, String from, String peracad, String extfr, final String clave, String numgrupo) throws Exception {
        
        
        
        String host = "smtp1.escuelaing.edu.co";
        //String host = "secundariapla.ecidomo.escuelaing.edu.co";
        String mensaje = "Mensaje Enviado";
        Vector despestud = new Vector();
        String destino = "";
        final String origen = from + "@escuelaing.edu.co";
        // final String origen ="lucero.rodriguez@escuelaing.edu.co";
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        String smtp;
        
  
        Vector listaestud = profesor.getListasClase(peracad,to,numgrupo);
      //MANDA ID DEL GRUPO EN TO Vector listaestud1 = profesor.getListaEnviarCorreo(to, peracad);
        //String filename = new String("C:\\Sun\\correo");
        String filename = new String("/usr/local/SUN/correo");
        int i = 0, j = 0;
        
        eci.BackupAdmin lista = new eci.BackupAdmin(from, filename);
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
                    return new PasswordAuthentication(origen, clave);
                }
            });
            session.setDebug(true);
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(origen));
            msg.setRecipients(Message.RecipientType.BCC, origen);
            //msg.setRecipients(Message.RecipientType.TO, new InternetAddress(from.trim() + extfr));
            for (int h = 0; h < listaestud.size(); h++) {
                despestud = (Vector) listaestud.elementAt(h);
                if ((!destino.contains(despestud.elementAt(8).toString()+ "@mail.escuelaing.edu.co"))&&(!despestud.elementAt(8).toString().contains("@"))&&!((despestud.elementAt(8).toString().equals(""))||(despestud.elementAt(8).toString().equals("No disponible")))) {
                    destino = destino + despestud.elementAt(8) + "@mail.escuelaing.edu.co,";
                }
                // msg.setRecipients(Message.RecipientType.BCC, "luis.salas@mail.escuelaing.edu.co");
                // msg.setRecipients(Message.RecipientType.BCC, despestud.elementAt(8) + "@mail.escuelaing.edu.co,");
            }
            destino = destino + origen;
            //destino=destino+ "lucero.rodriguez@escuelaing.edu.co";

            msg.setRecipients(Message.RecipientType.BCC, destino);

           // msg.setSubject(asunto, "UTF-8");
             msg.setSubject(asunto);
            msg.setSentDate(new Date());
            if (lista.nArchivos() > 0) {
                BodyPart msgBP = new MimeBodyPart();
                msgBP.setText(texto);
                Multipart mpart = new MimeMultipart();
                mpart.addBodyPart(msgBP);
                for (j = 0; j < lista.nArchivos(); j++) {
                    msgBP = new MimeBodyPart();
                    DataSource src = new FileDataSource(filename + "/" + from + "/" + lista.nomArchivo(j));
                    msgBP.setDataHandler(new DataHandler(src));
                    msgBP.setFileName(lista.nomArchivo(j));
                    mpart.addBodyPart(msgBP);
                    msg.setContent(mpart);
                }
                //lista.totArchivo();
            } else {
               // msg.setText(texto, "UTF-8");
                 msg.setText(texto);

            }
            Transport.send(msg);
            mensaje = "ok";
        } catch (Exception e) {
            mensaje = "error: " + filename + "/" + from + "/" + " ---- " + e.getMessage();
        }
        return mensaje;
        //return enviarprueba();
    }

    public String enviarInst(String to, String asunto, String texto, String from, String exto, String extfr, String pags_cops, String log) throws Exception {
        //  String host = "smtp1.escuelaing.edu.co";
        String host = "mail.office365.com";
        String mensaje = "Mensaje Enviado";
        //String filename = "C:\\Sun\\correo";
        String filename = new String("/usr/local/SUN/correo");
        eci.BackupAdmin lista = new eci.BackupAdmin(from, filename);
        int i = 0, j = 0;
        try {
            Properties prop = new Properties();
            prop.put("mail.smtp.host", host);
            Session ses1 = Session.getDefaultInstance(prop, null);
            MimeMessage msg = new MimeMessage(ses1);
            msg.setFrom(new InternetAddress(from.trim() + extfr));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to.trim() + exto));
            msg.setSubject(asunto);
            if (lista.nArchivos() > 0) {
                BodyPart msgBP = new MimeBodyPart();
                msgBP.setText(texto);
                Multipart mpart = new MimeMultipart();
                mpart.addBodyPart(msgBP);
                for (j = 0; j < lista.nArchivos(); j++) {
                    msgBP = new MimeBodyPart();
                    DataSource src = new FileDataSource(filename + "/" + from + "/" + lista.nomArchivo(j));
                    msgBP.setDataHandler(new DataHandler(src));
                    msgBP.setFileName(lista.nomArchivo(j));
                    mpart.addBodyPart(msgBP);
                    msg.setContent(mpart);
                }
                lista.totArchivo();
            } else {
                msg.setText(texto);
            }
            if (log.equals("log")) {
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy'-'hh:mm:ss");
                Date currentTime_1 = new Date();
                String dateString = formatter.format(currentTime_1);
                ParsePosition pos = new ParsePosition(0);
                Date currentTime_2 = formatter.parse(dateString, pos);
                // FileWriter arch = new FileWriter("C:\\Sun\\AppServer\\config\\logimpre.log", true);
                FileWriter arch = new FileWriter("/usr/local/SUN/config/logimpre.log", true);
                BufferedWriter arch1 = new BufferedWriter(arch);
                PrintWriter entrada = new PrintWriter(arch1);
                String fec = (String) from + "," + (String) dateString + "," + pags_cops;
                entrada.println(fec);
                //entrada.println(cadena);
                entrada.close();
                arch.close();
            }
            Transport.send(msg);
            mensaje = from;
        } catch (Exception e) {
            mensaje = "error";// + lista.nArchivos() + ": " + e.getMessage();
        }
        return mensaje;
    }

    public String enviarprueba() throws Exception {
        String host = "smtp1.escuelaing.edu.co";
        //  String host = "mail.office365.com";
        String to = "aguiza@escuelaing.edu.co";
        Properties prop = new Properties();
        prop.put("mail.smtp.host", host);
        Session ses1 = Session.getDefaultInstance(prop, null);
        //Store store1 = ses1.getStore("pop3");
        MimeMessage msg = new MimeMessage(ses1);
        msg.setFrom(new InternetAddress("aguiz@escuelaing.edu.co"));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        msg.setSubject("Hola Mundo");
        msg.setText("Mundo Hola");
        Transport.send(msg);
        return "MENSAJE ENVIADO";


        /*String host = "smtp.escuelaing.edu.co";
        //String host = "190.24.150.69";
        String mensaje = "Mensaje Enviado";
        Properties prop = new Properties();
        prop.put("mail.smtp.host", host);
        Session ses1 = Session.getDefaultInstance(prop, null);
        MimeMessage msg = new MimeMessage(ses1);
        msg.setFrom(new InternetAddress("aguiza@escuelaing.edu.co"));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress("aguiza@escuelaing.edu.co"));
        msg.setSubject("Hola Mundo");
        msg.setText("Mundo Hola");
        Transport.send(msg);
        return mensaje;*/
    }
}
