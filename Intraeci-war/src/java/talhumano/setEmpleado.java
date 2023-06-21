/*
 * To change this template, choose Tools | Templates
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
 * @author jgarcia
 */
public class setEmpleado extends HttpServlet {

    private String estciv;
    private String tsan;
    private String frh = "+";
    private String nmil;
    private String dmil;
    private String clase;
    private String dir;
    private String tel;
    private String ciud;
    private String celular;

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
        int ret = 0;
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        String res = "<resultado>";

        estciv = (String) request.getParameter("eciv");
        tsan = (String) request.getParameter("tsan");
        frh = (String) request.getParameter("facrh");
        if (frh.equals("N")) {
            frh = "-";
        } else {
            frh = "+";
        }
        nmil = (String) request.getParameter("libmil");
        dmil = (String) request.getParameter("dimlib");
        clase = (String) request.getParameter("clalib");
        dir = (String) request.getParameter("dir");
        tel = (String) request.getParameter("tel");
        ciud = (String) request.getParameter("ciud");
        celular = (String) request.getParameter("cel");

        try {
            ret = emp.setEmpleado(nmil, clase, dmil, dir, tel, celular, tsan, frh, estciv, ciud);
        } catch (Exception ex) {
            Logger.getLogger(setEmpleado.class.getName()).log(Level.SEVERE, null, ex);
        }
        res = res + "<dato>" + String.valueOf(ret) + "</dato>";
        if (ret > 0) {
            res = res + "<valor>Operación Exitosa</valor>";
        } else {
            res = res + "<valor>Fallo en la Operación</valor>";
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
}
