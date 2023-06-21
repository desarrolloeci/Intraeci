/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BDintraeci;

import java.rmi.RemoteException;
import java.util.HashMap;
import javax.ejb.EJBHome;
import javax.ejb.EJBObject;
import javax.ejb.Handle;
import javax.ejb.RemoveException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import utiles.ConsultaException;

/**
 *
 * @author jpgarcia
 */
public class BDproyecto extends Persistencia implements SessionBean {

    public static final String SUPER_USUARIO = "1013604945";
    public static final String PROYECTO = "Proyecto";
    public static final String FASE = "Fase";
    private SessionContext context;
    private String idPlan;
    private String idProyecto;
    private String idFase;
    private String idSegui;
    private String idSeguiF;
    private String idSeguiE;
    private String idEntre;
    private String tipo;
    private String idEmp;
    private String permiso;
    private String permisoSeguiGer;
    private String permisoSeguiDir;
    private int idEstFase;
    EstadoFase sigEstado;
    NivelFase nivelFase;
    private HashMap<String, HashMap> permisos;

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

    public void inicializar(String id_emp) throws Exception {
        this.idEmp = id_emp;
        setPerDir();
        permiso = "0";
    }

    public void setPerDir() throws Exception {
        permisos = new HashMap<String, HashMap>();
        HashMap<String, String> aux;
        HashMap[] temp = getRegistros("select tipo, valor, cc_dir from registro.odi.permisoProyec where cod_emp=" + idEmp + " union "
                + "select 'Fase' tipo, 1 valor, areapr cc_dir from registro.odi.fases f, registro.odi.proyectos p where proyfa=idpr and gerpr=" + idEmp + " group by areapr");
        for (int i = 0; i < temp.length; i++) {
            if (permisos.get(temp[i].get("tipo").toString()) == null) {
                aux = new HashMap<String, String>();
                aux.put(temp[i].get("cc_dir").toString(), temp[i].get("valor").toString());
                permisos.put(temp[i].get("tipo").toString(), aux);
                continue;
            }
            if (permisos.get(temp[i].get("tipo").toString()).get(temp[i].get("cc_dir").toString()) == null) {
                permisos.get(temp[i].get("tipo").toString()).put(temp[i].get("cc_dir").toString(), temp[i].get("valor").toString());
                continue;
            }
            permisos.get(temp[i].get("tipo").toString()).put(temp[i].get("cc_dir").toString(), permisos.get(temp[i].get("tipo").toString()).get(temp[i].get("cc_dir").toString()) + "-" + temp[i].get("valor"));
        }
    }

    public HashMap<String, HashMap> getPerDir() {
        return permisos;
    }

    public void setNivelFase(String idUniDir) {
        nivelFase = nivelFase.USUARIO;
        String[] valores = permisos.get(FASE).get(idUniDir).toString().split("-");
        for (int i = 0; i < valores.length; i++) {
            int valorNivel = Integer.parseInt(valores[i]);
            if (valorNivel == idEstFase) {
                switch (valorNivel) {
                    case 1:
                        nivelFase = NivelFase.RESPONSABLE;
                        break;
                    case 2:
                        nivelFase = NivelFase.DIRECTOR;
                        break;
                    case 3:
                        nivelFase = NivelFase.COMITE;
                        break;
                    case 4:
                        nivelFase = NivelFase.COMISION;
                        break;
                    case 5:
                        nivelFase = NivelFase.CONSEJO;
                        break;
                }
                break;
            }
        }
    }

    public void setSigEstado(int sigEst) {
        switch (sigEst) {
            case 0:
                sigEstado = EstadoFase.REVISION;
                break;
            case 1:
                sigEstado = EstadoFase.AVALADO;
                break;
            case 2:
                sigEstado = EstadoFase.POSPUESTO;
                break;
            case 3:
                sigEstado = EstadoFase.CANCELADO;
                break;
            case 4:
                sigEstado = EstadoFase.TERMINADO;
                break;
        }
    }

    public HashMap getPerXTipo(String tipo) {
        return permisos.get(tipo);
    }

    public String getIdFase() {
        return idFase;
    }

    public void setIdFase(String idFase) {
        this.idFase = idFase;
    }

    public String getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(String idPlan) {
        if (idPlan != null) {
            this.idPlan = idPlan;
        }
    }

