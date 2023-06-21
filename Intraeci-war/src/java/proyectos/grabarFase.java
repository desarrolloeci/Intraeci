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
public class grabarFase extends HttpServlet {

    public static final String GUARDAR = "1";
    public static final String INSERTAR = "2";
    public static final String ELIMINAR = "3";
    public static final String PROMOVER = "4";

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
            out.println("<title>Servlet grabarFase</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet grabarFase at " + request.getContextPath () + "</h1>");
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
                resultado = guardeFase(request, proyecto);
                res = res + "<dato>0</dato>";
            } else if (oper.equals(INSERTAR)) {
                resultado = creeFase(request, proyecto);
                res = res + "<dato>" + resultado + "</dato>";
            } else if (oper.equals(PROMOVER)) {
                resultado = proyecto.setPromFase(request.getParameter("caso"));
                res = res + "<dato>" + proyecto.getIdFase() + "</dato>";
            }
            res = res + "<valor>Operación Exitosa</valor>";
        } catch (Exception e) {
            res = res + "<valor>Fallo en la OperaciÃ³n " + e.getMessage() + "</valor>";
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

    private int guardeFase(HttpServletRequest request, BDproyectoRemote proyecto) throws Exception {
        String cCosto = (String) request.getParameter("ccosfInt");
        String nombre = (String) request.getParameter("nomFase");
        String numero = (String) request.getParameter("numFase");
        String descripcion = (String) request.getParameter("descFase");
        String ano = (String) request.getParameter("anFase");
        String mesInicio = (String) request.getParameter("miFase");
        String diaInicio = (String) request.getParameter("diFase");
        String mesFin = (String) request.getParameter("mfFase");
        String diaFin = (String) request.getParameter("dfFase");
        String gastoPerson = (String) request.getParameter("gpFase");
        String gastoOtros = (String) request.getParameter("ogFase");
        String inversion = (String) request.getParameter("invFase");
        String ingreso = (String) request.getParameter("ingFase");
        String estado = (String) request.getParameter("estFase");
        String caso = (String) request.getParameter("casoGuardar");
        return proyecto.salFase(nombre, numero, descripcion, ano, mesInicio, diaInicio, mesFin, diaFin, gastoPerson, gastoOtros, inversion, ingreso, estado, caso, cCosto);
    }

    private int creeFase(HttpServletRequest request, BDproyectoRemote proyecto) throws Exception {
        String nombre = (String) request.getParameter("nomFase");
        String numero = (String) request.getParameter("numFase");
        String descripcion = (String) request.getParameter("descFase");
        String ano = (String) request.getParameter("anFase");
        String mesInicio = (String) request.getParameter("miFase");
        String diaInicio = (String) request.getParameter("diFase");
        String mesFin = (String) request.getParameter("mfFase");
        String diaFin = (String) request.getParameter("dfFase");
        String gastoPerson = (String) request.getParameter("gpFase");
        String gastoOtros = (String) request.getParameter("ogFase");
        String inversion = (String) request.getParameter("invFase");
        String ingreso = (String) request.getParameter("ingFase");
        String estado = (String) request.getParameter("estFase");
        String control = (String) request.getParameter("contFase");
        String centroCostos = (String) request.getParameter("ccosfInt");
        return proyecto.insertFase(nombre, numero, descripcion, ano, mesInicio, diaInicio, mesFin, diaFin, gastoPerson, gastoOtros, inversion, ingreso, estado, control, centroCostos);
    }
}
