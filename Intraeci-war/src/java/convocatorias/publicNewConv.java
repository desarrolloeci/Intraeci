/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package convocatorias;

import BDintraeci.ConvocatoriaRemote;
import BDintraeci.EmpleadoRemote;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import inicio.conectaEJB;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Luis Salas
 */
public class publicNewConv extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet publicNewConv</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet publicNewConv at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String operacion = request.getParameter("oper");
        
        int msg = 1;

        try {
            HttpSession session = request.getSession(false);
            
            if (session == null) throw new Exception("0");
            
            
            ConvocatoriaRemote convocatoria = (ConvocatoriaRemote) session.getAttribute("convocatoria");

            if (convocatoria == null) {
                conectaEJB conEjb = new conectaEJB();
                convocatoria = conEjb.lookupConvocatoriaRemote("75107740", "-1");
                session.setAttribute("convocatoria", convocatoria);
            }
            
            EmpleadoRemote emp = (EmpleadoRemote) session.getAttribute("emp");
                
            if (emp == null) throw new Exception("0");

            boolean isAdm = (emp.IsAdmConvoca() == 1)?true:false;
            
            //boolean isAdm = true;

            if (!isAdm) throw new Exception("2");

            String idconv = request.getParameter("idconv");
            String nombre = request.getParameter("NomNew");
            String descripcion = request.getParameter("DscripNew");
            String fechaInicio = request.getParameter("FecIni");
            String fechaFin = request.getParameter("FecFin");
            fechaInicio=fechaInicio.split("/")[2]+"/"+fechaInicio.split("/")[1]+"/"+fechaInicio.split("/")[0];
            fechaFin=fechaFin.split("/")[2]+"/"+fechaFin.split("/")[1]+"/"+fechaFin.split("/")[0];
            String tipo = request.getParameter("TipoNeww");
            String asignatura = "0";//request.getParameter("AsigNew");
            String periodo = request.getParameter("periodoNew");
            String responsable = request.getParameter("RespNew");
            String director = request.getParameter("DirNew");
            
            int idCon;
            if (operacion.equals("0")) {
               // idCon = convocatoria.crear (nombre, descripcion, fechaInicio, fechaFin, tipo, asignatura, periodo, responsable, director);
               idCon =3;
            } else {
                idCon = convocatoria.editar (idconv, nombre, descripcion, fechaInicio, fechaFin, tipo, asignatura, periodo, responsable, director);
            }
            
            
            if (idCon > 0 ) {
                msg = 3;
            }
            
        } catch (Exception e) {
            Logger.getLogger(publicNewConv.class.getName()).log(Level.SEVERE, null, e);
            msg = Integer.parseInt((e.getMessage().length() > 1)?"1":e.getMessage());
        }
        
        StringBuilder respuesta = new StringBuilder("<resultado>");
        
        if (msg == 3) {
            respuesta.append("<dato>1</dato>");
            if (operacion.equals("0")) {
                respuesta.append("<valor>Se ha publicado la convocatoria exitosamente.</valor>");
            } else {
                respuesta.append("<valor>Se ha editado la convocatoria exitosamente.</valor>");
            }
        } else {
            respuesta.append("<dato>0</dato>");
            if (msg == 0) {
                respuesta.append("<valor>El usuario no se encuentra autenticado o su sesión ha finalizado.</valor>");
            } else if (msg == 1) {
                respuesta.append("<valor>Ha ocurrido un error mientras se realizaba la operación. Por favor intente de nuevo más tarde.</valor>");
            } else if (msg == 2) {
                respuesta.append("<valor>El usuario no posee los permisos requeridos para ésta operación.</valor>");
            }
        }

        respuesta.append("</resultado>");
        
        PrintWriter pw = response.getWriter();
        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(respuesta.toString());
        pw.flush();
        pw.close();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
