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
public class setProduccion extends HttpServlet {

    private String idpro;
    private String titulo;
    private String tipo;
    private String objetivo;
    private String pais;
    private String descp;
    private String rol;
    private String orgp;
    private String fini;
    private String ffin;

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
        response.setContentType("text/html;charset=UTF-8");
        int ret = 0;
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        String res = "<resultado>";

        idpro = (String) request.getParameter("idpro");
        //== Se elimina el registro de experiencia para el empleado
        try {
            ret = emp.elimProducto(idpro);
        } catch (Exception ex) {
            Logger.getLogger(setProduccion.class.getName()).log(Level.SEVERE, null, ex);
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

        idpro = (String) request.getParameter("idpro");
        tipo = (String) request.getParameter("tipp");
        titulo = (String) request.getParameter("titp");
        objetivo = (String) request.getParameter("objp");
        pais = (String) request.getParameter("paisp");
        descp = (String) request.getParameter("refp");
        orgp = (String) request.getParameter("orgp");
        fini = (String) request.getParameter("finip");
        ffin = (String) request.getParameter("ffinp");
        rol = (String) request.getParameter("rolp");

        String blq = (String) request.getParameter("blqp");
        if (blq.equals("true")) {
            blq = "S";
        } else {
            blq = "N";
        }
        if (idpro.equals("0")) {
            //== Se debe crear un registro de distinción para el empleado
            try {
                ret = emp.crearProducto(tipo, titulo, objetivo, pais, descp, orgp, fini, ffin, rol, blq);
            } catch (Exception ex) {
                Logger.getLogger(setProduccion.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            //== Se modifica el registro del este identificador
            try {
                ret = emp.setProducto(idpro, titulo, tipo, objetivo, descp, pais, fini, ffin, rol, orgp, blq);
            } catch (Exception ex) {
                Logger.getLogger(setProduccion.class.getName()).log(Level.SEVERE, null, ex);
            }
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
