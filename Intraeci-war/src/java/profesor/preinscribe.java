/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Vector;
import java.util.Date;

/**
 *
 * @author lrodriguez
 */
public class preinscribe extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        sesion = request.getSession(true);
        login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) sesion.getAttribute("empleado");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        Vector adiciona = new Vector();
        Vector datos = new Vector();
        String valor = new String();
        String valores = new String();
        String check = new String();
        String flag = new String();
        String variable = new String();
        String cadena = "marcar";
        String cadena2 = "codasig";
        String cadena1 = "check";
        java.util.Date fecha = new Date();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet preinscripcion</title>");
        out.println("</head>");
        out.println("<body>");
        String carnet = request.getParameter("carnet");
        String nombre = request.getParameter("nombre");
        String codasig[] = new String[10];
        String flag1 = "0";
        String mensaje= "";
        //getPerAcadPreins();
        String peracadpreins = empleado.getperAcadPreins();
        //out.println(peracadpreins);
        adiciona = profesor.Preinscripcion(carnet);
        int actualiza = 0;
        int actualiza1 = 0;
        if (adiciona.size() > 0) {
            for (int i = 0; i < adiciona.size(); i++) {

                Vector asignatura = (Vector) adiciona.elementAt(i);
                flag = String.valueOf(i);
                variable = (String) cadena.concat(flag);
                valor = request.getParameter(variable);
                if (valor != null) {
                    flag1 = "1";
                } else if (valor == null) {

                    flag1 = "0";
                    flag = String.valueOf(i);
                    variable = (String) cadena2.concat(flag);
                    valor = request.getParameter(variable);

                }
                datos = profesor.Preinscripcionprim(peracadpreins);
                if (datos.size() > 0) {
                    actualiza = profesor.preinsprim(flag1, carnet, valor);
                    actualiza1 = profesor.preins(flag1, carnet, valor);

                } else {
                    actualiza1 = profesor.preins(flag1, carnet, valor);
                }
            }
            if (actualiza1 > 0) {
                 mensaje = "Los datos han sido actualizados";
                response.sendRedirect("Preinscripcion?carnet=" + carnet + "&nombre=" + nombre + "&perinsc=" + peracadpreins + "&mensaje=" + mensaje);
            } else {
                out.println("Ha ocurrido un error, y los datos no han sido actualizados");
            }
        }
    }
}
