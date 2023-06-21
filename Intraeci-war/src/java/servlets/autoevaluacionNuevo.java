/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;
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
public class autoevaluacionNuevo extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        PrintWriter out = response.getWriter();

        String id = new String(""), asig = new String("");
        String total = new String(""), idgrp = new String("");
        String confactor = new String("");
        String idenc = new String(""), cadena = new String("P"), factor = new String("factor"), identificador = new String("identifica");
        String obs = new String(""), nvacadena = new String(""), nomfactor = new String(""), comentario = new String("comentario");
        int i, x, ret = 0, acum = 0, ret1 = 0, ret2 = 0, totdatos, pregfactor, codigo;
        total = request.getParameter("total");
        confactor = request.getParameter("confactor");

        String CodFactor = request.getParameter("CodFactor");
        codigo= Integer.parseInt(CodFactor);
        //   String comentario = request.getParameter("comentario");
        String nomfac = request.getParameter("nomfac");
        nomfactor = (String) factor.concat(CodFactor);
        String prog = request.getParameter("prog");
        String tipo = request.getParameter("tipo");

        String descripcion = request.getParameter("descripcion");
        String id_encuestado = request.getParameter("id_encuestado");
        // String contestan = request.getParameter("contestan");
        //int totalcontestan = Integer.parseInt(contestan);


        //String flag = request.getParameter("flag");
        totdatos = Integer.parseInt(total);
        pregfactor = Integer.parseInt(confactor);
        id = request.getParameter("idenc");
        String valor, valor1, valor2;
        String asistencia = new String("asistencia");
        String arreglo[] = new String[200];
        String var[] = new String[10];

        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();

        HttpSession sesion = request.getSession(false);
        Object empleado = sesion.getAttribute("empleado");
        String cedula, direccion;
        Vector verifica = new Vector();

        if (empleado instanceof InicioProfRemoteBusiness) {
            cedula = ((InicioProfRemoteBusiness) empleado).getIdemp();
            if (tipo.equals("T")) {
                String grupo = request.getParameter("grupo");
               
                direccion = "FormatoTaller?iden=" + id + "&prog=" + prog + "&descripcion=" + descripcion + "&id_encuestado=" + id_encuestado + "&grupo=" +grupo + "&tipo=" +"T";
            } else {
                direccion = "FormatoEncuestaNuevo?iden=" + id + "&prog=" + prog + "&descripcion=" + descripcion + "&id_encuestado=" + id_encuestado;
            }
        } else {
            cedula = empleado.toString();
            // direccion = "EncuestasOtros?cedula=" +cedula ;
            direccion = "FormatoEncuestaotros?iden=" + id + "&prog=" + prog + "&descripcion=" + descripcion + "&id_encuestado=" + id_encuestado + "&cedula=" + cedula;
        }
        //    verifica = admin.Verificarestas(cedula, id, prog);
       /*  if (verifica.size()> 0){
             
         out.println("<center><h2>Usted ya contestó, gracias por su participación.</center></h2>");
         out.println("<center><h2><a href=\"../intraeci/salir\"> Salir </a></h2></center>");
         }else {*/
        // request.getParameter("cedula");



    /*    Vector Contesto = admin.ContestoEncuestaFac(cedula, nomfac, id);
         if (Contesto.elementAt(0).equals("1")) {
         out.println("<center><h2>Usted ya contestó este factor, gracias por su participación.</center></h2>");
         out.println("<center><h2><a href=\"../intraeci/salir\"> Salir </a></h2></center>");

         } else {*/
        Vector valida = admin.ContestoEncuestaFac(id_encuestado, id, CodFactor);
        
       if (valida.size() > 0) {
           
            response.sendRedirect(direccion);
             //out.println("<center><h2>Usted ya contestó este factor, gracias por su participación.</center></h2>");
        }else{
        for (i = 1; i <= pregfactor; i++) {

            valor = String.valueOf(i);
            String variable = (String) cadena.concat(CodFactor+valor);
            String comentarios = (String) comentario.concat(valor);
            String valcomentario = request.getParameter(comentarios);
            String dato = request.getParameter(variable);
            String separa[] = new String[5];
            StringTokenizer st = new StringTokenizer(dato, "|");
            int k = 0;
            while (st.hasMoreTokens()) {
                separa[k] = st.nextToken();
                k = k + 1;
            }
            String dato1 = separa[0];
            String indice = separa[1];
             Vector validacion = admin.Validar(id, indice, id_encuestado);
            if (validacion.size() > 0){
                response.sendRedirect(direccion);
                break;
            }else{
            ret = admin.AutoevaluacionNvo(id_encuestado, id, CodFactor, indice, dato1, valcomentario);
            }
        
        }

        //response.sendRedirect(direccion);

        /* if (ret > 0 && tipo.equals("T")) {
         if (CodFactor.equals("1")){
         for (int j = 0; j < totalcontestan; j++) {
         valor2 = String.valueOf(j);
         String variableasiste = (String) asistencia.concat(valor2);
         String asiste = request.getParameter(variableasiste);
         String separa1[] = new String[5];
         StringTokenizer st = new StringTokenizer(asiste, "|");
         int z = 0;
         while (st.hasMoreTokens()) {
         separa1[z] = st.nextToken();
         z = z + 1;
         }
         String asistio = separa1[0];
         String idasistente = separa1[1];
         ret = admin.Asistencia(idasistente, id, asistio);
         }
         }
         out.println("<center><h2>");
         response.sendRedirect(direccion);
         out.println("</center></h2>");
         } else*/
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
