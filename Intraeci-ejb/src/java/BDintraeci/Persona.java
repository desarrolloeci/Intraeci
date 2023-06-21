/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BDintraeci;

import java.util.HashMap;

/**
 *
 * @author jgarcia
 */
public class Persona {

    protected Persistencia bDatos;
    protected String docId;
    protected String nombres;
    protected String docIdComp;
    protected String periodoComp = "2012-1";

    public Persona() {
    }

    public String getId() {
        return docId;
    }

    public void setIdComp(String id) throws Exception {
        try {
            this.docIdComp = id;
        } catch (Exception e) {
            throw e;
        }
    }

    public int crearDistincion(String nom, String raz, String instit, String descr,
            String pais, String anio, String blq) throws Exception {
        HashMap dato;
        String iddis;

        dato = bDatos.getRegistro("select max(iddis) + 1 id from odi.distinciones ");
        iddis = (String) dato.get("id");
        bDatos.actualizar("insert into odi.distinciones "
                + "(iddis, idemp, nombre, instit, pais, anio, razon, descr, blq  ) values ( "
                + iddis + ", '" + docId + "', '" + nom + "', '" + instit + "', '" + pais + "', " + anio
                + ", '" + raz + "', '" + descr + "', '" + blq + "' )");
        return registraOperacion("odi.distinciones", iddis, "insert");
    }

    public int crearExperiencia(String org, String fini, String ffin,
            String cargo, String tpcar, String niv, String blq) throws Exception {
        HashMap dato;
        String idhis;

        if (ffin.equals("")) {
            ffin = "01/01/2050";
        }
        dato = bDatos.getRegistro("select max(idhis) + 1 id from odi.histlab ");
        idhis = (String) dato.get("id");
        bDatos.actualizar("insert into odi.histlab "
                + "(idhis, idemp, nomorg, fini, ffin, cargo, tpcar, nivdoc, blq) values ( "
                + idhis + ", '" + docId + "', '" + org + "', '" + fini + "', '" + ffin + "', '"
                + cargo + "', '" + tpcar + "', '" + niv + "', '" + blq + "')");
        return registraOperacion("odi.histlab", idhis, "insert");
    }

    public int crearMembresia(String org, String tipo, String cat, String pais,
            String fing, String fret, String blq) throws Exception {
        HashMap dato;
        String id;

        dato = bDatos.getRegistro("select max(idmem) + 1 id from odi.membrecias ");
        id = (String) dato.get("id");
        bDatos.actualizar("insert into odi.membrecias "
                + "(idmem, idemp, org, tipm, fing, fret, cat, pais, blq ) values ( "
                + id + ", '" + docId + "', '" + org + "', '" + tipo + "', '" + fing + "', '" + fret + "', '"
                + cat + "', '" + pais + "', '" + blq + "' )");
        return registraOperacion("odi.membrecias", id, "insert");
    }

    public int crearProducto(String tipp, String titp, String objp, String paisp, String descp, String orgp,
            String fini, String ffin, String rolp, String blq) throws Exception {
        HashMap dato;
        String id;

        dato = bDatos.getRegistro("select max(idpro) + 1 id from odi.productos ");
        id = (String) dato.get("id");
        bDatos.actualizar("insert into odi.productos "
                + "(idpro, idemp, tipp, titp, objp, descp, pais, orgp, fini, ffin, rolp, blq) values ( "
                + id + ", '" + docId + "', '" + tipp + "', '" + titp + "', '" + objp + "', '" + descp + "', '"
                + paisp + "', '" + orgp + "', '" + fini + "', '" + ffin + "', '" + rolp + "', '" + blq + "' )");
        return registraOperacion("odi.productos", id, "insert");
    }

    public int crearIdioma(String lengua, String certif, String org, String punt, String fecha,
            String nl, String nh, String ne, String blq) throws Exception {
        HashMap dato;
        String id;

        dato = bDatos.getRegistro("select max(idlen) + 1 id from odi.idiomas ");
        id = (String) dato.get("id");
        bDatos.actualizar("insert into odi.idiomas "
                + "(idlen, idemp, lengua, certif, org, punt, fec, nivlec, nivhab, nivesc, blq  ) values ( "
                + id + ", '" + docId + "', '" + lengua + "', '" + certif + "', '" + org + "', '" + punt + "', '"
                + fecha + "', '" + nl + "', '" + nh + "', '" + ne + "', '" + blq + "' )");
        return registraOperacion("odi.idiomas", id, "insert");
    }

