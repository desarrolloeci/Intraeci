/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package talhumano;

import BDintraeci.AspiranteRemote;
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
public class getAspirante extends HttpServlet {
   
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
        //==  Cuando se invoca tipo GET, devuelve la informaci´n detallada de un
        //==  estudio, recibiendo su identificador
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion;
        String res = "";
        PrintWriter pw = response.getWriter();
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        AspiranteRemote asp = conEjb.lookupAspiranteRemote();
        HashMap item = null ;

        String op = request.getParameter("op") ;
        if (op.equals("1")) {
            String doc = request.getParameter("docing") ;
            String ema = request.getParameter("emaing") ;
            asp.inicializar(doc);
            try {
                item = asp.detalleAspirante(doc, ema);
            } catch (Exception ex) {
                Logger.getLogger(getAspirante.class.getName()).log(Level.SEVERE, null, ex);
            }
            sesion = request.getSession(true);
            asp.inicializar(doc) ;
            EmpleadoRemote emp = conEjb.lookupEmpleadoRemote();
            emp.inicializar(doc);
            sesion.setAttribute("asp", asp ) ;
            sesion.setAttribute("emp", emp ) ;

            res = "<aspirante>" +
                    "<doc>" + item.get("docid") + "</doc>" +
                    "<tdoc>" + item.get("tdoc") + "</tdoc>" +
                    "<nombre>" + item.get("ap1") + " " + item.get("ap2") + " " + item.get("nom") +"</nombre>" +
                    "<fnac>" + item.get("fnac") + "</fnac>" +
                    "<ciunac>" + item.get("ciunac") + "</ciunac>" +
                    "<nciunac>" + item.get("nciunac") + "</nciunac>" +
                    "<eciv>" + item.get("eciv") + "</eciv>" +
                    "<tpsan>" + item.get("tpsan") + "</tpsan>" +
                    "<frh>" + item.get("frh") + "</frh>" +
                    "<libmil>" + item.get("lmil") + "</libmil>" +
                    "<clamil>" + item.get("clase") + "</clamil>" +
                    "<dismil>" + item.get("dmil") + "</dismil>" +
                    "<dirres>" + item.get("dirres") + "</dirres>" +
                    "<telres>" + item.get("telres") + "</telres>" +
                    "<ciures>" + item.get("ciudad") + "</ciures>" +
                    "<nomciu>" + item.get("nom_ciu") + "</nomciu>" +
                    "<celular>" + item.get("cel") + "</celular>" +
                    "<email>" + item.get("email") + "</email>" +
                    "<genero>" + item.get("gen") + "</genero>" +
                    "</aspirante>";
        } else {
            //Trae solo el perfil
            try {
                sesion = request.getSession(false);
                asp = (AspiranteRemote) sesion.getAttribute("asp");
                item = asp.getPerfil() ;
            } catch (Exception ex) {
                Logger.getLogger(getAspirante.class.getName()).log(Level.SEVERE, null, ex);
            }
            res = "<perfil>" + item.get("perfil") + "</perfil>" ;
        }
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
