/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.util.Properties;
import javax.swing.Timer;

/**
 *
 * @author lrodriguez
 */
public class reservasPoliant extends HttpServlet {

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
            out.println("<title>Servlet reservasPoli</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet reservasPoli at " + request.getContextPath () + "</h1>");
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
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        Vector vresp;
        String fecha, actualizar, consult, sec, dia, hora, rcsal, horfin, estado;
        String tipo, idgrupo, capac;
        String idProf = "0";
        int difhora = 0, resec = 0;
        sesion = request.getSession(false);
        //String cedula = new String((String)sesion.getAttribute("cedula"));
        login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) sesion.getAttribute("empleado");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        if (sesion == null) {
            response.sendRedirect("cerrar?msg=4");
        } else {
            sec = new String((String) sesion.getAttribute("sec"));
            fecha = request.getParameter("fecha");
            dia = request.getParameter("dia");
            hora = request.getParameter("hora");
            horfin = request.getParameter("horafin");
            rcsal = request.getParameter("caracteris");
            tipo = request.getParameter("tipo");
            idgrupo = request.getParameter("idgrupo");
            capac = request.getParameter("capacidad");
            String ndia = request.getParameter("ndia");
            String descr = request.getParameter("observ");
            String peracad = empleado.getPerHorario();
            //validacion para los periodos intermedios
            int horaini, horafin, tblq = 0, n = 0;
            horaini = Integer.parseInt(hora);
            if (tipo.equals("") || (tipo.equals(null))) {
                tipo = "L";

            }
            if (horfin == null) {
                /*  if (horaini % 100 > 0) {*/
                horafin = horaini + 100;
                /* } else {
                horafin = horaini + 130;
                }*/
                tblq = 1;
            } else {
                horafin = Integer.parseInt(horfin);
                difhora = horafin - horaini;
                if (difhora < 200) {
                    /* if (horaini % 100 > 0) {
                    horafin = horaini + 170;
                    } else {*/
                    horafin = horaini + 100;
                    tblq = 1;
                //}

                } else {
                    tblq = 2;

                }
            }
            String texto[] = new String[5000];
            String fechau[] = new String[5000];
            /*  if (tipo.equals("C")) {
            StringTokenizer st = new StringTokenizer(idgrupo, "-");
            int k = 0;
            while (st.hasMoreTokens()) {
            texto[k] = st.nextToken();
            k = k + 1;
            }

            }*/
            StringTokenizer st1 = new StringTokenizer(fecha, "-");
            int j = 0;
            while (st1.hasMoreTokens()) {
                fechau[j] = st1.nextToken();
                j = j + 1;
            }
            String fecuso = fechau[0] + "-" + fechau[1] + "-" + fechau[2];
            String fec = fechau[0] + "/" + fechau[1] + "/" + fechau[2];
            Vector horario = profesor.getHorario(empleado.getIdProf(), empleado.getPeriodo());
            int a = 12;
            int i = (horario.size() * 2);
            if (empleado.getIdProf().equals("")) {
                i = 500;
                idProf = empleado.getIdemp();
            } else {
                idProf = empleado.getIdProf();
            }
            Vector reserva = admin.getCantReservaPoli(idProf); //consulta el numero de reservas

            if (reserva.size() > 0) {
                String valor = (String) reserva.elementAt(0);
                // out.println(valor);
                if (valor.equals("No disponible")) {
                    n = 0;
                } else {
                    n = Integer.parseInt(valor);
                }
            }

            /* if (rcsal.equals("X")) {
            hora = "700";
            horafin = 1900;
            estado = "S";

            } else {
            estado = "S";

            }*/

            int suma, capaci;
            /*  Vector capacidad = admin.CapSalon(fec, hora, horafin); //verificar sum de reservas en un salon
            if (capacidad.size() > 0) {
            for (j = 0; j < capacidad.size(); j++) {
            Vector datocap = (Vector) capacidad.elementAt(j);
            suma = new String(datocap.elementAt(0).toString());

            }
            } else{
            suma =  capac ;

            }*/

            //SE QUITA ESTE IF CON SU ELSE PARA QUE NO HAYA LIMITE DE RESERVAS
            if (n < a) {
                //  String peracad = empleado.getPerHorario();
                estado = "S";
                if (rcsal.equals("X")) {
                    capac = "0";
                    Vector consalon = admin.getConSalonPoliEv(rcsal, fec, hora, horafin, capac);
                    String idsal = "";
                    resec = Integer.parseInt(sec);
                    if (consalon.size() > 0) {
                        int horainic = Integer.parseInt(hora);
                        for (j = 0; j < consalon.size(); j++) {
                            horainic = 700;
                            horafin = (horainic + 100);
                            Vector salon = (Vector) consalon.elementAt(j);
                            idsal = (String) salon.elementAt(0);
                            capac = (String) salon.elementAt(2);
                            for (int p = 0; p < 12; p++) {

                                actualizar = new String("insert into registro.usosalon " +
                                        " (fecuso, iduso, id_sal, hora, dia, fsol, tipo, estad, per, prof, idgrp, " +
                                        " asig, ngrp, descr, cap, req, hfin, tblq) values (convert(varchar(10), '" + fecuso + "', 103), " + resec + ", " +
                                        idsal + ", " + horainic + ", " + ndia + ", getdate(), '" +
                                        tipo + "', '" + estado + "', '" + empleado.getPerHorario() + "', " + idProf + ", " + texto[1] + ", " + texto[2] + ", " +
                                        texto[0] + ", '" + descr.toUpperCase() + "', " + capac + ", '" + rcsal + "', '" +
                                        horafin + "', '" + tblq + "'  ) ");
                                int resultado = admin.actualiza(actualizar);
                                if (resultado == 0) {
                                    out.println(actualizar);
                                    out.println("Ha ocurrido un error, intente mas tarde");

                                } else {
                                    admin.sigSecuencia("RESERVAS");
                                    resec++;
                                }
                                horainic = (horafin);
                                horafin = (horainic + 100);

                            }

                        }
                        response.sendRedirect("Mensajes?idmsj=12&salon=" + idsal + "&fecuso=" +
                                fecha + "&hora=" + hora + "&horafin=" + (horafin - 100) + "&sec=" + sec);

                    } else {
                        sesion.setAttribute("fecuso", fecha);
                        sesion.setAttribute("dia", dia);
                        sesion.setAttribute("hora", hora);
                        sesion.setAttribute("capac", capac);
                        sesion.setAttribute("descr", descr);
                        sesion.setAttribute("ndia", ndia);
                        response.sendRedirect("Polideportivo?error=formaerror");
                    }
                } else if (!rcsal.equals("X")) {
                     String valor = "0";
                        int tarifa = 0;
                    resec = Integer.parseInt(sec);
                    int horainic = Integer.parseInt(hora);
                    int cap = Integer.parseInt(capac);
                    /*if (cap <= 5) {
                    cap = 5;
                    }*/

                /*    if (tblq == 2) {

                        horafin = horaini + 100;
                        Vector consalon = admin.getConSalonPoli(rcsal, fec, hora, horafin, capac);
                        if (consalon.size() > 0) {
                            Vector idsal = (Vector) consalon.elementAt(0);
                            valor = (String) (idsal.elementAt(2));
                            tarifa = Integer.parseInt(valor);
                            tarifa = (tarifa * 2);

                            for (int p = 0; p < 2; p++) {

                                capac = (String) idsal.elementAt(2);
                                actualizar = new String("insert into registro.usosalon " +
                                        " (fecuso, iduso, id_sal, hora, dia, fsol, tipo, estad, per, prof, idgrp, " +
                                        " asig, ngrp, descr, cap, req, hfin, tblq) values (convert(varchar(10), '" + fecuso + "', 103), " + resec + ", " +
                                        idsal.elementAt(0) + ", " + horainic + ", " + ndia + ", getdate(), '" +
                                        tipo + "', '" + estado + "', '" + empleado.getPerHorario() + "', " + idProf + ", " + texto[1] + ", " + texto[2] + ", " +
                                        texto[0] + ", '" + descr.toUpperCase() + "', " + capac + ", '" + rcsal + "', '" +
                                        horafin + "', '" + tblq + "'  ) ");
                                int resultado = admin.actualiza(actualizar);
                                //  horafin = horafin + 100;
                                if (resultado == 0) {
                                    //out.println("dia:"+ dia );
                                    out.println(actualizar);
                                    out.println("Ha ocurrido un error, intente mas tarde");
                                //response.sendRedirect("../../jsp/errorbd.jsp");
                                } else {
                                    admin.sigSecuencia("RESERVAS");
                                    resec++;
                                }
                                horainic = (horafin);
                                horafin = (horainic + 100);

                            }
                            resec = admin.sigSecuencia("RESERVAS");
                            response.sendRedirect("Mensajes?idmsj=12&salon=" + idsal.elementAt(1) + "&fecuso=" +
                                    fecha + "&hora=" + hora + "&horafin=" + (horafin - 100) + "&sec=" + sec + "&tarifa=" + tarifa);


                        } else {
                            sesion.setAttribute("fecuso", fecha);
                            sesion.setAttribute("dia", dia);
                            sesion.setAttribute("hora", hora);
                            sesion.setAttribute("capac", capac);
                            sesion.setAttribute("descr", descr);
                            sesion.setAttribute("ndia", ndia);
                            response.sendRedirect("Polideportivo?error=formaerror");
                        }

                    } else {*/

                        Vector consalon = admin.getConSalonPoli(rcsal, fec, hora, horafin);
                        if (consalon.size() > 0) {
                            Vector idsal = (Vector) consalon.elementAt(0);
                          // capac = (String) idsal.elementAt(2);
                            valor = (String) (idsal.elementAt(2));
                            tarifa = Integer.parseInt(valor);
                            actualizar = new String("insert into registro.usosalon " +
                                    " (fecuso, iduso, id_sal, hora, dia, fsol, tipo, estad, per, prof, idgrp, " +
                                    " asig, ngrp, descr, cap, req, hfin, tblq) values (convert(varchar(10), '" + fecuso + "', 103), " + resec + ", " +
                                    idsal.elementAt(0) + ", " + horainic + ", " + ndia + ", getdate(), '" +
                                    tipo + "', '" + estado + "', '" + empleado.getPerHorario() + "', " + idProf + ", " + texto[1] + ", " + texto[2] + ", " +
                                    texto[0] + ", '" + descr.toUpperCase() + "', " + capac + ", '" + rcsal + "', '" +
                                    horafin + "', '" + tblq + "'  ) ");
                            int resultado = admin.actualiza(actualizar);
                            //  horafin = horafin + 100;
                            if (resultado == 0) {
                                //out.println("dia:"+ dia );
                                out.println(actualizar);
                                out.println("Ha ocurrido un error, intente mas tarde");
                            //response.sendRedirect("../../jsp/errorbd.jsp");
                            } else {
                                admin.sigSecuencia("RESERVAS");
                                resec++;
                            }
                            resec = admin.sigSecuencia("RESERVAS");
                            response.sendRedirect("Mensajes?idmsj=12&salon=" + idsal.elementAt(1) + "&fecuso=" +
                                    fecha + "&hora=" + hora + "&horafin=" + horafin + "&sec=" + sec + "&tarifa=" + tarifa);
                        } else {
                            sesion.setAttribute("fecuso", fecha);
                            sesion.setAttribute("dia", dia);
                            sesion.setAttribute("hora", hora);
                            sesion.setAttribute("capac", capac);
                            sesion.setAttribute("descr", descr);
                            sesion.setAttribute("ndia", ndia);
                            response.sendRedirect("Polideportivo?error=formaerror");
                        }
                   // }


                }/*  {
            response.sendRedirect("Mensajes?idmsj=4");
            }*/
            } else {
                response.sendRedirect("Mensajes?idmsj=4");
            }
        }

    }
    /** Returns a short description of the servlet.
     */
// </editor-fold>
}
