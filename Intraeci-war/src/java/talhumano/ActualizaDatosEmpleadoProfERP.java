/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package talhumano;

import BDintraeci.EmpleadoRemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author andres.rojas
 */
public class ActualizaDatosEmpleadoProfERP extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
            out.println("<title>Servlet ActualizaDatosEmpleadoERP</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ActualizaDatosEmpleadoERP at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod_emp=request.getParameter("cod_emp");
        String linkedin = request.getParameter("linkedin");
        String cvlac = request.getParameter("cvlac");
        String youtube = request.getParameter("youtube");
        String researchgate = request.getParameter("researchgate");
        String facebook = request.getParameter("Facebook");
        String googleScholar = request.getParameter("GoogleScholar");
        String extension = request.getParameter("ext");
        String ubicacion = request.getParameter("ubicacion");
        String[] intereses = request.getParameterValues("intereses");
        String perfil_completo = request.getParameter("perfil_completo_input");
        String inf_veridica = request.getParameter("inf_veridica");
        String ind_acepta = request.getParameter("ind_acepta");
        String ind_modifica = request.getParameter("ind_modifica");
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        
        Integer res=0;
        
        try {
            res=emp.guardaDatosBasicosProfERP(cod_emp, ubicacion, extension,  perfil_completo, inf_veridica, ind_acepta, ind_modifica);
        } catch (Exception ex) {
            res=0;
        }
        
        if(res!=0){
            try {
                if(facebook!=null&&!facebook.trim().equals("")){
                    emp.guardaRedSocialERP(cod_emp, "3", facebook);
                }
                if(cvlac!=null&&!cvlac.trim().equals("")){
                    emp.guardaRedSocialERP(cod_emp, "4", cvlac);
                }
                if(linkedin!=null&&!linkedin.trim().equals("")){
                    emp.guardaRedSocialERP(cod_emp, "5", linkedin);
                }
                if(youtube!=null&&!youtube.trim().equals("")){
                    emp.guardaRedSocialERP(cod_emp, "6", youtube);
                }
                if(researchgate!=null&&!researchgate.trim().equals("")){
                    emp.guardaRedSocialERP(cod_emp, "7", researchgate);
                }
                 if(googleScholar!=null&&!googleScholar.trim().equals("")){
                    emp.guardaRedSocialERP(cod_emp, "8", googleScholar);
                }
                if(intereses!=null && intereses.length>0){
                    for (String interes : intereses) {
                        emp.guardaInteresEmpERP(cod_emp, interes);
                    } 
                }
            } catch (Exception ex) {
                res=0;
            }
        }
        
        response.sendRedirect("HojaVidaProf?respuesta="+res+"&paramtext=0&cod_emp="+cod_emp);
        
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
