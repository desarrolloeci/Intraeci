/*
 * reservAudit.java
 *
 * Created on 6 de junio de 2007, 03:30 PM
 */

package servlets;

import java.io.*;
import java.net.*;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author alexgz
 * @version
 */
public class reservAudit extends HttpServlet {
    
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
        out.println("<title>Servlet reservAudit</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet reservAudit at " + request.getContextPath () + "</h1>");
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
        PrintWriter         out = response.getWriter() ;
        HttpSession         sesion ;
        Vector              vresp ;
        String              fecha, actualizar, consult, sec, dia, hora, rcsal, horfin, asig;
        String              tipo, idgrupo, capac ;
        String              idProf = "0";
        int                 resec = 0;
        sesion = request.getSession(false);
        //String cedula = new String((String)sesion.getAttribute("cedula"));
        login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness)sesion.getAttribute("empleado");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        if (sesion == null) {
            response.sendRedirect("cerrar?msg=4") ;
        }
        else {
            sec         =   new String((String)sesion.getAttribute("sec"));
            fecha       =   request.getParameter("fecha") ;   
            dia         =   request.getParameter("dia") ;               
            hora        =   request.getParameter("hini") ; 
            hora        =   hora + request.getParameter("mini") ; 
            horfin      =   request.getParameter("hfin");   
            horfin      =   horfin + request.getParameter("mfin");   
            rcsal       =   request.getParameter("req") ;               
            tipo        =   request.getParameter("tipo") ;                           
            idgrupo     =   request.getParameter("idgrp") ;                            
            asig        =   request.getParameter("asig") ;             
            capac       =   request.getParameter("cap") ;    
            String ndia =   request.getParameter("ndia") ;  
            String descr =  request.getParameter("descr");
            if(descr.length()>99)
                descr = descr.substring(0, 99);
            descr = descr.replace("'", "");
            int horaini, horafin, n=0;
            horaini = Integer.parseInt(hora);
            horafin = Integer.parseInt(horfin);
            String fechau[]=new String[50];
            StringTokenizer st1 = new StringTokenizer(fecha, "-");
            int j=0;
            while (st1.hasMoreTokens()) { 
                fechau[j]=st1.nextToken();                      
                j=j+1;   
            }
            String fecuso = fechau[0]+"-"+fechau[1]+"-"+fechau[2] ;
            String fec = fechau[0]+"/"+fechau[1]+"/"+fechau[2] ;  
            if (empleado.getIdProf().equals("")){
                idProf = empleado.getIdemp();
            }    
            else { 
                idProf = empleado.getIdProf();                  
            }
                                
             Vector consalon = admin.getConAudit(fec, hora, ndia, horafin);
             if (consalon.size() > 0 ){
                Vector idsal = (Vector)consalon.elementAt(0);
                actualizar = new String("insert into registro.usosalon " +       
                         " (fecuso, iduso, id_sal, hora, dia, fsol, tipo, estad, per, prof, idgrp, " +
                         " asig, descr, cap, req, hfin) values (convert(varchar(10), '"+ fecuso +"', 103), '"+ sec +"', '" +
                         idsal.elementAt(0) + "', '"+ hora +"', '"+ ndia +"', getdate(), '"+ 
                         tipo +"', 'S', '" + empleado.getPeriodo() + "', '"+ idProf +"', '"+ idgrupo +"', '"+ asig +"', '"+ 
                         descr +"', '"+ capac +"', '"+ rcsal +"', '"+ 
                         horafin +"') " )  ; 
                int resultado= admin.actualiza(actualizar);      
                //int resultado = 0;
                if (resultado == 0) {
                   out.println(actualizar);
                   out.println("Ha ocurrido un error, intente mas tarde");
                }
                else {
                    resec = admin.sigSecuencia("RESERVAS");                            
                    response.sendRedirect("Mensajes?idmsj=5&salon=" + idsal.elementAt(1) + "&fecuso=" +
                            fecha + "&hora=" + hora + "&horafin=" + horafin + "&sec=" + sec);
                }   
             }
            else { 
                sesion.setAttribute("fecuso", fecha);
                sesion.setAttribute("dia", dia);
                sesion.setAttribute("hora", hora);  
                sesion.setAttribute("capac", capac); 
                sesion.setAttribute("descr", descr);
                sesion.setAttribute("ndia", ndia);
                response.sendRedirect("ReservaAuditorio?error=formaerror") ;
             }
            /*}
            else
                 response.sendRedirect("../../jsp/forma1.jsp") ;*/
        }
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