    public int crearPublic(String tipo, String titulo, String timayor, String area, String fecha,
            String edicion, String editor, String ciudad, String pais) throws Exception {
        HashMap dato;
        String id;

        dato = bDatos.getRegistro("select max(idpub) + 1 id from odi.publicaciones ");
        id = (String) dato.get("id");
        bDatos.actualizar("insert into odi.publicaciones "
                + "(idpub, idemp, tipo, titulo, titmay, area, fec, edic, edit, ciudad, pais) values ( "
                + id + ", '" + docId + "', '" + tipo + "', '" + titulo + "', '" + timayor + "', '" + area + "', '"
                + fecha + "', '" + edicion + "', '" + editor + "', '" + ciudad + "', '" + pais + "' )");
        return registraOperacion("odi.publicaciones", id, "insert");
    }

    public HashMap detalleDistincion(String id) throws Exception {
        return bDatos.getRegistro("select iddis, nombre, instit, pais, anio, razon, blq, descr " + "from odi.distinciones " + "where iddis = " + id);
    }

    public HashMap detalleExperiencia(String id) throws Exception {
        return bDatos.getRegistro("select idhis, nomorg, convert(varchar(10), fini, 103) fini, " + "convert(varchar(10), ffin, 103) ffin, cargo, tpcar, nivdoc, blq " + "from odi.histlab " + "where idhis = " + id);
    }

    public HashMap detalleIdioma(String id) throws Exception {
        return bDatos.getRegistro("select idlen, lengua, certif, convert(varchar(10),fec, 103) fec, org, punt, nivlec, nivhab, nivesc, blq " + "from odi.idiomas " + "where idlen = " + id);
    }

    public HashMap detalleMembresia(String id) throws Exception {
        return bDatos.getRegistro("select idmem, org, tipm, convert(varchar(10),fing,103) fing, convert(varchar(10),fret,103) fret, cat, pais, blq " + "from odi.membrecias " + "where idmem = " + id);
    }

    public HashMap detalleProducto(String id) throws Exception {
        return bDatos.getRegistro("select idpro, tipp, titp, convert(varchar(10),fini,103) fini, convert(varchar(10),ffin,103) ffin, blq, " + " objp, pais, descp, orgp, rolp " + "from odi.productos " + "where idpro = " + id);
    }

    public HashMap detallePublic(String id) throws Exception {
        return bDatos.getRegistro("select idpub, tipo, titulo, titmay, area, fec, edic, edit, ciudad, pais " + "from odi.publicaciones " + "where idpub = " + id);
    }

    public int elimDistincion(String id) throws Exception {
        bDatos.actualizar("delete from odi.distinciones where iddis = " + id);
        return registraOperacion("odi.distinciones", id, "delete");
    }

    public int elimExperiencia(String id) throws Exception {
        bDatos.actualizar("delete from odi.histlab where idhis = " + id);
        return registraOperacion("odi.histlab", id, "delete");
    }

    public int elimIdioma(String id) throws Exception {
        bDatos.actualizar("delete from odi.idiomas where blq = 'N' and idlen = " + id);
        return registraOperacion("odi.idiomas", id, "delete");
    }

    public int elimMembresia(String id) throws Exception {
        bDatos.actualizar("delete from odi.membrecias where blq = 'N' and idmem = " + id);
        return registraOperacion("odi.membrecias", id, "delete");
    }

    public int elimProducto(String id) throws Exception {
        bDatos.actualizar("delete from odi.productos where blq = 'N' and idpro = " + id);
        return registraOperacion("odi.productos", id, "delete");
    }

    public int elimPublic(String id) throws Exception {
        bDatos.actualizar("delete from odi.publicaciones where idpub = " + id);
        return registraOperacion("odi.publicaciones", id, "delete");
    }

    public HashMap[] getDistinciones() throws Exception {
        return bDatos.getRegistros("select iddis, nombre, instit, pais, anio, razon, blq " + "from odi.distinciones " + "where idemp = '" + docId + "' order by anio ");
    }

    public HashMap[] getHislab() throws Exception {
        return bDatos.getRegistros("select idhis, nomorg, convert(varchar(10), fini, 103) fini, " + "convert(varchar(10), ffin, 103) ffin, cargo, tpcar, nivdoc, blq " + "from odi.histlab " + "where idemp = '" + docId + "' order by odi.histlab.fini DESC");
    }

