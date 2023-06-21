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
public class GuardarExperienciaLaboralERP extends HttpServlet {

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
            out.println("<title>Servlet GuardarExperienciaLaboralERP</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuardarExperienciaLaboralERP at " + request.getContextPath() + "</h1>");
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
        String cod_emp=request.getParameter("cod_emp");
        String nombre_empresa=request.getParameter("nombre_empresa").trim();
        String cargo=request.getParameter("cargo").trim();
        String area_exp=request.getParameter("area_exp").trim();
        String des_fun=request.getParameter("des_fun").trim();
        String tpo_exp=request.getParameter("tpo_exp").trim();
        String mot_ret=request.getParameter("mot_ret").trim();
        String nom_jef=request.getParameter("nom_jef").trim();
        String tel=request.getParameter("tel").trim();
        String fec_in=request.getParameter("fec_in").trim();
        String fec_out=request.getParameter("fec_out").trim();
        
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        
        Integer res;
        
        try{
            res=emp.guardaExperienciaLabERP(cod_emp, nombre_empresa, cargo, area_exp, des_fun, tpo_exp, mot_ret, nom_jef, tel, fec_in.replace("-", ""), fec_out.replace("-", ""));
        }catch(Exception ex){
            res=0;
        }
        
        response.sendRedirect("ExperienciaLab?respuesta="+res);
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
