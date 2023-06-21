/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos;

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
public class getRubros extends HttpServlet {
    
    private final String CHARACTER_ENCODE = "UTF-8";
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

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
        
        response.setContentType("text/xml");
        response.setCharacterEncoding(CHARACTER_ENCODE);
        response.setHeader("Cache-Control", "no-cache");
        HttpSession sesion = request.getSession(false);
        PrintWriter pw = response.getWriter();
        String res = "";
        try {
            if (sesion==null) throw new Exception("0");

            EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("empleado2") ;

            res = "<lista>";
            HashMap[] datos = null ;
            HashMap item = null;

            //Obtenemos la vigencia
            String vig = request.getParameter("vig");

            //Obtenemos el parámetro "tipo" y apartir de éste decidimos si obtener los Centros o los Rubros
            if (request.getParameter("tipo").equals("0")) {
                datos = emp.lisCentros(vig);
            } else {
                String cen = request.getParameter("cen");
                datos = emp.lisRubros(vig, cen);
            }


            for (int i = 0; i < datos.length; i++) {
                item = datos[i];
                res +=  "<item>"
                        +"<cod>" + escapeXML((String) item.get("Codigo")) + "</cod>"
                        +"<nom>" + escapeXML((String) item.get("Nombre")) + "</nom>"
                        +"</item>";
            }
            res += "</lista>";
 
        } catch (Exception err) {
            //Si encuentra algun error.
            String errMsg;
            if (err.getMessage().equalsIgnoreCase("0")) {
                errMsg = "El usuario no está auntenticado, o su sesión ha expirado. Por favor vuelva a ingresar al sistema.";
                res = "<error>" + errMsg + "</error>";
            } else {
                /*errMsg = "Error inesperado: " + err.getMessage().toString() + ". Contacte con la oficina de OSIRIS.";
                Logger.getLogger(getRubros.class.getName()).log(Level.SEVERE,null,err);*/
                res = "<lista></lista>";
            }
        }
        
        //Enviar Respuesta
        pw.write(res);
        pw.flush();
        pw.close();
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        response.setContentType("text/xml");
        response.setCharacterEncoding(CHARACTER_ENCODE);
        response.setHeader("Cache-Control","no-cache");
        HttpSession sesion = request.getSession(false);
        PrintWriter pw = response.getWriter();
        String res = "";
        
        try {
            
            if (sesion == null) throw new Exception("0");
            
            EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("empleado2") ;
            HashMap[] datos = null ;
            
            String vig = request.getParameter("vig");
            String ccen = request.getParameter("ccen");
            
            if (request.getParameter("tipo").equals("1") ) {
                String crub = request.getParameter("crub");
                datos = emp.getCDPs(vig, crub, ccen);
            } else {
                datos = emp.getResPres(vig, ccen);
            }

            HashMap item ;
            res = "<listacdps>";
            
            for (int i = 0; i < datos.length; i++) {
                item = datos[i];
                res = res + "<cdp>" +
                        "<num>" + escapeXML((String) item.get("num")) + "</num>" +
                        "<det>" + escapeXML((String) item.get("det")) + "</det>" +
                        "<nom_prov>" + escapeXML((String) item.get("nom_prov")) + "</nom_prov>" +
                        "<fec>" + escapeXML((String) item.get("fec")) + "</fec>" +
                        "<val>" + escapeXML((String) item.get("val")) + "</val>" +
                        "<est>" + escapeXML((String) item.get("est")) + "</est>" +
                        "<rub>" + escapeXML((String) item.get("rub")) + "</rub>" +
                        "</cdp>";
            }
            res = res + "</listacdps>";

        } catch (Exception err) {
            //Si encuentra algun error.
            String errMsg;
            if (err.getMessage().equalsIgnoreCase("0")) {
                errMsg = "El usuario no está auntenticado, o su sesión ha expirado. Por favor vuelva a ingresar al sistema.";
                res = "<error>" + errMsg + "</error>";
            } else {
                /*errMsg = "Error inesperado: " + err.getMessage().toString() + " Contacte con la oficina de OSIRIS.";
                Logger.getLogger(getRubros.class.getName()).log(Level.SEVERE, null, err);*/
                res = "<lista></lista>";
            }
            
            
        }
        
        //Enviar Respuesta
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
        return "Lista rubros con presupuesto para una vigencia y un reponsable";
    }// </editor-fold>
    
    private String escapeXML(String escapeText) {
        String result = escapeText;
        result = result.replaceAll("&","&amp;");
        result = result.replaceAll("<","&lt;");
        result = result.replaceAll(">","&gt;");
        result = result.replaceAll("\"","&quot;");
        result = result.replaceAll("'","&apos;");
        return result;
    }

}
