/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package convocatorias;

import BDintraeci.ConvocatoriaRemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Authenticator;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import otros.configBPM.MiAutenticador;

/**
 *
 * @author Juan Pablo Garcia
 */
public class iniciaProceso extends HttpServlet {

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
            out.println("<title>Servlet iniciaProceso</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet iniciaProceso at " + request.getContextPath () + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        StringBuilder respuesta = new StringBuilder("<resultado>");
        try {
            HttpSession sesion = request.getSession(true);
            ConvocatoriaRemote convocatoria = (ConvocatoriaRemote) sesion.getAttribute("convocatoria");
            int idCon = guardeConvocatoria(request, convocatoria);
            if (idCon > 0 && crearProceso(idCon, convocatoria.getUsuarioBPM()) > 0) {
                respuesta.append("<dato>0</dato>");
                respuesta.append("<valor>Operación Exitosa</valor>");
            } else {
                respuesta.append("<valor>Fallo en la Operación.</valor>");
            }
        } catch (Exception ex) {
            respuesta.append("<valor>Fallo en la Operación: ").append(ex.getMessage()).append("</valor>");
        }
        respuesta.append("</resultado>");
        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(respuesta.toString());
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

    private int guardeConvocatoria(HttpServletRequest request, ConvocatoriaRemote convocatoria) throws Exception {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descrip");
        String fechaInicio = request.getParameter("fecIni");
        String fechaFin = request.getParameter("fecFin");
        String tipo = request.getParameter("tipo");
        String asignatura = request.getParameter("idAsig");
        String periodo = request.getParameter("perAcad");
        return -1;
        //return convocatoria.crear(nombre, descripcion, fechaInicio, fechaFin, tipo, asignatura, periodo,periodo);
    }

    private int crearProceso(int id, HashMap usuarioBPM) throws Exception {
        Authenticator auth = new MiAutenticador();
        Authenticator.setDefault(auth);
        return convocatoria("[[[1_Solicitante:::" + usuarioBPM.get("ID") + "###" + usuarioBPM.get("NombreCompleto") + "]]][[[3_idConvocatoria:::" + id + "]]]");
    }

    private static int convocatoria(java.lang.String datos) {
        clienteWSC.Convocatoria_Service service = new clienteWSC.Convocatoria_Service();
        clienteWSC.ConvocatoriaSoap port = service.getConvocatoriaSoap();
        return port.convocatoria(datos);
    }
}
