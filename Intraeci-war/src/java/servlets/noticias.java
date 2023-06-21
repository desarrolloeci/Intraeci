/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alexgz
 */
public class noticias extends HttpServlet {
   
    /** 
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet noticias</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet noticias at " + request.getContextPath () + "</h1>");
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
    */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/xml;charset=utf-8");
        PrintWriter out = response.getWriter();
        //String urlrss = "http://copernico.escuelaing.edu.co/aeci/web/index.php?option=com_rss&feed=RSS2.0&no_html=1";//request.getParameter("urlrss");
        String urlrss = "http://copernico.escuelaing.edu.co/desarrollo/contenido/index.php?format=feed&type=rss";//request.getParameter("urlrss");
        URL url = new URL(urlrss);
        InputStream is = url.openStream();
        BufferedReader di = new BufferedReader(new InputStreamReader(is, "utf-8"));
        String linea;
        /***** Lee línea a línea el  archivo ... ****/
        do {
            linea = di.readLine();
            if (linea == null) {
                break;
            } else {
                out.println(linea);
            }
        } while (true);
    } 

    /** 
    * Handles the HTTP <code>POST</code> method.
    * @param request servlet request
    * @param response servlet response
    */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
    * Returns a short description of the servlet.
    */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
