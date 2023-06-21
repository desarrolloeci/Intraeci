/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package talhumano;

import BDintraeci.AspiranteRemote;
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
public class setAspirante extends HttpServlet {

    private String nom;
    private String ape1;
    private String ape2;
    private String email;

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
        AspiranteRemote asp = (AspiranteRemote) sesion.getAttribute("asp");

        String op = (String) request.getParameter("op");
        String res = "<resultado>";
        if (op.equals("1")) {
            //Actualiza la información general del aspirante
            email = (String) request.getParameter("email");
            String tdoc = (String) request.getParameter("tdoc");
            String fnac = (String) request.getParameter("fnac");
            String cnac = (String) request.getParameter("ciunac");
            String eciv = (String) request.getParameter("eciv");
            String tpsan = (String) request.getParameter("tsan");
            String frh = (String) request.getParameter("facrh");
            if (frh.equals("P")) {
                frh = "+";
            } else {
                frh = "-";
            }
            String nlib = (String) request.getParameter("libmil");
            String clase = (String) request.getParameter("clalib");
            String dmil = (String) request.getParameter("dimlib");
            String dir = (String) request.getParameter("dir");
            String tel = (String) request.getParameter("tel");
            String celular = (String) request.getParameter("cel");
            String ciudad = (String) request.getParameter("ciud");
            String gen = (String) request.getParameter("gen");

            //== Se modifica el registro del este identificador
            try {
                ret = asp.setAspirante(fnac, eciv, tpsan, frh, nlib, clase, dmil, dir, tel,
                        celular, ciudad, gen, tdoc, cnac);
            } catch (Exception ex) {
                Logger.getLogger(setAspirante.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            //Actualiza el perfil del aspirante
            String perfil = (String) request.getParameter("perf");
            try {
                ret = asp.setPerfil(perfil);
            } catch (Exception ex) {
                Logger.getLogger(setAspirante.class.getName()).log(Level.SEVERE, null, ex);
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
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        AspiranteRemote asp = conEjb.lookupAspiranteRemote();

        String id = (String) request.getParameter("idAsp");
        asp.inicializar(id);
        nom = (String) request.getParameter("nomasp");
        ape1 = (String) request.getParameter("ape1");
        ape2 = (String) request.getParameter("ape2");
        email = (String) request.getParameter("emAsp");
        String res = "<resultado>";

        //== Se debe crear un registro de distinción para el empleado
        try {
            ret = asp.crearAspirante(ape1, ape2, nom, email);
        } catch (Exception ex) {
            Logger.getLogger(setAspirante.class.getName()).log(Level.SEVERE, null, ex);
        }

        res = res + "<dato>" + String.valueOf(ret) + "</dato>";
        if (ret > 0) {
            res = res + "<valor>Operación Exitosa</valor>";
        } else {
            res = res + "<valor>Fallo en la Operación.\nEs posible que ya se encuentre registrado."
                    + "\nIntente ingresar con su documento y correo electrónico</valor>";
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
