/*
 * enviarCorreoImp.java
 *
 * Created on 2 de febrero de 2007, 03:38 PM
 */

package otros;

import java.io.*;
import java.net.*;
import java.util.StringTokenizer;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author alexgz
 * @version
 */
public class enviarCorreoImp extends HttpServlet {
    
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
        out.println("<title>Servlet enviarCorreoImp</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet enviarCorreoImp at " + request.getContextPath () + "</h1>");
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
        int j, cont, k;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String codimpre;
        String tipo = request.getParameter("tipo");
        String arreglo[]=new String[50];
        StringTokenizer st;
        String tempo[]=new String[20];
        String codigo = new String("0");
        String log = new String("");
        String respuesta = new String();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Enviar Correo</title>");
        out.println("</head>");
        out.println("<body>");
        otros.ruta ruta = new otros.ruta();
        String from = new String();
        String texto = request.getParameter("texto");
        String user = request.getParameter("userimpre");
        String asunto = "0 - Solicitud de Impresión: ";
        String numpag = request.getParameter("numpag");
        String numcopias = request.getParameter("numcopias");
        if(tipo.equals("inst")){
            codimpre = request.getParameter("codimpre");
            j=0;
            cont=-1;
            try {
                FileReader ra = new FileReader(ruta.valruta() + "codimpre.txt");
                BufferedReader entrada = new BufferedReader(ra); 
                String s;
                while((s = entrada.readLine()) != null) {
                    arreglo[j]= s;
                    st = new StringTokenizer(arreglo[j], ",");
                    k=0;
                    while (st.hasMoreTokens()) {              
                        tempo[k]=st.nextToken();
                        k=k+1;  
                    }
                    if(tempo[0].equals(codimpre))
                        cont = j;
                    j=j+1;           
                }
                entrada.close();
                ra.close();
            }catch(java.io.FileNotFoundException fnfex) { 
                out.println("Error: " + fnfex); 
            }catch(java.io.IOException ioex) { 
                out.println("Error: " + ioex); 
            }
            if(cont>-1 && !codimpre.equals("")){
                st = new StringTokenizer(arreglo[cont], ",");
                k=0;
                while (st.hasMoreTokens()) {              
                    tempo[k]=st.nextToken();
                    k=k+1;  
                }
                codigo = tempo[1];
                log = "log";
            }else{
                cont = -1;
            }
        if(cont<0){
              out.println("<script language=\"javascript\"> \n" +
                      "<!-- \n" +
                      "alert('No se pudo enviar el correo \\n Código erroneo'); \n" +
                      "history.back(); \n" +
                      "//--> \n </script>");
        }else{
            asunto = codigo + " - Solicitu de Impresión: ";
            //out.println("csimpp"+ asunto + texto + user + "@mail.escuelaing.edu.co" + "@escuelaing.edu.co" + pags_cops + log);
        }
      }
        otros.enviarMail enviar = new otros.enviarMail();
        String pags_cops = "Número de páginas: " + numpag + "\nNúmero de Copias: " + numcopias + "\n\n";
        texto = pags_cops + texto;
        pags_cops = numpag + "," + numcopias;
        try{
            respuesta = enviar.enviarInst("e2037452", asunto, texto, user, "@luna.escuelaing.edu.co", "@escuelaing.edu.co", pags_cops, log);
            //respuesta = enviar.enviar("e2037452", asunto, texto, "", user, "@luna.escuelaing.edu.co", "@escuelaing.edu.co");
        } catch (Exception e) {
            respuesta = "error " + e.getMessage();
        }

        if(respuesta.equals("error")||respuesta.equals("")){
            out.println("Ha ocurrido un error al enviar el correo.<br>Revise el si el " +
                    "archivo adjunto existe<br>Intente luego o h&aacute;galo a través de la página " +
                    "<a href=\"\" onclick=\"window.open('http://correo.escuelaing.edu.co',''," +
                    "'width=650,height=450, toolbar=yes,scrollbars=yes,location=yes,directories=yes," +
                    "status=yes,menubar=yes,resizable=no');return false\">correo.escuelaing.edu.co</a></font></b></font></p>");
        }else{
            response.sendRedirect("Mensajes?idmsj=6");
            //out.println("error:" + respuesta);
            
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
