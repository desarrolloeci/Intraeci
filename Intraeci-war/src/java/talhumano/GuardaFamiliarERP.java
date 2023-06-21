/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package talhumano;

import BDintraeci.EmpleadoRemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author andres.rojas
 */
public class GuardaFamiliarERP extends HttpServlet {

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
            out.println("<title>Servlet GuardaFamiliarERP</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuardaFamiliarERP at " + request.getContextPath() + "</h1>");
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
        String ap1_fam = request.getParameter("ap1_fam").trim();
        String ap2_fam = request.getParameter("ap2_fam").trim();
        String nom_fam = request.getParameter("nom_fam").trim();
        String tip_fam = request.getParameter("tip_fam").trim();
        String tip_ide = request.getParameter("tip_ide").trim();
        String num_ced = request.getParameter("num_ced").trim();
        String fec_nac = request.getParameter("fec_nac").trim();
        String sex_fam = request.getParameter("sex_fam").trim();
        String est_civ = request.getParameter("est_civ").trim();
        String ocu_fam = request.getParameter("ocu_fam").trim();
        String sal_bas = request.getParameter("sal_bas").trim();
        String ind_sub = request.getParameter("ind_sub").trim();
        String ind_pro = request.getParameter("ind_pro").trim();
        String ind_conv = request.getParameter("ind_conv").trim();
        String niv_est = request.getParameter("niv_est").trim();
        String ind_comp = request.getParameter("ind_comp").trim();
        String cod_emp = request.getParameter("cod_emp").trim();
        
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        
        Integer ans;
        
        try {
            ans = emp.guardaFamiliarEmpERP(cod_emp, ap1_fam, ap2_fam, nom_fam, tip_fam, tip_ide, num_ced, fec_nac.replace("-", ""), sex_fam, est_civ, ocu_fam, sal_bas, ind_sub, ind_pro, ind_conv, niv_est, ind_comp);
        } catch (Exception ex) {
            Logger.getLogger(GuardaFamiliarERP.class.getName()).log(Level.SEVERE, null, ex);
            ans = 0;
        }
        
        response.sendRedirect("FormFamiliaresERP?respuesta="+ans);
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
