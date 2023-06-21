/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Enlace;

import Dto.conciliacion;
import EnlaceNovasoft.EnlaceRemote;
import EnlaceNovasoft.NobasoftRemote;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author andres.rojas
 */
public class enlaceNovasoft extends HttpServlet {

    private List<conciliacion> listaEncontrado;
    private List<conciliacion> listaNoEncontrado;

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
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        try {
//            System.out.println("Enlace.enlaceNovasoft.processRequest()");
//        } finally {
//            out.close();
//        }
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
        System.out.println("Enlace.enlaceNovasoft.doGet()");

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
        //processRequest(request, response);
        System.out.println("Enlace.enlaceNovasoft.doPost()");
        String fechaIni = (String) request.getParameter("fechaIni");
        String fechaFin = (String) request.getParameter("fechaFin");
        if ("Buscar Pagos".equals(request.getParameter("enviarMetodo"))) {
            this.listaEncontrado = new ArrayList<conciliacion>();
            this.listaNoEncontrado = new ArrayList<conciliacion>();
            
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            EnlaceRemote enlace = conEjb.lookupEnlaceRemote("75107740", "-1");
            List<conciliacion> listaEnlace = new ArrayList<conciliacion>();
            try {
                listaEnlace = enlace.getListEnlace(fechaIni, fechaFin);
            } catch (Exception ex) {
                Logger.getLogger(enlaceNovasoft.class.getName()).log(Level.SEVERE, null, ex);
            }
            List<conciliacion> listaNobasoft = new ArrayList<conciliacion>();
            inicio.conectaEJB conEjb1 = new inicio.conectaEJB();
            NobasoftRemote nobasoft = conEjb1.lookupNobasoftRemote("75107740", "-1");
            try {
                listaNobasoft = nobasoft.getListNobasoft(fechaIni, fechaFin);
            } catch (Exception ex) {
                Logger.getLogger(enlaceNovasoft.class.getName()).log(Level.SEVERE, null, ex);
            }
            retornarListas(listaEnlace, listaNobasoft);

            request.setAttribute("listaEncontrado", listaEncontrado);
            request.setAttribute("listaNoEncontrado", listaNoEncontrado);
            request.setAttribute("tipo_rol", (String) request.getParameter("tipo_rol"));
            request.setAttribute("fechaIni", (String) request.getParameter("fechaIni"));
            request.setAttribute("fechaFin", (String) request.getParameter("fechaFin"));

            RequestDispatcher vista = request.getRequestDispatcher("EnlaseNovasoft");
            vista.forward(request, response);

        } else if ("Descargar Reporte".equals(request.getParameter("enviarMetodo2"))) {

            request.setAttribute("listaEncontrado", listaEncontrado);
            request.setAttribute("listaNoEncontrado", listaNoEncontrado);
            request.setAttribute("tipo_rol", (String) request.getParameter("tipo_rol"));
            request.setAttribute("fechaIni", (String) request.getParameter("fechaIni"));
            request.setAttribute("fechaFin", (String) request.getParameter("fechaFin"));
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-disposition", "filename=PagosPorProcesar_"+fechaIni+"_"+fechaFin+".xls");
            PrintWriter out = response.getWriter();

            try {
                out.println("Id Alumno\tIdentificación\tFecha de pago\tFuente de pago\tValor de pago");
                for (int i = 0; i < listaNoEncontrado.size(); i++) {
                    conciliacion c = listaNoEncontrado.get(i);
                    out.println(c.getEmpID() + "\t" +c.getCedula() + "\t" + c.getFechaTransaccion() + "\t" + c.getFuentePago() + "\t" + c.getValorPago());
                }

            } finally {
                out.close();
            }

            //exportarExcel(out);
            RequestDispatcher vista = request.getRequestDispatcher("EnlaseNovasoft");
            vista.forward(request, response);
        }

//response.sendRedirect("EnlaseNovasoft");
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

    private void retornarListas(List<conciliacion> listaEnlace, List<conciliacion> listaNobasoft) {
        if (listaNobasoft.isEmpty()) {
            listaNoEncontrado = listaEnlace;
        } else {
            if (!listaEnlace.isEmpty()) {
                Boolean encontrado = false;
                for (int i = 0; i < listaEnlace.size(); i++) {
                    encontrado = false;
                    for (int j = 0; j < listaNobasoft.size(); j++) {
                        if (listaEnlace.get(i).getEmpID().equals(listaNobasoft.get(j).getEmpID())
                                && listaEnlace.get(i).getFechaTransaccion().equals(listaNobasoft.get(j).getFechaTransaccion()) 
                                && listaEnlace.get(i).getValorPago().equals(listaNobasoft.get(j).getValorPago())
                                ) {
                            listaEncontrado.add(listaEnlace.get(i));
                            encontrado = true;
                            break;
                        }
                    }
                    if (!encontrado) {
                        listaNoEncontrado.add(listaEnlace.get(i));
                    }
                }
            }
        }
    }

}
