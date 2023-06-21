/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import login.InicioProfRemoteBusiness;

/**
 *
 * @author Lucero
 */
public class guardavotoscopasst extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet guardavotoscopasst</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet guardavotoscopasst at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String nomParam, P, nomcrp, codcrp, id, cadena = new String("P");;
        Integer opcion, tipo;
        Integer totCandi=0;
        if(request.getParameter("totCandi")!=null){
                totCandi=Integer.parseInt(request.getParameter("totCandi"));
        }
        
        nomcrp = request.getParameter("nomcrp");
        codcrp = request.getParameter("codcrp");
        String valor, valor1;
        String arreglo[] = new String[200];
        HttpSession sesion = request.getSession(true);
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        Object empleado = sesion.getAttribute("empleado");

        // login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");
        //inicio.conectaEJB conEjb = new inicio.conectaEJB();
        //BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        String cedula = ((InicioProfRemoteBusiness) empleado).getIdemp();

        String descerror[] = new String[5];
        java.util.Vector res2 = new java.util.Vector();
        res2 = admin.ConsultaVotoCopasst(cedula);
        String copasst = ((String) res2.elementAt(0));
        if (!copasst .equals("0")) {
            
            out.println("<table width=\"640\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"> ");
            out.println("<tr>");
            out.println("<td>");
            out.println("<img src=\"img/profesores_empleados.jpg\" width=\"793\" height=\"228\" border=\"0\" alt=\"\" >");
            out.println("</td>");
            out.println("</tr>");
            out.println("</table>");
            out.println("<center><h2>");
            out.println("Su voto ya se encuentra registrado, muchas gracias por su participación");
            out.println("<p>");
            out.println("</h2>");
            out.println("<p>");
            out.println("<a href=\"salir\"> SALIR&nbsp;&nbsp;&nbsp;");
            out.println("</a>");
            out.println("&nbsp;&nbsp;&nbsp; ");
            out.println("<a href=\"Menu?indice=1\"> REGRESAR");
            out.println("</center></h2>");

        } else {
            for (int i = 1; i <= totCandi; i++) {
                valor = String.valueOf(i);
                String variable = (String) cadena.concat(valor);
                arreglo[i] = request.getParameter(variable);
                // nvacadena = nvacadena + arreglo[i];
       /* if (res2.size() > 0) {

                 out.println("Su voto ya se encuentra registrado. Muchas gracias por su participación");
                 } else {*/
                //String vcd = ((String) res2.elementAt(0));
                // String vca = ((String) res2.elementAt(1));
                if (arreglo[i] != null) {
                    res = admin.ActualizaVotosCopasst(nomcrp, cedula);

                    int res1 = admin.InserVotoCopasst(codcrp, arreglo[i]);
                }
            }
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
            out.println("<a href=\"Menu?indice=1\"> REGRESAR");
            out.println("</center></h2>");

        }

    }
}