    public HashMap[] getIdiomas() throws Exception {
        return bDatos.getRegistros("select idlen, lengua, certif, convert(varchar(10),fec, 103) fec, nivlec, nivhab, nivesc, blq " + "from odi.idiomas " + "where idemp = '" + docId + "' order by lengua");
    }

    public HashMap[] getMembresia() throws Exception {
        return bDatos.getRegistros("select idmem, org, convert(varchar(10),fing,103) fing, convert(varchar(10),fret,103) fret, pais, blq " + "from odi.membrecias " + "where idemp = '" + docId + "' order by fing ");
    }

    public HashMap[] getProduccion() throws Exception {
        return bDatos.getRegistros("select idpro, tipp, titp, convert(varchar(10),fini,103) fini, convert(varchar(10),ffin,103) ffin, blq " + "from odi.productos " + "where idemp = '" + docId + "' order by fini ");
    }

    public HashMap[] getPublicaciones() throws Exception {
        return bDatos.getRegistros("select idpub, tipo, titulo, titmay, area, fec, edic, edit, ciudad, pais " + "from odi.publicaciones " + "where idemp = '" + docId + "' order by fec DESC");
    }

    public void inicializar(String idDoc) {
        bDatos = new Persistencia();
        this.docId = idDoc;
        this.docIdComp = idDoc;
    }

    public int setDistincion(String ident, String nom, String raz, String instit, String descr, String pais, String anio, String blq) throws Exception {
        bDatos.actualizar("update odi.distinciones set " + " nombre = '" + nom + "', razon = '" + raz + "', instit = '" + instit + "', " + " descr = '" + descr + "', pais = '" + pais + "', anio = " + anio + ", blq = '" + blq + "' " + " where iddis = " + ident);
        return registraOperacion("odi.distinciones", ident, "update");
    }

    public int setExperiencia(String ident, String org, String fini, String ffin, String cargo, String tpcar, String niv, String blq) throws Exception {
        bDatos.actualizar("update odi.histlab set " + " nomorg = '" + org + "', fini = '" + fini + "', ffin = '" + ffin + "', " + " cargo = '" + cargo + "', tpcar = '" + tpcar + "', nivdoc = '" + niv + "', blq = '" + blq + "' " + " where idhis = " + ident);
        return registraOperacion("odi.histlab", ident, "update");
    }

    public int setIdioma(String ident, String lengua, String certif, String org, String punt, String fecha, String nl, String nh, String ne, String blq) throws Exception {
        bDatos.actualizar("update odi.idiomas set " + " lengua = '" + lengua + "', certif = '" + certif + "', org = '" + org + "', punt = '" + punt + "', fec = '" + fecha + "', nivlec = '" + nl + "', blq = '" + blq + "', " + " nivhab = '" + nh + "', nivesc = '" + ne + "' " + " where idlen = " + ident);
        return registraOperacion("odi.idiomas", ident, "update");
    }

    public int setMembresia(String ident, String org, String tipo, String cat, String pais, String fing, String fret, String blq) throws Exception {
        bDatos.actualizar("update odi.membrecias set " + " org = '" + org + "', tipm = '" + tipo + "', cat = '" + cat + "', " + " pais = '" + pais + "', fing = '" + fing + "', fret = '" + fret + "', blq = '" + blq + "' " + " where idmem = " + ident);
        return registraOperacion("odi.membrecias", ident, "update");
    }

    public int setProducto(String ident, String tit, String tipo, String obj, String descp, String pais, String fini, String ffin, String rol, String org, String blq) throws Exception {
        bDatos.actualizar("update odi.productos set " + " titp = '" + tit + "', tipp = '" + tipo + "', objp = '" + obj + "', descp = '" + descp + "', pais = '" + pais + "', fini = '" + fini + "', ffin = '" + ffin + "', blq = '" + blq + "', " + " rolp = '" + rol + "', orgp = '" + org + "' " + " where idpro = " + ident);
        return registraOperacion("odi.productos", ident, "update");
    }

    public int setPublic(String ident, String tipo, String titulo, String timayor, String area, String fecha, String edicion, String editor, String ciudad, String pais) throws Exception {
        bDatos.actualizar("update odi.publicaciones set " + " tipo = '" + tipo + "', titulo = '" + titulo + "', titmay = '" + timayor + "', area = '" + area + "', fec = '" + fecha + "', edic = '" + edicion + "', edit = '" + editor + "', ciudad = '" + ciudad + "', " + " pais = '" + pais + "' " + " where idpub = " + ident);
        return registraOperacion("odi.publicaciones", ident, "update");
    }

