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
public interface EmpleadoRemote extends EJBObject {

    HashMap datosGenerales() throws Exception;

    String getId() throws Exception;

    void inicializar(String idDoc) throws RemoteException;

    HashMap[] getEstudios() throws Exception;

    HashMap[] getHislab() throws Exception;

    HashMap[] getIdiomas() throws Exception;

    HashMap detalleEstudio(String id) throws Exception;

    int setEstudio(String ident, String cdins, String tit, String dur, String fgra, String ntar,
             String nivel, String blq) throws Exception;

    HashMap detalleExperiencia(String id) throws Exception;

    int setExperiencia(String ident, String org, String fini, String ffin,
                    String cargo, String tpcar, String niv, String blq) throws Exception;

    int elimExperiencia(String id) throws Exception;

    int crearExperiencia(String org, String fini, String ffin,
                    String cargo, String tpcar, String niv, String blq) throws Exception;

    HashMap detalleIdioma(String id) throws Exception;

    HashMap[] getDocencia() throws Exception;

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

    int setEmpleado(String nlib, String clase, String dmil, String dir, String tel, String celular,
                   String grsan, String frh, String eciv, String ciud) throws Exception;

    int elimEstudio(String id) throws Exception;

    int crearEstudio(String titulo, String cdins, String dur, String fecha, String ntar,
                String nivel, String blq) throws Exception;

    void setNombre(String ap1, String ap2, String nom) throws RemoteException;

    HashMap getPerfil() throws Exception;

    int setPerfil(String perfil) throws Exception;
    
    HashMap getConvDet(String id_conv) throws Exception;

    HashMap[] lisciudades(String filtro) throws Exception;

    HashMap[] lisUniversidades(String filtro) throws Exception;

    HashMap[] lisconvoca() throws Exception ;

    HashMap[] lisconvocapart() throws Exception ;

    int inscConvoca(String[] convs, int ncon) throws Exception ;

    int desinscConvoca(String[] convs, int ncon) throws Exception ;

    HashMap detalleConv(String tipo, String id) throws Exception ;

    HashMap[] lisconvocadm() throws Exception ;

    HashMap[] lisconvoadm() throws Exception ;

    HashMap[] lisparticipan(String id) throws Exception ;

    HashMap getParticipa(String id) throws Exception;

    int setEstadoPart(String id, String mens, String obs, String raz, String estad) throws Exception;

    HashMap[] getCompromisos(String op) throws Exception;

    HashMap detalleCompromiso(String idc, String op) throws Exception;

    int setCompromiso(String idc, String idint, String num, String fini, String ffin, String tipo,
           String desact, String niv, String hc, String ha, String hd, String hp, String blq, String tp) throws Exception;

    int crearCompromiso(String idc, String idint, String num, String fini, String ffin, String tipo,
                String desact, String niv, String hc, String ha, String hd, String hp, String blq) throws Exception;

    int elimCompromiso(String id) throws Exception;

    HashMap[] listpcompromiso(String filtro) throws Exception;

    HashMap[] lisproyectos(String filtro) throws Exception;

    HashMap[] lispacargo(String opc) throws Exception;

    void setIdComp(String id) throws Exception; ;

    int confirmeHoja() throws Exception;

    int registrarEvaluacion(String per, String tp, String eval, String nres, String resp, String obs) throws Exception;

    HashMap getEvaluacion(String per, String tipo, String eval) throws Exception;

    HashMap[] getCompEval(String per, String tpc, String tpe) throws Exception;
    
    int IsAdmConvoca() throws Exception;
    
    int IsPermisosConvoca(String idconv) throws Exception;
    
    HashMap[] resumenAspirantes(String idconv) throws Exception;
     
    HashMap[] lisRubros(String vig, String cen) throws Exception ;
    
    HashMap[] lisCentros(String vig) throws Exception;

    HashMap[] getCDPs(String vig, String rub, String cen) throws Exception ;

    HashMap[] getResPres(String vig, String cen) throws Exception ;

        HashMap[] getTiposEmpleadoERP() throws Exception ;
    
    public HashMap[] getLis1DirEmpleadoERP() throws Exception;
    
    public HashMap[] getLis2DirEmpleadoERP() throws Exception;
    
    public HashMap[] getLis3DirEmpleadoERP() throws Exception;
    
    public HashMap[] getLisABCDirEmpleadoERP() throws Exception;
    
    public HashMap[] getLis4DirEmpleadoERP() throws Exception;
    
    public HashMap getDatosBasicosEmpleadoERP(String id_emp) throws Exception;
    
    public HashMap[] getAreasEmpleadoERP() throws Exception;
    
    public HashMap[] getRedesSocialesEmpleadoERP(String id_emp) throws Exception;
    
    public HashMap[] getAreasInteresERP(String cen_opt) throws Exception;
    
    public HashMap[] getInteresesEmpleadoERP(String id_emp) throws Exception;
    
    public HashMap getCargoERP(String id_cargo) throws Exception;
    
