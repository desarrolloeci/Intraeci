/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utiles;

import BDintraeci.EmpleadoRemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Mario
 */
public class exportExcel extends HttpServlet {
    //Crea un mapa del export realizado por un empleado específico, así no mezcla la información.
    HashMap <EmpleadoRemote, String> exportMap = new HashMap <EmpleadoRemote, String>();
    private final String CHARACTER_ENCODE = "UTF-8";

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
        
        HttpSession sesion = request.getSession(false);
        PrintWriter out = response.getWriter();
        try {
            //Verificamos la sesión
            if (sesion == null) throw new Exception("El usuario no está auntenticado, o su sesión ha expirado");
            EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("empleado2");
            //Verificamos que se haya realizado realizado primero el método POST, en el cual se realiza el mapeo
            if (exportMap.containsKey(emp) == false) throw new Exception("Solicitud incompleta");
            String exportData = exportMap.get(emp);
            //Verificamos que existe información (la decodificación puede haber fallado)
            if (exportData == "" || exportData == null) throw new Exception("No existen datos a exportar");
            exportMap.remove(emp);
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding(CHARACTER_ENCODE);
            response.setHeader("Content-Disposition", "attachment; filename=\"exportTemporal.xls\"");
            response.setHeader("Cache-Control","no-cache");
            response.setHeader("Connection", "close");
            out.write(exportData);
        } catch (Exception err) {
            out.write(err.getMessage());
        }
        
        out.flush();
        out.close();
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession(false);
        
        try{
            String exportData = "";
            response.setHeader("Connection", "close");
            response.setCharacterEncoding(CHARACTER_ENCODE);
            if (sesion == null) throw new Exception("El usuario no está auntenticado, o su sesión ha expirado");
            EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("empleado2");
            exportData = request.getParameter("exportData");
            exportMap.put(emp, exportData);
        } catch (Exception err) {
            PrintWriter out = response.getWriter();
            out.write(err.getMessage());
            out.flush();
            out.close();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Exporta el contenido del atributo 'exportData' en Excel";
    }// </editor-fold>
}
