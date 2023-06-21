/*
 * FileUpload.java
 *
 * Created on 5 de diciembre de 2006, 02:59 PM
 */
package eci.util.upload;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.oreilly.servlet.*;
import java.util.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUpload extends javax.servlet.http.HttpServlet {

    protected boolean create() throws java.lang.Exception {

        return true;
    }

    public FileUpload() {   // Constructor.
    }

    private void unhandledEvent(String listenerName, String methodName, java.lang.Object event) {
    }

    /**
     * destroy Method
     */
    public void destroy() {
        super.destroy();
        // TODO: implement
    }

    /**
     * doGet Method
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //doPost(request,response);
    }

    /**
     * doPost Method
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("iso-8859-1");
        PrintWriter out = response.getWriter();

        String loginex = "";
       //String usr = request.getParameter("loginex");
        String fpath = "";
        //new String((String)request.getParameter("fpath"));
        String spath = "";
        //new String((String)request.getParameter("spath"));
        String anterior = "";
         String fName = "";
        //new String((String)request.getParameter("anterior"));
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(1 * 1024 * 1024);

            String ubicacionArchivo;
            ubicacionArchivo = "/usr/local/SUN/correo/";
            //ubicacionArchivo = "C:/Sun/correo";
            File repDir = new File(ubicacionArchivo + "/temp/");
            if (!repDir.exists()) repDir.mkdir();
            factory.setRepository(repDir);
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = upload.parseRequest(request);
            //Creamos un ciclo para cada INPUT del formulario
            for (FileItem item : items) {

                //Identificamos si el INPUT es un archivo o un campo de formulario normal
                if (item.isFormField()) {

                    //Si es un campo de formulario lo obtenemos en su respectiva variable
                    if (item.getFieldName().equals("loginex")) {
                        
                        loginex = item.getString();
                       
                    }
                    if (item.getFieldName().equals("fpath")) {
                        
                        fpath = item.getString();
                        fpath= fpath + "/" + loginex;
                    }

                    if (item.getFieldName().equals("spath")) {
                        spath = item.getString();
                    }
                    if (item.getFieldName().equals("anterior")) {
                        anterior = item.getString();
                    }


                } else {

                    //Si es un archivo nos aseguramos de que el nombre sea el que buscamos
                    if (item.getFieldName().equals("file1")) {

                        //Obtenemos el nombre del archivo
                        fName = item.getName();
                        if (fName.lastIndexOf("\\") > 0) {
                            fName.replace("\\", "\\\\");
                            String[] vecname = fName.split("\\\\");
                            fName = vecname[vecname.length-1];
                        }
                        

                        //Revisamos que exista el archivo, que sea tipo PDF, y que no pese más de 10 MB
                        if (fName.equals("") || fName == null) {
                            throw new Exception("No ha seleccionado ningun archivo.");
                        }
                        
                          //Definimos el nombre del archivo
                        String fileName = fName;

                        //Guardamos el archivo en el servidor
                        File file = new File(fpath, fileName);
                        item.write(file);

                        //Buscamos los archivos temporales y los borramos
                        for (File fileDel : repDir.listFiles()) {
                            fileDel.delete();
                        }
                        
                    }
                }    
            }
            //  MultipartRequest multi = new MultipartRequest(request, finalpath + "/"+usuarioex, 5*1024*1024);
            response.sendRedirect("Backup?on=n&spath=" + spath + "&anterior=" + anterior);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Backup?spath=" + spath + "&anterior=" + anterior + "&on=" + e.getMessage());
        }
    }

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // TODO: implement
    }
}