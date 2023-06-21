/*
 * To change this template, choose Tools | Templates
 * Clase para la consulta de la tabla temporal Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS
 * para su visualización en el jsp hojavida_ActDatos alojada en Intraeci-WebModule/talhum/hojavida_ActDatos.jsp
 * Javier.Tambo
 * and open the template in the editor.
 */
package BDintraeci;
import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.List;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import utiles.ConsultaException;
/**
 *
 * @author javier.tambo
 */
public class EmpleadoInfoTemp    {
  public String usuario_red4,usuario_red5,usuario_red6,usuario_red7, usu_inserta, usr_num_ext, ubicacion, tpo_exp, tipo_est, tip_ide, tip_fam, tel_res,
  sex_fam, sal_bas, perfil="", pai_res, ocu_fam, num_tel, num_ced, nro_tar, nom_fam, nom_empr, nom_car, niv_est, 
  mot_ret, jefe_inm, inf_veridica,ind_sub, ind_pro, ind_modifica, ind_conv, ind_comp, ind_can, ind_acepta,
  id_interes, graduado, fec_ter,fec_registro, fec_nac, fec_ing, fec_gra, est_civ_fam, est_civ_emp, e_mail_alt,
  dpt_res, dir_res, descrip_publicacion, des_fun, cod_redsoc, cod_ins, cod_idi, cod_hab, cod_estudio, cod_emp="",              
  cod_calif, ciu_res, celular, area_exp, ap2_fam, ap1_fam, ano_est;
  public int est=0;
public HashMap[] interesesEmpERP=null;
  public Persistencia bDatos=new Persistencia();
   public void EmpleadoInfoTemp(int cod_emp){    

       try {
           
     
         HashMap datos= bDatos.getRegistro("select * from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS\n" +
"where cod_emp='"+cod_emp+"' and ind_modifica in(0,1)\n" +
"order by 1");
         
          HashMap datosRed4= bDatos.getRegistro("select usuario_red from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS\n" +
"where cod_emp='"+cod_emp+"' and cod_redsoc=4\n" +
"order by 1");
         
           HashMap datosRed5= bDatos.getRegistro("select usuario_red from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS\n" +
"where cod_emp='"+cod_emp+"' and cod_redsoc=5");
           
            HashMap datosRed6= bDatos.getRegistro("select usuario_red from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS\n" +
"where cod_emp='"+cod_emp+"' and cod_redsoc=6");
            
             HashMap datosRed7= bDatos.getRegistro("select usuario_red from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS\n" +
"where cod_emp='"+cod_emp+"' and cod_redsoc=7");
             
             try {
               interesesEmpERP=bDatos.getRegistros("select id_interes from Novasoft.dbo.USR_RHH_ACTUALIZA_DATOS\n" +
"where cod_emp='"+cod_emp+"' and id_interes is not null");
           } catch (Exception e) {
               System.out.print(e.getMessage()+"este es un error en la linea 53");
           }
         
       
    this.usuario_red4=(String)datosRed4.get("usuario_red");     
    this.usuario_red5=(String)datosRed5.get("usuario_red");    
    this.usuario_red6=(String)datosRed6.get("usuario_red");    
    this.usuario_red7=(String)datosRed7.get("usuario_red");    
this.usu_inserta=(String)datos.get("usu_inserta");     
this.usr_num_ext=(String)datos.get("usr_num_ext");     
this.ubicacion=(String)datos.get("ubicacion");       
this.tpo_exp=(String)datos.get("tpo_exp");         
this.tipo_est=(String)datos.get("tipo_est");        
this.tip_ide=(String)datos.get("tip_ide");         
this.tip_fam=(String)datos.get("tip_fam");         
this.tel_res=(String)datos.get("tel_res");         
this.sex_fam=(String)datos.get("sex_fam");         
this.sal_bas=(String)datos.get("sal_bas");         
this.perfil=(String)datos.get("perfil");          
this.pai_res=(String)datos.get("pai_res");         
this.ocu_fam=(String)datos.get("ocu_fam");         
this.num_tel=(String)datos.get("num_tel");         
this.num_ced=(String)datos.get("num_ced");         
this.nro_tar=(String)datos.get("nro_tar");         
this.nom_fam=(String)datos.get("nom_fam");         
this.nom_empr=(String)datos.get("nom_empr");        
this.nom_car=(String)datos.get("nom_car");         
this.niv_est=(String)datos.get("niv_est");         
this.mot_ret=(String)datos.get("mot_ret");         
this.jefe_inm=(String)datos.get("jefe_inm");        
this.inf_veridica=(String)datos.get("inf_veridica");    
this.ind_sub=(String)datos.get("ind_sub");         
this.ind_pro=(String)datos.get("ind_pro");         
this.ind_modifica=(String)datos.get("ind_modifica");    
this.ind_conv=(String)datos.get("ind_conv");        
this.ind_comp=(String)datos.get("ind_comp");        
this.ind_can=(String)datos.get("ind_can");         
this.ind_acepta=(String)datos.get("ind_acepta");      
this.id_interes=(String)datos.get("id_interes");      
this.graduado=(String)datos.get("graduado");        
this.fec_ter=(String)datos.get("fec_ter");         
this.fec_registro=(String)datos.get("fec_registro");    
this.fec_nac=(String)datos.get("fec_nac");         
this.fec_ing=(String)datos.get("fec_ing");         
this.fec_gra=(String)datos.get("fec_gra");         
this.est_civ_fam=(String)datos.get("est_civ_fam");     
this.est_civ_emp=(String)datos.get("est_civ_emp");     
this.e_mail_alt=(String)datos.get("e_mail_alt");      
this.dpt_res=(String)datos.get("dpt_res");         
this.dir_res=(String)datos.get("dir_res");         
this.descrip_publicacion=(String)datos.get("descrip_publicacion");
this.des_fun=(String)datos.get("des_fun");         
this.cod_redsoc=(String)datos.get("cod_redsoc");      
this.cod_ins=(String)datos.get("cod_ins");         
this.cod_idi=(String)datos.get("cod_idi");         
this.cod_hab=(String)datos.get("cod_hab");         
this.cod_estudio=(String)datos.get("cod_estudio");     
this.cod_emp=(String)datos.get("cod_emp");
this.cod_calif=(String)datos.get("cod_calif");       
this.ciu_res=(String)datos.get("ciu_res");         
this.celular=(String)datos.get("celular");         
this.area_exp=(String)datos.get("area_exp");        
this.ap2_fam=(String)datos.get("ap2_fam");         
this.ap1_fam=(String)datos.get("ap1_fam");         
this.ano_est=(String)datos.get("ano_est");         
if(this.cod_emp==null){
 est=1;
}
      } catch (Exception e) {
          est=1;
       }
 }
       
}


