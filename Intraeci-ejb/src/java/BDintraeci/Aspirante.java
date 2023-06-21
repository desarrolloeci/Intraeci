/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package BDintraeci;

import java.util.HashMap;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;

/**
 *
 * @author jgarcia
 */
public class Aspirante extends Persona implements SessionBean {

    private SessionContext context;

    // <editor-fold defaultstate="collapsed" desc="EJB infrastructure methods. Click the + sign on the left to edit the code.">;

    // TODO Add code to acquire and use other enterprise resources (DataSource, JMS, enterprise bean, Web services)
    // TODO Add business methods or web service operations

    /**
     * @see javax.ejb.SessionBean#setSessionContext(javax.ejb.SessionContext)
     */
    public void setSessionContext(SessionContext aContext) {
        context = aContext;
    }

    /**
     * @see javax.ejb.SessionBean#ejbActivate()
     */
    public void ejbActivate() {

    }

    /**
     * @see javax.ejb.SessionBean#ejbPassivate()
     */
    public void ejbPassivate() {

    }

    /**
     * @see javax.ejb.SessionBean#ejbRemove()
     */
    public void ejbRemove() {

    }

    // </editor-fold>;

    /**
     * See section 7.10.3 of the EJB 2.0 specification
     * See section 7.11.3 of the EJB 2.1 specification
     */
    public void ejbCreate() {
        // TODO implement ejbCreate if necessary, acquire resources
        // This method has access to the JNDI context so resource aquisition
        // spanning all methods can be performed here such as home interfaces
        // and data sources.
    }

    public int crearAspirante(String ape1, String ape2, String nom, String email) throws Exception {
        HashMap tmp = bDatos.getRegistro("select count(*) cant from odi.aspirante where docid = '" + docId + "' " ) ;
        int cant = Integer.parseInt((String) tmp.get("cant")) ;
        if (cant > 0)
            return -1 ;
        return bDatos.actualizar("insert into odi.aspirante " +
                        "(docid, ap1, ap2, nom, email, freg ) values ( " +
                        "'" + docId + "', upper('"+ ape1 + "'), upper('" + ape2 + "'), upper('" + nom + "'), '" + email + "', getdate() )" );
    }

     public HashMap detalleAspirante(String id, String ema) throws Exception {
       /* return bDatos.getRegistro("select docid, ap1, ap2, nom, convert(char(10),fnac,103) fnac, eciv, tpsan, frh, " +
               "lmil, clase, dmil, dirres, telres, ciudad, cel, email, gen, tdoc, ciures.nom_ciu, ciunac, cnac.nom_ciu nciunac  " +
               "from odi.aspirante, nomina.dbo.gen_ciudad ciures, nomina.dbo.gen_ciudad cnac " +
               "where ciudad *= ciures.cod_ciu and ciunac *= cnac.cod_ciu and docid = '" + id + "' and (email = '" + ema + "' or '" + ema + "' = '-1' )" ) ;*/
       return bDatos.getRegistro("select docid, ap1, ap2, nom, convert(char(10),fnac,103) fnac, eciv, tpsan, frh, " +
               "lmil, clase, dmil, dirres, telres, ciudad, cel, email, gen, tdoc, ciures.nom_ciu, ciunac, cnac.nom_ciu nciunac "+
               "from odi.aspirante left outer join novasoft.dbo.gen_ciudad ciures on ciudad collate Modern_Spanish_CI_AS = ciures.cod_ciu "+
               "left outer join novasoft.dbo.gen_ciudad cnac on ciunac collate Modern_Spanish_CI_AS = cnac.cod_ciu "+
               "where  docid = '" + id + "' and (email = '" + ema + "' or '" + ema + "' = '-1' )");
    }


    public int setAspirante(String fnac, String eciv, String tpsan, String frh, String nlib, String clase, String dmil,
           String dir, String tel, String celular, String ciudad, String gen, String tdoc, String ciunac) throws Exception {
        return bDatos.actualizar("update odi.aspirante set " +
                " fnac = '" + fnac + "', eciv = " + eciv + ", tpsan = '" + tpsan + "', frh = '" + frh +
                "', lmil = '" + nlib + "', clase = " + clase + ", dmil = " + dmil + ", dirres = '" + dir +
                "', telres = '" + tel + "', cel = '" + celular + "', ciudad = '" + ciudad +
                "', gen = '" + gen + "', tdoc = '" + tdoc + "', ciunac = '" + ciunac +
                "' where docid = '" + docId + "'" );
    }

    public int setPerfil(String perfil) throws Exception {
        return bDatos.actualizar("update odi.aspirante set " +
                " perfil = '" + perfil + "' where docid = '" + docId + "'" );
    }

    public HashMap getPerfil() throws Exception {
        return bDatos.getRegistro("select perfil  " +
               "from odi.aspirante " +
               "where docid = '" + docId + "'  " ) ;
    }

   public HashMap detalleEstudio(String id) throws Exception {
        return bDatos.getRegistro("select idestud, nom_est, nom_ins, convert(varchar(10), fec_gra, 103) fgra, sem_apr, " +
               "tip_est, nro_tar, blq,  odi.estudasp.cod_ins cod_ins  " +
               "from odi.estudasp, novasoft.dbo.rhh_tbinsti " +
               "where odi.estudasp.cod_ins collate Modern_Spanish_CI_AS = novasoft.dbo.rhh_tbinsti.cod_ins and " +
               "idestud = " + id ) ;
    }
    public HashMap[] getEstudios() throws Exception {
        return bDatos.getRegistros("select idestud, nom_est, nom_ins, convert(varchar(10), fec_gra, 103) fgra, des_est,blq, nro_tar " +
               "from  novasoft.dbo.rhh_tbclaest, odi.estudasp, novasoft.dbo.rhh_tbinsti " +
               " where novasoft.dbo.rhh_tbclaest.tip_est = odi.estudasp.tip_est collate Modern_Spanish_CI_AS and " +
               " odi.estudasp.cod_ins collate Modern_Spanish_CI_AS = novasoft.dbo.rhh_tbinsti.cod_ins and " +
               "cod_emp = '" + docId + "' order by fec_gra DESC " ) ;
    }



    public int crearEstudio(String titulo, String cdins, String dur, String fecha, String ntar,
                String nivel, String blq) throws Exception {
        HashMap dato ;
        String id ;

        dato = bDatos.getRegistro("select max(idestud) + 1 id from odi.estudasp ") ;
        id = (String) dato.get("id") ;
        return bDatos.actualizar("insert into odi.estudasp " +
                "(cod_emp, cod_est, nom_est, cod_ins, sem_apr, gra_son, fec_gra, " +
                "nro_tar,  tip_est, idestud, blq) values ( " +
                "'" + docId + "', '00020', '"+ titulo + "', '" + cdins + "', " + dur + ", 1, '" +
                fecha + "', '" + ntar + "', '" + nivel + "', " + id + ", '" + blq + "' )" );
    }

    public int setEstudio(String ident, String tit, String inst, String dur, String fgra, String ntar,
             String nivel, String blq) throws Exception {
        return bDatos.actualizar("update odi.estudasp set " +
                " nom_est = '" + tit + "', sem_apr = " + dur + ", fec_gra = '" + fgra + "', blq = '" + blq +
                "', nro_tar = '" + ntar + "', tip_est = '" + nivel + "' where idestud = " + ident );
    }

    public int elimEstudio(String id) throws Exception {
        return bDatos.actualizar("delete from odi.estudasp where blq = 'N' and idestud = " + id );
    }

}
