/*
 * BackupAdmin.java
 *
 * Created on 5 de diciembre de 2006, 02:35 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package eci;

/**
 *
 * @author alexgz
 */

import java.io.*;
import java.rmi.RemoteException;
import java.text.DateFormat;
import java.util.*;
import java.lang.*;

public class BackupAdmin extends java.lang.Object {

    private String path = new String(); /*Path donde se crea el backup*/
    private String usuario ; /*Nick Name del usuario*/
    private Vector archivos = new Vector(); /*Vector de archivos*/
    private Vector tamarch = new Vector();
    private Vector fecarch = new Vector();
    private File dirUsu;
            
    /** Creates new BackAdmin */
    public BackupAdmin(String nickName, String sPath) throws RemoteException {
        this.path = sPath;
        dirUsu = new File(path + "/" + nickName);
        if (! dirUsu.exists() ){
            dirUsu.mkdir();            
        }else{
            String[] archivos =  dirUsu.list() ;
            for (int i=0 ; i < archivos.length ; i++ ){
                this.archivos.add(archivos[i]);
                File fichero = new File(path + "/" + nickName + "/" + archivos[i]);
                //DateFormat fec = DateFormat.getDateInstance(DateFormat.SHORT);
                Date fecha = new Date(fichero.lastModified());
                //fec.format(fecha);
                this.tamarch.add(Long.toString(fichero.length()));
                this.fecarch.add(Long.toString(fichero.lastModified()));
            }
        }
    }
    
    /** 
    * @param int index Numero del Archivo
    * @return String  Nombre del Archivo numero index
    * @exception Ninguna 
    */
    public String nomArchivo(int index){
        return ((String)archivos.elementAt(index));
    }

    /** 
    * @param void
    * @return int Numero de archivos que tiene el usuario para el backup  
    * @exception Ninguna 
    */    
    public int nArchivos (){
        return archivos.size();
    }
    
    public void rmArchivo (String nomArch){
        File rmArch = new File (dirUsu.getAbsoluteFile() + "/" + nomArch );
        rmArch.delete();
        archivos.remove(nomArch);
    }
    
    public String tamarch (int index){
        
        double tam;
        float dato = Integer.valueOf(tamarch.elementAt(index).toString()).intValue();
        tam = dato/1024;
        tam = (double)Math.round(tam*100)/100;
        return Double.toString(tam);
    }
    
    public String tamarchH (int index){
        double tam;
        float dato = Integer.valueOf(tamarch.elementAt(index).toString()).intValue();
        tam = dato/1024;
        if(tam>1024){
            tam = tam/1024;
            tam = (double)Math.round(tam*100)/100;
            return Double.toString(tam) + " Mb";
        }else{
            tam = (double)Math.round(tam*100)/100;
            return Double.toString(tam) + " Kb";
        }
    }
    
    public String tamtot(){
        double tam;
        float tot = 0;
        int i;
        for(i=0; i<tamarch.size(); i++){
           tot = tot + Integer.valueOf(tamarch.elementAt(i).toString()).intValue();
        }
        tam = tot/1024;
        tam = (double)Math.round(tam*100)/100;
        return Double.toString(tam);
    }
    
    public String tamtotH(){
        double tam;
        float tot = 0;
        int i;
        for(i=0; i<tamarch.size(); i++){
           tot = tot + Integer.valueOf(tamarch.elementAt(i).toString()).intValue();
        }
        tam = tot/1024;
        if(tam>1024){
            tam = tam/1024;
            tam = (double)Math.round(tam*1000)/1000;
            return Double.toString(tam) + " Mb";
        }else{
            tam = (double)Math.round(tam*100)/100;
            return Double.toString(tam) + " Kb";
        }
    }
    
    public void totArchivo (){
        for(int i =0;i<archivos.size();i++){
            File rmArch = new File (dirUsu.getAbsoluteFile() + "/" + archivos.elementAt(i));
            rmArch.delete();
        }
        //archivos.remove(archivos.elementAt(i));
    }
    
    public long fecArchivo (int index){
        return Long.parseLong(fecarch.elementAt(index).toString());
        //archivos.remove(archivos.elementAt(i));
    }
    
    public void setPath (String sPath){
        this.path = sPath;
    }
}

