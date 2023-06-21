/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package talhumano;

import BDintraeci.EmpleadoRemote;
import java.io.IOException;
import java.io.PrintWriter;
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
public class CapturaDatosDonacion extends HttpServlet {

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
            out.println("<title>Servlet CapturaDatosDonacion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CapturaDatosDonacion at " + request.getContextPath() + "</h1>");
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
        String[] meses = request.getParameterValues("meses");
        String mes_inicio = request.getParameter("cobro_indefinido");
        String valor = request.getParameter("valor");
        valor = valor.replaceAll("[^\\d]", "");
        String cod_emp = request.getParameter("cod_emp");
        String donacion_indefinida="0";
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        Integer ans = 0;
        String[] meses_seleccionados = new String[12];
        if(meses!=null&&meses.length>0){
            for (int i = 0; i < meses_seleccionados.length; i++) {
                String mes_seleccionado="0";
                for (String mes : meses) {
                    if(i+1==Integer.parseInt(mes)){
                        mes_seleccionado="1";
                    }
                }
                meses_seleccionados[i]=mes_seleccionado;
            }
        }else if(mes_inicio!=null&&!mes_inicio.equals("")){
            for (int i = 0; i < meses_seleccionados.length; i++) {
                meses_seleccionados[i]="0";
            }
            meses_seleccionados[Integer.parseInt(mes_inicio)-1]="1";
            donacion_indefinida="1";
        }
        try {
            ans=emp.guardaDonacionUnete(cod_emp, meses_seleccionados, donacion_indefinida, valor);
        } catch (Exception e) {
            
        }
        response.sendRedirect("FormUnete?respuesta="+ans);
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
