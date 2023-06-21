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
public class setPublicacion extends HttpServlet {

    private String idpub;
    private String titulo;
    private String tipo;
    private String tmayor;
    private String edicion;
    private String editor;
    private String fecha;
    private String ciudad;
    private String pais;
    private String area;

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

        idpub = (String) request.getParameter("idpub");
        //== Se elimina el registro de experiencia para el empleado
        try {
            ret = emp.elimPublic(idpub);
        } catch (Exception ex) {
            Logger.getLogger(setPublicacion.class.getName()).log(Level.SEVERE, null, ex);
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

        idpub = (String) request.getParameter("idpub");
        tipo = (String) request.getParameter("tipo");
        titulo = (String) request.getParameter("titpub");
        tmayor = (String) request.getParameter("tmayor");
        pais = (String) request.getParameter("paispub");
        ciudad = (String) request.getParameter("ciudpub");
        fecha = (String) request.getParameter("fec");
        edicion = (String) request.getParameter("edic");
        editor = (String) request.getParameter("edit");
        area = (String) request.getParameter("arpub");

        if (idpub.equals("0")) {
            //== Se debe crear un registro de distinción para el empleado
            try {
                ret = emp.crearPublic(tipo, titulo, tmayor, area, fecha, edicion, editor, ciudad, pais);
            } catch (Exception ex) {
                Logger.getLogger(setPublicacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            //== Se modifica el registro del este identificador
            try {
                ret = emp.setPublic(idpub, tipo, titulo, tmayor, area, fecha, edicion, editor, ciudad, pais);
            } catch (Exception ex) {
                Logger.getLogger(setPublicacion.class.getName()).log(Level.SEVERE, null, ex);
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
