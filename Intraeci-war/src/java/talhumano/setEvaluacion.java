/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package talhumano;

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

/**
 *
 * @author jgarcia
 */
public class setEvaluacion extends HttpServlet {
   
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
        HttpSession sesion = request.getSession(false);
        PrintWriter pw = response.getWriter();
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp") ;
        HashMap item = null ;

        String ideval = request.getParameter("idev") ;
        String tpeval = request.getParameter("tpev") ;
        try {
            item = emp.getEvaluacion("2011", tpeval, ideval) ;
        } catch (Exception ex) {
            Logger.getLogger(setEvaluacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        String res = "<cant>" + item.get("cant") + "</cant>";
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
        int ret = 0, np = 1, i = 1;
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        String res = "<resultado>", resps = "", id = "", raz = "", obj = "";

        String enc = (String) request.getParameter("enc");
        String usu = (String) request.getParameter("usu");
        String npr = (String) request.getParameter("npr");
        np = Integer.parseInt(npr) ;
        if (enc.equals("1") ) {
            resps = (String) request.getParameter("resp");
            try {
                    ret = emp.registrarEvaluacion("2011", usu, enc, npr, resps, "_") ;
            } catch (Exception ex) {
                Logger.getLogger(setEvaluacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else  {
            for (int j = 0; j < np; j++ ) {
                id = (String) request.getParameter("id" + String.valueOf(j));
                obj = (String) request.getParameter("obj" + String.valueOf(j));
                raz = (String) request.getParameter("raz" + String.valueOf(j));
                try {
                        ret = emp.registrarEvaluacion("2011", usu, id, "1", obj, raz) ;
                } catch (Exception ex) {
                    Logger.getLogger(setEvaluacion.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }
        res = res + "<dato>" + String.valueOf(ret) + "</dato>";
        if (ret > 0) {
            res = res + "<valor>Operación Exitosa</valor>";
        } else {
            res = res + "<valor>Fallo en la Operación de envío de la evaluación</valor>";
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
