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
public class getEstudios extends HttpServlet {
   
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //==  Cuando se invoca tipo POST, devuelve la la lista de estudio
        //==  estudio, recibiendo su identificador
        response.setContentType("text/html;charset=UTF-8");
        String res = "";
        HttpSession sesion = request.getSession(false);
        PrintWriter pw = response.getWriter();
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp") ;
        HashMap[] datos = null ;
        try {
            datos = emp.getEstudios();
        } catch (Exception ex) {
            Logger.getLogger(getEstudios.class.getName()).log(Level.SEVERE, null, ex);
        }
        HashMap item ;
        int i ;

        res = "<listaestudios>";
        for (i = 0; i < datos.length; i++) {
            item = datos[i];
            res = res + "<estudio>" +
                    "<idest>" + item.get("idestud") + "</idest>" +
                    "<nivel>" + item.get("des_est") + "</nivel>" +
                    "<titulo>" + item.get("nom_est") + "</titulo>" +
                    "<universidad>" + item.get("nom_ins") + "</universidad>" +
                    "<fgrado>" + item.get("fgra") + "</fgrado>" +
                    "<blq>" + item.get("blq") + "</blq>" +
                    "</estudio>";
        }
        res = res + "</listaestudios>";
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //==  Cuando se invoca tipo GET, devuelve la informaci´n detallada de un
        //==  estudio, recibiendo su identificador
        response.setContentType("text/html;charset=UTF-8");
        String res = "";
        HttpSession sesion = request.getSession(false);
        PrintWriter pw = response.getWriter();
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp") ;
        HashMap item = null ;
        
        String ident = request.getParameter("idestud") ;
        try {
            item = emp.detalleEstudio(ident);
        } catch (Exception ex) {
            Logger.getLogger(getEstudios.class.getName()).log(Level.SEVERE, null, ex);
        }

        res = "<estudio>" +
                "<idest>" + item.get("idestud") + "</idest>" +
                "<nivel>" + item.get("tip_est") + "</nivel>" +
                "<titulo>" + item.get("nom_est") + "</titulo>" +
                "<universidad>" + item.get("nom_ins") + "</universidad>" +
                "<cuniv>" + item.get("cod_ins") + "</cuniv>" +
                "<fgrado>" + item.get("fgra") + "</fgrado>" +
                "<duracion>" + item.get("sem_apr") + "</duracion>" +
                "<tarprof>" + item.get("nro_tar") + "</tarprof>" +
                "<blq>" + item.get("blq") + "</blq>" +
                "</estudio>";
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
