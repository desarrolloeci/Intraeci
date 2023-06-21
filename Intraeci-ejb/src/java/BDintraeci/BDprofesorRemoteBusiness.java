package BDintraeci;

import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.Vector;

/**
 * This is the business interface for BDprofesor enterprise bean.
 */
public interface BDprofesorRemoteBusiness {

    Vector getAsignaturasLabs(String peraca, String idProf) throws RemoteException;

    Vector getAsignaturas(String peraca, String idProf) throws RemoteException;

    Vector getAsignaturasSeg(String peraca, String idProf) throws RemoteException;

    Vector Alarmas(String idest, String tercio, String idasig, String periodo, int tipo) throws RemoteException;

    Vector AlarmasTutor(String idest) throws RemoteException;

    Vector NotasSeg(String idest) throws RemoteException;

    Vector getAsignaturasNotas(String peraca, String idProf, String idasig, String idgrupo) throws RemoteException;

    String getEstudiantes(String idgrupo, String peraca) throws RemoteException;

    String sigSecuencia(String entidad) throws RemoteException;

    Vector getSumaNotas(String idgrupo, String peraca) throws RemoteException;

    Vector getListaNotas(String idgrupo, String peraca) throws RemoteException;

    Vector getListasClase(String peraca,  String idasig, String numgrupo)throws RemoteException;
    
    Vector getCedulaEst(String id_est) throws RemoteException;
    
    Vector ListasEnvioCorreoPrePos(String idprof, String peraca) throws RemoteException;

    Vector getListaEnviarCorreo(String idgrupo, String peraca) throws RemoteException;
    
    int IngresaNotas(String campo, String idgrupo, String idest, String nota) throws RemoteException;
    
    int IngresaNotasPregradoPOS(String campo, String idgrupo, String idEst, String acum, String idasig, String nota) throws RemoteException;

    int IngresaNotasPosgradoPRE(String idgrupo, String idEst,  String nota) throws RemoteException;
    
    int LogEnviaCorreo(String idProf, String idasig, String idgrupo, String asunto)throws RemoteException;

    int IngresaNotasSeg(String campo, String idgrupo, String idest, String nota, String var, String falla) throws RemoteException;

    int IngresaAcum(String campo, String acum, String fec, String idgrupo, String idasig) throws RemoteException;

   int IngresaAcumMod(String campo, int total, String idgrupo, String idasig) throws RemoteException;

   int IngresaAcumModPRE(String campo, String campo1, String idgrupo, String idasig) throws RemoteException;

    Vector IngresaAcumModPrePos( String campo1, String idgrupo, String idasig, String idgrupoP, String periodo)throws RemoteException;

    int InsertarModiNotas(String sec, String idprof, String periodo, String idasig, String idgrupo, String numgrupo, String tercio, String idest, String nota, String notanva, String operacion, String razon) throws RemoteException;

    int InsertarlogauditPos(String idprof, String datosasigna, String razon, String idasig, String idest, String nota, String campo, String grupo)throws RemoteException;

    int Insertarlogaudit(String idprof, String datosasigna, String razon, String idgrupo, String idest, String nota, String campo) throws RemoteException;

    Vector getHorario(String idProf, String peraca) throws RemoteException;

    Vector getHorarioVideoBeam(String idProf, String peraca) throws RemoteException;
    
    int UsoVideoBeam(String uso, String idsal)throws RemoteException;
    
    Vector getHorarioPos(String idProf, String peraca) throws RemoteException;

    Vector getHorarioExamenes(String idProf, String peraca) throws RemoteException;

    Vector getAsignaturasPos(String idProf, String impre) throws RemoteException;
    
    Vector ImpresionPos(String idProf) throws RemoteException;

    Vector getSumaNotasPosgrado(String idgrupo, String peraca) throws RemoteException;

    Vector getListaNotasPos(String idgrupo, String peraca) throws RemoteException;

    int IngresaNotasPosgrado(String nota, String idgrupo, String idEst, String acum, String idasig) throws RemoteException;

