/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SegEstud;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mario Martínez
 */
public class regConsulta extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
            out.println("<title>Servlet regConsulta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet regConsulta at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        
        String res = "<resultado>";
        
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            response.setContentType("text/html");

            HttpSession session;
            session = request.getSession(false);
            String usuario = (String) session.getAttribute("usuario");
            
            if (!(usuario != null && !usuario.equals(""))) {
                response.sendRedirect("cerrar?msg=4");
            }
            
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
            
            if (admin == null) {
                response.sendRedirect("cerrar?msg=4");
            }
            
            Calendar today = Calendar.getInstance();
            
            Calendar dateParsed = Calendar.getInstance();
            SimpleDateFormat dateFormatIn = new SimpleDateFormat("dd'/'MM'/'yyyy");

            dateParsed.setTime(dateFormatIn.parse(request.getParameter("fecha")));
            
            if (today.before(dateParsed)) throw new Exception("SECodError:-1");
            
            if (today.get(Calendar.YEAR) == dateParsed.get(Calendar.YEAR) && today.get(Calendar.DAY_OF_YEAR) == dateParsed.get(Calendar.DAY_OF_YEAR)) {
                dateParsed = Calendar.getInstance();
            }
            
            SimpleDateFormat dateFormatOut = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

            String fecha = dateFormatOut.format(dateParsed.getTime());
            String profesor = ((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getIdemp();
            
            String carne = request.getParameter("carne");
            String visita = request.getParameter("visita");
            String tipo = request.getParameter("tipo");
            String asignatura = request.getParameter("asignatura");
            String tema = request.getParameter("tema");
            String observaciones = request.getParameter("observaciones");
            String perAcad = ((login.InicioProfRemoteBusiness) session.getAttribute("empleado")).getPeriodo();
            
            int ret = admin.setConsultaEst(fecha, profesor, carne, visita, tipo, asignatura, tema, observaciones, perAcad);
            
            if (ret > 0) {
                res += "<estado>1</estado>";
            } else {
                res += "<estado>0</estado>";
            }
        } catch (Exception ex) {
            res = "<resultado>";
            
            if (ex.getMessage().substring(0, 10).equals("SECodError")) {
                res += "<estado>" + ex.getMessage().replace("SECodError:", "") + "</estado>";
            } else {
                res += "<estado>0</estado>";
            }
            Logger.getLogger(regConsulta.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        res += "</resultado>";
        
        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(res);
        pw.flush();
        pw.close();
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
