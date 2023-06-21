/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos;

import BDintraeci.BDproyectoRemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.ArrayList;
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
public class despFase extends HttpServlet {

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
            out.println("<title>Servlet despFase</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet despFase at " + request.getContextPath () + "</h1>");
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
        response.setHeader("Cache-control","no-cache");
        StringBuilder respuesta = new StringBuilder();
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        BDproyectoRemote proyecto = (BDproyectoRemote) sesion.getAttribute("proyecto");
        respuesta.append("<lisdedicacion>");
        try {
            for (HashMap dedicacion : proyecto.getLisDedicacion(request.getParameter("idEnt"))) {
                respuesta.append("<dedicacion>");
                respuesta.append("<id>").append(dedicacion.get("iddfa")).append("</id>");
                respuesta.append("<nombre>").append(dedicacion.get("nombres")).append("</nombre>");
                respuesta.append("<doc>").append(dedicacion.get("rec")).append("</doc>");
                respuesta.append("<unidad>").append(dedicacion.get("nom_cco")).append("</unidad>");
                respuesta.append("<totalhoras>").append(dedicacion.get("thor")).append("</totalhoras>");
                respuesta.append("<numsem>").append(dedicacion.get("nsem")).append("</numsem>");
                respuesta.append("<fecini>").append(dedicacion.get("Inicio")).append("</fecini>");
                respuesta.append("<fecfin>").append(dedicacion.get("Fin")).append("</fecfin>");
                respuesta.append("</dedicacion>");
            }
        } catch (Exception e) {
            respuesta.append("<id>Error</id>");
        }
        respuesta.append("</lisdedicacion>");
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
        String ient = "", res = "";
        PrintWriter pw = response.getWriter();
        ient = (String) request.getParameter("ide");
        HttpSession sesion = request.getSession(false);
        BDproyectoRemote proyecto = (BDproyectoRemote) sesion.getAttribute("proyecto");
        res = "<entregable>";
        try {
            HashMap entregable = proyecto.getEntregable(ient);
            NumberFormat numFormat = NumberFormat.getInstance(Locale.US);
            res = res + "<id>" + entregable.get("ident") + "</id>"
                    + "<nombre>" + entregable.get("noment") + "</nombre>"
                    + "<estado>" + entregable.get("estent") + "</estado>"
                    + "<descrip>" + entregable.get("descent") + "</descrip>"
                    + "<inicio>" + entregable.get("Inicio") + "</inicio>"
                    + "<fin>" + entregable.get("Fin") + "</fin>"
                    + "<nomResp>" + entregable.get("nombres") + "</nomResp>"
                    + "<idResp>" + entregable.get("cod_emp") + "</idResp>"
                    + "<ccExt>" + entregable.get("centroCosto") + "</ccExt>"
                    + "<ccInt>" + entregable.get("idcen") + "</ccInt>"
                    + "<permiso>" + entregable.get("permisos") + "</permiso>"
                    + "<ting>" + numFormat.format(Float.parseFloat(entregable.get("ting").toString())) + "</ting>"
                    + "<tgaspe>" + numFormat.format(Float.parseFloat(entregable.get("tgaspe").toString())) + "</tgaspe>"
                    + "<otrgas>" + numFormat.format(Float.parseFloat(entregable.get("otrgas").toString())) + "</otrgas>"
                    + "<invest>" + numFormat.format(Float.parseFloat(entregable.get("invest").toString())) + "</invest>"
                    + "<costInt>" + numFormat.format(Float.parseFloat(entregable.get("costInt").toString())) + "</costInt>";
        } catch (Exception e) {
            res = res + "<id>Error</id>";
        }
        res = res + "</entregable>";
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
