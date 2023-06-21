/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import java.io.*;
import java.net.*;
import java.util.Vector;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author alexgz
 * @version
 */
public class EnviaNotasSeg extends HttpServlet {

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

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
        int res, res1, res2, error;
        String cadena = "nota";
        String sec;
        sesion = request.getSession(true);
        String descerror[] = new String[5];
        Vector estudiantes = new Vector();
        String consulta = new String();
        String notaEst = new String();
        String variable = new String();
        String falla = "";
        String datosasigna = "";
        String tercio = request.getParameter("tercio");
        String idgrupo = request.getParameter("idgrupo");
        String idasig = request.getParameter("idasig");
        String nota = request.getParameter("nota");
        String carnet = request.getParameter("carnet");
        String codg = request.getParameter("codg");
        String nombre = request.getParameter("nombre");
        String codasig = request.getParameter("codasig");
        String nomasig = request.getParameter("nomasig");
        String documento = request.getParameter("documento");
        String notas1 = request.getParameter("notas1");
        String notas2 = request.getParameter("notas2");
        String notas3 = request.getParameter("notas3");
        String notas4 = request.getParameter("notas4");
        String notas5 = request.getParameter("notas5");
        String notanva = request.getParameter("nota");
        String periodo = request.getParameter("periodo");
        String texto = "Seguimiento";
        //   String guardar = new String();
        falla = request.getParameter("falla");
        login.InicioProfRemoteBusiness empleado = (login.InicioProfRemoteBusiness) sesion.getAttribute("empleado");
        String per = empleado.getPerHorario();
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        String docu = empleado.getDocumProf();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet enviaNotasSeguimiento</title>");
        out.println("</head>");
        out.println("<body>");
        estudiantes = empleado.getEstudiantes();
        error = 0;
        if (estudiantes.size() > 0) {
            int not = Integer.parseInt(nota);

            if (not < 30) {
                error = 1;

            } else if ((tercio.equals("1") && nota != null)) {
                String campo = "nota1";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                datosasigna = (idasig + "-" + idgrupo + "-" + tercio + "-" + carnet + "-" + notas1 + "-" + notanva);
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, idgrupo, carnet, notanva, campo);
                res = profesor.IngresaNotasSeg("nota1", idgrupo, carnet, nota, "falla1", falla);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, idgrupo, codg, tercio, carnet, notas1, notanva, operacion, texto);
            } else if ((tercio.equals("2") && nota != null)) {
                String campo = "nota2";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                datosasigna = (idasig + "-" + idgrupo + "-" + tercio + "-" + carnet + "-" + notas2 + "-" + notanva);
                res = profesor.IngresaNotasSeg("nota2", idgrupo, carnet, nota, "falla2", falla);
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, idgrupo, carnet, notanva, campo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, idgrupo, codg, tercio, carnet, notas2, notanva, operacion, texto);
            } else if ((tercio.equals("3") && nota != null)) {
                String campo = "nota3";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                datosasigna = (idasig + "-" + idgrupo + "-" + tercio + "-" + carnet + "-" + notas3 + "-" + notanva);
                res = profesor.IngresaNotasSeg("nota3", idgrupo, carnet, nota, "falla3", falla);
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, idgrupo, carnet, notanva, campo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, idgrupo, codg, tercio, carnet, notas3, notanva, operacion, texto);
            } else if ((tercio.equals("4") && nota != null)) {
                String campo = "nota_lab";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                datosasigna = (idasig + "-" + idgrupo + "-" + tercio + "-" + carnet + "-" + notas4 + "-" + notanva);
                res = profesor.IngresaNotasSeg("nota_lab", idgrupo, carnet, nota, "falla4", falla);
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, idgrupo, carnet, notanva, campo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, idgrupo, codg, tercio, carnet, notas4, notanva, operacion, texto);
            } else if ((tercio.equals("5") && nota != null)) {
                String campo = "nota4";
                String operacion = "U";
                sec = profesor.sigSecuencia("MODINOTAS");
                datosasigna = (idasig + "-" + idgrupo + "-" + tercio + "-" + carnet + "-" + notas5 + "-" + notanva);
                res = profesor.IngresaNotasSeg("nota4", idgrupo, carnet, nota, "falla5", falla);
                res1 = profesor.Insertarlogaudit(documento, datosasigna, texto, idgrupo, carnet, notanva, campo);
                res2 = profesor.InsertarModiNotas(sec, documento, periodo, idasig, idgrupo, codg, tercio, carnet, notas5, notanva, operacion, texto);
            }

        }

        empleado.limpiaVariables();
        if (error == 0) {

            if (tercio.equals("1") || (tercio.equals("2")) || (tercio.equals("3")) || (tercio.equals("4")) || (tercio.equals("5"))) // out.println("Las nota(s) ya han sido procesadas y registradas en el sistema");
            {

                response.sendRedirect("NotasSeguimiento?carnet=" + carnet + "&idasig=" + idasig + "&tercio=" + tercio + "&idgrupo=" + idgrupo + "&per=" + per + "&codg=" + codg + "&codasig=" + codasig + "&nomasig=" + nomasig + "");

            } else {
                response.sendRedirect("Observaciones?carnet=" + carnet + "&idasig=" + idasig + "&tercio=" + tercio + "&idgrupo=" + idgrupo + "&per=" + per + "&codg=" + codg + "&docu=" + docu + " ");

            }
        } else {

            response.sendRedirect("Observaciones?carnet=" + carnet + "&idasig=" + idasig + "&tercio=" + tercio + "&idgrupo=" + idgrupo + "&per=" + per + "&codg=" + codg + "&nota=" + nota + "&falla=" + falla + "&nombre=" + nombre + "&codasig=" + codasig + "&nomasig=" + nomasig + "&docu=" + docu + " ");

            //   String guardar = request.getParameter("guardar");

            /*  if (guardar != null) {
            if ((tercio.equals("1") && notaEst != null)) {
            res = profesor.IngresaNotasSeg("nota1", idgrupo, carnet, nota, "falla1", falla);
            } else if ((tercio.equals("2") && notaEst != null)) {
            res = profesor.IngresaNotasSeg("nota2", idgrupo, carnet, nota, "falla2", falla);

            } else if ((tercio.equals("3") && notaEst != null)) {
            res = profesor.IngresaNotasSeg("nota3", idgrupo, carnet, nota, "falla3", falla);

            } else if ((tercio.equals("4") && notaEst != null)) {
            res = profesor.IngresaNotasSeg("nota_lab", idgrupo, carnet, nota, "falla4", falla);
            }
            }*/
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
