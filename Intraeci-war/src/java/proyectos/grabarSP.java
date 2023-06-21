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
 * @author jgarcia
 */
public class grabarSP extends HttpServlet {

    public static final String GUARDAR = "1";
    public static final String INSERTAR = "2";
    public static final String ELIMINAR = "3";
    public static final String GUARDARDEDICAION = "4";
    public static final String GUARDAROBSERVACIONES = "5";
    public static final String INSERTARDEDICAION = "6";
    public static final String ELIMINARDEDICAION = "7";

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
            out.println("<title>Servlet grabarSP</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet grabarSP at " + request.getContextPath () + "</h1>");
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
        oper = (String) request.getParameter("tp");
        HttpSession sesion = request.getSession(false);
        BDproyectoRemote proyecto = (BDproyectoRemote) sesion.getAttribute("proyecto");
        res = "<resultado>";
        try {
            if (oper.equals(GUARDAR)) {
                resultado = guardeSeguimiento(request, proyecto);
                res = res + "<dato>0</dato>";
            } else if (oper.equals(GUARDARDEDICAION)) {
                resultado = guardeDedicacion(request, proyecto);
                res = res + "<dato>" + resultado + "</dato>";
            } else if (oper.equals(INSERTARDEDICAION)) {
                resultado = proyecto.insertDediSegui(request.getParameter("recurInt"));
                res = res + "<dato>" + resultado + "</dato>";
            } else if (oper.equals(ELIMINARDEDICAION)) {
                resultado = proyecto.deleteDediSegui(request.getParameter("id"));
                res = res + "<dato>" + request.getParameter("id") + "</dato>";
            } else if (oper.equals(GUARDAROBSERVACIONES)) {
                resultado = proyecto.salObservacionesSegui(request.getParameter("obsvDir"));
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

    private int guardeSeguimiento(HttpServletRequest request, BDproyectoRemote proyecto)
            throws IOException, Exception {
        String tipo = (String) request.getParameter("tipo");
        String eta = (String) request.getParameter("etas" + tipo);
        String res = (String) request.getParameter("ress" + tipo);
        String est = (String) request.getParameter("estsInt" + tipo);
        String sem = (String) request.getParameter("alertaInt" + tipo);
        String ing = (String) request.getParameter("ing" + tipo);
        String gasp = (String) request.getParameter("gper" + tipo);
        String ogas = (String) request.getParameter("otrg" + tipo);
        String inv = (String) request.getParameter("inv" + tipo);
        String accionTomar = (String) request.getParameter("aciTom" + tipo);
        String soporte = (String) request.getParameter("sopor" + tipo);
        String avance = (String) request.getParameter("avanceInt" + tipo);
        String obsv = (String) request.getParameter("obsvDir" + tipo);
        return proyecto.salSeguimiento(eta, res, est, sem, ing, gasp, ogas, inv, accionTomar, soporte, tipo, avance, obsv);
    }

    private int guardeDedicacion(HttpServletRequest request, BDproyectoRemote proyecto) throws Exception {
        int res = 0;
        String temp = request.getParameter("listaDedicacion");
        String[] listaDedicacion = temp.split("-"), valor;
        for (int i = 0; i < listaDedicacion.length; i++) {
            valor = listaDedicacion[i].split("_");
            res = res + proyecto.salDediSeguim(valor[0], valor[1]);
        }
        return res;
    }
}
