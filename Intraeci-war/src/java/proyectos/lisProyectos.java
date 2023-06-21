/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos;

import BDintraeci.BDproyectoRemote;
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
public class lisProyectos extends HttpServlet {

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
            out.println("<title>Servlet lisProyectos</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet lisProyectos at " + request.getContextPath () + "</h1>");
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
        /*String plan = "";
        HttpSession sesion = request.getSession(false);
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDproyectoRemote bd = conEjb.lookupBDproyectoRemote();

        plan = (String) request.getParameter("id");
        ArrayList proys = bd.getListaProyectos(plan);
        sesion.setAttribute("LProyectos", proys);
        response.sendRedirect("Proyectos?idPlan=" + plan);*/
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
        String iproy = "", res = "";
        PrintWriter pw = response.getWriter();
        try {
            iproy = (String) request.getParameter("idp");
            HttpSession sesion = request.getSession(false);
            BDproyectoRemote proyecto = (BDproyectoRemote) sesion.getAttribute("proyecto");
            HashMap descProyec = proyecto.getProyecto(iproy), permisos = proyecto.getPerXTipo("Proyecto");
            String permiso = (String) descProyec.get("permisos");
            if (permisos != null) {
                if (permisos.get(descProyec.get("idUni").toString()) != null) {
                    permiso = permisos.get(descProyec.get("idUni")).toString();
                }
            }
            res = res + "<proyecto>"
                    + "<id>" + descProyec.get("idpr") + "</id>"
                    + "<plan>" + descProyec.get("nompl") + "</plan>"
                    + "<nombre>" + descProyec.get("nompr") + "</nombre>"
                    + "<tipo>" + descProyec.get("tppr") + "</tipo>"
                    + "<inicio>" + descProyec.get("FecIni") + "</inicio>"
                    + "<fin>" + descProyec.get("FecFin") + "</fin>"
                    + "<duracion>" + descProyec.get("durpr") + "</duracion>"
                    + "<objetivo>" + descProyec.get("obgenpr") + "</objetivo>"
                    + "<justif>" + descProyec.get("justpr") + "</justif>"
                    + "<nomResp>" + descProyec.get("nomResp") + "</nomResp>"
                    + "<idResp>" + descProyec.get("resppr") + "</idResp>"
                    + "<nomGerente>" + descProyec.get("nomGer") + "</nomGerente>"
                    + "<idGerente>" + descProyec.get("gerpr") + "</idGerente>"
                    + "<nomUnidad>" + descProyec.get("nomUni") + "</nomUnidad>"
                    + "<idUnidad>" + descProyec.get("idUni") + "</idUnidad>"
                    + "<nomArea>" + descProyec.get("nomArea") + "</nomArea>"
                    + "<idArea>" + descProyec.get("idArea") + "</idArea>"
                    + "<estado>" + descProyec.get("estpr") + "</estado>"
                    + "<permiso>" + permiso + "</permiso>";
            res = res + "<listafases>";
            HashMap[] fases = proyecto.getlisFases(iproy);
            for (int i = 0; i < fases.length; i++) {
                descProyec = fases[i];
                res = res + "<fase>"
                        + "<idf>" + descProyec.get("idfa") + "</idf>"
                        + "<nombre>" + descProyec.get("nomfase") + "-" + descProyec.get("numfase") + "</nombre>"
                        + "<estado>" + descProyec.get("estfas") + "</estado>"
                        + "<descrip>" + descProyec.get("descfa") + "</descrip>"
                        + "<anio>" + descProyec.get("anfa") + "</anio>"
                        + "<inicio>" + descProyec.get("mifa") + "-" + descProyec.get("difa") + "</inicio>"
                        + "<fin>" + descProyec.get("mffa") + "-" + descProyec.get("dffa") + "</fin>"
                        + "<idest>" + descProyec.get("idEstado") + "</idest>"
                        /*+ "<ingresos>" + descProyec.get("ting") + "</ingresos>"
                        + "<gastos>" + descProyec.get("gastos") + "</gastos>"
                        + "<inver>" + descProyec.get("invest") + "</inver>"*/
                        + "</fase>";
            }
            res = res + "</listafases>";
            res = res + "</proyecto>";
            //Enviar Respuesta
        } catch (Exception ex) {
            res="<proyecto><id>Error</id></proyecto>";
        }
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