    public HashMap getDatosUsrERP(String id_cargo) throws Exception;
    
    public HashMap[] getPublicacionesERP(String id_emp) throws Exception;
    
    public HashMap[] getExperienciaEmpleadoERP(String id_emp) throws Exception;
    
    public HashMap[] getEstudiosProfERP(String id_emp) throws Exception;
    
    public HashMap[] getAreasExpERP() throws Exception;
    
    public HashMap[] getTiposEstudiosERP() throws Exception;
    
    public HashMap[] getInstitutosERP() throws Exception;
    
    public HashMap[] getTiemposExpERP() throws Exception;
    
    public HashMap[] getEstCivilERP() throws Exception;
    
    public HashMap getDatosAdicionalesERP(String id_emp) throws Exception;
    
    public HashMap[] getPaisesERP() throws Exception;
    
    public HashMap[] getCiudadesERP() throws Exception;
    
    public HashMap[] getDepartamentosERP() throws Exception;
    
    public Integer guardaDatosBasicosERP(String cod_emp, String dir_res, String tel_res, String ubicacion, String usr_num_ext, String pai_res, String dpt_res, String ciu_res, String est_civ, String e_mail_alt, String perfil, String celular, String inf_veridica, String ind_acepta, String ind_modifica) throws Exception;
    
    public Integer guardaDatosBasicosProfERP(String cod_emp, String ubicacion, String usr_num_ext, String perfil, String inf_veridica, String ind_acepta, String ind_modifica) throws Exception;
    
    public Integer guardaRedSocialERP(String cod_emp, String cod_redsoc, String usuario_red) throws Exception;
    
    public Integer guardaExperienciaLabERP(String cod_emp, String nom_empr, String nom_car, String area_exp, String des_fun, String tpo_exp, String mot_ret, String jefe_inm, String num_tel, String fec_ing, String fec_ter) throws Exception;
    
    public Integer guardaEstudiosProfERP(String cod_emp,String cod_estudio,String cod_ins, String ano_est,String fec_gra,String nro_tar) throws Exception;
    
    public Integer guardaInteresEmpERP(String cod_emp, String id_interes) throws Exception;
    
    public Integer guardaPublicacionEmpERP(String cod_emp, String descrip_publicacion) throws Exception;
    
    public HashMap[] getEstudiosERP(String cod_emp)throws Exception;
    
    public HashMap[] getIdiomasERP()throws Exception;
    
    public HashMap[] getCalifIdiomasERP()throws Exception;
    
    public HashMap[] getHabilIdiomasERP()throws Exception;
    
    public HashMap[] getIdiomasEmpERP(String cod_emp)throws Exception;
    
    public Integer guardaidiomaEmpERP(String cod_emp, String cod_idi, String cod_calif, String cod_habil) throws Exception;
    
    public HashMap[] getParentescosERP()throws Exception;
    
    public HashMap[] getGenerosERP()throws Exception;
    
    public HashMap[] getTiposDocERP()throws Exception;
    
    public HashMap[] getOcupacionesERP()throws Exception;
    
    public HashMap[] getFamiliaresEmpERP(String cod_emp)throws Exception;
    
    public boolean EliminarFamiliar(int num_ced)throws Exception;
    
    public boolean EliminarPublicacion(int cod_emp, String publicacion)throws Exception;
    
    public boolean EliminarExperiencia(int cod_emp, String nom_empr)throws Exception;
    
    public boolean EliminarEstudiosProf(int cod_emp,String nro_tar)throws Exception;
    
    public Integer guardaFamiliarEmpERP(String cod_emp, String ap1_fam, String ap2_fam, String nom_fam, String tip_fam, String tip_ide, String num_ced, String fec_nac, String sex_fam, String est_civ, String ocu_fam, String sal_bas, String ind_sub, String ind_pro, String ind_conv, String niv_est, String ind_comp) throws Exception;
    
    public HashMap[] getClasesEstudioERP()throws Exception;
    
    public Integer generarTokenInicioGestorCursos(String id_emp, String cadena_llave, String cadena_encriptada, String flag_sesion) throws Exception;
    
    public Integer guardaDonacionUnete(String cod_emp, String[] meses_seleccionados, String donacion_indefinida, String valor) throws Exception;
    
    public HashMap[] getRolesCovid19()throws Exception;
    
    public HashMap[] getTiposTransporteCOVID19()throws Exception;
    
    public HashMap getDatosBasicosMovilidadERP(String id_emp) throws Exception;
    
    public Integer guardarDatosFormularioMovilidadCovid19(String tip_id, String documento, String tipo_rol, String nombres, String apellidos, String genero, String edad, String cargo, String ciudad, String direccion, String barrio, String inf_veridica, String ind_acepta, String hor_ing, String hor_sal, String modo_transp, String trab_remoto, String[] dias_def) throws Exception;
    
    public HashMap getDatosGuardadosMovilidadERP(String id_emp) throws Exception;
}
