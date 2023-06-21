/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jgarcia
 */
public class lisPlanes extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet lisPlanes</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet lisPlanes at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
        } finally {
            out.close();
        }
    }

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
        processRequest(request, response);
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
        try {
            response.setContentType("text/html;charset=UTF-8");
            String res = "";
            PrintWriter pw = response.getWriter();
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDproyectoRemote bd = conEjb.lookupBDproyectoRemote();
            HashMap[] items = bd.getListaPlanes(res);
            HashMap item;
            /*int t = items.size(), i;
            res = "<listaplanes>";
            for (i = 0; i < t; i++) {
            item = (ArrayList) items.get(i);
            res = res + "<plan>" +
            "<id>" + item.get(0) + "</id>" +
            "<tipo>" + item.get(1) + "</tipo>" +
            "<nombre>" + item.get(2) + "</nombre>" +
            "<unidad>" + item.get(3) + "</unidad>" +
            "<inicio>" + item.get(4) + "-" + item.get(5) + "</inicio>" +
            "<fin>" + item.get(6) + "-" + item.get(7) + "</fin>" +
            "</plan>";
            }*/
            int t = items.length;
            int i;
            res = "<listaplanes>";
            for (i = 0; i < t; i++) {
                item = items[i];
                res = res + "<plan>" + "<id>" + item.get("idpl") + "</id>" + "<tipo>" + item.get("tppl") + "</tipo>" + "<nombre>" + item.get("nompl") + "</nombre>" + "<unidad>" + item.get("descen") + "</unidad>" + "<inicio>" + item.get("aipl") + "-" + item.get("mipl") + "</inicio>" + "<fin>" + item.get("afpl") + "-" + item.get("mfpl") + "</fin>" + "</plan>";
            }
            res = res + "</listaplanes>";
            //Enviar Respuesta
            response.setContentType("text/xml");
            pw.write(res);
            pw.flush();
            pw.close();
        } catch (Exception ex) {
            Logger.getLogger(lisPlanes.class.getName()).log(Level.SEVERE, null, ex);
        }
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
