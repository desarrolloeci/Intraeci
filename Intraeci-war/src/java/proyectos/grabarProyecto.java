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
public class grabarProyecto extends HttpServlet {

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
            out.println("<title>Servlet grabarProyecto</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet grabarProyecto at " + request.getContextPath () + "</h1>");
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
                resultado = guardeProyecto(request, proyecto);
                res = res + "<dato>0</dato>";
            } else if (oper.equals(INSERTAR)) {
                resultado = creeProyecto(request, proyecto);
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

    private int guardeProyecto(HttpServletRequest request, BDproyectoRemote proyecto) throws Exception {
        String nombre = (String) request.getParameter("nombre");
        String estado = (String) request.getParameter("estado");
        String fechaInicio = (String) request.getParameter("fecIni");
        String fechaFin = (String) request.getParameter("fecFin");
        String duracion = (String) request.getParameter("dur");
        String objetivo = (String) request.getParameter("objetivo");
        String justificacion = (String) request.getParameter("justificacion");
        String responsable = (String) request.getParameter("idResponsable");
        String gerente = (String) request.getParameter("idGerente");
        String tipo = (String) request.getParameter("tipo");
        String unidad = (String) request.getParameter("uniDirInt");
        String area = (String) request.getParameter("areaPresupInt");
        return proyecto.salProyecto(nombre, estado, fechaInicio, fechaFin, objetivo, justificacion, responsable, gerente, tipo, unidad, area, duracion);
    }

    private int creeProyecto(HttpServletRequest request, BDproyectoRemote proyecto) throws Exception {
        String estado = (String) request.getParameter("estado");
        String nombre = (String) request.getParameter("nombre");
        String tipo = (String) request.getParameter("tipo");
        String fechaInicio = (String) request.getParameter("fecIni");
        String fechaFin = (String) request.getParameter("fecFin");
        String duracion = (String) request.getParameter("dur");
        String objetivo = (String) request.getParameter("objetivo");
        String justificacion = (String) request.getParameter("justificacion");
        String responsable = (String) request.getParameter("idResponsable");
        String gerente = (String) request.getParameter("idGerente");
        String unidad = (String) request.getParameter("uniDirInt");
        String area = (String) request.getParameter("areaPresupInt");
        return proyecto.insertProyecto(estado, nombre, tipo, fechaInicio, fechaFin, duracion, objetivo, justificacion, responsable, gerente, unidad, area);
    }
}
