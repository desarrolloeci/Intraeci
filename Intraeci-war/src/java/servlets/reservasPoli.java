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
public class reservasPoli extends HttpServlet {

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
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        Vector vresp;
        String fecha, actualizar, consult, sec, dia, hora, idsal, horfin, estado;
        String tipo, idgrupo, capac;
        String idProf = "0", cedula="";
        int difhora = 0, resec = 0, suma, capaci;
        ;
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
            idsal = request.getParameter("caracteris");
            tipo = request.getParameter("tipo");
            idgrupo = request.getParameter("idgrupo");
            capac = request.getParameter("capacidad");
            String ndia = request.getParameter("ndia");
            String descr = request.getParameter("observ");
            String horactual= request.getParameter("horactual");
            String peracad = empleado.getPerHorario();
            //validacion para los periodos intermedios
            int horaini, horafin, tblq = 0, n = 0;
            horaini = Integer.parseInt(hora);
            if (tipo.equals("") || (tipo.equals(null))) {
                tipo = "L";

            }
            if (horfin == null) {
                horafin = horaini + 100;
                tblq = 1;
            } else {
                horafin = Integer.parseInt(horfin);
                difhora = horafin - horaini;
                if (difhora < 200) {
                    horafin = horaini + 100;
                    tblq = 1;
                } else {
                    tblq = 2;

                }
            }
            String texto[] = new String[5000];
            String fechau[] = new String[5000];

            StringTokenizer st1 = new StringTokenizer(fecha, "-");
            int j = 0;
            while (st1.hasMoreTokens()) {
                fechau[j] = st1.nextToken();
                j = j + 1;
            }
            String fecuso = fechau[0] + "-" + fechau[1] + "-" + fechau[2];
            String fec = fechau[0] + "/" + fechau[1] + "/" + fechau[2];
            Vector horario = profesor.getHorario(empleado.getIdProf(), empleado.getPeriodo());
            int a = 20;
            int i = (horario.size() * 2);
            if (empleado.getIdProf().equals("")) {
                i = 500;
                idProf = empleado.getIdemp();
                cedula = empleado.getIdemp();
            } else {
                idProf = empleado.getIdProf();
                  cedula = empleado.getIdemp();
            }
            Vector reserva = admin.getCantReservaPoli(idProf); //consulta el numero de reservas
            Vector tarifa =admin.tarifas(idsal);
            String tarif = tarifa.elementAt(0).toString();
            int total=0;
            total = Integer.parseInt(tarif);
            if (tblq ==1){
                total =total;

            }else{
                total = (total * 2);
            }

            
            if (reserva.size() > 0) {
                String valor = (String) reserva.elementAt(0);
                // out.println(valor);
                if (valor.equals("No disponible")) {
                    n = 0;
                } else {
                    n = Integer.parseInt(valor);
                }
            }
            String cant = "", cant1 = "";
            int canti = 0, canti1 = 0;

            /*if (horactual > hora){

            }*/

