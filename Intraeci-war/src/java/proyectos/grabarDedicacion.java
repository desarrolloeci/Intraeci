/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos;

import BDintraeci.BDproyectoRemote;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Juan Pablo Garcia
 */
public class grabarDedicacion extends HttpServlet {

    public static final String GUARDAR = "1";
    public static final String INSERTAR = "2";
    public static final String ELIMINAR = "3";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet grabarDesprendible</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet grabarDesprendible at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String oper, res;
        int resultado = 0;
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        BDproyectoRemote proyecto = (BDproyectoRemote) sesion.getAttribute("proyecto");
        oper = (String) request.getParameter("tp");
        res = "<resultado>";
        try {
            if (oper.equals(GUARDAR)) {
                resultado = guardeDedicacion(request, proyecto);
                res = res + "<dato>" + resultado + "</dato>";
            } else if (oper.equals(ELIMINAR)) {
                resultado = elimineDedicacion(request, proyecto);
                res = res + "<dato>" + resultado + "</dato>";
            } else if (oper.equals(INSERTAR)) {
                resultado = creeDedicacion(request, proyecto);
                res = res + "<dato>" + resultado + "</dato>";
            }
            res = res + "<valor>Operación Exitosa</valor>";
        } catch (Exception e) {
            res = res + "<valor>Fallo en la Operación " + e.getMessage() + "</valor>";
        }
        res = res + "</resultado>";
        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(res);
        pw.flush();
        pw.close();
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private int guardeDedicacion(HttpServletRequest request, BDproyectoRemote proyecto) throws Exception {
        String id = (String) request.getParameter("id");
        String horas = (String) request.getParameter("horTotRecurI" + id);
        String semanas = (String) request.getParameter("semRecurI" + id);
        String fechaInicio = (String) request.getParameter("fecIniRecurI" + id);
        String fechaFin = (String) request.getParameter("fecFinRecurI" + id);
        if (proyecto.salDedicacion(id, horas, semanas, fechaInicio, fechaFin) > 0) {
            return Integer.parseInt(id);
        } else {
            return -1;
        }
    }

    private int elimineDedicacion(HttpServletRequest request, BDproyectoRemote proyecto) throws Exception {
        String id = (String) request.getParameter("id");
        if (proyecto.deleteDedicacion(id) > 0) {
            return Integer.parseInt(id);
        } else {
            return -1;
        }
    }

    private int creeDedicacion(HttpServletRequest request, BDproyectoRemote proyecto) throws Exception {
        String recurso = (String) request.getParameter("recurInt");
        String unidad = (String) request.getParameter("uniRecurInt");
        String horas = (String) request.getParameter("horTotRecur");
        String semanas = (String) request.getParameter("semRecur");
        String fechaInicio = (String) request.getParameter("fecIniRecur");
        String fechaFin = (String) request.getParameter("fecFinRecur");
        String idEnt = (String) request.getParameter("idEnt");
        return proyecto.insertDedicacion(recurso, unidad, horas, semanas, fechaInicio, fechaFin, idEnt);
    }
}
