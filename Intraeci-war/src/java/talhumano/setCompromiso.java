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
public class setCompromiso extends HttpServlet {

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

        String idc = (String) request.getParameter("idc");


        //== Se elimina el registro de experiencia para el empleado
        try {
            //== Se mira si es una operación de confirmar hoja.  idc = 0
            if (idc.equals("0"))
                ret = emp.confirmeHoja() ;
            else
                ret = emp.elimCompromiso(idc);
        } catch (Exception ex) {
            Logger.getLogger(setCompromiso.class.getName()).log(Level.SEVERE, null, ex);
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
        String idc, idint = "0", nivel, ngrp = "0", hc = "0", hp = "0", ha = "0", hd = "0", blq,
               fini = "01-01-1900", ffin = "01-01-1900", nom = "_", tipo ;

        String op = (String) request.getParameter("op");
        blq = (String) request.getParameter("blq");
        tipo = op ;
        if (op.equals("1")) {
            idc = (String) request.getParameter("idcdoc");
            idint = (String) request.getParameter("idintdoc");
            nivel = (String) request.getParameter("nivd");
            ngrp = (String) request.getParameter("ngrp");
            hc = (String) request.getParameter("hc");
            hp = (String) request.getParameter("hp");
            ha = (String) request.getParameter("ha");
            hd = (String) request.getParameter("hd");
        } else if (op.equals("2")) {
            idc = (String) request.getParameter("idcdocp");
            idint = (String) request.getParameter("idintdocp");
            nivel = (String) request.getParameter("nivdp");
            ngrp = (String) request.getParameter("ngrpp");
            hc = (String) request.getParameter("hcp");
            hp = (String) request.getParameter("hpp");
            ha = (String) request.getParameter("hap");
            hd = (String) request.getParameter("hdp");
        } else if (op.equals("3")) {
            idc = (String) request.getParameter("idced");
            nivel = "_";
            nom = (String) request.getParameter("ncured");
            fini = (String) request.getParameter("finied");
            ffin = (String) request.getParameter("ffined");
            hc = (String) request.getParameter("thed");
        } else if (op.equals("4")) {
            idc = (String) request.getParameter("idcedit");
            nivel = "_";
            nom = (String) request.getParameter("ncuredit");
            fini = (String) request.getParameter("finiedit");
            ffin = (String) request.getParameter("ffinedit");
            hc = (String) request.getParameter("thedit");
        } else if (op.equals("5")) {
            idc = (String) request.getParameter("idcpr");
            idint = (String) request.getParameter("idintpr");
            nivel = "_";
            nom = (String) request.getParameter("npr");
            fini = (String) request.getParameter("finipr");
            ffin = (String) request.getParameter("ffinpr");
            hc = (String) request.getParameter("thpr");
        } else if (op.equals("6")) {
            idc = (String) request.getParameter("idcoc");
            nivel = "_";
            nom = (String) request.getParameter("desoc");
            tipo = (String) request.getParameter("idtpc");
            hc = (String) request.getParameter("thoc");
        } else if (op.equals("18")) {
            idc = (String) request.getParameter("idcpe");
            nivel = "_";
            nom = (String) request.getParameter("nompe");
            ngrp = (String) request.getParameter("nepe");
            hc = (String) request.getParameter("hvis");
            hd = (String) request.getParameter("hinf");
        } else  {
            idc = (String) request.getParameter("idctg");
            nivel = (String) request.getParameter("nivtg");
            nom = (String) request.getParameter("nomtg");
            hc = (String) request.getParameter("htg");
        }
        if (blq.equals("true")) 
            blq = "S";
        else
            blq = "N";
        if (idc.equals("0")) {
            //== Se debe crear un registro de compromiso
            try {
                ret = emp.crearCompromiso(idc, idint, ngrp, fini, ffin, tipo, nom, nivel, hc, ha, hd, hp, blq) ;
            } catch (Exception ex) {
                Logger.getLogger(setCompromiso.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            //== Se modifica el registro del este identificador
            try {
                ret = emp.setCompromiso(idc, idint, ngrp, fini, ffin, tipo, nom, nivel, hc, ha, hd, hp, blq, op) ;
            } catch (Exception ex) {
                Logger.getLogger(setCompromiso.class.getName()).log(Level.SEVERE, null, ex);
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