    int InsertarObserva(String idest, String idasig, String obs, String periodo, String tercio, String idgrupo, String nrog, String alarma, String docu) throws RemoteException;

    Vector getListaspos(String idProf) throws RemoteException;

    Vector getentrevista(String documprof, String peraca) throws RemoteException;

    Vector getAsignaturasPos(String idEst) throws RemoteException;

    Vector gettutoreados(String peraca, String idProf) throws RemoteException;
    
    Vector InformeAconsejados( String peraca, String idProf) throws RemoteException;

    Vector Historia( String idEst) throws RemoteException;

    Vector getConsultaPeriodos(String carnet) throws RemoteException;

    Vector getdespNotas(String carnet, String peraca) throws RemoteException;

    Vector datosEst(String carnet) throws RemoteException;

    Vector getperaca(String plan, String cohorte) throws RemoteException;

    Vector despNotasAct(String carnet, String peraca) throws RemoteException;

    Vector despDetallePlan(String carnet) throws RemoteException;

    Vector despCreditos(String carnet, String idplan) throws RemoteException;

    Vector despDoblePlan(String carnet) throws RemoteException;

    Vector despidasig(String carnet, String ident, int par) throws RemoteException;

    Vector despasig(String carnet, String ident) throws RemoteException;

    Vector despInfAsi(String carnet, String ident) throws RemoteException;

    Vector despRegistro(String carnet, String ident) throws RemoteException;

    Vector despBiblia(String carnet, String ident) throws RemoteException;

    Vector despPrerreq(String carnet, String ident) throws RemoteException;

    Vector despCorreq(String carnet, String ident) throws RemoteException;

    Vector getRespEnc(String idprof, String peracad) throws RemoteException;

    Vector getObsEnc(String idprof, String per) throws RemoteException;

    Vector getIdprog(String id_plan) throws RemoteException;

    Vector Preinscripcion(String carnet) throws RemoteException;

    Vector Preinscripcionprim(String periodo) throws RemoteException;

    int preins(String prio, String carnet, String idasig) throws RemoteException;

    int preinsprim(String prio, String carnet, String idasig) throws RemoteException;

    int ActualizaVotos(String campo, String idEst)throws RemoteException;

    int InserVoto(String idcrp, String nro) throws RemoteException;

    Vector getNuevaAsig(String idplan, String idprog, String idest) throws RemoteException;

     Vector desptarjeton(String idProf) throws RemoteException;

     Vector Candidatos(String tipo) throws RemoteException;
     
    Vector ConsultaVoto( String cedula)throws RemoteException;
             
    String getMensajeDB() throws java.rmi.RemoteException;

    HashMap getUsuarioBPM(String idEmp) throws java.rmi.RemoteException;

    /**
     * Retorna Información del laboratorio, auxiliar o teorica de una asignatura
     * @param idasig
     * @return
     * @throws java.rmi.RemoteException
     */
    Vector AsigLabAux(String idasig) throws RemoteException;

    /**
     * Retorna nombre y grupo del profesor
     * @param idasigs
     * @param idest
     * @return
     * @throws java.rmi.RemoteException
     */
    Vector getNomProfs(String idasigs, String idest) throws RemoteException;
    
    /**
     * Retorna la confirmacion de la persistencia del token de autenticacion del sistema de Planes de transicion para usuarios profesores o decanos
     * @param token el token con el que el sistema de planes de transicion asegurara la validez del acceso del usuario
     * @param carnet el numero de identificación con el que esta registrado el usuario
     * @return True si el token se pudo persistir, False en caso contrario.
     * @throws java.rmi.RemoteException
     */
    Boolean PersisteToken(String token, String carnet) throws RemoteException;
    
    /**
     * True si el nombre de usuario del parametro corresponde a un decano
     * @param usuario
     * @return
     * @throws RemoteException 
     */
    Boolean esDecano(String usuario) throws RemoteException;
    public String getIdProf(String usuario) throws RemoteException;
}
