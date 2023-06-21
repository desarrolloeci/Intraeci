/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import login.InicioProfRemoteBusiness;
import java.util.Vector;

/**
 *
 * @author lrodriguez
 */
public class autoevaluacion extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        PrintWriter out = response.getWriter();

        String id = new String(""), asig = new String("");
        String total = new String(""), idgrp = new String("");
        String idenc = new String(""), cadena = new String("P");
        String obs = new String(""), nvacadena = new String("");
        int i, x, ret, acum = 0, ret1, totdatos;
        total = request.getParameter("total");
        String justif1 = request.getParameter("justif1");
        String justif10 = request.getParameter("justif10");
        String justif2 = request.getParameter("justif2");
        String justif3 = request.getParameter("justif3");
        String justif4 = request.getParameter("justif4");
        String justif5 = request.getParameter("justif5");
        String justif6 = request.getParameter("justif6");
        String justif7 = request.getParameter("justif7");
        String justif8 = request.getParameter("justif8");
        String justif9 = request.getParameter("justif9");
        String grjust = request.getParameter("granjustif");
        String prog = request.getParameter("prog");
        //String flag = request.getParameter("flag");
        totdatos = Integer.parseInt(total);
        id = request.getParameter("idenc");
        String valor, valor1;
        String arreglo[] = new String[200];
        String var[] = new String[10];

        for (i = 1; i <= totdatos; i++) {
            valor = String.valueOf(i);
            String variable = (String) cadena.concat(valor);
            arreglo[i] = request.getParameter(variable);
            nvacadena = nvacadena + arreglo[i];
        }

        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();

        if (justif1 == null) {
            justif1 = " ";
        }
        if (justif2 == null) {
            justif2 = " ";
        }
        if (justif3 == null) {
            justif3 = " ";
        }
        if (justif4 == null) {
            justif4 = " ";
        }
        if (justif5 == null) {
            justif5 = " ";
        }
        if (justif6 == null) {
            justif6 = " ";
        }
        if (justif7 == null) {
            justif7 = " ";
        }
        if (justif8 == null) {
            justif8 = " ";
        }
        if (justif9 == null) {
            justif9 = " ";
        }
        if (justif10 == null) {
            justif10 = " ";
        }

        if (grjust == null) {
            grjust = " ";
        }

        HttpSession sesion = request.getSession(false);
        Object empleado = sesion.getAttribute("empleado");
        String cedula, direccion;
        Vector verifica = new Vector();

        if (empleado instanceof InicioProfRemoteBusiness) {
            cedula = ((InicioProfRemoteBusiness) empleado).getIdemp();
            // direccion = "Encuestas";
            direccion = "Aplican";
        } else {
            cedula = empleado.toString();
            direccion = "EncuestasOtros?cedula=" + cedula;
        }
        verifica = admin.Verificarestas(cedula, id, prog);
        if (verifica.size() > 0) {

            out.println("<center><h2>Usted ya contestó, gracias por su participación.</center></h2>");
            out.println("<center><h2><a href=\"../intraeci/salir\"> Salir </a></h2></center>");
        } else {
            // request.getParameter("cedula");
            ret = admin.Autoevaluacion(id, nvacadena, prog, cedula, justif1, justif2, justif3, justif4, justif5, justif6, justif7, justif8, justif9, justif10, grjust);

            // if (flag.equals("1") && ret > 0) {
            ret1 = admin.Encuestado(cedula, id, prog);
            /* } else {
             ret1 = admin.Encuestado2(cedula, id);
             }*/
            if (ret > 0) {
                out.println("<center><h2>");
                response.sendRedirect(direccion);
                out.println("</center></h2>");
            } else {
                out.println("<center><h2>");
                out.println("Hubo algún problema diligenciando la encuesta. ");
                out.println("<center><h2><a href=\"../intraeci/salir\"> Salir </a></h2></center>");
                out.println("</center></h2>");
            }

        }
    }
}
