/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos;

import BDintraeci.BDproyectoRemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jgarcia
 */
public class despSeguimiento extends HttpServlet {

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
            out.println("<title>Servlet despSeguimiento</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet despSeguimiento at " + request.getContextPath () + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        StringBuilder respuesta = new StringBuilder();
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        BDproyectoRemote proyecto = (BDproyectoRemote) sesion.getAttribute("proyecto");
        respuesta.append("<listSeguimiento>");
        try {
            for (HashMap dedicacion : proyecto.getLisSeguimiento(request.getParameter("idEnt"), "E")) {
                respuesta.append("<seguimiento>");
                respuesta.append("<id>").append(dedicacion.get("idsgpr")).append("</id>");
                respuesta.append("<corte>").append(dedicacion.get("corte")).append("</corte>");
                respuesta.append("<fecha>").append(dedicacion.get("fecha")).append("</fecha>");
                //respuesta.append("<etapa>").append(dedicacion.get("etapasg")).append("</etapa>");
                respuesta.append("<avance>").append(dedicacion.get("avance")).append("</avance>");
                respuesta.append("<estado>").append(dedicacion.get("estado")).append("</estado>");
                respuesta.append("<color>").append(General.getColorSemSegui(dedicacion.get("semsg").toString())).append("</color>");
                respuesta.append("</seguimiento>");
            }
        } catch (Exception e) {
            respuesta.append("<id>Error</id>");
        }
        respuesta.append("</listSeguimiento>");
        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(respuesta.toString());
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
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        BDproyectoRemote proyecto = (BDproyectoRemote) sesion.getAttribute("proyecto");
        String respuesta = "<seguimiento>";
        try {
            HashMap seguimiento = proyecto.getSeguimiento((String) request.getParameter("ids"), (String) request.getParameter("tipo"));
            NumberFormat numFormat = NumberFormat.getInstance(Locale.US);
            respuesta = respuesta + "<id>" + seguimiento.get("idsgpr") + "</id>"
                    + "<periodo>" + seguimiento.get("aseg") + "(" + seguimiento.get("mseg") + "-" + seguimiento.get("msegf") + ")</periodo>"
                    + "<fecha>" + seguimiento.get("fecha") + "</fecha>"
                    //+ "<etapa>" + seguimiento.get("etapasg") + "</etapa>"
                    + "<resultado>" + seguimiento.get("resseg") + "</resultado>"
                    + "<estado>" + seguimiento.get("estado") + "</estado>"
                    + "<alerta>" + seguimiento.get("semsg") + "</alerta>"
                    + "<ingresos>" + numFormat.format(Float.parseFloat(seguimiento.get("ingrrp").toString())) + "</ingresos>"
                    + "<gasper>" + numFormat.format(Float.parseFloat(seguimiento.get("gastpe").toString())) + "</gasper>"
                    + "<otrgastos>" + numFormat.format(Float.parseFloat(seguimiento.get("otrgas").toString())) + "</otrgastos>"
                    + "<inversion>" + numFormat.format(Float.parseFloat(seguimiento.get("inveje").toString())) + "</inversion>"
                    + "<costInt>" + numFormat.format(Float.parseFloat(seguimiento.get("costInt").toString())) + "</costInt>"
                    + "<feclim>" + seguimiento.get("fecLim") + "</feclim>"
                    + "<nmovs>" + seguimiento.get("mov") + "</nmovs>"
                    + "<permisoGer>" + seguimiento.get("permisosGer") + "</permisoGer>"
                    + "<permisoDir>" + seguimiento.get("permisosDir") + "</permisoDir>"
                    + "<acciones>" + seguimiento.get("acciones") + "</acciones>"
                    + "<soporte>" + seguimiento.get("soporte") + "</soporte>"
                    + "<obsvDir>" + seguimiento.get("obsv_dir") + "</obsvDir>"
                    + "<avance>" + seguimiento.get("avance") + "</avance>"
                    + "<listaDedicacion>";
            for (HashMap dedicacion : proyecto.getLisDedicacionSeguimiento()) {
                //idd, ids, rec,horas
                respuesta = respuesta + "<dedicacion>"
                        + "<idDed>" + dedicacion.get("idd") + "</idDed>"
                        + "<recurso>" + dedicacion.get("nombres") + "</recurso>"
                        + "<horas>" + dedicacion.get("horas") + "</horas>"
                        + "</dedicacion>";
            }
            respuesta = respuesta + "</listaDedicacion>";
        } catch (Exception e) {
            respuesta = respuesta + "<id>Error</id>";
        }
        respuesta = respuesta + "</seguimiento>";
        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(respuesta);
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
