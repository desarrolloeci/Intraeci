/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos;

import javax.servlet.http.HttpServlet;

import java.io.File;

import com.oreilly.servlet.multipart.FileRenamePolicy;




/**
 *
 * @author Luis Alberto Salas
 */
public class NameFile extends HttpServlet implements FileRenamePolicy {
    String  tipo;
    String idsol;
     String idest;


 
   
   //implement the rename(File f) method to satisfy the
    // FileRenamePolicy interface contract
    public File rename(File f){


        //String tipo = n.getParameter("tipo");
        //Get the parent directory path as in h:/home/user or /home/user
       // String idsolicitud, clave;        
        //String pave ;

       //pave=n.
       // String pave= n.getInitParameter(tipo);
        String parentDir = f.getParent( );

        //Get filename without its path location, such as 'index.txt'
         //clave = request.getParameter("clave");
        String fname = f.getName( );

        //Get the extension if the file has one
        String fileExt = "";
        int i = -1;
        if(( i = fname.indexOf(".")) != -1){

            fileExt = fname.substring(i);
            //System.out.println( "cambiando nombre" );
            //System.
           
            fname = fname.substring(0,i);
        }

        //add the timestamp
        //fname = fname + (""+( new Date( ).getTime( ) / 1000));
        fname = (idest)+("-")+(tipo)+("-")+(idsol);

        //piece together the filename
        fname = parentDir + System.getProperty(
            "file.separator") + fname + fileExt;

        File temp = new File(fname);

         return temp;
    }
   public void setTipo(String nuevoValor){
        tipo=nuevoValor;
}
   public void setidsol(String nuevoValor){
        idsol=nuevoValor;
   }
   public void setidest(String nuevoValor){
        idest=nuevoValor;
   }


}