    public void setNombre(String ap1, String ap2, String nom) {
        if (ap2 == null) {
            ap2 = "";
        }
        nombres = ap1 + " " + ap2 + " " + nom;
    }

    public HashMap[] lisUniversidades(String filtro) throws Exception {
        /*return bDatos.getRegistros("select cod_ins cod, nom_ins nom "
                + "from nomina.dbo.rhh_tbinsti where nom_ins like '%" + filtro + "%' order by nom_ins");*/
        return bDatos.getRegistros("select cod_ins cod, nom_ins nom "
                + "from novasoft.dbo.rhh_tbinsti where nom_ins like '%" + filtro + "%' order by nom_ins");
    }

    public HashMap[] lisciudades(String filtro) throws Exception {
        /*return bDatos.getRegistros("select cod_ciu cod, nom_ciu nom "
                + "from nomina.dbo.gen_ciudad where nom_ciu like '%" + filtro + "%' and cod_ciu != '00222' order by nom_ciu");*/
        return bDatos.getRegistros("select cod_ciu cod, nom_ciu nom "
                + "from novasoft.dbo.gen_ciudad where nom_ciu like '%" + filtro + "%' and cod_ciu != '00222' order by nom_ciu");
    }

    public HashMap[] lisconvoca() throws Exception {
        return bDatos.getRegistros("select idcon, nombre, convert(varchar(10),ffin,103) ffin, descon from odi.convoca "
                + "where estado = 'Abierta' and getdate() < ffin and idcon not in "
                + "(select conv from odi.partconvoca where cod_emp = '" + docId + "' )"
                + "order by ffin");
    }

    public HashMap[] lisconvocapart() throws Exception {
        return bDatos.getRegistros("select idpar, nombre, convert(varchar(10),ffin,103) ffin, odi.partconvoca.estado  "
                + "from odi.convoca, odi.partconvoca  "
                + "where cod_emp = '" + docId + "' and conv = idcon and odi.convoca.estado <> 'Terminada' order by ffin");
    }

    public HashMap detalleConv(String tipo, String id) throws Exception {
        if (tipo.equals("101")) {
            return bDatos.getRegistro("select 'Convocatoria: ' + nombre + '\n\nPlazo: ' + "
                    + " convert(char(10), fini, 103) + '-' + convert(char(10), ffin, 103) + '\n\nDescripción:\n' + descon desconv "
                    + " from odi.convoca where idcon = " + id);
        } else {
            return bDatos.getRegistro("select 'Convocatoria: ' + nombre + '\n\nPlazo: ' + convert(char(10), fini, 103) + '-' "
                    + "+ convert(char(10), ffin, 103) + '\n\nDescripción:\n' + descon + '\n\nEstado de su Proceso: ' + odi.partconvoca.estado + "
                    + "'\n\nTenga en cuenta que: ' + mensaje + '\n\nObservaciones:\n' + substring(obs, 1, 2500) desconv "
                    + "from odi.partconvoca, odi.convoca where idcon = conv and idpar = " + id);
        }
    }

    public int inscConvoca(String[] convs, int ncon) throws Exception {
        HashMap dato;
        String id;
        int i, ret = 1;

        for (i = 0; i < ncon && ret > 0; i++) {
            dato = bDatos.getRegistro("select max(idpar) + 1 id from odi.partconvoca  ");
            id = (String) dato.get("id");
            ret = bDatos.actualizar("insert into odi.partconvoca "
                    + "(idpar, cod_emp, conv, fecha, estado, mensaje, razon, obs) values ( "
                    + id + ", '" + docId + "', " + convs[i] + ", getdate(), 'Inscrito', '_', '_', '_' ) ");
        }
        return ret;
    }

    public int desinscConvoca(String[] convs, int ncon) throws Exception {
        int i, ret = 1;

        for (i = 0; i < ncon && ret > 0; i++) {
            ret = bDatos.actualizar("delete from odi.partconvoca "
                    + "where idpar = " + convs[i] + " and cod_emp = '" + docId + "' and estado = 'Inscrito'");
        }
        return ret;
    }

    public int registraOperacion(String tabla, String elemento, String operacion) throws Exception {
        return bDatos.actualizar("insert into odi.reg_talhum (doc_emp, fecha, tabla, elemento, operacion) values ('" + docId + "', getDate(), '" + tabla + "', '" + elemento + "', '" + operacion + "')");
    }
}