    public void setIdProyecto(String idProyecto) {
        this.idProyecto = idProyecto;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getId() {
        if (tipo.equals(PROYECTO)) {
            return idProyecto;
        } else {
            return idFase;
        }
    }

    public HashMap[] getListComentario() throws Exception {
        return getRegistros("select nombres, descrip, convert(varchar(10), fecha, 103) fecha from registro.odi.regisModif r, registro.dbo.empnomina n "
                + "where convert(varchar(15),r.cod_emp )=n.cod_emp COLLATE SQL_Latin1_General_CP1_CI_AS and tipo='" + tipo + "' and gen_por='M' and id=" + getId() + " order by fecha");
    }

    public void setComentario(String comentario) throws Exception {
        actualizar("insert into registro.odi.regisModif (cod_emp, id, tipo, fecha, descrip, gen_por) values (" + idEmp + ", " + getId() + ", '" + tipo + "', getDate(), '" + comentario + "','M')");
    }

    public int setPromFase(String sigEst) throws Exception {
        String sigNiv = "";
        setSigEstado(Integer.parseInt(sigEst));
        String estado = sigEstado.getTexto() + nivelFase.getTexto();
        if (sigEst.equals("1")) {
            sigNiv = " + 1";
            if (nivelFase == NivelFase.CONSEJO) {
                setEstadoProyecto("Ejecución");
                estado = "Ejecución";
            }
        }
        actualizar("insert into registro.odi.regisModif (cod_emp, id, tipo, fecha, descrip, gen_por) "
                + "(select " + idEmp + ", " + idFase + ", '" + FASE + "', getDate(), "
                + " 'Estado Anterior: ' + estfas + ' -> Nuevo Estado: " + sigEstado.getTexto() + nivelFase.getTexto() + "', 'A' from registro.odi.fases where idfa=" + idFase + ")");
        return actualizar("update registro.odi.fases set estfas='" + estado + "', idEstado= idEstado " + sigNiv + " where idfa=" + idFase);
    }

    public HashMap[] getListaPlanes(String res) throws Exception {
        return getRegistros("select idpl, tppl, nompl, descen, aipl, mipl, afpl, mfpl "
                + " from registro.odi.planes, apolo.uge.centros  "
                + " where unidadpl=idcen order by nompl DESC, afpl DESC, mipl DESC ");
    }

    public HashMap[] getListaProyectos() throws Exception {
        return getRegistros("select idpr, nompr, estpr from registro.odi.proyectos "
                + " where planpr = " + idPlan + " order by nompr ");
    }

    public HashMap getProyecto(String idproy) throws Exception {
        setIdProyecto(idproy);
        setTipo(PROYECTO);
        HashMap temp = getRegistro("select idpr, 'Plan: ' + nompl nompl, nompr, tppr, convert(char(10), fipr, 103) FecIni, "
                + " convert(char(10), ffpr, 103) FecFin, durpr, obgenpr, justpr, resppr, gerpr, estpr, ger.nombres COLLATE SQL_Latin1_General_CP1_CI_AS nomGer,res.nombres COLLATE SQL_Latin1_General_CP1_CI_AS nomResp, "
                + " (case when ('" + idEmp + "' in (resppr,gerpr,'" + SUPER_USUARIO + "')) then (case estpr when 'Inscrito' then 1 when 'Proyectado' then 1 when 'Ejecución' then 1 else 2 end) when ('" + idEmp + "' in (select respon from registro.odi.entregables, registro.odi.fases where idpad=idfa and proyfa=" + idproy + ")) then 2 else 0 end) permisos, "
                //+ " (case when (resppr ='" + idEmp + "' or gerpr='" + idEmp + "') then (case estpr when 'Inscrito' then 1 when 'Proyectado' then 1 else 2 end) else 0 end) permisos, "
                //+ " 1 permisos, "
                + " unidad.idcen idUni, unidad.descen nomUni, area.idcen idArea, area.descen nomArea "
                + " from registro.odi.proyectos, registro.odi.planes, registro.dbo.empnomina ger, registro.dbo.empnomina res, "
                + " apolo.uge.centros unidad, apolo.uge.centros area "
                + " where unidad.idcen=unidirpr and area.idcen=areapr and ger.cod_emp COLLATE SQL_Latin1_General_CP1_CI_AS=gerpr and res.cod_emp COLLATE SQL_Latin1_General_CP1_CI_AS=resppr and  planpr = idpl and idpr = " + idproy);
        permiso = temp.get("permisos").toString();
        return temp;
    }

    public HashMap[] getlisFases(String idpr) throws Exception {
        return getRegistros("select idfa, nomfase, numfase, estfas, descfa, ccosfa, anfa, "
                + " mifa, difa, mffa, dffa, ting, tgaspe + otrgas gastos, invest, idEstado from registro.odi.fases "
                + " where proyfa = " + idpr + " order by numfase ");
    }

    public HashMap getFase(String idf) throws Exception {
        setIdFase(idf);
        setTipo(FASE);
        /*HashMap temp = getRegistro("select nompr, idfa, nomfase, numfase, estfas, descfa, isnull(descen + ' ' + cdcen,'No Disponible ') centroCosto, anfa, isnull(idcen, 0) idcen, "
        + " mifa, difa, mffa, dffa, ting, tgaspe, otrgas, invest, conpa, "
        //+ " (case when (resppr='" + idEmp + "' or gerpr='" + idEmp + "') then (case when (estfas='Inscrito' or estfas='En Revisión Responsable' or estfas='Proyectado') then 1 else 2 end) else 0 end) permisos, idEstado "
        + " (case when (('" + idEmp + "' in (resppr, gerpr) or  '" + idEmp + "' in (select respon from registro.odi.entregables where idpad=" + idFase + "))) then ((case when (idEstado<2) then 1 else 2 end)) when (" + idEmp + " = '" + SUPER_USUARIO + "') then 1 else 0 end) permisos, idEstado "
        //+ " 1 permisos, idEstado "
        + " from registro.odi.fases "
        + " inner join  registro.odi.proyectos on proyfa = idpr "
        + " left outer join presupuesto_2010.presup.centros on idcen=ccosfa"
        + " where idfa = " + idFase);*/
        HashMap temp = getRegistro("select nompr, idfa, nomfase, numfase, estfas, substring(descfa, 1, 1500) descfa, isnull(descen + ' ' + cdcen,'No Disponible ') centroCosto, anfa, isnull(idcen, 0) idcen,"
                + " mifa, difa, mffa, dffa, ting, tgaspe, otrgas, invest, conpa, isnull(sum(costo*thor),0) costInt,"
                + " (case when (('" + idEmp + "' in (resppr, gerpr) or  '" + idEmp + "' in (select respon from registro.odi.entregables where idpad=  " + idFase + " ))) then ((case when (idEstado<2) then 1 else 2 end)) when (  '" + idEmp + "'   = '" + SUPER_USUARIO + "') then 1 else 0 end) permisos, idEstado"
                + " from registro.odi.fases"
                + " inner join  registro.odi.proyectos on proyfa = idpr"
                + " left outer join apolo.uge.centros on idcen=ccosfa"
                + " left outer join registro.odi.dedicacion d on d.ident=0 and fasd=idfa"
                + " left outer join registro.odi.costonomina_dist on rec=cedula"
                + " where idfa =  " + idFase
                + " group by nompr, idfa, nomfase, numfase, estfas, substring(descfa, 1, 1500), descen, cdcen, anfa, idcen,"
                + " mifa, difa, mffa, dffa, ting, tgaspe, otrgas, invest, conpa, resppr, gerpr, idEstado");
        idEstFase = Integer.parseInt(temp.get("idEstado").toString());
        permiso = temp.get("permisos").toString();
        return temp;
    }

    public HashMap[] getLisDedicacion(String idEnt) throws Exception {
        return getRegistros("select iddfa, fasd, nombres, nom_cco, thor, nsem, convert(char(10), fided, 103) Inicio, convert(char(10), ffded, 103) Fin, rec "
                + " from registro.odi.dedicacion, registro.dbo.empnomina, apolo.dbo.gen_ccosto cc "
                + " where cod_cl1 COLLATE SQL_Latin1_General_CP1_CI_AS = cc.cod_cco and rec=cod_emp COLLATE SQL_Latin1_General_CP1_CI_AS and fasd = " + idFase + "  and ident=" + idEnt + " order by fided ASC, nombres ");
    }

    public HashMap[] getLisEntregas() throws Exception {
        return getRegistros("select ident, noment from registro.odi.entregables where tpent = 'F' and idpad = " + idFase + " order by fient ASC ");
    }

    public HashMap getEntregable(String ide) throws Exception {
        idEntre = ide;
        /*return getRegistro("select ident, noment, estent, convert(char(10), fient, 103) Inicio, convert(char(10), ffent, 103) Fin, descent, nombres, cod_emp, e.ting, e.tgaspe, e.otrgas, e.invest,"
        + " (case when '" + idEmp + "' in (resppr, gerpr, respon) then (case when (idEstado<2) then 1 else 2 end)  when '" + idEmp + "'= '" + SUPER_USUARIO + "' then 1 else 0 end) permisos, "
        //+ " 1 permisos, "
        + " isnull(descen + ' ' + cdcen,'No Asigando ') centroCosto, isnull(idcen, 0) idcen "
        + " from registro.odi.entregables e "
        + " inner join registro.odi.empnomina on cod_emp=respon "
        + " inner join registro.odi.fases on idfa=idpad "
        + " inner join registro.odi.proyectos on  idpr=proyfa "
        + " left outer join presupuesto_2010.presup.centros on idcen=e.ccosent "
        + " where ident = " + ide);*/
        return getRegistro("select e.ident, noment, estent, convert(char(10), fient, 103) Inicio, convert(char(10), ffent, 103) Fin, substring(descent, 1, 1500) descent, nombres, cod_emp COLLATE SQL_Latin1_General_CP1_CI_AS cod_emp, e.ting, e.tgaspe, e.otrgas, e.invest, "
                + "(case when '" + idEmp + "' in (resppr, gerpr, respon) then (case when (idEstado<2) then 1 else 2 end)  when '" + idEmp + "'= '" + SUPER_USUARIO + "' then 1 else 0 end) permisos, "
                + "isnull(descen + ' ' + cdcen,'No Asigando ') centroCosto, isnull(idcen, 0) idcen, isnull(sum(costo*thor),0) costInt "
                + "from registro.odi.entregables e "
                + "inner join registro.dbo.empnomina on cod_emp COLLATE SQL_Latin1_General_CP1_CI_AS = respon "
                + "inner join registro.odi.fases on idfa=idpad "
                + "inner join registro.odi.proyectos on  idpr=proyfa "
                + "left outer join apolo.uge.centros on idcen=e.ccosent "
                + "left outer join registro.odi.dedicacion d on e.ident=d.ident and fasd=idfa "
                + "left outer join registro.odi.costonomina_dist on rec=cedula "
                + "where e.ident = " + ide
                + " group by e.ident, noment, estent, fient, ffent, substring(descent, 1, 1500), nombres, cod_emp, e.ting, e.tgaspe, e.otrgas, e.invest, "
                + "resppr, gerpr, respon, idEstado, descen, cdcen, idcen ");
    }

    public HashMap getSeguimiento(String idseg, String tipo) throws Exception {
        HashMap temp;
        if (tipo.equals("F")) {
            /*temp = getRegistro("select idsgpr, aseg, mseg, convert(char(10), fecsg, 103) fecha, etapasg, resseg, avance, "
            + " estado, semsg, ingrrp, gastpe, s.otrgas, inveje, msegf, convert(char(10), fclim, 103) fecLim, mov, acciones, soporte, obsv_dir,"
            + " (case when blq='N' then (case when '" + idEmp + "' in (gerpr, resppr) then 1 else 0 end) else 0 end) permisosGer, "
            + " (case when blq='N' then (case when '" + idEmp + "' in (resppr) then 1 else 0 end) else 0 end) permisosDir"
            //+ " 1 permisosGer, "
            //+ " 1 permisosDir "
            + " from registro.odi.seguimiento s, registro.odi.fases f, registro.odi.proyectos p "
            + " where idpr=proyfa and f.idfa=s.ident and idsgpr = " + idseg);*/
            temp = getRegistro("select idsgpr, aseg, mseg, convert(char(10), fecsg, 103) fecha, etapasg, substring(resseg, 1, 1500) resseg, avance,"
                    + " estado, semsg, ingrrp, gastpe, s.otrgas, inveje, msegf, convert(char(10), fclim, 103) fecLim, mov, acciones, soporte, obsv_dir, isnull(sum(costo*horas),0) costInt,"
                    + " (case when blq='N' then (case when '" + idEmp + "' in (gerpr, resppr, '" + SUPER_USUARIO + "') then 1 else 0 end) else 0 end) permisosGer,"
                    + " (case when blq='N' then (case when '" + idEmp + "' in (gerpr, resppr, '" + SUPER_USUARIO + "') then 1 else 0 end) else 0 end) permisosDir"
                    + " from registro.odi.proyectos p"
                    + " inner join registro.odi.fases f on idpr=proyfa"
                    + " inner join registro.odi.seguimiento s on f.idfa=s.ident"
                    + " left outer join  odi.dedisegui on  ids=s.idsgpr"
                    + " left outer join registro.odi.costonomina_dist on rec=cedula"
                    + " where idsgpr =   " + idseg
                    + " group by idsgpr, aseg, mseg, fecsg, etapasg, substring(resseg, 1, 1500), avance, estado, semsg, ingrrp, gastpe, s.otrgas, inveje, msegf,"
                    + " fclim, mov, acciones, soporte, obsv_dir, gerpr, resppr, blq");
            idSeguiF = idseg;
        } else {
            /*temp = getRegistro("select idsgpr, aseg, mseg, convert(char(10), fecsg, 103) fecha, etapasg, resseg, avance, "
            + "estado, semsg, ingrrp, gastpe, s.otrgas, inveje, msegf, convert(char(10), fclim, 103) fecLim, mov, acciones, soporte, obsv_dir,"
            + " (case when blq='N' then (case when '" + idEmp + "' in (gerpr, respon, resppr) then 1 else 0 end) else 0 end) permisosGer, "
            + " (case when blq='N' then (case when '" + idEmp + "' in (resppr) then 1 else 0 end) else 0 end) permisosDir "
            //+ " 1 permisosGer, "
            //+ " 1 permisosDir "
            + " from registro.odi.seguimiento s,registro.odi.entregables e,registro.odi.fases,registro.odi.proyectos "
            + " where e.ident=s.ident and idpr=proyfa and idfa=idpad and idsgpr = " + idseg);*/
            temp = getRegistro("select idsgpr, aseg, mseg, convert(char(10), fecsg, 103) fecha, etapasg, substring(resseg,1,1500) resseg, avance, "
                    + " estado, semsg, ingrrp, gastpe, s.otrgas, inveje, msegf, convert(char(10), fclim, 103) fecLim, mov, acciones, soporte, obsv_dir, isnull(sum(costo*horas),0) costInt,"
                    + " (case when blq='N' then (case when '" + idEmp + "' in (gerpr, respon, resppr, '" + SUPER_USUARIO + "') then 1 else 0 end) else 0 end) permisosGer, "
                    + " (case when blq='N' then (case when '" + idEmp + "' in (gerpr, resppr, '" + SUPER_USUARIO + "') then 1 else 0 end) else 0 end) permisosDir "
                    + " from registro.odi.proyectos"
                    + " inner join registro.odi.fases f on idpr=proyfa"
                    + " inner join registro.odi.entregables e on  idfa=idpad"
                    + " inner join registro.odi.seguimiento s on e.ident=s.ident"
                    + " left outer join  odi.dedisegui on  ids=s.idsgpr"
                    + " left join odi.costonomina_dist on rec=cedula	"
                    + " where  idsgpr = " + idseg
                    + " group by idsgpr, aseg, mseg, fecsg, etapasg, substring(resseg, 1, 1500), avance, "
                    + " estado, semsg, ingrrp, gastpe, s.otrgas, inveje, msegf, fclim, mov, acciones, soporte, obsv_dir,"
                    + " gerpr, respon, resppr, blq");
            idSeguiE = idseg;
        }
        idSegui = idseg;
        permisoSeguiDir = temp.get("permisosDir").toString();
        permisoSeguiGer = temp.get("permisosGer").toString();
        return temp;
    }

    public HashMap[] getLisSeguimiento(String idpap, String tipo) throws Exception {
        return getRegistros("select idsgpr, convert(varchar(10),aseg)+'('+convert(varchar(10),mseg)+'-'+convert(varchar(10),msegf)+')' corte, convert(char(10), fecsg, 103) fecha, etapasg, estado, semsg, avance "
                + " from registro.odi.seguimiento "
                + " where tpseg = '" + tipo + "' and ident = " + idpap
                + " order by aseg, mseg ");
    }

    public HashMap[] getLisDedicacionSeguimiento() throws Exception {
        return getRegistros("select idd, ids, nombres,  horas from registro.odi.dediSegui s, registro.dbo.empnomina e where rec=cod_emp COLLATE SQL_Latin1_General_CP1_CI_AS and ids=" + idSegui + " order by nombres");
    }

    public HashMap[] getResumenSegui() throws Exception {
        return getRegistros("select nompl, nompr,  anfa nomfase, idfa id "
                + "from registro.odi.planes ,registro.odi.proyectos, registro.odi.fases, registro.odi.seguimiento "
                + "where tpseg='F' and blq='N' and ident=idfa and idpl=planpr and idpr=proyfa and ('" + idEmp + "' in (resppr, gerpr) or '" + idEmp + "' in (select respon from registro.odi.entregables e where idpad=idfa))");
    }

    public HashMap[] getProyToApro() throws Exception {
        return getRegistros("select idpr id, estpr estado, nompr nombre, 'Proyecto' tipo, 'Proyectos?idPlan='+convert(varchar(10),planpr)+'&idProye='+convert(varchar(10),idpr) url "
                + " from registro.odi.proyectos pro, registro.odi.permisoProyec per "
                + " where per.cc_dir=pro.unidirpr and estpr='Inscrito' and tipo='Proyecto' and cod_emp=" + idEmp
                + " union "
                + " select idfa id,estfas estado, nomfase nombre, 'Fase' tipo, 'MenuFase?idProye='+convert(varchar(10),proyfa)+'&idFase='+convert(varchar(10),idfa)+'&idUniDir='+(convert(varchar(10),cc_dir)) url "
                + " from registro.odi.fases fas, (select tipo, valor, cc_dir, cod_emp from registro.odi.permisoProyec where cod_emp='" + idEmp + "' union select 'Fase' tipo, 1 valor, areapr cc_dir, gerpr cod_emp from registro.odi.fases f, registro.odi.proyectos p where proyfa=idpr and gerpr=" + idEmp + " group by areapr, gerpr) per, registro.odi.proyectos pro "
                + " where idpr=proyfa and (per.cc_dir=pro.unidirpr or per.cc_dir=pro.areapr) and idEstado=valor and tipo='Fase' and cod_emp=" + idEmp);
    }

    public int salProyecto(String nombre, String estado, String fechaInicio, String fechaFin, String objetivo, String justificacion, String responsable, String gerente, String tipo, String unidad, String area, String duracion) throws Exception {
        if (permiso.equals("1")) {
            if (!estado.equals("Inscrito")) {
                actualizar("insert into registro.odi.regisModif (cod_emp, id, tipo, fecha, descrip, gen_por) "
                        + "(select " + idEmp + ", " + idProyecto + ", '" + PROYECTO + "', getDate(), "
                        + " 'Estado: ' + estpr + ' - Unidad: ' + convert(varchar(10),unidirpr) + ' - Area: ' + convert(varchar(10),areapr) + ' - Responsable: ' + resppr + ' - Gerente: ' + gerpr + ' - Inicio: ' + convert(varchar(10),fipr,103) + ' - Fin: ' + convert(varchar(10),fipr,103), 'A' from registro.odi.proyectos where idpr=" + idProyecto + ")");
            }
            return actualizar("update registro.odi.proyectos set estpr='" + estado + "',nompr='" + nombre + "',tppr='" + tipo
                    + "',fipr='" + fechaInicio + "',ffpr='" + fechaFin + "',obgenpr='" + objetivo
                    + "',justpr='" + justificacion + "',resppr='" + responsable + "',gerpr='" + gerente + "', "
                    + " unidirpr='" + unidad + "',areapr='" + area + "', durpr='" + duracion + "' where idpr=" + idProyecto);
        }
        throw new ConsultaException("Permisos Insuficientes");
    }

    public int salFase(String nombre, String numero, String descripcion, String ano, String mesInicio, String diaInicio, String mesFin, String diaFin, String gastoPerson, String gastoOtros, String inversion, String ingreso, String estado, String caso, String cCosto) throws Exception {
        if (permiso.equals("1") || (caso.equals("1"))) {
            if (caso.equals("1")) {
                actualizar("insert into registro.odi.regisModif (cod_emp, id, tipo, fecha, descrip, gen_por) "
                        + "(select " + idEmp + ", " + idFase + ", '" + FASE + "', getDate(), "
                        + " 'Estado: ' + estfas + ' - Centro Costo: ' + convert(varchar(10),ccosfa) + ' - Gasto Personal: ' + convert(varchar(15),tgaspe) + ' - Otros Gastos: ' + convert(varchar(15),otrgas) + ' - Ingresos: ' + convert(varchar(15),ting) + ' - Inversion: ' + convert(varchar(15),invest), 'A' from registro.odi.fases where idfa=" + idFase + ")");
            }
            return actualizar("update registro.odi.fases set nomfase='" + nombre + "', numfase='" + numero + "', anfa='" + ano
                    + "', mifa='" + mesInicio + "', difa='" + diaInicio + "', mffa='" + mesFin + "', dffa='" + diaFin
                    + "', descfa='" + descripcion + "', tgaspe=" + gastoPerson + ", otrgas=" + gastoOtros
                    + ", invest=" + inversion + ", ting=" + ingreso + ",estfas='" + estado + "', ccosfa='" + cCosto + "' "
                    + " where idfa=" + idFase);
        }
        throw new ConsultaException("Permisos Insuficientes");
    }

    public int salDedicacion(String id, String horas, String semanas, String fechaInicio, String fechaFin) throws Exception {
        if (permiso.equals("1")) {
            return actualizar("update registro.odi.dedicacion set thor='" + horas
                    + "', nsem='" + semanas + "', fided='" + fechaInicio + "', ffded='" + fechaFin + "' "
                    + "where fasd=" + idFase + " and iddfa=" + id);
        }
        throw new ConsultaException("Permisos Insuficientes");
    }

    public int salEntregable(String nombre, String fechaInicio, String fechaFin, String descripcion, String estado, String responsable, String centroCosto, String ingresos, String gastosPer, String otros, String inversion) throws Exception {
        if (permiso.equals("1")) {
            return actualizar("update registro.odi.entregables set noment='" + nombre + "', descent = '" + descripcion + "',  fient = '" + fechaInicio + "', "
                    + "ffent = '" + fechaFin + "', estent = '" + estado + "', respon='" + responsable + "', "
                    + "ting=" + ingresos + ", tgaspe=" + gastosPer + ", otrgas=" + otros + ", invest=" + inversion + ", ccosent='" + centroCosto + "' "
                    + "where ident =" + idEntre);
        }
        throw new ConsultaException("Permisos Insuficientes");
    }

    public int salSeguimiento(String etapa, String res, String estado, String sem, String ing, String gastp, String otrgas, String inv, String accionTomar, String soporte, String tipo, String avance, String obsv) throws Exception {
        String idTempSegui = idSeguiE;
        if (tipo.equals("F")) {
            idTempSegui = idSeguiF;
        }
        if (permisoSeguiGer.equals("1")) {
            return actualizar("update registro.odi.seguimiento set fecsg = getDate(),  etapasg = '" + etapa + "', "
                    + "resseg = '" + res + "', estado = '" + estado + "', semsg = '" + sem + "', "
                    + "ingrrp = " + ing + ", gastpe = " + gastp + ", otrgas = " + otrgas + ", inveje = " + inv
                    + ", mov=(mov+1), acciones='" + accionTomar + "', soporte='" + soporte + "', avance='" + avance + "', obsv_dir= '" + obsv + "'"
                    + " where idsgpr = " + idTempSegui);
        }
        throw new ConsultaException("Permisos Insuficientes");
    }

    public int salObservacionesSegui(String obsvDir) throws Exception {
        if (permisoSeguiDir.equals("1")) {
            return actualizar("update registro.odi.seguimiento set obsv_dir='" + obsvDir + "' where idsgpr = " + idSeguiF);
        }
        throw new ConsultaException("Permisos Insuficientes");
    }

    public int salDediSeguim(String idDedSeg, String horas) throws Exception {
        if (permisoSeguiGer.equals("1")) {
            return actualizar("update registro.odi.dediSegui set horas=" + horas + " where ids=" + idSegui + " and idd=" + idDedSeg);
        }
        throw new ConsultaException("Permisos Insuficientes");
    }

    public int insertProyecto(String estado, String nombre, String tipo, String fechaInicio, String fechaFin, String duracion, String objetivo, String justificacion, String responsable, String gerente, String unidad, String area) throws Exception {
        actualizar("insert into  registro.odi.proyectos (idpr, planpr, nompr, tppr, fipr, ffpr, durpr, obgenpr, justpr, resppr, gerpr, estpr, unidirpr, areapr)"
                + "  (select SIG_SEC,'" + idPlan + "','" + nombre + "','" + tipo + "','" + fechaInicio + "','" + fechaFin + "','" + duracion + "','" + objetivo + "','" + justificacion + "','" + responsable + "','" + gerente + "','Inscrito', '" + unidad + "', '" + area + "' from registro.secuencias where NOMBRE='PROYECTO_PROYECTO')");
        actualizar("update registro.secuencias set sig_sec=(sig_sec+1) where nombre='PROYECTO_PROYECTO'");
        return Integer.parseInt(getRegistro("select (sig_sec-1) id from registro.secuencias where nombre='PROYECTO_PROYECTO'").get("id").toString());
    }

    public int insertFase(String nombre, String numero, String descripcion, String ano, String mesInicio, String diaInicio, String mesFin, String diaFin, String gastoPerson, String gastoOtros, String inversion, String ingreso, String estado, String control, String centroCostos) throws Exception {
        actualizar("insert into  registro.odi.fases (idfa, proyfa, nomfase, numfase, ccosfa, anfa, mifa, difa, mffa, dffa, descfa, ting, tgaspe, otrgas, invest, estfas, conpa, tingOri, tgaspeOri, otrgasOri, investOri, idEstado)"
                + "  (select SIG_SEC,'" + idProyecto + "','" + nombre + "','" + numero + "','" + centroCostos + "','" + ano + "','" + mesInicio + "','" + diaInicio + "','" + mesFin + "','" + diaFin + "','" + descripcion + "','" + ingreso + "','" + gastoPerson + "','" + gastoOtros + "','" + inversion + "','Inscrito','" + control + "','" + ingreso + "','" + gastoPerson + "','" + gastoOtros + "','" + inversion + "',1 from registro.secuencias where NOMBRE='PROYECTO_FASE')");
        actualizar("update registro.secuencias set sig_sec=(sig_sec+1) where nombre='PROYECTO_FASE'");
        return Integer.parseInt(getRegistro("select (sig_sec-1) id from registro.secuencias where nombre='PROYECTO_FASE'").get("id").toString());
    }

    public int insertDedicacion(String recurso, String unidad, String horas, String semanas, String fechaInicio, String fechaFin, String idEnt) throws Exception {
        if (permiso.equals("1")) {
            actualizar("insert into registro.odi.dedicacion (iddfa, fasd, rec, unidrec, nsem, fided, ffded, per, thor, tpact, desact, niv, hc, dedsem, hae, had, blq, ident)"
                    + " (select max(iddfa) + 1 id, " + idFase + ", '" + recurso + "', '" + unidad + "'," + semanas + ", '" + fechaInicio + "','" + fechaFin + "', '2012-1',"
                    + horas + ", '5', '_', '_', " + horas + ", 0, 0, 0, 'S', " + idEnt + " from registro.odi.dedicacion)");
            return Integer.parseInt(getRegistro("select max(iddfa) id  from registro.odi.dedicacion").get("id").toString());
        }
        throw new ConsultaException("Permisos Insuficientes");
    }

    public int insertDediSegui(String recurso) throws Exception {
        if (permisoSeguiGer.equals("1")) {
            actualizar("insert into registro.odi.dediSegui (idd, ids, rec, horas)"
                    + " (select max(idd) + 1 id, " + idSegui + ", '" + recurso + "', 0 from registro.odi.dediSegui)");
            return Integer.parseInt(getRegistro("select max(idd) id  from registro.odi.dediSegui").get("id").toString());
        }
        throw new ConsultaException("Permisos Insuficientes");
    }

    public int insertEntregable(String nombre, String responsable, String centroCosto, String fechaInicio, String fechaFin, String descripcion, String estado, String ingresos, String gastosPer, String otros, String inversion) throws Exception {
        if (permiso.equals("1")) {
            actualizar("insert into  registro.odi.entregables (ident, tpent, idpad, noment, descent, fient, ffent, estent, respon, ting, tgaspe, otrgas, invest, ccosent)"
                    + "  (select SIG_SEC,'F','" + idFase + "','" + nombre + "','" + descripcion + "','" + fechaInicio + "','" + fechaFin + "','" + estado + "','" + responsable + "', " + ingresos + ", " + gastosPer + ", " + otros + ", " + inversion + ", " + centroCosto + " from registro.secuencias where NOMBRE='PROYECTO_ENTREGABLE')");
            actualizar("update registro.secuencias set sig_sec=(sig_sec+1) where nombre='PROYECTO_ENTREGABLE'");
            return Integer.parseInt(getRegistro("select (sig_sec-1) id from registro.secuencias where nombre='PROYECTO_ENTREGABLE'").get("id").toString());
        }
        throw new ConsultaException("Permisos Insuficientes");
    }

    public int deleteDedicacion(String id) throws Exception {
        if (permiso.equals("1")) {
            return actualizar("delete registro.odi.dedicacion where fasd=" + idFase + " and iddfa=" + id);
        }
        throw new ConsultaException("Permisos Insuficientes");
    }

    public int deleteDediSegui(String id) throws Exception {
        if (permisoSeguiGer.equals("1")) {
            return actualizar("delete registro.odi.dediSegui where ids=" + idSegui + " and idd=" + id);
        }
        throw new ConsultaException("Permisos Insuficientes");
    }

    private void setEstadoProyecto(String estado) throws Exception {
        actualizar("update registro.odi.proyectos set estpr='" + estado + "' where idpr=" + idProyecto);
    }

    public EJBHome getEJBHome() throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public Object getPrimaryKey() throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public void remove() throws RemoteException, RemoveException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public Handle getHandle() throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public boolean isIdentical(EJBObject obj) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}

enum EstadoFase {

    REVISION(0), AVALADO(1), POSPUESTO(2), CANCELADO(3), TERMINADO(4);
    private int valorTexto;

    EstadoFase(int valor) {
        this.valorTexto = valor;
    }

    public String getTexto() {
        switch (valorTexto) {
            case 0:
                return "En Revisión ";
            case 1:
                return "Avalado ";
            case 2:
                return "Pospuesto ";
            case 3:
                return "Cancelado ";
            case 4:
                return "Terminado ";
        }
        return null;
    }
}

enum NivelFase {

    USUARIO(0), RESPONSABLE(1), DIRECTOR(2), COMITE(3), COMISION(4), CONSEJO(5);
    private int valorNivel;

    NivelFase(int valor) {
        this.valorNivel = valor;
    }

    public String getTexto() {
        switch (valorNivel) {
            case 1:
                return "Gerente";
            case 2:
                return "Director de la Unidad de Dirección";
            case 3:
                return "Comité de Rectoría";
            case 4:
                return "Comisión Administrativa del Consejo Directivo";
            case 5:
                return "Consejo Directivo";
        }
        return null;
    }
}
