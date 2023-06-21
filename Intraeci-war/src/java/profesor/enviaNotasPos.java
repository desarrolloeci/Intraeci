/*
 * enviaNotasPos.java
 *
 * Created on 11 de diciembre de 2006, 11:05 AM
 */
package profesor;

import java.io.*;
import java.net.*;
import java.util.Vector;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author alexgz
 * @version
 */
public class enviaNotasPos extends HttpServlet {

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
        out.println("<title>Servlet enviaNotasPos</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet enviaNotasPos at " + request.getContextPath () + "</h1>");
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
        HttpSession sesion;
        int res, error;
        String cadena = "nota";
        sesion = request.getSession(true);
        String descerror[] = new String[5];
        Vector estudiantes = new Vector();
        String notaEst = new String();
        String nota = new String();
        String variable = new String();
        String id_grupo = new String();
        String idgrupo = request.getParameter("idgrupo");
        String idasig = request.getParameter("idasig");
        String suma = request.getParameter("suma");
        String grupo = request.getParameter("grupo");
        String nivel = "";
        login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) sesion.getAttribute("empleado");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Notas</title>");
        out.println("</head>");
        out.println("<body>");
        estudiantes = empleado.getEstudiantes();
        error = 0;
        if (estudiantes.size() > 0) {
            for (int i = 0; i < estudiantes.size(); i++) {
                Vector estudiante = (Vector) estudiantes.elementAt(i);
                nota = String.valueOf(i);
                variable = (String) cadena.concat(nota);
                notaEst = request.getParameter(variable);
                nivel = estudiante.elementAt(16).toString();
                id_grupo = estudiante.elementAt(18).toString();
                if (notaEst != null && nivel.equals("POST")) {
                    res = profesor.IngresaNotasPosgrado(notaEst, idgrupo, estudiante.elementAt(6).toString(), suma, idasig);

                    if (res <= 0) {
                        descerror[error] = String.valueOf(i);
                        error = error + 1;
                    }
                } else if (notaEst != null && nivel.equals("PRE")) {
                    res = profesor.IngresaNotasPosgradoPRE(id_grupo, estudiante.elementAt(6).toString(), notaEst);

                }
            }
            empleado.limpiaVariables();
            if (error == 0) {
                response.sendRedirect("Mensajes?idmsj=3&grupo=" + grupo);
            } else {
                out.println("Ha ocurrido un error, errores: " + descerror);
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
