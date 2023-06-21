/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos;

import BDintraeci.BDproyectoRemote;
import utiles.RutaDoc;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Luis Salas
 */
public class cargaDocSoporteEnt extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet cargaDocSoporteEnt</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cargaDocSoporteEnt at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession sesion = request.getSession(false);
        BDproyectoRemote proyecto = (BDproyectoRemote) sesion.getAttribute("proyecto");
        
        String nit = "";
        String idseg = "";
        String nom = "";

        String fName = "";
        
        if (proyecto != null) {
            
            RutaDoc docPath = new RutaDoc("DocSeguimeintoEnt");
            String ubicacionArchivo = docPath.getRuta();
            
            try {

                DiskFileItemFactory factory = new DiskFileItemFactory();
                //Definimos a partir de qué tamaño el sistema empieza a guardar un archivo temporal para la subida
                //En este caso 5 MB.
                factory.setSizeThreshold(1*1024*1024);

                //Definimos el directorio para guardar este archivo temporal
                File repDir = new File(docPath.getRutaTemp());
                factory.setRepository(repDir);

                ServletFileUpload upload = new ServletFileUpload(factory);

                //Obtenemos la lista de campos del formulario
                List<FileItem> items = upload.parseRequest(request);

                //Creamos un ciclo para cada INPUT del formulario
                for(FileItem item: items) {

                    //Identificamos si el INPUT es un archivo o un campo de formulario normal
                    if(item.isFormField()) {
                        //Si es un campo de formulario lo obtenemos en su respectiva variable
                        if (item.getFieldName().equals("idp")) nit = item.getString();
                        if (item.getFieldName().equals("idseg")) idseg = item.getString();
                        if (item.getFieldName().equals("nombre")) nom = item.getString();


                    } else {

                        //Si es un archivo nos aseguramos de que el nombre sea el que buscamos
                        if (item.getFieldName().equals("SopEnt")) {

                            //Obtenemos el nombre del archivo
                            fName = item.getName();

                            //Revisamos que exista el archivo, que sea tipo PDF, y que no pese más de 5 MB
                            if (fName.equals("") || fName == null) throw new Exception("0");
                            if (!fName.substring(fName.lastIndexOf('.'), fName.length()).equals(".pdf")) throw new Exception("1");
                            if (item.getSize()>(5*1024*1024)) throw new Exception ("2");

                            //Definimos el nombre del archivo
                            String fileName = "Doc-" + nit + "-Ent.pdf";

                            //Guardamos el archivo en el servidor
                            File file = new File(ubicacionArchivo, fileName);

                            //Verificamos que el nombre del archivo no exista, y si existe agregamos un "_X"
                            //siendo X un número consecutivo.
                            int numFiles = 0;
                            while (file.exists()) {
                                numFiles++;
                                fileName = "Doc-" + nit + "_" + numFiles + "-Ent.pdf";
                                file = new File(ubicacionArchivo, fileName);
                            }

                            item.write(file);

                            //Buscamos los archivos temporales y los borramos
                            for(File fileDel: repDir.listFiles()) fileDel.delete();
                        }
                    }
                }
                response.sendRedirect("MenuSeguimiento?idp=" + idseg + "&nombre=" + nom );
            } catch (Exception err) {
                PrintWriter pw = response.getWriter();
                String msg = "";
                String errMsg = err.getMessage();
                if (errMsg.equals("0")) {
                    msg = "No se ha seleccionado ningun archivo.";
                } else if (errMsg.equals("1")) {
                    msg = "El tipo de archivo seleccionado debe ser PDF.";
                } else if (errMsg.equals("2")) {
                    msg = "El peso del archivo debe ser inferior a 5 MB.";
                } else {
                    msg = "No se ha podido subir el archivo.";
                }
                pw.write(msg);
                pw.flush();
                pw.close();
            }
        }
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
}
