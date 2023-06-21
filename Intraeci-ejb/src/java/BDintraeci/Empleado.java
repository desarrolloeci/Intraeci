/*
* To change this template, choose Tools | Templates
* and open the template in the editor.
*/
package BDintraeci;

import java.util.HashMap;
import java.util.List;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import utiles.ConsultaException;

/**
* @author jgarcia
*/
public class Empleado extends Persona implements SessionBean {

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
    }

    public HashMap datosGenerales() throws Exception {
        return bDatos.getRegistro("select nombres, cod_emp, est_lab, convert(varchar(10), fec_nac, 103) fecn, gen, gru_san, fac_rhh, "
                + "est_civ,  nac_emp, dir_res, tel_res, tel_cel tel_celular, ciu_res, num_lib, cla_lib, dim_lib, e_mail email, categoria, "
                + "eciv, nom_ciu  from odi.empnomina, novasoft.dbo.gen_ciudad  where ciu_res = cod_ciu and cod_emp = '" + docId + "'");
    }

    public int setEmpleado(String nlib, String clase, String dmil, String dir, String tel, String celular,
            String grsan, String frh, String eciv, String ciud) throws Exception {
        bDatos.actualizar("update novasoft.dbo.rhh_emplea set "
                + " num_lib = '" + nlib + "', cla_lib = " + clase + ", dim_lib = " + dmil + ", dir_res = '" + dir
                + "', tel_res = '" + tel + "', tel_cel = '" + celular + "', gru_san = '" + grsan + "', fac_rhh = '" + frh + "', "
                + " est_civ = '" + eciv + "', ciu_res = '" + ciud + "' "
                + " where cod_emp = '" + docId + "'");
        return registraOperacion("novasoft.dbo.rhh_emplea", docId, "update");
    }

//=== Métodos de administración de Estudios
    public HashMap[] getEstudios() throws Exception {

        return bDatos.getRegistros("select ID_Uniq idestud, RTRIM(nom_est)nom_est, nom_ins, convert(varchar(10), fec_gra, 103) fgra, des_est, 'N' blq from  "
                + "novasoft.dbo.rhh_tbclaest, novasoft.dbo.rhh_estudio, novasoft.dbo.rhh_tbinsti  where novasoft.dbo.rhh_tbclaest.tip_est ="
                + " novasoft.dbo.rhh_estudio.tip_est and  novasoft.dbo.rhh_estudio.cod_ins = novasoft.dbo.rhh_tbinsti.cod_ins and cod_emp ="
                + " '" + docId + "'");
    }

    public HashMap detalleEstudio(String id) throws Exception {
        return bDatos.getRegistro("select ID_Uniq idestud, RTRIM(nom_est)nom_est, nom_ins, convert(varchar(10), fec_gra, 103) fgra, sem_apr, tip_est, "
                + "RTRIM(nro_tar)nro_tar, novasoft.dbo.rhh_estudio.cod_ins cod_ins from novasoft.dbo.rhh_estudio, novasoft.dbo.rhh_tbinsti "
                + "where novasoft.dbo.rhh_estudio.cod_ins = novasoft.dbo.rhh_tbinsti.cod_ins and ID_Uniq = '" + id+"'");
    }

    public int setEstudio(String ident, String cdins, String tit, String dur, String fgra, String ntar,
            String nivel, String blq) throws Exception {
        bDatos.actualizar("update novasoft.dbo.rhh_estudio set "
                + " nom_est = '" + tit + "', sem_apr = " + dur + ", fec_gra = '" + fgra 
                + "', nro_tar = '" + ntar + "', tip_est = '" + nivel + "', cod_ins = '" + cdins
                + "' where ID_Uniq = '" + ident+"'");
        return registraOperacion("novasoft.dbo.rhh_estudio", ident, "update");
    }

    public int crearEstudio(String titulo, String cdins, String dur, String fecha, String ntar,
            String nivel, String blq) throws Exception {
        HashMap dato;
        String id;
        //dato = bDatos.getRegistro("select max(idestud) + 1 id from nomina.dbo.rhh_estudio ");
        //id = (String) dato.get("id");
        bDatos.actualizar("insert into novasoft.dbo.rhh_estudio (cod_emp, cod_est, nom_est, cod_ins, ano_est, sem_apr, hor_est, gra_son, fec_gra, nro_tar, ind_can, tip_est ) values ( "
                + "'" + docId + "', '00020', '" + titulo + "', '" + cdins + "', '0', " + dur + ", 0, 1   , '"
                + fecha + "', '" + ntar + "', 1, '" + nivel + "' )");
        return registraOperacion("novasoft.dbo.rhh_estudio", fecha, "insert - " + nivel);
    }

    public int elimEstudio(String id) throws Exception {
        bDatos.actualizar("delete from novasoft.dbo.rhh_estudio where ID_Uniq ='" + id+"'");
        return registraOperacion("novasoft.dbo.rhh_estudio", id, "delete");
    }

