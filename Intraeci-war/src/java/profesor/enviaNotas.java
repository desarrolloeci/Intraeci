/*
 * enviaNotas.java
 *
 * Created on 28 de noviembre de 2006, 11:58 AM
 */

package profesor;

import java.io.*;
import java.net.*;
import java.util.Vector;

import javax.servlet.*;
import javax.servlet.http.*;


public class enviaNotas extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet enviaNotas</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet enviaNotas at " + request.getContextPath () + "</h1>");
        out.println("</body>");
        out.println("</html>");
         */
        out.close();
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesion; 
        int res, error;
        String cadena = "nota";
        sesion = request.getSession(true);
        String descerror[]=new String[5];
        Vector estudiantes = new Vector();
        Vector estudiantes1 = new Vector();
        String consulta = new String();
        String notaEst = new String();
        String nota = new String();
        String variable = new String();
        String tercio = request.getParameter("tercio");	
        String idgrupo = request.getParameter("idgrupo");
        String idasig = request.getParameter("idasig");
         String codgrupo = request.getParameter("codgrupo");
        String suma = request.getParameter("suma");
        String peracad = request.getParameter("peracad");
        String nivel ="";
        login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness)sesion.getAttribute("empleado");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet enviaNotas</title>");
        out.println("</head>");
        out.println("<body>");
       estudiantes = empleado.getEstudiantes();
       // estudiantes1 = profesor.getListasClase(peracad, idasig, codgrupo);
     // out.println(estudiantes.size());
        error = 0;
        if(estudiantes.size()>0){
            for ( int i=0 ;  i < estudiantes.size() ;  i++ ){ 
                Vector estudiante = (Vector)estudiantes.elementAt(i);
                nota= String.valueOf(i);
                variable=(String)cadena.concat(nota);
                notaEst = request.getParameter(variable);
               // nivel = request.getParameter("nivel");
                nivel = estudiante.elementAt(16).toString();
                if ((tercio.equals("1") && notaEst != null && nivel.equals("PRE"))){
                    res = profesor.IngresaNotas("nota1", idgrupo, estudiante.elementAt(6).toString(), notaEst);
                    if(res <= 0){
                        descerror[error] = String.valueOf(i);
                        error = error + 1;  
                    }
                }else if ((tercio.equals("1") && notaEst != null && nivel.equals("POST"))){
                    res = profesor.IngresaNotasPregradoPOS("nota1", codgrupo, estudiante.elementAt(6).toString(), suma, idasig, notaEst);
                    if(res <= 0){
                        descerror[error] = String.valueOf(i);
                        error = error + 1;  
                    }
                }

                else if((tercio.equals("2") && notaEst != null && nivel.equals("PRE"))){
                    res = profesor.IngresaNotas("nota2", idgrupo, estudiante.elementAt(6).toString(), notaEst);
                    if(res <= 0){
                        descerror[error] = String.valueOf(i);
                        error = error + 1;  
                    }
                } else if ((tercio.equals("2") && notaEst != null && nivel.equals("POST"))){
                    res = profesor.IngresaNotasPregradoPOS("nota2", codgrupo, estudiante.elementAt(6).toString(), suma, idasig, notaEst);
                    if(res <= 0){
                        descerror[error] = String.valueOf(i);
                        error = error + 1;
                    }
                }
                else if ((tercio.equals("3") && notaEst != null && nivel.equals("PRE")) ) {
                    res = profesor.IngresaNotas("nota3", idgrupo, estudiante.elementAt(6).toString(), notaEst);
                    if(res <= 0){
                        descerror[error] = String.valueOf(i);
                        error = error + 1;
                    }
                }else if ((tercio.equals("3") && notaEst != null && nivel.equals("POST"))){
                    res = profesor.IngresaNotasPregradoPOS("nota3", codgrupo, estudiante.elementAt(6).toString(), suma, idasig, notaEst);
                    if(res <= 0){
                        descerror[error] = String.valueOf(i);
                        error = error + 1;  
                    }
                }

                else if ((tercio.equals("4") && notaEst != null && nivel.equals("PRE"))){
                    res = profesor.IngresaNotas("nota_lab", idgrupo, estudiante.elementAt(6).toString(), notaEst);
                    if(res <= 0){
                        descerror[error] = String.valueOf(i);
                        error = error + 1;
                    }
                }else if ((tercio.equals("4") && notaEst != null && nivel.equals("POST"))){
                    res = profesor.IngresaNotasPregradoPOS("nota_lab", codgrupo, estudiante.elementAt(6).toString(), suma, idasig, notaEst);
                    if(res <= 0){
                        descerror[error] = String.valueOf(i);
                        error = error + 1;  
                    }
                }
            }
            if ((tercio.equals("1"))){
                res = profesor.IngresaAcum("s1", suma, "fe1", idgrupo, idasig);
                if(res <= 0){
                    descerror[error] = "ErrorIngre1";
                    error = error + 1;
                }
            }else if((tercio.equals("2"))){
                res = profesor.IngresaAcum("s2", suma, "fe2", idgrupo, idasig);
                if(res <= 0){
                    descerror[error] = "ErrorIngre2";
                    error = error + 1;
                }
            }else if((tercio.equals("3"))){
                res = profesor.IngresaAcum("s3", suma, "fe3", idgrupo, idasig);
                if(res <= 0){
                    descerror[error] = "ErrorIngre3";
                    error = error + 1;
                }
            }else if((tercio.equals("4"))){
                res = profesor.IngresaAcum("sl", suma, "fel", idgrupo, idasig);
                if(res <= 0){
                    descerror[error] = "ErrorIngre4";
                    error = error + 1;
                }
            }
            empleado.limpiaVariables();
            if(error == 0){
                if (tercio.equals("1") || (tercio.equals("2")) || (tercio.equals("3")) ||(tercio.equals("4")))
                    response.sendRedirect("Mensajes?idmsj=1");
                else
                    response.sendRedirect("Mensajes?idmsj=2");
            }else{
                out.println("Ha ocurrido un error, por favor comuníquese con la oficina de registro académico ");
            }
        }else{
            out.println("Ha ocurrido un error, no hay registros");
        }
        out.println("</body>");
        out.println("</html>");
    }


    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
