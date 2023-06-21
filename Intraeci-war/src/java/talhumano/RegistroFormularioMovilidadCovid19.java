/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package talhumano;

import BDintraeci.EmpleadoRemote;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author andres.rojas
 */
public class RegistroFormularioMovilidadCovid19 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
            out.println("<title>Servlet RegistroFormularioMovilidadCovid19</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroFormularioMovilidadCovid19 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tip_id = request.getParameter("tip_id").trim();
        String documento = request.getParameter("documento").trim();
        String tipo_rol = request.getParameter("tipo_rol").trim();
        String nombres = request.getParameter("nombres").trim();
        String apellidos = request.getParameter("apellidos").trim();
        String genero = request.getParameter("genero").trim();
        String edad = request.getParameter("edad").trim();
        String cargo = request.getParameter("cargo").trim();
        String ciudad =request.getParameter("ciudad").trim();
        String direccion = request.getParameter("direccion").trim();
        String barrio = request.getParameter("barrio").trim();
        String inf_veridica = request.getParameter("inf_veridica").trim();
        String ind_acepta = request.getParameter("ind_acepta").trim();
        String hor_ing = request.getParameter("hor_ing").trim().replace(".", "");
        String hor_sal = request.getParameter("hor_sal").trim().replace(".", "");
        String modo_transp = request.getParameter("modo_transp").trim();
        String trab_remoto = request.getParameter("trab_remoto").trim();
        String[] dias_laborar = request.getParameterValues("dias_laborar");
        String[] dias_def = new String[7];
        for (int i = 0; i < dias_def.length; i++) {
            dias_def[i]="0";
        }
        for (int i = 0; i < dias_laborar.length; i++) {
            dias_def[Integer.parseInt(dias_laborar[i])]="1";
        }
        
        Integer respuesta = 0;
        
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        
        try {
            respuesta=emp.guardarDatosFormularioMovilidadCovid19(tip_id, documento, tipo_rol, nombres, apellidos, genero, edad, cargo, ciudad, direccion, barrio, inf_veridica, ind_acepta, hor_ing, hor_sal, modo_transp, trab_remoto, dias_def);
        } catch (Exception ex) {
            respuesta=0;
        }
        
        response.sendRedirect("formularioMovilidadCovid19?respuesta="+respuesta);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
