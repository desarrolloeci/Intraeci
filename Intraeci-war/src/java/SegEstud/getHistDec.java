/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SegEstud;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mario Martínez
 */
public class getHistDec extends HttpServlet {

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
            out.println("<title>Servlet getHistDec</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet getHistDec at " + request.getContextPath() + "</h1>");
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
        PrintWriter pw = response.getWriter();
        
        String res = "<resultado>";
        
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            response.setContentType("text/html");

            HttpSession session;
            session = request.getSession(false);
            String usuario = (String) session.getAttribute("usuario");
            
            if (!(usuario != null && !usuario.equals(""))) {
                response.sendRedirect("cerrar?msg=4");
            }
            
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
            
            if (admin == null) {
                response.sendRedirect("cerrar?msg=4");
            }
            
            login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) session.getAttribute("empleado");
            
            if (empleado == null) {
                response.sendRedirect("cerrar?msg=4");
            }
            
            int idDpto = (Integer) session.getAttribute("departamento");
            String codEmp = empleado.getIdemp();
            String perAcad = empleado.getPeriodo();
            
            /* Codigo para sacar el tipo de empleado y enviarlo a la consulta, dentro de la forma como se arma la consulta 
             * se definen los perfiles dependiendo del tipo (las consultas que puede ver y las que no).
             * Sin embargo, si se llegan a crear más tipos de empleados, se debe crear una tabla, y definir sobre esta tabla
             * el ID del tipo, su nombre, y definir qué otros tipos puede leer.
             */
            int rolEmp = 0;
            Vector access = (Vector) admin.getSegEstEmpAdmitido(codEmp).elementAt(0);
            if (Integer.parseInt((String) access.elementAt(0)) > 0) rolEmp = Integer.parseInt((String) access.elementAt(2));
            
            Vector ret = admin.getHistConsultasDec(idDpto, perAcad, rolEmp);
            
            if (ret.size() > 0) {
                
                res += "<estado>1</estado>";
                
                Vector consulta;
                
                for (int i = 0; i < ret.size(); i++) {
                    consulta = (Vector) ret.elementAt(i);
                    
                    res += "<consulta>";
                        res += "<fecha>" + escapeXML(consulta.elementAt(0).toString()) + "</fecha>";
                        res += "<profesor>" + escapeXML(consulta.elementAt(1).toString()) + "</profesor>";
                        res += "<estudiante>" + escapeXML(consulta.elementAt(2).toString()) + "</estudiante>";
                        res += "<carne>" + escapeXML(consulta.elementAt(3).toString()) + "</carne>";
                        res += "<tipo>" + escapeXML(consulta.elementAt(4).toString()) + "</tipo>";
                        res += "<asignatura>" + escapeXML(consulta.elementAt(5).toString()) + "</asignatura>";
                        res += "<tema>" + escapeXML(consulta.elementAt(6).toString()) + "</tema>";
                    res += "</consulta>";
                }
            } else {
                res += "<estado>0</estado>";
            }
        } catch (Exception ex) {
            res = "<resultado>";
            res += "<estado>-1</estado>";
            Logger.getLogger(getHistDec.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        res += "</resultado>";
        
        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(res);
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
    
    private String escapeXML(String escapeText) {
        String result = escapeText;
            if (result.equals("")) result = "_";
            result = result.replaceAll("&", "&amp;");
            result = result.replaceAll("<", "&lt;");
            result = result.replaceAll(">", "&gt;");
            result = result.replaceAll("\"", "&quot;");
            result = result.replaceAll("'", "&apos;");
        return result;
    }
}
