/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestorCursos;

import BDintraeci.EmpleadoRemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utiles.Encripta;

/**
 *
 * @author andres.rojas
 */
public class ConectarGestorCursos extends HttpServlet {

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
            out.println("<title>Servlet ConectarGestorCursos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConectarGestorCursos at " + request.getContextPath() + "</h1>");
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
        String id_emp;
        String cadena = Encripta.randomAlphaNumeric(20);
        String llave = Encripta.randomAlphaNumeric(20);
        String cadena_encriptada = Encripta.Encriptar(cadena, llave);
        HttpSession session = request.getSession(true);
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        EmpleadoRemote emp = conEjb.lookupEmpleadoRemote();
        emp.inicializar(((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getIdemp());
        session.setAttribute("emp", emp );
        HashMap datos = new HashMap();
        try {
            datos = emp.datosGenerales();
        } catch (Exception ex) {
            Logger.getLogger(ConectarGestorCursos.class.getName()).log(Level.SEVERE, null, ex);
        }
        id_emp=(String) datos.get("cod_emp");
        try {
            emp.generarTokenInicioGestorCursos(id_emp, llave, cadena_encriptada, "1");
        } catch (Exception ex) {
            Logger.getLogger(ConectarGestorCursos.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //response.sendRedirect("http://10.1.3.135:8080/GestionDeCursos/Services/Login?id_emp="+id_emp.trim()+"&cadena="+cadena);
        response.sendRedirect("https://tycho.escuelaing.edu.co/GestionDeCursos/Services/Login?id_emp="+id_emp.trim()+"&cadena="+cadena);    
    }

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
        processRequest(request, response);
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