            if (n < a) {
                resec = Integer.parseInt(sec);
                Vector consalon = admin.getConSalonPoli(idsal, fec, hora, horafin);
                cant = consalon.elementAt(0).toString();
                canti = Integer.parseInt(cant);
                if (canti > 0) {
                    sesion.setAttribute("fecuso", fecha);
                    sesion.setAttribute("dia", dia);
                    sesion.setAttribute("hora", hora);
                    sesion.setAttribute("capac", capac);
                    sesion.setAttribute("descr", descr);
                    sesion.setAttribute("ndia", ndia);
                    response.sendRedirect("Polideportivo?error=formaerror");

                } else if (idsal.equals("139") || idsal.equals("130") || idsal.equals("131") || idsal.equals("135") || idsal.equals("136") || idsal.equals("133") || idsal.equals("137")) {
                    if (idsal.equals("139")) {//COLISEO
                        Vector todo = admin.getConSalonUnico(idsal, fec, hora, horafin);
                        cant = todo.elementAt(0).toString();
                        canti = Integer.parseInt(cant);
                    } else if (idsal.equals("130")) {//Baloncesto completo
                        Vector todoB = admin.BaloncestoC(idsal, fec, hora, horafin);
                        cant = todoB.elementAt(0).toString();
                        canti = Integer.parseInt(cant);
                    } else if (idsal.equals("133")) {//Futbol completo
                        Vector todoF = admin.Futbolsala(idsal, fec, hora, horafin);
                        cant = todoF.elementAt(0).toString();
                        canti = Integer.parseInt(cant);
                    } else {
                        Vector todoE = admin.espejos(idsal, fec, hora, horafin);//Espejos-squash-arte-multiples
                        cant = todoE.elementAt(0).toString();
                        canti = Integer.parseInt(cant);
                    }

                    if (canti > 0) {
                        sesion.setAttribute("fecuso", fecha);
                        sesion.setAttribute("dia", dia);
                        sesion.setAttribute("hora", hora);
                        sesion.setAttribute("capac", capac);
                        sesion.setAttribute("descr", descr);
                        sesion.setAttribute("ndia", ndia);
                        response.sendRedirect("Polideportivo?error=formaerror");

                    } else {
                        estado = "S";
                        actualizar = new String("insert into registro.usosalon " +
                                " (fecuso, iduso, id_sal, hora, dia, fsol, tipo, estad, per, prof, idgrp, " +
                                " asig, ngrp, descr, cap, req, hfin, tblq, docsol, valor) values (convert(varchar(10), '" + fecuso + "', 103), " + resec + ", " + idsal + ", " + horaini + ", " + ndia + ", getdate(), '" +
                                tipo + "', '" + estado + "', '" + empleado.getPerHorario() + "', " + idProf + ", " + texto[1] + ", " + texto[2] + ", " +
                                2 + ", '" + descr.toUpperCase() + "', '', '', " + horafin + ", '" + tblq + "', " + cedula + ", '"+total +"' ) ");
                        int resultado = admin.actualiza(actualizar);
                        if (resultado == 0) {
                            out.println(actualizar);
                            out.println("Ha ocurrido un error, intente mas tarde");

                        } else {
                            admin.sigSecuencia("RESERVAS");
                            resec++;
                        }

                        response.sendRedirect("Mensajes?idmsj=12&salon=" + idsal + "&fecuso=" +
                                fecha + "&hora=" + hora + "&horafin=" + (horafin) + "&sec=" + sec);

                    }

                } else {
                    if (idsal.equals("140")) {//Baloncesto media cancha
                        Vector MediaB = admin.BaloncestoM(idsal, fec, hora, horafin);
                        cant = MediaB.elementAt(0).toString();
                        canti = Integer.parseInt(cant);
                        Vector Balon = admin.Baloncesto(idsal, fec, hora, horafin);
                        cant1 = Balon.elementAt(0).toString();
                        canti1 = Integer.parseInt(cant1);
                        if (canti1 > 0 || canti >= 4) {
                            sesion.setAttribute("fecuso", fecha);
                            sesion.setAttribute("dia", dia);
                            sesion.setAttribute("hora", hora);
                            sesion.setAttribute("capac", capac);
                            sesion.setAttribute("descr", descr);
                            sesion.setAttribute("ndia", ndia);
                            response.sendRedirect("Polideportivo?error=formaerror");
                        } else {
                            Vector Minimo = admin.minimoBal(idsal, fec, hora, horafin);
                            String min = Minimo.elementAt(0).toString();
                            estado = "S";
                            actualizar = new String("insert into registro.usosalon " +
                                    " (fecuso, iduso, id_sal, hora, dia, fsol, tipo, estad, per, prof, idgrp, " +
                                    " asig, ngrp, descr, cap, req, hfin, tblq, docsol, valor) values (convert(varchar(10), '" + fecuso + "', 103), " + resec + ", " + min + ", " + horaini + ", " + ndia + ", getdate(), '" +
                                    tipo + "', '" + estado + "', '" + empleado.getPerHorario() + "', " + idProf + ", " + texto[1] + ", " + texto[2] + ", " +
                                    2 + ", '" + descr.toUpperCase() + "', '', '', " + horafin + ", '" + tblq + "', " + cedula + ", '"+ total +"'  ) ");
                            int resultado = admin.actualiza(actualizar);
                            if (resultado == 0) {
                                out.println(actualizar);
                                out.println("Ha ocurrido un error, intente mas tarde");

                            } else {
                                admin.sigSecuencia("RESERVAS");
                                resec++;
                            }

                            response.sendRedirect("Mensajes?idmsj=12&salon=" + min + "&fecuso=" +
                                    fecha + "&hora=" + hora + "&horafin=" + (horafin) + "&sec=" + sec);
                        }
                    } else if (idsal.equals("132")) {//Volley
                        Vector Volley = admin.Volley(idsal, fec, hora, horafin);
                        cant = Volley.elementAt(0).toString();
                        canti = Integer.parseInt(cant);
                        Vector VolleyM = admin.VolleyO(idsal, fec, hora, horafin);
                        cant1 = VolleyM.elementAt(0).toString();
                        canti1 = Integer.parseInt(cant1);
                        if (canti1 > 0 || canti >= 2) {
                            sesion.setAttribute("fecuso", fecha);
                            sesion.setAttribute("dia", dia);
                            sesion.setAttribute("hora", hora);
                            sesion.setAttribute("capac", capac);
                            sesion.setAttribute("descr", descr);
                            sesion.setAttribute("ndia", ndia);
                            response.sendRedirect("Polideportivo?error=formaerror");
                        } else {
                            estado = "S";
                            Vector minimoV = admin.minimoVol(idsal, fec, hora, horafin);
                            String minV = minimoV.elementAt(0).toString();
                            actualizar = new String("insert into registro.usosalon " +
                                    " (fecuso, iduso, id_sal, hora, dia, fsol, tipo, estad, per, prof, idgrp, " +
                                    " asig, ngrp, descr, cap, req, hfin, tblq, docsol, valor) values (convert(varchar(10), '" + fecuso + "', 103), " + resec + ", " + minV + ", " + horaini + ", " + ndia + ", getdate(), '" +
                                    tipo + "', '" + estado + "', '" + empleado.getPerHorario() + "', " + idProf + ", " + texto[1] + ", " + texto[2] + ", " +
                                    2 + ", '" + descr.toUpperCase() + "', '', '', " + horafin + ", '" + tblq + "', " + cedula + ", '"+ total +"'  ) ");
                            int resultado = admin.actualiza(actualizar);
                            if (resultado == 0) {
                                out.println(actualizar);
                                out.println("Ha ocurrido un error, intente mas tarde");

                            } else {
                                admin.sigSecuencia("RESERVAS");
                                resec++;
                            }

                            response.sendRedirect("Mensajes?idmsj=12&salon=" + minV + "&fecuso=" +
                                    fecha + "&hora=" + hora + "&horafin=" + (horafin) + "&sec=" + sec);

                        }

                    } else if (idsal.equals("138")) {//Tenis de Mesa
                        Vector Tenis = admin.Tenis(idsal, fecha, hora, horafin);
                        cant = Tenis.elementAt(0).toString();
                        canti = Integer.parseInt(cant);
                        if (canti >= 2) {
                            sesion.setAttribute("fecuso", fecha);
                            sesion.setAttribute("dia", dia);
                            sesion.setAttribute("hora", hora);
                            sesion.setAttribute("capac", capac);
                            sesion.setAttribute("descr", descr);
                            sesion.setAttribute("ndia", ndia);
                            response.sendRedirect("Polideportivo?error=formaerror");
                        } else {//minimo tenis
                            Vector Minimo = admin.minimoTenis(idsal, fecha, hora, horafin);
                            String min = Minimo.elementAt(0).toString();
                            estado = "S";
                            //texto[0] SE CAMBIA POR UN 2
                            actualizar = new String("insert into registro.usosalon " +
                                    " (fecuso, iduso, id_sal, hora, dia, fsol, tipo, estad, per, prof, idgrp, " +
                                    " asig, ngrp, descr, cap, req, hfin, tblq, docsol, valor) values (convert(varchar(10), '" + fecuso + "', 103), " + resec + ", " + min + ", " + horaini + ", " + ndia + ", getdate(), '" +
                                    tipo + "', '" + estado + "', '" + empleado.getPerHorario() + "', " + idProf + ", " + texto[1] + ", " + texto[2] + ", " +
                                    2 + ", '" + descr.toUpperCase() + "', '', '', " + horafin + ", '" + tblq + "', " + cedula + ", '"+ total +"'  ) ");
                            int resultado = admin.actualiza(actualizar);
                            if (resultado == 0) {
                                out.println(actualizar);
                                out.println("Ha ocurrido un error, intente mas tarde");
                            } else {
                                admin.sigSecuencia("RESERVAS");
                                resec++;
                            }

                            response.sendRedirect("Mensajes?idmsj=12&salon=" + min + "&fecuso=" +
                                    fecha + "&hora=" + hora + "&horafin=" + (horafin) + "&sec=" + sec);
                        }

                    }
                }

            } else {
                response.sendRedirect("Mensajes?idmsj=4");
            }

        }

    }
}



