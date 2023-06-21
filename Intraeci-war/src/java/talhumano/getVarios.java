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
 * @author Juan Pablo Garcia
 */
public class getVarios extends HttpServlet {

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
        String res = "";
        HttpSession sesion = request.getSession(false);
        PrintWriter pw = response.getWriter();
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        HashMap item = null;
        String op = (String) request.getParameter("op");
        String iden = (String) request.getParameter("id");
        try {
            item = emp.detalleConv(op, iden);
        } catch (Exception ex) {
            Logger.getLogger(getVarios.class.getName()).log(Level.SEVERE, null, ex);
        }
        res = res + "<convocatoria>" + escapeXML((String) item.get("desconv")) + "</convocatoria>";
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
        String res = "";
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        HashMap[] datos = null;
        HashMap datosConv = null;
        String op = (String) request.getParameter("op");
        try {
            if (op.equals("1") || op.equals("3")) {
                datos = emp.lisconvoca();
            } else if (op.equals("2")) {
                datos = emp.lisconvocapart();
            } else if (op.equals("4")) {
                datos = emp.lisconvocadm();
            } else if (op.equals("5")) {
                String id = (String) request.getParameter("id");
                datos = emp.lisparticipan(id);
                datosConv = emp.getConvDet(id);
            } 
        } catch (Exception ex) {
            Logger.getLogger(getVarios.class.getName()).log(Level.SEVERE, null, ex);
        }
        HashMap item;
        int i;
        if (op.equals("5")) {
            res = "<convocatoria>";
            res += "<participantes>";
            for (i = 0; i < datos.length; i++) {
                item = datos[i];
                res +=  "<participa>" +
                        "<idp>" + escapeXML((String) item.get("docid")) + "</idp>" +
                        "<nom>" + escapeXML((String) item.get("nom")) + "</nom>" +
                        "<fecha>" + escapeXML((String) item.get("fec")) + "</fecha>" +
                        "<fnac>" + escapeXML((String) item.get("fnac")) + "</fnac>" +
                        "<genero>" + escapeXML((String) item.get("gen")) + "</genero>" +
                        "<estado>" + escapeXML((String) item.get("estado")) + "</estado>" +
                        "<idpar>" + escapeXML((String) item.get("idpar")) + "</idpar>" +
                        "</participa>";
            }
            res += "</participantes>";
            res +=  "<infoConv>" +
                    "<idcon>" + escapeXML((String) datosConv.get("idcon")) + "</idcon>" +
                    "<nom>" + escapeXML((String) datosConv.get("nombre")) + "</nom>" +
                    "<desc>" + escapeXML((String) datosConv.get("descon")) + "</desc>" +
                    "<fini>" + escapeXML((String) datosConv.get("fini")) + "</fini>" +
                    "<ffin>" + escapeXML((String) datosConv.get("ffin")) + "</ffin>" +
                    "<tipo>" + escapeXML((String) datosConv.get("tipo")) + "</tipo>" +
                    "<per>" + escapeXML((String) datosConv.get("peracad")) + "</per>" +
                    "<convAdm>" + escapeXML((String) datosConv.get("convAdm")) + "</convAdm>" +
                    "<nomAdm>" + escapeXML((String) datosConv.get("nomAdm")) + "</nomAdm>" +
                    "<convDir>" + escapeXML((String) datosConv.get("convDir")) + "</convDir>" +
                    "<nomDir>" + escapeXML((String) datosConv.get("nomDir")) + "</nomDir>" +
                    "</infoConv>";
            res += "</convocatoria>";
        } else {
            res = "<convocatorias>";
            for (i = 0; i < datos.length; i++) {
                item = datos[i];
                if (op.equals("1") || op.equals("3") || op.equals("4")) {
                    res = res + "<convoca>"
                            + "<idcon>" + escapeXML((String) item.get("idcon")) + "</idcon>"
                            + "<descon>" + escapeXML((String) item.get("nombre")) + "</descon>"
                            + "<fecha>" + escapeXML((String) item.get("ffin")) + "</fecha>"
                            + "<otrinf>" + escapeXML((String) item.get("descon")) + "</otrinf>"
                            + "</convoca>";
                } else {
                    res = res + "<convoca>"
                            + "<idpar>" + escapeXML((String) item.get("idpar")) + "</idpar>"
                            + "<descon>" + escapeXML((String) item.get("nombre")) + "</descon>"
                            + "<fecha>" + escapeXML((String) item.get("ffin")) + "</fecha>"
                            + "<estado>" + escapeXML((String) item.get("estado")) + "</estado>"
                            + "</convoca>";
                }
            }
            res = res + "</convocatorias>";
        }
        
        if (op.equals("3")) sesion.invalidate();
        
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
    
    private String escapeXML(String escapeText) {
        String result = escapeText;
        if (result == null || result.trim().equals("")) result = "_";
        
        result = result.replaceAll("&", "&amp;");
        result = result.replaceAll("<", "&lt;");
        result = result.replaceAll(">", "&gt;");
        result = result.replaceAll("\"", "&quot;");
        result = result.replaceAll("'", "&apos;");
        return result;
    }
}
