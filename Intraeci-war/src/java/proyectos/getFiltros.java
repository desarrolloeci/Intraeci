/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos;

import BDintraeci.EmpleadoRemote;
import BDintraeci.UtilesRemote;
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
public class getFiltros extends HttpServlet {

    public static final String OTRO = "0";
    public static final String EMPLEADOS = "1";
    public static final String CENTRO_COSTOS = "1";
    public static final String ASIGNATURAS = "2";
    public static final String CARGOS = "3";
    public static final String CIUDADES = "101";
    public static final String UNIVERSIDADES = "102";
    public static final String TPCOMPROMISO = "103";
    public static final String PROYECTOS = "104";

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
            out.println("<title>Servlet getEmpleados</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getEmpleados at " + request.getContextPath () + "</h1>");
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
        String filtro = request.getParameter("filtro");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        UtilesRemote utiles = conEjb.lookupUtilesRemote();
        String tipo = request.getParameter("tipo");
        StringBuilder respuesta = new StringBuilder();
        if (tipo.equals(EMPLEADOS)) {
            respuesta = new StringBuilder("<empleados>");
            try {
                for (HashMap empleado : utiles.getListEmpleados(filtro)) {
                    respuesta.append("<empleado>");
                    respuesta.append("<nombre>").append(empleado.get("nombres")).append("</nombre>");
                    respuesta.append("<id>").append(empleado.get("cod_emp")).append("</id>");
                    respuesta.append("<cc>").append(empleado.get("nom_ccosto")).append("</cc>");
                    respuesta.append("<idcc>").append(empleado.get("cod_ccosto")).append("</idcc>");
                    respuesta.append("</empleado>");
                }
            } catch (Exception e) {
                respuesta.append("<empleado>Error</empleado>");
            }
            respuesta.append("</empleados>");
        } else if (tipo.equals(OTRO)) {
            String caso = request.getParameter("caso");
            if (caso.equals(ASIGNATURAS)) {
                respuesta = new StringBuilder("<lista>");
                try {
                    for (HashMap item : utiles.getListAsignaturas(filtro)) {
                        respuesta.append("<item>");
                        respuesta.append("<nombre>").append(item.get("nombre")).append("</nombre>");
                        respuesta.append("<id>").append(item.get("id")).append("</id>");
                        respuesta.append("</item>");
                    }
                } catch (Exception e) {
                    respuesta.append("<item>Error</item>");
                }
                respuesta.append("</lista>");
            } else if (caso.equals(CENTRO_COSTOS)) {
                respuesta = new StringBuilder("<centrosCostos>");
                try {
                    for (HashMap item : utiles.getListCentroCostos(filtro)) {
                        respuesta.append("<centroCosto>");
                        respuesta.append("<nombre>").append(item.get("nombre")).append("</nombre>");
                        respuesta.append("<id>").append(item.get("id")).append("</id>");
                        respuesta.append("<cod>").append(item.get("cod")).append("</cod>");
                        respuesta.append("</centroCosto>");
                    }
                } catch (Exception e) {
                    respuesta.append("<item>Error</item>");
                }
                respuesta.append("</centrosCostos>");
            } else if (caso.equals(CARGOS)) {
                respuesta = new StringBuilder("<lista>");
                try {
                    for (HashMap item : utiles.getListaCargos(filtro)) {
                        respuesta.append("<item>");
                        respuesta.append("<nombre>").append(item.get("nom_car")).append("</nombre>");
                        respuesta.append("<id>").append(item.get("cod_car")).append("</id>");
                        respuesta.append("</item>");
                    }
                } catch (Exception e) {
                    respuesta.append("<item>Error</item>");
                }
                respuesta.append("</lista>");
            } else if (caso.equals(CIUDADES) || caso.equals(UNIVERSIDADES) || caso.equals(TPCOMPROMISO)
                    || caso.equals(PROYECTOS) ) {
                HttpSession sesion = request.getSession(false);
                EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
                HashMap[] lista = null;
                HashMap item;
                try {
                    if (caso.equals(CIUDADES)) {
                        lista = emp.lisciudades(filtro);
                    } else if (caso.equals(UNIVERSIDADES)) {
                        lista = emp.lisUniversidades(filtro);
                    } else if (caso.equals(PROYECTOS)) {
                        lista = emp.lisproyectos(filtro);
                    } else  {
                        lista = emp.listpcompromiso(filtro);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(getFiltros.class.getName()).log(Level.SEVERE, null, ex);
                }

                respuesta = new StringBuilder("<lista>");
                for (int i = 0; i < lista.length; i++) {
                    item = lista[i];
                    respuesta.append("<item>");
                    respuesta.append("<nombre>").append(item.get("nom")).append("</nombre>");
                    respuesta.append("<id>").append(item.get("cod")).append("</id>");
                    respuesta.append("</item>");
                }
                respuesta.append("</lista>");
            }
        }
        //Enviar Respuesta
        response.setContentType("text/xml");
        PrintWriter pw = response.getWriter();
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
}
