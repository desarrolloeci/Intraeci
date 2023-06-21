/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import otros.ConfEci;
import javax.servlet.http.HttpSession;
import login.InicioProfBean;
import login.InicioProfRemoteBusiness;
import login.InicioProfRemoteHome;

/**
 *
 * @author alexgz
 */
public class GuardaAsigPos extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GuardaAsigPos</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuardaAsigPos at " + request.getContextPath () + "</h1>");
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
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        
        int tot = 0, resp = 0, cambio=0;
        String dcon1="x", dcon2="x", dcon3="x",dcon4="x";
        double valdesc=0, valtot=0, descegre=0, descaeci=0;
        String actualizar, idest, act1, camest,plan,cohorte, peraca, consulta;
        String vaeci="", vegre="";
        String nord = "", valder = "", valord = "", docest = "", egre = "", idprof="0";
        String asig="";
        sesion = request.getSession(false);
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();

        idest = request.getParameter("idest");
        plan = request.getParameter("plan");
        cohorte = request.getParameter("cohorte");
        peraca = request.getParameter("peraca");
        asig = request.getParameter("newasig").toString();

        ConfEci cfgEci = new ConfEci();
        login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness)sesion.getAttribute("empleado");

        if (sesion == null) {
            response.sendRedirect("cerrar?msg=4");
        } else {
            /*String per = request.getParameter("anniop") + "-" + request.getParameter("perp");
            String peracad = cfgEci.getPerOrdenesPos();
            if (request.getParameter("anniop").equals("0") || request.getParameter("perp").equals("null")) {
                out.println("Ha ocurrido un error, periodo incorrecto");
            } */
            if (peraca.equals(" ")){
                out.println("Ha ocurrido un error");
            }
            else {
                int tamch = Integer.parseInt(request.getParameter("tamch"));
                for (int i = 0; i < tamch; i++) {
                    if (request.getParameter("asigpos" + i) != null) {
                         //per_acad = '" + peraca + "', "
                        actualizar = "update registro.registro.biblia_post set clave = '" + request.getParameter("nvclave" + i) + "' " +
                                " where id_bib = '" + request.getParameter("asigpos" + i) + "' ";
                        int resultado = admin.actualiza(actualizar);
                        tot = tot + resultado;
                        cambio=1;
                    }
                }
// Agregar una nueva asignatura en biblia_post
                if(!asig.equals("null")){
                    Vector s=new Vector();
                    s=admin.getSec();
                    int sec=Integer.parseInt(s.elementAt(0).toString());
                    int sig=sec+1;
                    actualizar= " update registro.secuencias set sig_sec="+sig+" where nombre='BIBLIAPOST' " ;
                    int resultado = admin.actualiza(actualizar);

                    s=admin.getCredAsig(asig);
                    int cred=Integer.parseInt(s.elementAt(0).toString());
                    
                    int res=admin.InsertAsig(sec, asig, idest, peraca, cred);
                    // Prueba
                    res=resultado+res;
                    cambio=1;
                   
                }

                Vector a = admin.getNumorden(idest, peraca);
                Vector c = admin.getDocestudiante(idest);

// Revisar si existe una orden y si se agrego alguna asignatura
                if (a.size() > 0 && cambio==1) {

                    Vector b = admin.getValorden(idest, peraca);
                    nord = a.elementAt(0).toString();
                    valder = a.elementAt(1).toString(); // Valor anterior
                    double extemp=0;
                    if (b.size() > 0) {
                        dcon1=a.elementAt(2).toString();
                        dcon2=a.elementAt(3).toString();
                        dcon3=a.elementAt(4).toString();
                        dcon4=a.elementAt(5).toString();

                        valord = b.elementAt(0).toString(); // Nuevo valor
                        docest = c.elementAt(0).toString();
                        Vector d = admin.getEgresado(idest, docest);
                        egre = d.elementAt(0).toString();

// Cambia las asignaturas que tiene clave P a F
                        camest= "update registro.biblia_post set clave = 'F', idord='"+nord+"'  where id_est = '"+ idest +"' and clave = 'P' and per_acad = '"+ peraca+"' ";
                        int res1 = admin.actualiza(camest);
// Buscar si hay extemporaneidad y calcularla
                        if (dcon1.equals("20") || dcon2.equals("20") || dcon3.equals("20") || dcon4.equals("20") ){
                                extemp =Integer.parseInt(valord)*0.05;
                        }

// Buscar si el estudiante es egresado y se hacen los calculos para el descuento
                        if (egre.equals("1")) {

                            if (dcon1.equals("36")){
                               vegre="vcon1";
                             }
                            else if (dcon2.equals("36")){
                               vegre="vcon2";
                             }
                            else if (dcon3.equals("36")){
                               vegre="vcon3";
                            }
                            else if (dcon4.equals("36")){
                               vegre="vcon4";
                            }
                            
                            descegre = (Integer.parseInt(valord) * 0.1) * (-1);                         

// Buscar si tiene DESCUENTO AFILIADO ASOCIACION DE EGRESADOS
                            if (dcon1.equals("37")){
                               vaeci="vcon1";
                             }
                            else if (dcon2.equals("37")){
                               vaeci="vcon2";
                             }
                            else if (dcon3.equals("37")){
                               vaeci="vcon3";
                            }
                            else if (dcon4.equals("37")){
                               vaeci="vcon4";
                            }
                            if (!vaeci.equals("")){
                                descaeci=(Integer.parseInt(valord) * 0.02) * (-1);
                            }

                            
                            valdesc=descegre+descaeci;
                            valtot = Integer.parseInt(valord) + valdesc+extemp;

                            act1 = " update registro.registro.ordenes set val_der = '" + valord + "', "+vaeci+"= " + descaeci + ", "+
                                   " "+vegre+"= " + descegre + ", val_tot = " + valtot + ", vcon4 = '"+ extemp +"' " +
                                   " where id_ord = '" + nord + "' and id_est = '" + idest + "' and per_acad = '" + peraca + "' ";
  
                        }
// Si no es egresado se actualiza el valor a pagar
                        else {
                            valtot=Integer.parseInt(valord)+extemp;
                            act1 = "update registro.registro.ordenes set val_der = '" + valord + "', val_tot = '" + valtot + "', vcon4 = '"+ extemp +"' " +
                                    "where id_ord = '" + nord + "' and id_est = '" + idest + "' and per_acad = '" + peraca + "' ";
                            
                        }
                        int res = admin.actualiza(act1);
                        tot = tot + res+res1;

                    }

                    idprof = empleado.getIdProf();
                    resp = admin.InsertarEst(idest, nord, valder, valord, idprof);
                    
                }
                
                if (tot == 0) {
                    out.println("Ha ocurrido un error, intente mas tarde");
                } else {
                       response.sendRedirect("AsignaturasPos?carnet=" + idest + "&up=ok");
                       /*out.println("Documento:" + idest);
                        out.println("id_ord:" + nord);
                        out.println("valor_anterior:" + valder);
                        out.println("valor_nuevo:" + valord);
                        out.println("idProf:" + idprof);
                        out.println("dcon1:" + dcon1);
                        out.println("dcon2:" + dcon2);
                        out.println("dcon3:" + dcon3);
                        out.println("dcon4:" + dcon4);
                        out.println("valtot:" + valtot);*/

                }
            }
        //actualizar = "update registro.biblia_post set clave = 'HH' where id_bib = '" + request.getParameter(actualizar) + "' ";
        }
    }

    /** 
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
