/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utiles;

import java.util.Date;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Juan Pablo Garcia
 */
/**
 * Clase java que recibe como parametros varios String, estos representan el
 * nombre del smtp del correo, la direccion a la que se envia el correo, la
 * direccion de quien lo envia y el asunto del mismo. Ademas un boleano que
 * indica si es o no formato html y un StringBuffer con el cuerpo del correo.
 * Posee el metodo send que envia el correo.
 */
public class Correo {

    private String origen, destino, error, smtp;
    private boolean envio;

    public Correo() {
        this.origen = "bpms@escuelaing.edu.co";
        this.destino = "lucero.rodriguez@escuelaing.edu.co";
        // this.smtp = "smtp1.escuelaing.edu.co";
        this.smtp = "smtp.office365.com";

        envio = false;
    }

    public boolean enviar(String asunto, String cuerpo) {
        /* MimeMultipart multipart = new MimeMultipart();
        Properties properties = new Properties();
        properties.put("mail.smtp.host", this.smtp);
        Session session = Session.getDefaultInstance(properties, null);
        session.setDebug(true);*/
        /*  try {
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(this.origen));
        msg.setRecipients(Message.RecipientType.TO, this.destino);

        msg.setSubject(asunto);
        msg.setSentDate(new Date());

        // BODY
        MimeBodyPart mbp = new MimeBodyPart();
        mbp.setText(cuerpo, "ISO-8859-1");
        multipart.addBodyPart(mbp);
        msg.setContent(multipart);
        Transport.send(msg);
        this.envio = true;
        } catch (Exception men) {
        this.error = "Problemas con el envio del correo " + men.getMessage();
        this.envio = false;
        }*/

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
                    return new PasswordAuthentication(origen, "bpms2014");
                }
            });

            session.setDebug(true);
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(origen));
            msg.setRecipients(Message.RecipientType.BCC, destino);
            msg.setSubject(asunto);
            msg.setSentDate(new Date());
            // texto = Datos + "\n\n";
            msg.setContent(multipart);
            msg.setText(cuerpo, "ISO-8859-1");
            Transport.send(msg);
            // mensaje = "ok";
        } catch (Exception e) {
            this.error = "Problemas con el envio del correo " + e.getMessage();
            this.envio = false;
        }
        return this.envio;
    }

    public String getMensaje() {
        return this.error;
    }
}