//=== Métodos de administración de Docencia
    public HashMap[] getDocencia() throws Exception {
        return bDatos.getRegistros("select periodo, nom_asig, grupo, can_alum, can_gan, perdida, cancelaron "
                + "from odi.histprof "
                + "where docprof = '" + docId + "' order by periodo, nom_asig, grupo ");
    }

    public HashMap getPerfil() throws Exception {
        return bDatos.getRegistro("select perfil  "
                + "from apolo.dbo.rhh_tbperfiles "
                + "where cod_emp = '" + docId + "'  ");
    }

    public int setPerfil(String perfil) throws Exception {
        bDatos.actualizar("update apolo.dbo.rhh_tbperfiles set "
                + " perfil = '" + perfil + "' where cod_emp = '" + docId + "'");
        return registraOperacion("apolo.dbo.rhh_tbperfiles", docId, "update");
    }
    
    public HashMap getConvDet(String id_conv) throws Exception {
        return bDatos.getRegistro(  "SELECT  CONV.idcon, " +
                                            "CONV.nombre, " +
                                            "CONV.descon, " +
                                            "CONVERT(VARCHAR(10), CONV.fini, 103) fini, " +
                                            "CONVERT(VARCHAR(10), CONV.ffin, 103) ffin, " +
                                            "CONV.tipo, " +
                                            "CONV.peracad, " +
                                            "CONV.idadm convAdm, " +
                                            "EMPADM.nombres nomAdm, " +
                                            "CONV.dirunidad convDir, " +
                                            "EMPDIR.nombres nomDir " +
                                    "FROM odi.convoca CONV " +
                                        "INNER JOIN registro.dbo.empnomina EMPADM ON EMPADM.cod_emp COLLATE SQL_Latin1_General_CP1_CI_AS = CONV.idadm " +
                                        "INNER JOIN registro.dbo.empnomina EMPDIR ON EMPDIR.cod_emp COLLATE SQL_Latin1_General_CP1_CI_AS = CONV.dirunidad " +
                                    "WHERE idcon = '" + id_conv + "'");
    }

    public HashMap[] lisconvocadm() throws Exception {
        return bDatos.getRegistros( "SELECT  idcon, " +
                                            "nombre, " +
                                            "CONVERT(VARCHAR(10), ffin, 103) ffin " +
                                    "FROM odi.convoca " +
                                    "WHERE   estado = 'Abierta' " +
                                            "AND (" +
                                                "idadm = '" + docId + "' " +
                                                "OR dirunidad = '" + docId + "' " +
                                                "OR '" + docId + "' = '1047421813' " +
                                                "OR '" + docId + "' = '52249671' " +
                                                "OR '" + docId + "' = '39778717' " +
                                                "OR '" + docId + "' = '35416070'" +
                                            ") " +
                                    "ORDER BY odi.convoca.ffin");
    }

    public HashMap[] lisparticipan(String id) throws Exception {
        return bDatos.getRegistros("select idpar, convert(varchar(10),fecha,103) fec, docid, ap1 + ' ' + ap2 + ' ' + nom nom, convert(varchar(10),fnac,103) fnac, gen, estado "
                + " from odi.aspirante, odi.partconvoca "
                + "where cod_emp = docid and conv = " + id + " order by fecha");
    }

    public HashMap getParticipa(String id) throws Exception {
        return bDatos.getRegistro("select estado, mensaje, obs, razon "
                + "from odi.partconvoca where idpar = " + id);

    }

    public int setEstadoPart(String id, String mens, String obs, String raz, String estad) throws Exception {
        bDatos.actualizar("update odi.partconvoca set "
                + " estado = '" + estad + "', razon = '" + raz + "', mensaje = '" + mens
                + "', obs = '" + obs + "' where idpar = " + id);
        return registraOperacion("odi.partconvoca", id, "update");
    }

    public HashMap[] getCompromisos(String op) throws Exception {
        if (op.equals("1") || op.equals("2")) {
            return bDatos.getRegistros("select iddfa, fasd, nom_asig + ' - ' + cod_asig nom, nsem, niv, hc, dedsem, hae, had, thor, tpact, "
                    + " convert(varchar(10),fided,103) fini, convert(varchar(10),ffded,103) ffin, blq, tpact tipo "
                    + " from odi.dedicacion, registro.asignatura"
                    + " where fasd = id_asig and tpact = " + op + " and rec = '" + docIdComp + "' and per = '"
                    + periodoComp + "' order by nom");
        } else if (op.equals("5")) {
            return bDatos.getRegistros("select iddfa, fasd, nompr nom, nsem, niv, hc, dedsem, hae, had, thor, tpact, "
                    + " convert(varchar(10),fided,103) fini, convert(varchar(10),ffded,103) ffin, blq, tpact tipo "
                    + " from odi.dedicacion, odi.fases, odi.proyectos "
                    + " where proyfa = idpr and fasd = idfa and tpact = " + op + " and rec = '" + docIdComp
                    + "' and per = '" + periodoComp + "' order by nom");
        } else if (op.equals("6")) {
            return bDatos.getRegistros("select iddfa, fasd, desact nom, nsem, niv, hc, dedsem, hae, had, thor, tpact, "
                    + " convert(varchar(10),fided,103) fini, convert(varchar(10),ffded,103) ffin, blq, tipo "
                    + " from odi.dedicacion, odi.tpcompromiso "
                    + " where idtp = tpact and cat = 6 and rec = '" + docIdComp + "' and per = '" + periodoComp + "' order by nom");
        } else {
            return bDatos.getRegistros("select iddfa, fasd, desact nom, nsem, niv, hc, hae, had,thor, tpact, "
                    + " convert(varchar(10),fided,103) fini, convert(varchar(10),ffded,103) ffin, blq, tpact tipo "
                    + " from odi.dedicacion "
                    + " where tpact = " + op + " and rec = '" + docIdComp + "' and per = '" + periodoComp + "' order by nom");
        }
    }

    public HashMap detalleCompromiso(String idc, String op) throws Exception {
        if (op.equals("1") || op.equals("2")) {
            return bDatos.getRegistro("select iddfa, fasd, nom_asig + ' - ' + cod_asig nom, nsem, niv, hc, dedsem, hae, had, thor, tpact, "
                    + " convert(varchar(10),fided,103) fini, convert(varchar(10),ffded,103) ffin, blq, tpact tipo  "
                    + " from odi.dedicacion, registro.asignatura"
                    + " where iddfa = " + idc + " and fasd = id_asig and rec = '" + docIdComp + "' order by nom");
        }
        if (op.equals("5")) {
            return bDatos.getRegistro("select iddfa, fasd, nompr nom, nsem, niv, hc, dedsem, hae, had, thor, tpact, "
                    + " convert(varchar(10),fided,103) fini, convert(varchar(10),ffded,103) ffin, blq, tpact tipo  "
                    + " from odi.dedicacion, odi.fases, odi.proyectos "
                    + " where proyfa = idpr and fasd = idfa and iddfa = " + idc + " and rec = '" + docIdComp + "' order by nom");
        } else if (op.equals("6")) {
            return bDatos.getRegistro("select iddfa, fasd, desact nom, nsem, niv, hc, dedsem, hae, had, thor, tpact, "
                    + " convert(varchar(10),fided,103) fini, convert(varchar(10),ffded,103) ffin, tipo, blq, tipo  "
                    + " from odi.dedicacion, odi.tpcompromiso "
                    + " where idtp = tpact and tpact >= 6 and iddfa = " + idc + " and rec = '" + docIdComp + "' order by nom");
        } else {
            return bDatos.getRegistro("select iddfa, fasd, desact nom, nsem, niv, hc, hae, had, thor, tpact, "
                    + " convert(varchar(10),fided,103) fini, convert(varchar(10),ffded,103) ffin, blq, tpact tipo  "
                    + " from odi.dedicacion "
                    + " where iddfa = " + idc + " and rec = '" + docIdComp + "' order by nom");
        }
    }

    public int setCompromiso(String idc, String idint, String num, String fini, String ffin, String tipo,
            String desact, String niv, String hc, String ha, String hd, String hp, String blq, String tp) throws Exception {
        String th;
        blq = "N";
        if (desact.length() == 0 || desact.equals(" ")) {
            desact = "_";
        }
        if (tipo.equals("1")) {
            th = "(" + hc + " + " + ha + " + " + hd + " + " + hp + ") * 16";
        } else {
            th = "(" + hc + " + " + ha + " + " + hd + " + " + hp + ") ";
        }
        bDatos.actualizar("update odi.dedicacion set "
                + " fasd = " + idint + ", nsem = " + num + ", fided = '" + fini + "', ffded = '" + ffin
                + "', tpact = " + tipo + ", desact = '" + desact + "', niv = '" + niv + "', "
                + " hc = " + hc + ", dedsem = " + hp + ", hae = " + ha + ", had = " + hd + ", blq = '" + blq + "', thor = " + th
                + " where iddfa = " + idc + " and rec = '" + docIdComp + "' ");
        return registraOperacion("odi.dedicacion", idc, "update");
    }

    public int crearCompromiso(String idc, String idint, String num, String fini, String ffin, String tipo,
            String desact, String niv, String hc, String ha, String hd, String hp, String blq) throws Exception {
        HashMap dato;
        String id, th;
        blq = "N";
        if (desact.length() == 0 || desact.equals(" ")) {
            desact = "_";
        }
        if (tipo.equals("1")) {
            th = "(" + hc + " + " + ha + " + " + hd + " + " + hp + ") * 16";
        } else {
            th = "(" + hc + " + " + ha + " + " + hd + " + " + hp + ") ";
        }
        dato = bDatos.getRegistro("select max(iddfa) + 1 id from odi.dedicacion ");
        id = (String) dato.get("id");
        bDatos.actualizar("insert into odi.dedicacion ( "
                + " iddfa, fasd, rec, unidrec, nsem, fided, ffded, per, thor, tpact, desact, niv, hc, dedsem, hae, had, blq) "
                + " values (" + id + ", " + idint + ", '" + docIdComp + "', 'x', " + num + ", '" + fini + "', '" + ffin
                + "', '" + periodoComp + "', " + th + ", " + tipo + ", '" + desact + "', '" + niv + "', " + hc + ", " + hp
                + ", " + ha + ", " + hd + ", '" + blq + "' )");
        return registraOperacion("odi.dedicacion", id, "insert");
    }

    public int elimCompromiso(String id) throws Exception {
        bDatos.actualizar("delete from odi.dedicacion where fconf is null and blq = 'N' and iddfa = " + id);
        return registraOperacion("odi.dedicacion", id, "delete");
    }

    public HashMap[] listpcompromiso(String filtro) throws Exception {
        return bDatos.getRegistros("select idtp cod, tipo nom "
                + "from odi.tpcompromiso where tipo like '%" + filtro + "%' order by cod");
    }

    public HashMap[] lisproyectos(String filtro) throws Exception {
        return bDatos.getRegistros("select idfa cod, nompr nom "
                + "from  odi.fases, odi.proyectos where anfa = 2012 and proyfa = idpr and nompr like '%"
                + filtro + "%' order by nom");
    }

    public HashMap[] lispacargo(String opc) throws Exception {
        docIdComp = docId;
        if (opc.equals("0")) {
           /* return bDatos.getRegistros("select cod_emp, nombres, count(fconf) cant "
                    + " from odi.empnomina, odi.dedicacion where  cod_emp *= rec and per = '" + periodoComp + "' and "
                    + " cod_emp = '" + docId + "' and fconf is not null group by cod_emp, nombres order by nombres");*/
           return bDatos.getRegistros("select cod_emp, nombres, count(fconf) cant "+
                    "from odi.empnomina "+
                    "left outer join odi.dedicacion on cod_emp = rec and per = '" + periodoComp + "' and fconf is not null " +
                    "where cod_emp = '" + docId + "' " +
                    "group by cod_emp, nombres order by nombres");

        } else {
            return bDatos.getRegistros("select cod_emp, ap1_emp + ap2_emp + nom_emp nombres, 0 cant "
                    + "from nomina.dbo.rhh_emplea where est_lab in ('01','02') and rtrim(substring(cod_cco,1,4)) in "
                    + "(select rtrim(substring(cod_cco,1,4)) from nomina.dbo.rhh_emplea "
                    + " where tip_emp = '06' and cod_emp = '" + docId + "') order by nombres");
        }
    }

    public int confirmeHoja() throws Exception {
        bDatos.actualizar("update odi.dedicacion set fconf = getdate(), blq = 'S' "
                + "where fconf is null and rec = '" + docIdComp + "' and per = '" + periodoComp + "' ");
        return registraOperacion("odi.dedicacion", docIdComp, "update");
    }

    public int registrarEvaluacion(String per, String tp, String eval, String nres, String resp, String obs) throws Exception {
        bDatos.actualizar("insert into odi.evalpersonal "
                + "(docper, pereval, tpeval, ideval, evaluador, fecha, nresp, resp, obs) values ( "
                + "'" + docIdComp + "', '" + per + "', '" + tp + "', " + eval + ", '" + docId + "', getdate(), "
                + nres + ", '" + resp + "', '" + obs + "' )");
        return registraOperacion("odi.evalpersonal", docIdComp, "insert");
    }

    public HashMap getEvaluacion(String per, String tipo, String eval) throws Exception {
        return bDatos.getRegistro("select count(*) cant  "
                + " from odi.evalpersonal "
                + " where pereval = '" + per + "' and ideval = " + eval + " and tpeval = '" + tipo + "' and "
                + " docper = '" + docIdComp + "' ");
    }

    public HashMap[] getCompEval(String per, String tpc, String tpe) throws Exception {
        if (tpc.equals("20")) {
            return bDatos.getRegistros("select idcomp, rec, per, tipo, desact, medidor "
                    + " from odi.evalcompromisos "
                    + " where tpact = " + tpc + " and rec = '" + docIdComp + "' and per = '" + per
                    + "' and idcomp not in ( select ideval from odi.evalpersonal where tpeval = '" + tpe + "' ) "
                    + " order by idcomp ");
        } else if (tpc.equals("2")) {
            return bDatos.getRegistros("select iddfa, fasd, nompr nom, nsem, niv, hc, dedsem, hae, had, thor, tpact, "
                    + " convert(varchar(10),fided,103) fini, convert(varchar(10),ffded,103) ffin, blq, tpact tipo "
                    + " from odi.dedicacion, odi.fases, odi.proyectos "
                    + " where proyfa = idpr and fasd = idfa and tpact = " + tpc + " and rec = '" + docIdComp
                    + "' and per = '" + periodoComp + "' order by nom");
        } else {
            return bDatos.getRegistros("select iddfa, fasd, desact nom, nsem, niv, hc, hae, had,thor, tpact, "
                    + " convert(varchar(10),fided,103) fini, convert(varchar(10),ffded,103) ffin, blq, tpact tipo "
                    + " from odi.dedicacion "
                    + " where tpact = " + tpc + " and rec = '" + docIdComp + "' and per = '" + periodoComp + "' order by nom");
        }
    }
    
    public int IsAdmConvoca() throws Exception{
        if (docId.equals("1047421813") || docId.equals("52249671") || docId.equals("39778717") || docId.equals("35416070")){
        //if(docId == 39778717) {
            return 1;
        } else {
            return 0;
        }
    }
    
    public int IsPermisosConvoca(String idconv) throws Exception {
        HashMap temp = bDatos.getRegistro(  "DECLARE @ID INT;\n" +
                                            "SELECT @ID = idcon " +
                                            "FROM odi.convoca " +
                                            "WHERE   idcon = '" + idconv + "' " +
                                                    "AND (" +
                                                        "idadm = '" + docId + "' " +
                                                        "OR dirunidad = '" + docId + "'" +
                                                    ")\n" +
                                            "IF(@ID IS NOT NULL) " +
                                                "SELECT 1 Response; " +
                                            "ELSE " +
                                                "SELECT 0 Response;");
        return Integer.parseInt((String) temp.get("Response"));
    }
    
    public HashMap[] resumenAspirantes(String idconv) throws Exception {
        return bDatos.getRegistros( "SELECT  A.ap1 + ' ' + CASE WHEN A.ap2 <> '' THEN A.ap2 + ' ' ELSE '' END  + nom Aspirante, " +
                                            "telres Telefono, " +
                                            "cel Celular, " +
                                            "email Email, " +
                                            "Idiomas = ISNULL(LTRIM(RTRIM(STUFF((SELECT '[salto]' + ISNULL(I.lengua, '') " +
                                                                                "FROM odi.idiomas I " +
                                                                                "WHERE I.idemp = PC.cod_emp " +
                                                                                "FOR XML PATH(''), TYPE).value('.', 'VARCHAR(MAX)'), 1, 7, ''))), ''), " +
                                            "Estudios = ISNULL(LTRIM(RTRIM(STUFF((   SELECT  '[salto]' + ISNULL(CONVERT(VARCHAR(10), EST.fec_gra, 103), 'Sin fecha') + ' - ' + " +
                                                                                            "ISNULL(RTRIM(LTRIM((NIVEST.des_est COLLATE SQL_Latin1_General_CP1_CI_AS))), '(No hay nombre de título)') + ' en ' + " +
                                                                                            "ISNULL(RTRIM(LTRIM(EST.nom_est)), '') + ' - ' + " +
                                                                                            "ISNULL(RTRIM(LTRIM((INSTEST.nom_ins COLLATE SQL_Latin1_General_CP1_CI_AS))), '(No hay nombre de instituto)') " +
                                                                                    "FROM odi.estudasp EST " +
                                                                                        "LEFT JOIN Novasoft.dbo.rhh_tbclaest NIVEST ON NIVEST.tip_est COLLATE SQL_Latin1_General_CP1_CI_AS = EST.tip_est " +
                                                                                        "LEFT JOIN Novasoft.dbo.rhh_tbinsti INSTEST ON INSTEST.cod_ins COLLATE SQL_Latin1_General_CP1_CI_AS = EST.cod_ins " +
                                                                                    "WHERE EST.cod_emp = PC.cod_emp " +
                                                                                    "FOR XML PATH(''), TYPE).value('.', 'VARCHAR(MAX)'), 1, 7, ''))), ''), " +
                                            "[Experiencia Laboral] = ISNULL(LTRIM(RTRIM(STUFF((  SELECT '[salto]' + CONVERT(VARCHAR(10), fini ,103) + ' - ' + (CASE ffin WHEN '01/01/1900' THEN 'Actualidad' ELSE CONVERT(VARCHAR(10), ffin, 103) END) + ': ' + LTRIM(RTRIM(ISNULL(cargo, ''))) + ' - ' + LTRIM(RTRIM(ISNULL(tpcar, ''))) + ' en ' + LTRIM(RTRIM(ISNULL(nomorg, ''))) " +
                                                                                                "FROM odi.histlab H " +
                                                                                                "WHERE H.idemp = PC.cod_emp " +
                                                                                                "FOR XML PATH(''), TYPE).value('.', 'VARCHAR(MAX)'), 1, 7, ''))), ''), " +
                                            "Publicaciones = ISNULL(LTRIM(RTRIM(STUFF((  SELECT '[salto]' + fec + ': ' + ciudad + ', ' + pais + ' - ' + tipo + ' de ' + titulo " +
                                                                                        "FROM odi.publicaciones P " +
                                                                                        "WHERE P.idemp = PC.cod_emp " +
                                                                                        "FOR XML PATH(''), TYPE).value('.', 'VARCHAR(MAX)'), 1, 7, ''))), '') " +
                                    "FROM odi.partconvoca PC " +
                                    "INNER JOIN odi.aspirante A ON A.docid = PC.cod_emp " +
                                    "WHERE PC.conv = '" + idconv + "' " +
                                    "ORDER BY A.ap1, A.ap2, A.nom");
    }
    
    public HashMap[] lisCentros(String vig) throws Exception {
        return bDatos.getRegistros( "SELECT DISTINCT codigo Codigo, nombre Nombre "
                                    +"FROM novasoft.dbo.gen_clasif1 tblCen "
                                        +"INNER JOIN novasoft.dbo.pre_cuedoc tblCue "
                                        +"ON tblCen.codigo=tblCue.cod_cl1 "
                                    +"WHERE tblCue.ano_doc='" + vig + "' "
                                            +"AND (tblCen.usr_responsable='" + docId + "' "
                                                +"OR tblCen.usr_respon2='" + docId + "' "
                                                +"OR tblCen.usr_respon3='" + docId + "') "
                                    +"ORDER BY Nombre");
    }
    
    public HashMap[] lisRubros(String vig, String cen) throws Exception {
        return bDatos.getRegistros( "SELECT DISTINCT cod_rub Codigo, nom_rub Nombre "
                                    +"FROM novasoft.dbo.pre_rubro tblRub "
                                        +"INNER JOIN novasoft.dbo.pre_cuedoc tblCue "
                                            +"ON tblRub.cod_rub=tblCue.cod_rubro "
                                        +"INNER JOIN novasoft.dbo.gen_clasif1 tblCen "
                                            +"ON tblCen.codigo=tblCue.cod_cl1 "
                                    +"WHERE  tblCue.cod_cl1='" + cen + "' "
                                            +"AND tblCue.ano_doc='" + vig + "' "
                                            +"AND (tblCue.tip_doc LIKE '72%' OR tblCue.sub_tip='U726') "
                                            +"AND (tblCen.usr_responsable='" + docId + "' "
                                                +"OR tblCen.usr_respon2='" + docId + "' "
                                                +"OR tblCen.usr_respon3='" + docId + "') "
                                    +"ORDER BY Nombre");
    }

    public HashMap[] getCDPs(String vig, String rub, String cen) throws Exception {
        return bDatos.getRegistros( "SELECT  num,det,nom_prov,fec,val,est,rub " +
                                    "FROM Novasoft.dbo.usr_v_pre_intraeci cue " +
                                    "WHERE   cue.ano_doc = '" + vig + "' " +
                                    "AND cue.cod_cl1 = '" + cen + "' " +
                                    "AND cue.cod_rubro = '" + rub + "' "
                                    + "UNION "
                                    + "SELECT  'Apropia' num, "
                                            + "'Apr. ' + nom_rub det, "
                                            + "'0' nom_prov, "
                                            + "CONVERT(varchar(10), "
                                            + "YEAR(MIN(cab.fec_doc))) fec, "
                                            + "SUM(CONVERT(bigint, apr_ini + apr_adi - apr_red)) val, "
                                            + "1 est, "
                                            + "nom_rub rub "
                                    + "FROM Novasoft.dbo.pre_cuedoc cue "
                                        + "INNER JOIN Novasoft.dbo.pre_cabdoc cab ON   cab.ano_doc = cue.ano_doc "
                                                                                    + "AND cab.per_doc = cue.per_doc "
                                                                                    + "AND cab.sub_tip = cue.sub_tip "
                                                                                    + "AND cab.num_doc = cue.num_doc "
                                        + "INNER JOIN  Novasoft.dbo.pre_rubro rub ON cue.cod_rubro = rub.cod_rub "
                                    + "WHERE   cab.tip_doc LIKE '7%' "
                                            + "AND cab.ano_doc = '" + vig + "' "
                                            + "AND cod_cl1 = '" + cen + "' "
                                            + "AND cod_rubro = '" + rub + "' "
                                    + "GROUP BY nom_rub "
                                    + "ORDER BY fec DESC, num DESC");

    }

    public HashMap[] getResPres(String vig, String cen) throws Exception {
        //CONSULTA OPTIMIZADA
        return bDatos.getRegistros( "SELECT 0 num, cod_rubro rub, nom_rub det, '0' nom_prov, 'Ejecutado' est, convert(bigint, sum(valor_cdp)) val, cue.ano_doc fec " +
            "FROM novasoft.dbo.pre_cuedoc cue " +
            "INNER JOIN novasoft.dbo.pre_rubro rub ON cue.cod_rubro = rub.cod_rub " +
            "WHERE cue.tip_doc = 'U26' AND  estado_cdp NOT IN ('0', '4') AND cod_cl1 = '" + cen + "' AND cue.ano_doc = '" + vig + "' " +
            "GROUP BY cue.ano_doc, cod_cl1, cod_rubro, nom_rub " +
            "UNION " +
            "SELECT 0 num, cod_rubro rub, nom_rub det, '0' nom_prov, 'Apropiado' est, convert(bigint, SUM(apr_ini + apr_adi - apr_red)) val, cue.ano_doc fec " +
            "FROM novasoft.dbo.pre_cuedoc cue " +
            "INNER JOIN novasoft.dbo.pre_rubro rub ON cue.cod_rubro = rub.cod_rub " +
            "WHERE cue.tip_doc LIKE '7%' AND estado_cdp <> '4' AND cod_cl1 = '" + cen + "' AND cue.ano_doc = '" + vig + "' GROUP BY cue.ano_doc, cod_cl1, cod_rubro, nom_rub " +
            "ORDER BY cod_rubro, est");
        /** CONSULTA NO OPTIMIZADA
        return bDatos.getRegistros( "SELECT 0 num, cod_rubro rub, nom_rub det, '0' nom_prov, 'Ejecutado' est, convert(bigint, sum(valor_cdp)) val, cab.ano_doc fec "
                                    +"FROM novasoft.dbo.pre_cuedoc cue "
                                        +"INNER JOIN novasoft.dbo.pre_cabdoc cab ON cue.ano_doc = cab.ano_doc AND cue.per_doc = cab.per_doc AND cue.num_doc = cab.num_doc "
                                        +"INNER JOIN novasoft.dbo.pre_rubro rub ON cue.cod_rubro = rub.cod_rub "
                                    +"WHERE cab.tip_doc = 'U26' AND estado_cdp NOT IN ('0', '4') AND cod_cl1 = '" + cen + "' AND cab.ano_doc = '" + vig + "' "
                                    +"GROUP BY cab.ano_doc, cod_cl1, cod_rubro, nom_rub "
                                    +"UNION "
                                        +"SELECT 0 num, cod_rubro rub, nom_rub det, '0' nom_prov, 'Apropiado' est, convert(bigint, SUM(apr_ini + apr_adi - apr_red)) val, cab.ano_doc fec "
                                        +"FROM novasoft.dbo.pre_cuedoc cue "
                                            +"INNER JOIN novasoft.dbo.pre_cabdoc cab ON cue.ano_doc = cab.ano_doc AND cue.per_doc = cab.per_doc AND cue.num_doc = cab.num_doc "
                                            +"INNER JOIN novasoft.dbo.pre_rubro rub ON cue.cod_rubro = rub.cod_rub "
                                        +"WHERE cab.tip_doc LIKE '7%' AND estado_cdp <> '4' AND cod_cl1 = '" + cen + "' AND cab.ano_doc = '" + vig + "' "
                                        +"GROUP BY cab.ano_doc, cod_cl1, cod_rubro, nom_rub "
                                        +"ORDER BY cod_rubro, est");
                                        * */
    }
    
    
    public HashMap[] getTiposEmpleadoERP() throws Exception{
        return bDatos.getRegistros("select CODIGO, NOMBRE from Novasoft.dbo.gen_clasif4 where estado='1'");
    }
    
    public HashMap[] getLis1DirEmpleadoERP() throws Exception{
        return bDatos.getRegistros("select descripcion, codigo from registro.lis_1_dir_rrhh where estado='1'");
    }
    
    public HashMap[] getLis2DirEmpleadoERP() throws Exception{
        return bDatos.getRegistros("select descripcion, codigo from registro.lis_2_dir_rrhh where estado='1'");
    }
    
    public HashMap[] getLis3DirEmpleadoERP() throws Exception{
        return bDatos.getRegistros("select descripcion, codigo from registro.lis_3_dir_rrhh where estado='1'");
    }
    
    public HashMap[] getLisABCDirEmpleadoERP() throws Exception{
        return bDatos.getRegistros("select descripcion from registro.lis_abc_dir_rrhh where estado='1'");
    }
    
    public HashMap[] getLis4DirEmpleadoERP() throws Exception{
        return bDatos.getRegistros("select descripcion, codigo from registro.lis_4_dir_rrhh where estado='1'");
    }
    
    public HashMap getDatosBasicosEmpleadoERP(String id_emp) throws Exception{
        return bDatos.getRegistro("select (nom_emp+' '+ap1_emp+' '+ap2_emp) as nombre, cod_cl4 as tipo, e_mail, cod_cl1 area, cod_car cargo, dir_res direccion, tel_res telefono from Novasoft.dbo.rhh_emplea where cod_emp='"+id_emp+"'");
    }
    
    public HashMap[] getAreasEmpleadoERP() throws Exception{
        return bDatos.getRegistros("select codigo, nombre from Novasoft.dbo.gen_clasif1 where estado='1'");
    }
    
    public HashMap[] getRedesSocialesEmpleadoERP(String id_emp) throws Exception{
        return bDatos.getRegistros("select cod_redsoc as codigo, usuario from Novasoft.dbo.GTH_EmpRedSocial where cod_emp='"+id_emp+"'");
    }
    
    public HashMap[] getAreasInteresERP(String cen_opt) throws Exception{
        return bDatos.getRegistros("select ID_INTERES codigo, DESCRIPCION from Novasoft.dbo.USR_GTH_TBINTERES where cod_cl1='"+cen_opt.trim()+"'");
    }
    
    public HashMap[] getInteresesEmpleadoERP(String id_emp) throws Exception{
        return bDatos.getRegistros("select ID_INTERES codigo from Novasoft.dbo.USR_GTH_INTERES where Cod_emp='"+id_emp+"'");
    }
    
    public HashMap getCargoERP(String id_cargo) throws Exception{
        return bDatos.getRegistro("select nom_car nombre, des_car perfil from Novasoft.dbo.rhh_cargos where cod_car='"+id_cargo+"'");
    }
    
    public HashMap getDatosUsrERP(String id_cargo) throws Exception{
        return bDatos.getRegistro("select usr_num_ext extension, ubicacion from Novasoft.dbo.USR_RHH_EMPLEA where Cod_emp='"+id_cargo+"'");
    }
    
    
    public HashMap[] getPublicacionesERP(String id_emp) throws Exception{
        return bDatos.getRegistros("select descrip_publicacion publicacion from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where cod_emp='"+id_emp+"' and descrip_publicacion is not null");
    }
    
    
    public HashMap[] getExperienciaEmpleadoERP(String id_emp) throws Exception{
        return bDatos.getRegistros("select nom_empr nombre_empresa, nom_car nombre_cargo, (select des_area_exp from Novasoft.dbo.GTH_ExpLabArea DES_AREA where DES_AREA.area_exp=EXPE.area_exp) area_experiencia, des_fun descripcion_funciones, (select des_tpo_exp from Novasoft.dbo.GTH_ExpLabTpo DES_TPO where DES_TPO.tpo_exp=EXPE.tpo_exp) duracion, mot_ret motivo_retiro, jefe_inm jefe, num_tel telefono, fec_ing ingreso, fec_ter terminacion  from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS EXPE where cod_emp='"+id_emp+"' and nom_empr is not null");
    }
    
    public HashMap[] getEstudiosProfERP(String id_emp) throws Exception{
        return bDatos.getRegistros("select cod_emp,est.nom_est,ins.nom_ins,ano_est,fec_gra,nro_tar \n" +
"from novasoft.[dbo].[USR_RHH_ACTUALIZA_DATOS] datos\n" +
"inner join novasoft.[dbo].rhh_tbinsti ins on ins.cod_ins=datos.cod_ins\n" +
"inner join novasoft.[dbo].rhh_tbestud est on est.cod_est=datos.cod_estudio\n" +
"where cod_emp='"+id_emp+"' and fec_gra is not null");
    }
    
    public HashMap[] getAreasExpERP() throws Exception{
        return bDatos.getRegistros("select area_exp codigo, des_area_exp descripcion from Novasoft.dbo.GTH_ExpLabArea");
    }
    
     public HashMap[] getTiposEstudiosERP() throws Exception{
        return bDatos.getRegistros("select cod_est,nom_est from Novasoft.dbo.rhh_tbestud where tip_est in (01,02,03,04,05,06) order by 2");
    }
     
      public HashMap[] getInstitutosERP() throws Exception{
        return bDatos.getRegistros("select cod_ins,nom_ins from Novasoft.dbo.rhh_tbinsti order by 2");
    }
    
    public HashMap[] getTiemposExpERP() throws Exception{
        return bDatos.getRegistros("select tpo_exp codigo, des_tpo_exp descripcion from Novasoft.dbo.GTH_ExpLabTpo");
    }
    
    public HashMap[] getEstCivilERP() throws Exception{
        return bDatos.getRegistros("select cod_est codigo, des_est descripcion from Novasoft.dbo.GTH_EstCivil");
    }
    
    public HashMap getDatosAdicionalesERP(String id_emp) throws Exception{
        return bDatos.getRegistro("select est_civ estado_civil, e_mail_alt email_alternativo, ciu_res ciudad_residencia, tel_cel celular, dpt_res departamento_residencia, pai_res pais_residencia from Novasoft.dbo.RHH_EMPLEA where cod_emp='"+id_emp+"'");
    }
    
    public HashMap[] getPaisesERP() throws Exception{
        return bDatos.getRegistros("select cod_pai codigo_pais, nom_pai descripcion from Novasoft.dbo.gen_paises order by nom_pai");
    }
    
    public HashMap[] getCiudadesERP() throws Exception{
        return bDatos.getRegistros("select cod_pai codigo_pais, cod_ciu codigo_ciudad, nom_ciu descripcion, cod_dep codigo_departamento from Novasoft.dbo.gen_ciudad order by nom_ciu");
    }
    
    public HashMap[] getDepartamentosERP() throws Exception{
        return bDatos.getRegistros("select cod_pai codigo_pais, cod_dep codigo_departamento ,nom_dep descripcion from Novasoft.dbo.gen_deptos order by nom_dep");
    }
    //
    public Integer guardaDatosBasicosERP(String cod_emp, String dir_res, String tel_res, String ubicacion, String usr_num_ext, String pai_res, String dpt_res, String ciu_res, String est_civ, String e_mail_alt, String perfil, String celular, String inf_veridica, String ind_acepta, String ind_modifica) throws Exception{
        try {
            bDatos.actualizar("delete from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where cod_emp='"+cod_emp+"' and dir_res is not null");
        } catch (Exception e) {
            if(!e.getMessage().equals("Error no Definido. Cero filas afectadas.")){
                throw e;
            }
        }
        return bDatos.actualizar("insert into Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS (cod_emp, dir_res, tel_res, ubicacion, usr_num_ext, pai_res, dpt_res, ciu_res, est_civ_emp, e_mail_alt, perfil, celular, inf_veridica, ind_acepta, ind_modifica, fec_registro) values ('"+cod_emp+"', '"+dir_res+"', '"+tel_res+"', '"+ubicacion+"', '"+usr_num_ext+"', '"+pai_res+"', '"+dpt_res+"', '"+ciu_res+"' ,'"+est_civ+"' ,'"+e_mail_alt+"' ,'"+perfil+"', '"+celular+"', '"+inf_veridica+"', '"+ind_acepta+"', '"+ind_modifica+"', getdate())");
    }
    
    public Integer guardaDatosBasicosProfERP(String cod_emp, String ubicacion, String usr_num_ext, String perfil, String inf_veridica, String ind_acepta, String ind_modifica) throws Exception{
        try {
            bDatos.actualizar("delete from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where cod_emp='"+cod_emp+"' and usr_num_ext is not null");
        } catch (Exception e) {
            if(!e.getMessage().equals("Error no Definido. Cero filas afectadas.")){
                throw e;
            }
        }
        return bDatos.actualizar("insert into Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS (cod_emp, ubicacion, usr_num_ext, perfil, inf_veridica, ind_acepta, ind_modifica, fec_registro) values ('"+cod_emp+"', '"+ubicacion+"', '"+usr_num_ext+"' ,'"+perfil+"', '"+inf_veridica+"', '"+ind_acepta+"', '"+ind_modifica+"', getdate())");
    }
    
    public Integer guardaRedSocialERP(String cod_emp, String cod_redsoc, String usuario_red) throws Exception{
        try{
            bDatos.actualizar("delete from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where cod_emp='"+cod_emp+"' and cod_redsoc='"+cod_redsoc+"'");
        } catch (Exception e) {
            if(!e.getMessage().equals("Error no Definido. Cero filas afectadas.")){
                throw e;
            }
        }
        return bDatos.actualizar("insert into Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS (cod_emp, cod_redsoc, usuario_red,fec_registro) values ('"+cod_emp+"', '"+cod_redsoc+"', '"+usuario_red+"',getdate())");
    }
    public Integer guardaExperienciaLabERP(String cod_emp, String nom_empr, String nom_car, String area_exp, String des_fun, String tpo_exp, String mot_ret, String jefe_inm, String num_tel, String fec_ing, String fec_ter) throws Exception{
        return bDatos.actualizar("insert into Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS (cod_emp, nom_empr, nom_car, area_exp, des_fun, tpo_exp, mot_ret, jefe_inm, num_tel, fec_ing, fec_ter,fec_registro) values ('"+cod_emp+"', '"+nom_empr+"', '"+nom_car+"', '"+area_exp+"', '"+des_fun+"', '"+tpo_exp+"', '"+mot_ret+"', '"+jefe_inm+"', '"+num_tel+"', '"+fec_ing+"', '"+fec_ter+"',getdate())");
    }
    
     public Integer guardaEstudiosProfERP(String cod_emp,String cod_estudio,String cod_ins, String ano_est,String fec_gra,String nro_tar) throws Exception{
        return bDatos.actualizar("insert into Novasoft.[dbo].[USR_RHH_ACTUALIZA_DATOS]\n" +
"(cod_emp,cod_estudio,cod_ins,ano_est,fec_gra,nro_tar,fec_registro)\n" +
"values ('"+cod_emp+"','"+cod_estudio+"','"+cod_ins+"','"+ano_est+"','"+fec_gra+"','"+nro_tar+"',getdate())");
    }
    
    public Integer guardaInteresEmpERP(String cod_emp, String id_interes) throws Exception{
        try{
            bDatos.actualizar("delete from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where cod_emp='"+cod_emp+"' and id_interes='"+id_interes+"'");
        } catch (Exception e) {
            if(!e.getMessage().equals("Error no Definido. Cero filas afectadas.")){
                throw e;
            }
        }
        return bDatos.actualizar("insert into Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS (cod_emp, id_interes,fec_registro) values ('"+cod_emp+"', '"+id_interes+"',getdate())");
    }
    
    public Integer guardaPublicacionEmpERP(String cod_emp, String descrip_publicacion) throws Exception{
        return bDatos.actualizar("insert into Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS (cod_emp, descrip_publicacion,fec_registro) values ('"+cod_emp+"', '"+descrip_publicacion+"',getdate())");
    }
    
    public HashMap[] getEstudiosERP(String cod_emp)throws Exception{
        return bDatos.getRegistros("select (select nom_est from Novasoft.dbo.rhh_tbestud TB_EST where TB_EST.cod_est=ESTUDIO.cod_est) titulo, (select nom_ins from Novasoft.dbo.rhh_tbinsti INSTITUCION where INSTITUCION.cod_ins=ESTUDIO.cod_ins) institucion, tip_est nivel_estudio from Novasoft.dbo.rhh_estudio ESTUDIO where cod_emp='"+cod_emp+"'");
    }
    
    public HashMap[] getIdiomasERP()throws Exception{
        return bDatos.getRegistros("select cod_idi, nom_idi from Novasoft.dbo.rhh_tbidioma");
    }
    
    public HashMap[] getCalifIdiomasERP()throws Exception{
        return bDatos.getRegistros("select cod_calif, Txt_Calif from Novasoft.dbo.GTH_Calificacion");
    }
    
    public HashMap[] getHabilIdiomasERP()throws Exception{
        return bDatos.getRegistros("select Cod_habilidad, Des_habilidad from Novasoft.dbo.GTH_IdiomaHabilidad");
    }
    
    public HashMap[] getIdiomasEmpERP(String cod_emp)throws Exception{
        return bDatos.getRegistros("select cod_idi, cod_calif, cod_hab from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where cod_emp='"+cod_emp+"' and cod_idi is not null");
    }
    
    public Integer guardaidiomaEmpERP(String cod_emp, String cod_idi, String cod_calif, String cod_habil) throws Exception{
        HashMap[] idiomasEmp = bDatos.getRegistros("select cod_idi, cod_calif, cod_hab from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where cod_emp='"+cod_emp+"' and cod_idi is not null");
        for (HashMap idioma : idiomasEmp) {
            if(idioma.get("cod_idi").equals(cod_idi)){
                bDatos.actualizar("delete from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where cod_emp='"+cod_emp+"' and cod_idi='"+cod_idi+"'");
            }
        }
        return bDatos.actualizar("insert into Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS (cod_emp, cod_idi, cod_calif, cod_hab,fec_registro) values ('"+cod_emp+"', '"+cod_idi+"', '"+cod_calif+"', '"+cod_habil+"',getdate())");
    }
    
    
    public HashMap[] getParentescosERP()throws Exception{
        return bDatos.getRegistros("select cod_par, nom_par from Novasoft.dbo.gen_parentesco");
    }
    
    public HashMap[] getGenerosERP()throws Exception{
        return bDatos.getRegistros("select cod_gen, des_gen from Novasoft.dbo.GTH_Genero");
    }
    public HashMap[] getTiposDocERP()throws Exception{
        return bDatos.getRegistros("select cod_tip, des_tip from Novasoft.dbo.gen_tipide");
    }
    public HashMap[] getOcupacionesERP()throws Exception{
        return bDatos.getRegistros("select cod_ocu, des_ocu from Novasoft.dbo.GTH_Ocupacion");
    }
    

    public HashMap[] getFamiliaresEmpERP(String cod_emp)throws Exception{
        return bDatos.getRegistros("select ap1_fam, ap2_fam, nom_fam, tip_fam, tip_ide, num_ced, fec_nac, sex_fam, est_civ_fam as est_civ, ocu_fam, sal_bas, ind_sub, ind_pro, ind_conv, niv_est, ind_comp from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where cod_emp='"+cod_emp+"' and ap1_fam is not null");
    }
    
    public boolean EliminarFamiliar(int num_ced){
         
        try {
            bDatos.actualizar("delete from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where num_ced='"+num_ced+"' and ap1_fam is not null");
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean EliminarPublicacion(int cod_emp,String publicacion){
         
        try {
            bDatos.actualizar("delete from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where cod_emp='"+cod_emp+"' and descrip_publicacion like '%"+publicacion+"%'");
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean EliminarExperiencia(int cod_emp,String nom_empr){
         
        try {
            bDatos.actualizar("delete from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where cod_emp='"+cod_emp+"' and nom_empr like '%"+nom_empr+"%'");
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
     public boolean EliminarEstudiosProf(int cod_emp,String nro_tar){
         
        try {
            bDatos.actualizar("delete novasoft.[dbo].[USR_RHH_ACTUALIZA_DATOS]\n" +
"where cod_emp='"+cod_emp+"' and nro_tar='"+nro_tar+"'");
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public Integer guardaFamiliarEmpERP(String cod_emp, String ap1_fam, String ap2_fam, String nom_fam, String tip_fam, String tip_ide, String num_ced, String fec_nac, String sex_fam, String est_civ, String ocu_fam, String sal_bas, String ind_sub, String ind_pro, String ind_conv, String niv_est, String ind_comp) throws Exception{
        HashMap[] familiaresEmp = this.getFamiliaresEmpERP(cod_emp);
        for (HashMap famil : familiaresEmp) {
            if(famil.get("num_ced").equals(num_ced)){
                bDatos.actualizar("delete from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS where num_ced='"+num_ced+"' and ap1_fam is not null");
            }
        }
        return bDatos.actualizar("insert into Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS (cod_emp, ap1_fam, ap2_fam, nom_fam, tip_fam, tip_ide, num_ced, fec_nac, sex_fam, est_civ_fam, ocu_fam, sal_bas, ind_sub, ind_pro, ind_conv, niv_est, ind_comp,fec_registro) values ('"+cod_emp+"', '"+ap1_fam+"', '"+ap2_fam+"', '"+nom_fam+"', '"+tip_fam+"', '"+tip_ide+"', '"+num_ced+"', '"+fec_nac+"', '"+sex_fam+"', '"+est_civ+"', '"+ocu_fam+"', '"+sal_bas+"', '"+ind_sub+"', '"+ind_pro+"', '"+ind_conv+"', '"+niv_est+"', '"+ind_comp+"',getdate())");
    }
    
    public HashMap[] getClasesEstudioERP()throws Exception{
        return bDatos.getRegistros("select tip_est, des_est from Novasoft.dbo.rhh_tbclaest");
    }
    
    
    public Integer generarTokenInicioGestorCursos(String id_emp, String cadena_llave, String cadena_encriptada, String flag_sesion) throws Exception{
        try{
            bDatos.actualizar("delete from registro.token_gestor_cursos where id_persona='"+id_emp+"'");
        }catch(ConsultaException ex){
            if(!ex.getMessage().equals("Error no Definido. Cero filas afectadas.")){
                throw new ConsultaException(ex.getMessage());
            }
        }
        
        return bDatos.actualizar("insert into registro.token_gestor_cursos (id_persona, cadena_llave, cadena_encriptada, flag_sesion) values ('"+id_emp+"', '"+cadena_llave+"', '"+cadena_encriptada+"', '"+flag_sesion+"')");
    }
    
    public Integer guardaDonacionUnete(String cod_emp, String[] meses_seleccionados, String donacion_indefinida, String valor) throws Exception{
        return bDatos.actualizar("insert into Novasoft.dbo.usr_eci_fondo_solidaridad (cod_emp, enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre, donacion_indefinida, valor, fec_graba) " +
           "values ('"+cod_emp+"', '"+meses_seleccionados[0]+"', '"+meses_seleccionados[1]+"', '"+meses_seleccionados[2]+"', '"+meses_seleccionados[3]+"', '"+meses_seleccionados[4]+"', '"+meses_seleccionados[5]+"', '"+meses_seleccionados[6]+"', '"+meses_seleccionados[7]+"', '"+meses_seleccionados[8]+"', '"+meses_seleccionados[9]+"', '"+meses_seleccionados[10]+"', '"+meses_seleccionados[11]+"', '"+donacion_indefinida+"', '"+valor+"', GETDATE())");
    }
    
    public HashMap[] getRolesCovid19()throws Exception{
        return bDatos.getRegistros("select codigo_rol CODIGO, descripcion DESCRIPCION from covid19.covid.tipo_rol");
    }
    
    public HashMap[] getTiposTransporteCOVID19()throws Exception{
        return bDatos.getRegistros("select cod_transporte CODIGO, descripcion DESCRIPCION from covid19.covid.tipo_transporte");
    }
    
    public HashMap getDatosBasicosMovilidadERP(String id_emp) throws Exception{
        return bDatos.getRegistro("select nom_emp NOMBRES, (ap1_emp+' '+ap2_emp) APELLIDOS, tip_ide TIPO_DOC, cod_emp DOC, sex_emp GENERO, fec_nac FECHA_NACIMIENTO, dir_res DIRECCION, ciu_res CIUDAD, pai_res PAIS from Novasoft.dbo.rhh_emplea where cod_emp='"+id_emp+"'");
    }
    
    public Integer guardarDatosFormularioMovilidadCovid19(String tip_id, String documento, String tipo_rol, String nombres, String apellidos, String genero, String edad, String cargo, String ciudad, String direccion, String barrio, String inf_veridica, String ind_acepta, String hor_ing, String hor_sal, String modo_transp, String trab_remoto, String[] dias_def) throws Exception{
        Boolean ans = true;
        try{
            bDatos.actualizar("delete from covid19.covid.inf_movilidad where documento='"+documento+"'");
        }catch(ConsultaException ex){
            if(!ex.getMessage().equals("Error no Definido. Cero filas afectadas.")){
                throw new ConsultaException(ex.getMessage());
            }
        }
        try{
            bDatos.actualizar("delete from covid19.covid.inf_personal where documento='"+documento+"'");
        }catch(ConsultaException ex){
            if(!ex.getMessage().equals("Error no Definido. Cero filas afectadas.")){
                throw new ConsultaException(ex.getMessage());
            }
        }
        ans=ans&&((bDatos.actualizar("insert into covid19.covid.inf_personal (tip_id, documento, tipo_rol, nombres, apellidos, genero, edad, cargo, ciudad, direccion, barrio, inf_veridica, ind_acepta, fech_reg) values ('"+tip_id+"', '"+documento+"', '"+tipo_rol+"', '"+nombres+"', '"+apellidos+"', '"+genero+"', '"+edad+"', '"+cargo+"', '"+ciudad+"', '"+direccion+"', '"+barrio+"', '"+inf_veridica+"', '"+ind_acepta+"', CURRENT_TIMESTAMP)"))==1);
        if(ans){
            ans=ans&&((bDatos.actualizar("insert into covid19.covid.inf_movilidad (tip_id, documento, fech_ini_semana, d_lun, d_mar, d_mrc, d_jue, d_vie, d_sab, d_dom, hor_ing, hor_sal, modo_transp, trab_remoto) values ('"+tip_id+"', '"+documento+"', NULL, '"+dias_def[0]+"', '"+dias_def[1]+"', '"+dias_def[2]+"', '"+dias_def[3]+"', '"+dias_def[4]+"', '"+dias_def[5]+"', '"+dias_def[6]+"', '"+hor_ing+"', '"+hor_sal+"', '"+modo_transp+"', '"+trab_remoto+"')"))==1);
        }
        return (ans)?1:0;
    }
    
    public HashMap getDatosGuardadosMovilidadERP(String id_emp) throws Exception{
        return bDatos.getRegistro("select tipo_rol, ciudad, direccion, barrio, d_lun, d_mar, d_mrc, d_jue, d_vie, d_sab, d_dom, hor_ing, hor_sal, modo_transp, trab_remoto from covid19.covid.inf_personal INF_PER, covid19.covid.inf_movilidad INF_MOV where INF_PER.documento=INF_MOV.documento and INF_PER.documento='"+id_emp+"'");
    }
}
