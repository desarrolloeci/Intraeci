/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package BDintraeci;

import java.rmi.RemoteException;
import java.util.HashMap;
import javax.ejb.EJBObject;

/**
 *
 * @author jgarcia
 */
public interface AspiranteRemote extends EJBObject {
    void inicializar(String idDoc) throws RemoteException;

    String getId() throws Exception;

    HashMap[] getHislab() throws Exception;

    HashMap[] getIdiomas() throws Exception;

    HashMap detalleExperiencia(String id) throws Exception;

    int setExperiencia(String ident, String org, String fini, String ffin,
                    String cargo, String tpcar, String niv, String blq) throws Exception;

    int elimExperiencia(String id) throws Exception;

    int crearExperiencia(String org, String fini, String ffin,
                    String cargo, String tpcar, String niv, String blq) throws Exception;

    HashMap detalleIdioma(String id) throws Exception;

    HashMap[] getDistinciones() throws Exception;

    HashMap detalleDistincion (String id) throws Exception;

    int setDistincion(String ident, String nom, String raz, String instit, String descr,
               String pais, String anio, String blq) throws Exception;

    int crearDistincion(String nom, String raz, String instit, String descr,
               String pais, String anio, String blq) throws Exception;

    int elimDistincion(String id) throws Exception;

    HashMap[] getMembresia() throws Exception;

    HashMap detalleMembresia(String id) throws Exception;

    int setMembresia(String ident, String org, String tipo, String cat, String pais,
                  String fing, String fret, String blq) throws Exception;

    int elimMembresia(String id) throws Exception;

    int crearMembresia(String org, String tipo, String cat, String pais,
                  String fing, String fret, String blq) throws Exception;

    HashMap[] getProduccion() throws Exception;

    int elimProducto(String id) throws Exception;

    HashMap detalleProducto(String id) throws Exception;

    int crearProducto(String tipp, String titp, String objp, String descp, String pais, String orgp,
            String fini, String ffin, String rolp, String blq) throws Exception;

    int setProducto(String ident, String tit, String tipo, String obj, String descp, String pais,
              String fini, String ffin, String rol, String org, String blq) throws Exception;

    int crearIdioma(String lengua, String certif, String org, String punt, String fecha,
            String nl, String nh, String ne, String blq) throws Exception;

    int setIdioma(String ident, String lengua, String certif, String org, String punt, String fecha,
            String nl, String nh, String ne, String blq) throws Exception;

    int elimIdioma(String id) throws Exception;

    HashMap[] getPublicaciones() throws Exception;

    HashMap detallePublic(String id) throws Exception;

    int crearPublic(String tipo, String titulo, String timayor, String area, String fecha,
              String edicion, String editor, String ciudad, String pais) throws Exception;

    int setPublic(String ident, String tipo, String titulo, String timayor, String area, String fecha,
              String edicion, String editor, String ciudad, String pais) throws Exception;

    int elimPublic(String id) throws Exception;

    void setNombre(String ap1, String ap2, String nom) throws RemoteException;

    int crearAspirante(String ape1, String ape2, String nom, String email) throws Exception;

    HashMap detalleAspirante(String id, String ema) throws Exception;

    int setAspirante(String fnac, String eciv, String tpsan, String frh, String nlib, String clase, String dmil,
           String dir, String tel, String celular, String ciudad, String gen, String tdoc, String ciunac) throws Exception;

    int setPerfil(String perfil) throws Exception;

    HashMap getPerfil() throws Exception;

    HashMap detalleEstudio(String id) throws Exception;

    HashMap[] getEstudios() throws Exception;

    int crearEstudio(String titulo, String cdins, String dur, String fecha, String ntar,
                String nivel, String blq) throws Exception;

    int setEstudio(String ident, String tit, String inst, String dur, String fgra, String ntar,
             String nivel, String blq) throws Exception;

    int elimEstudio(String id) throws Exception;

    HashMap[] lisciudades(String filtro) throws Exception;

    HashMap[] lisUniversidades(String filtro) throws Exception;

}
