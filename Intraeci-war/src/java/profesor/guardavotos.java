/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import java.io.*;
import java.net.*;
import java.util.Vector;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Lucero
 */
public class guardavotos extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
        } finally {
            out.close();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int res, error;
        // HttpSession sesion = request.getSession();
        String nomParam, R1, nomcrp, codcrp, id;
        Integer opcion, tipo;

        R1 = request.getParameter("R1");
        nomcrp = request.getParameter("nomcrp");
        codcrp = request.getParameter("codcrp");


        HttpSession session = request.getSession(true);
        login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        String cedula = empleado.getIdemp();
        String clavenum = empleado.getClanum();
        String descerror[] = new String[5];
        Vector res2 = new Vector();
        res2 = profesor.ConsultaVoto(cedula);

        
        if (res2.size() <= 0) {
            
            out.println("Seleccione un candidato");
        } else {
            String vcd = ((String) res2.elementAt(0));
            String vca = ((String) res2.elementAt(1));

            if ((nomcrp.equals("vca")) && (vca.equals("0"))) {
                res = profesor.ActualizaVotos(nomcrp, cedula);
                int res1 = profesor.InserVoto(codcrp, R1);
                out.println("<table width=\"640\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"> ");
                out.println("<tr>");
                out.println("<td>");
                out.println("<img src=\"img/profesores_empleados.jpg\" width=\"793\" height=\"228\" border=\"0\" alt=\"\" >");
                out.println("</td>");
                out.println("</tr>");
                out.println("</table>");
                out.println("<center><h2>");
                out.println("Su voto ha sido registrado, muchas gracias por su participación");
                out.println("<p>");
                out.println("</h2>");
                out.println("<p>");
                out.println("</h2>");
                out.println("<a href=\"salir\"> SALIR&nbsp;&nbsp;&nbsp;");
                out.println("</a>");
                out.println("&nbsp;&nbsp;&nbsp; ");
                out.println("<a href=\"Votaciones?indice=1\"> REGRESAR");
                out.println("</center></h2>");
            } else if ((nomcrp.equals("vcd")) && (vcd.equals("0"))) {
                res = profesor.ActualizaVotos(nomcrp, cedula);
                int res1 = profesor.InserVoto(codcrp, R1);
                out.println("<table width=\"640\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"> ");
                out.println("<tr>");
                out.println("<td>");
                out.println("<img src=\"img/profesores_empleados.jpg\" width=\"793\" height=\"228\" border=\"0\" alt=\"\" >");
                out.println("</td>");
                out.println("</tr>");
                out.println("</table>");
                out.println("<center><h2>");
                out.println("Su voto ha sido registrado, muchas gracias por su participación");
                out.println("<p>");
                out.println("</h2>");
                out.println("<a href=\"salir\"> SALIR&nbsp;&nbsp;&nbsp;");
                out.println("</a>");
                out.println("&nbsp;&nbsp;&nbsp; ");
                out.println("<a href=\"Votaciones?indice=1\"> REGRESAR");

                out.println("</center></h2>");
            } else {
                out.println("<table width=\"640\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"> ");
                out.println("<tr>");
                out.println("<td>");
                out.println("<img src=\"img/profesores_empleados.jpg\" width=\"793\" height=\"228\" border=\"0\" alt=\"\" >");
                out.println("</td>");
                out.println("</tr>");
                out.println("</table>");
                out.println("<center><h2>");
                out.println("Usted ya votó para este cuerpo colegiado, muchas gracias por su participación");
                out.println("<p>");
                out.println("</h2>");
                out.println("<p>");
                out.println("<a href=\"salir\"> SALIR&nbsp;&nbsp;&nbsp;");
                out.println("</a>");
                out.println("&nbsp;&nbsp;&nbsp; ");
                out.println("<a href=\"Votaciones?indice=1\"> REGRESAR");
                out.println("</center></h2>");

            }


        }
    }
}
