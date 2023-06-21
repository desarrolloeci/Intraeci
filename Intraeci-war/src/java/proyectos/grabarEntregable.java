/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos;

import BDintraeci.BDproyectoRemote;
import inicio.conectaEJB;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.RemoteException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Juan Pablo Garcia
 */
public class grabarEntregable extends HttpServlet {

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
            out.println("<title>Servlet guardaEntregable</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet guardaEntregable at " + request.getContextPath () + "</h1>");
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
                resultado = guardeEntregable(request, proyecto);
                res = res + "<dato>0</dato>";
            } else if (oper.equals(INSERTAR)) {
                resultado = creeEntregable(request, proyecto);
                res = res + "<dato>" + resultado + "</dato>";
            }
            res = res + "<valor>Operación Exitosa</valor>";
        } catch (Exception e) {
            res = res + "<valor>Fallo en la Operación + " + e.getMessage() + "</valor>";
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

    private int guardeEntregable(HttpServletRequest request, BDproyectoRemote proyecto) throws Exception {
        String nombre = (String) request.getParameter("nomEnt");
        String fechaInicio = (String) request.getParameter("fecIniEnt");
        String fechaFin = (String) request.getParameter("fecFinEnt");
        String estado = (String) request.getParameter("estEnt");
        String descripcion = (String) request.getParameter("descEnt");
        String responsable = (String) request.getParameter("respInt");
        String centroCosto = (String) request.getParameter("ccoseInt");
        String ingresos = (String) request.getParameter("ingEntre");
        String gastosPer = (String) request.getParameter("gpEntre");
        String otros = (String) request.getParameter("ogEntre");
        String inversion = (String) request.getParameter("invEntre");
        return proyecto.salEntregable(nombre, fechaInicio, fechaFin, descripcion, estado, responsable, centroCosto, ingresos, gastosPer, otros, inversion);
    }

    private int creeEntregable(HttpServletRequest request, BDproyectoRemote proyecto) throws Exception {
        String nombre = (String) request.getParameter("nomEnt");
        String responsable = (String) request.getParameter("respInt");
        String centroCosto = (String) request.getParameter("ccoseInt");
        String fechaInicio = (String) request.getParameter("fecIniEnt");
        String fechaFin = (String) request.getParameter("fecFinEnt");
        String descripcion = (String) request.getParameter("descEnt");
        String estado = (String) request.getParameter("estEnt");
        String ingresos = (String) request.getParameter("ingEntre");
        String gastosPer = (String) request.getParameter("gpEntre");
        String otros = (String) request.getParameter("ogEntre");
        String inversion = (String) request.getParameter("invEntre");
        return proyecto.insertEntregable(nombre, responsable, centroCosto, fechaInicio, fechaFin, descripcion, estado, ingresos, gastosPer, otros, inversion);
    }
}
