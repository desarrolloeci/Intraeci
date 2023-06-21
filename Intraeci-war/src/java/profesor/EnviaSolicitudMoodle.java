/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

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
public class EnviaSolicitudMoodle extends HttpServlet {

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
            out.println("<title>Servlet EnviaSolicitudMoodle</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EnviaSolicitudMoodle at " + request.getContextPath () + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession sesion = request.getSession(true);
            login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) sesion.getAttribute("empleado");
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDprofesorRemoteBusiness datosBPM = conEjb.lookupBDprofesorBean();
            HashMap datosUsuarioBPM = datosBPM.getUsuarioBPM(empleado.getIdemp());
            String matriculaEstu = request.getParameter("estudiantes");
            if (matriculaEstu.equals(0)) {
                matriculaEstu = "NO";
            } else {
                matriculaEstu = "SI";
            }
            if (datosUsuarioBPM.size() > 0) {
                String respuestaPanel = "[[[1_TipoArea:::12085###OSIRIS]]]"
                        + "[[[1_Solicitante:::" + datosUsuarioBPM.get("ID") + "###" + datosUsuarioBPM.get("NombreCompleto") + "]]]"
                        + "[[[2_Solicitante/CodigoERP:::" + empleado.getIdemp() + "]]]"
                        + "[[[1_TipoSolicitudOsiris:::12094###Solicitud Curso en Moodle]]]"
                        + "[[[3_Asunto:::" + request.getParameter("categoria") + "]]]"
                        + "[[[3_Descripcion:::" + request.getParameter("observ") + "]]]"
                        + "[[[3_CampoGeneral1:::" + request.getParameter("asignatura") + "]]]"
                        + "[[[3_CampoGeneral2:::" + request.getParameter("grupo") + "]]]"
                        + "[[[3_CampoGeneral3:::" + request.getParameter("clave") + "]]]"
                        + "[[[3_CampoGeneral5:::" + matriculaEstu + "]]]"
                        + "[[[3_CampoGeneral4:::" + empleado.getUsrExchange() + "@escuelaing.edu.co]]]"
                        + "[[[2_TipoSolicitudOsiris/Id.:::12094]]]";
                Authenticator auth = new MiAutenticador();
                Authenticator.setDefault(auth);
                int respuesta = solicitudesAdministrativasExternas( respuestaPanel);
                if (respuesta > 0) {
                    response.sendRedirect("Mensajes?idmsj=8");
                } else {
                    response.sendRedirect("Mensajes?idmsj=9");
                }
            } else {
                response.sendRedirect("Mensajes?idmsj=10");
            }
        } catch (Exception e) {
            response.sendRedirect("Mensajes?idmsj=9");
        } finally {
            out.close();
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

    private static int solicitudesAdministrativasExternas(java.lang.String datos) {
        clienteSA.SolicitudesAdministrativasExternas_Service service = new clienteSA.SolicitudesAdministrativasExternas_Service();
        clienteSA.SolicitudesAdministrativasExternasSoap port = service.getSolicitudesAdministrativasExternasSoap();
        return port.solicitudesAdministrativasExternas(datos);
    }
}
