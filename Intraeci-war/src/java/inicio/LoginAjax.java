/*
 * LoginAjax.java
 *
 * Created on 30 de octubre de 2006, 09:50 AM
 */
package inicio;

import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author alexgz
 * @version
 */
public class LoginAjax extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet LoginAjax</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet LoginAjax at " + request.getContextPath () + "</h1>");
        out.println("</body>");
        out.println("</html>");
         */
        //out.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String conectado = new String("");
        String usuario, clave;
        HttpSession sesion;
        login.InicioProfRemoteBusiness ingresar = null;
        login.LoginRemoteBusiness loginemp = null;
        usuario = request.getParameter("usuario");
        usuario = usuario.replace("@escuelaing.edu.co", "");
        usuario = usuario.replace("@mail.escuelaing.edu.co", "");
        clave = "NA";
        sesion = request.getSession(false);
        response.setContentType("text/html");
        response.setHeader("Cache-Control", "no-cache");
        //  PrintWriter pw = response.getWriter();
        PrintWriter out = response.getWriter();
        inicio.conectaEJB conEjb = new inicio.conectaEJB();

        if (usuario == null || usuario.equals("")) {
            request.setAttribute("error", "Falta alguno de los campos");
            request.getRequestDispatcher("/error.jsp").forward(request, response);

        } else {
            if (!(usuario.equals(""))) {
                loginemp = conEjb.lookupLoginBean();
                if (conEjb.conLog) {
                    //conectado = loginemp.getInicio(usuario, clave);
                    conectado = "conectado";
                    if (conectado.equals("conectado")) {
                        try {
                            ingresar = conEjb.lookupInicioProfBean(usuario);
                        } catch (ArrayIndexOutOfBoundsException e) {

                            request.setAttribute("error", "El usuario no se ha autenticado correctamente");
                            request.getRequestDispatcher("/error.jsp").forward(request, response);

                        }
                        sesion = request.getSession(true);
                        sesion.setAttribute("usuario", usuario);
                        sesion.setAttribute("empleado", ingresar);
                        sesion.setAttribute("clave", clave);
                        response.sendRedirect("Menu");
                        //pw.write("<root>OK</root>");
                    } else {
                        request.setAttribute("error", "El usuario no tiene permisos en este contexto");
                        request.getRequestDispatcher("/error.jsp").forward(request, response);
                    }
                }
            } else {

                request.setAttribute("error", "Falta alguno de los campos");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            }
        }

        //  pw.flush();
    }

    /*protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String conectado = new String(""); 
        String usuario, clave;
        HttpSession sesion;
        login.InicioProfRemoteBusiness ingresar = null;
        login.LoginRemoteBusiness loginemp = null;
        usuario = request.getParameter("usuario");
        clave = request.getParameter("clave");
        sesion = request.getSession(false);
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter pw = response.getWriter();
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        if (sesion != null){
            try{
                sesion.invalidate();
            }catch (java.lang.IllegalStateException e){}
            pw.write("<root>Ya existia una Sesion! Vuelva a autenticarse</root>");
        }else{
            if (usuario == null || clave == null || usuario.equals("") || clave.equals("")){
                pw.write("<root>Falta alguno de los campos</root>");
            }else{
                if (!(usuario.equals(""))||!(clave.equals(""))){
                            ingresar = conEjb.lookupInicioProfBean(usuario, clave);
                            if(ingresar.getMenu().equals("1") || ingresar.getMenu().equals("2")){
                                sesion = request.getSession(true);
                                sesion.setAttribute("usuario", usuario);
                                sesion.setAttribute("empleado", ingresar);
                                pw.write("<root>OK</root>");
                            }else{
                                pw.write("<root>El usuario no se ha autenticado correctamente</root>");
                            }
                    //}
                }else{
                    pw.write("<root>Falta alguno de los campos</root>");
                }
            }
        }
        pw.flush();
    }*/
    /**
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
