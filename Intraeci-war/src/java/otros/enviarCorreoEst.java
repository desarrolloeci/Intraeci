
/*
 * enviarCorreoEst.java
 *
 * Created on 12 de febrero de 2007, 09:08 AM
 */
package otros;

import java.io.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.util.Properties;
import javax.swing.Timer;

/**
 *
 * @author 
 * @version
 */
public class enviarCorreoEst extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
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
         out.println("<title>Servlet enviarCorreoEst</title>");
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet enviarCorreoEst at " + request.getContextPath () + "</h1>");
         out.println("</body>");
         out.println("</html>");
         */
        out.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion;
        sesion = request.getSession(true);
        PrintWriter out = response.getWriter();
        otros.enviarMail enviar = new otros.enviarMail();
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) sesion.getAttribute("empleado");

        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        String codimpre;
        empleado.setPath("correo");
        //String destino = new String("e2037452");
        //String destino = request.getParameter("paragrupo");
        String codasig = request.getParameter("codasig");
        String asunto = request.getParameter("asunto");
        String grupo = request.getParameter("grupo");
        String texto = request.getParameter("texto");
        
        
        

        String idprof = empleado.getIdProf();
        String clave = (String) sesion.getAttribute("clave");

        //out.println(clave);
        sesion.setAttribute("clave", clave);
        

        //String cc = request.getParameter("cc");
        String respuesta = new String();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Enviar Correo</title>");
        out.println("</head>");
        out.println("<body>");
        // + "  (" + codasig + "-" + grupo + ")"
        // + "  (" + separa[1] + "-" + separa[2] + ")"
        /*empleado.getPerHorario()->*/
        String separa[] = new String[5000];
        String [] cursosCorreo = request.getParameterValues("cursosEnviar");
        String idgrupo;
        String idasig;
        String numgrupo;
        String nomasig;
        StringTokenizer st;
        try {
            Boolean huboError=false;
            for (int i=0; i<cursosCorreo.length && !huboError; i++) {
                st = new StringTokenizer(cursosCorreo[i], "|");
                int k = 0;
                while (st.hasMoreTokens()) {
                    separa[k] = st.nextToken();
                    k = k + 1;
                }
                idgrupo = separa[0];
                idasig = separa[1];
                numgrupo = separa[2];
                nomasig = separa[3];
                //ANTESrespuesta = enviar.enviar(idgrupo, asunto, texto, "", empleado.getUsrExchange(), empleado.getPerHorario(), "@escuelaing.edu.co", clave, numgrupo);
                String asuntotmp= asunto+" "+nomasig+" - "+numgrupo;
                respuesta = enviar.enviar(idasig, asuntotmp, texto, "", empleado.getUsrExchange(), empleado.getPerHorario(), "@escuelaing.edu.co", clave, numgrupo);
               
                
                
                //respuesta = enviar.enviarprueba();
                if (!respuesta.equals("ok")) {
                    huboError=true;
                } else {
                    int res = profesor.LogEnviaCorreo(idprof, idasig, idgrupo, asunto);
                }
            }
            //eci.BackupAdmin lista = new eci.BackupAdmin(empleado.getUsrname(), "C:/Sun/correo");
            eci.BackupAdmin lista = new eci.BackupAdmin(empleado.getUsrname(), "/usr/local/SUN/correo");
            lista.totArchivo();
            empleado.setTextoCorreo("");
            if(huboError){
                out.println("Ha ocurrido un error al enviar el correo.<br>Revise si el "
                        + "archivo adjunto existe<br>Intente luego o h&aacute;galo a través de la página "
                        + "<a href=\"\" onclick=\"window.open('http://correo.escuelaing.edu.co','',"
                        + "'width=650,height=450, toolbar=yes,scrollbars=yes,location=yes,directories=yes,"
                        + "status=yes,menubar=yes,resizable=no');return false\">correo.escuelaing.edu.co</a></font></b></font></p>");
                out.println(respuesta);
            }
            response.sendRedirect("Mensajes?idmsj=6");
        } catch (Exception e) {
            out.println("No se pudo enviar el correo: " + e.getMessage());
        }
        //sesionMail = request.getSession(false);
        out.println("</body>");
        out.println("</html>");
    }

    /**
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
