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
import utiles.Correo;

/**
 *
 * @author jgarcia
 */
public class setExperiencia extends HttpServlet {

    private String idhis;
    private String organ;
    private String fecini;
    private String fecfin;
    private String cargo;
    private String tpcargo;
    private String niveld;

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
        try{
        response.setContentType("text/html;charset=UTF-8");
        int ret = 0;
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        String res = "<resultado>";

        idhis = (String) request.getParameter("idhis");
        organ = (String) request.getParameter("empresa");
        fecini = (String) request.getParameter("fdesde");
        fecfin = (String) request.getParameter("fhasta");
        cargo = (String) request.getParameter("cargo");
        tpcargo = (String) request.getParameter("tcargo");
        niveld = (String) request.getParameter("nivel");
        String blq = (String) request.getParameter("blqel");
        if (blq.equals("true")) {
            blq = "S";
        } else {
            blq = "N";
        }
        if (idhis.equals("0")) {
            //== Se debe crear un registro de estudios para el empleado
            try {
                ret = emp.crearExperiencia(organ, fecini, fecfin, cargo, tpcargo, niveld, blq);
            } catch (Exception ex) {
                Logger.getLogger(setExperiencia.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            //== Se modifica el registro del este identificador
            try {
                ret = emp.setExperiencia(idhis, organ, fecini, fecfin, cargo, tpcargo, niveld, blq);
            } catch (Exception ex) {
                Logger.getLogger(setEstudio.class.getName()).log(Level.SEVERE, null, ex);
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
         } catch (Exception e) {
            Correo correo = new Correo();
            correo.enviar("Set Experiencia", e.getMessage() );
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int ret = 0;
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        String res = "<resultado>";

        idhis = (String) request.getParameter("idhis");
        //== Se elimina el registro de experiencia para el empleado
        try {
            ret = emp.elimExperiencia(idhis);
        } catch (Exception ex) {
            Logger.getLogger(setExperiencia.class.getName()).log(Level.SEVERE, null, ex);
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
