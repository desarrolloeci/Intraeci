package BDintraeci;

import java.rmi.RemoteException;
import java.util.Vector;

/**
 * This is the business interface for BDadministrativo enterprise bean.
 */
public interface BDadministrativoRemoteBusiness {

    String getSecuencia() throws RemoteException;

    Vector getCantReserva(String idprof) throws RemoteException;

    Vector Fecha() throws RemoteException;

    Vector getCantReservaPoli(String idprof) throws RemoteException;

    Vector getConSalon(String rcsal, String capac, String fecha, String hora, String ndia, int horafin, String peracad) throws RemoteException;

    Vector getConSalonExa(String rcsal, String capac, String fecha, String hora, String ndia, int horafin, String peracad) throws RemoteException;

    Vector getConSalonPoli(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector getConSalonUnico(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector BaloncestoC(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector Futbolsala(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector espejos(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector BaloncestoM(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector Baloncesto(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector minimoBal(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector Volley(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector VolleyO(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector minimoVol(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector Tenis(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector minimoTenis(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector tarifas(java.lang.String idsal) throws RemoteException;

    Vector getConSalonPoliEv(java.lang.String rcsal, java.lang.String fecha, java.lang.String hora, int horafin, String capac) throws RemoteException;

    Vector CapSalon(java.lang.String fecha, java.lang.String hora, int horafin) throws RemoteException;

    Vector ContSalon() throws RemoteException;

    int actualiza(String consulta) throws RemoteException;

    int actualizaApolo(String consulta) throws RemoteException;

    int sigSecuencia(String entidad) throws RemoteException;

    int Autoevaluacion(String id, String restas, String prog, String identif, String justif1, String justif2, String justif3, String justif4, String justif5, String justif6, String justif7, String justif8, String justif9, String justif10, String grjust) throws RemoteException;

    int AutoevaluacionNvo(java.lang.String id, java.lang.String restas, java.lang.String prog, java.lang.String ident, java.lang.String lispregunta, java.lang.String indice) throws RemoteException;
    
    int AutoevaluacionNvoTaller(java.lang.String ident, java.lang.String id, int idfactor, java.lang.String idpreg, java.lang.String restas, java.lang.String comentario, java.lang.String factortaller)throws RemoteException;

    int Encuestado(String id_encuestado, String id, String prog) throws RemoteException;
    
    int Asistencia(String id_encuestado, String id, String asistencia) throws RemoteException;
 
     int ActualizaEstadoOtroGrupo(String id_enc, String grupo, String id_encuestado) throws RemoteException;
     
    int EncuestadoNvo(String cedula, String id, String prog, String factor) throws RemoteException;
    
    int GruposAsiste(String id_grupo , String id_enc) throws RemoteException;
    
    int GruposNoAsiste(String id_grupo , String id_enc) throws RemoteException;
    
    Vector DatosEncuestado(String documento, String grupo) throws RemoteException;
    
    Vector ConsultaDatosEncuestado(String idenc) throws RemoteException;

    int Encuestado2(String cedula, String id) throws RemoteException;
    
    int GuardaEmpleado(java.lang.String doc, java.lang.String nombres, java.lang.String mail)  throws RemoteException;
    
    int GuardaEncuestado( java.lang.String doc, java.lang.String id_enc,java.lang.String prog, java.lang.String grupo) throws RemoteException;

    int InscribeEvento(java.lang.String idevento, java.lang.String doc, java.lang.String nombres, java.lang.String apellido1, java.lang.String apellido2, java.lang.String vinculo) throws RemoteException;

    Vector VerificaEventos(String id, String doc) throws RemoteException;
    
    int ActualizaAsisteOtroGrupo( String id_enc, String grupo, String id_encuestado, String programa)  throws RemoteException;

    Vector Eventoprof(String doc, String peracad) throws RemoteException;

    Vector InscritosEvento(String id) throws RemoteException;
    
    int ApruebaRepruebaCurso(java.lang.String idevento, java.lang.String documento,java.lang.String estado) throws RemoteException;
    
    Vector CuposEventos(String ident) throws RemoteException;
       
    Vector EventosInscritos(String peracad, String doc) throws RemoteException;

   Vector DatosEncuestas(String cedula) throws RemoteException;

    Vector ContestoEncuestaFac(String cedula,  String iden, String idfactor) throws RemoteException;
    
    Vector MáximoFactor(String cedula, String idenc) throws RemoteException;

    Vector ContestoFactor(String cedula, String iden) throws RemoteException;
    
    Vector ContestoFactorTaller(String cedula, String idenc)  throws RemoteException;
    
    Vector PreguntasQueFaltan(String id, int idfactor,String idenc)throws RemoteException;
    
    Vector ConsultaEmpleados() throws RemoteException;
    
    Vector Verificarestas(String cedula, String idenc, String prog) throws RemoteException;

    Vector PreguntasEnc(String idenc) throws RemoteException;

    Vector PreguntasEncFactor(String idenc, int idfactor) throws RemoteException;
    
    Vector DatosPregFaltanEncFactor(String idenc, int idfactor, String idpreg) throws RemoteException;
    
    Vector PreguntasFactorContesto(String id, int factor,String id_encuestado) throws RemoteException;

    Vector FactoresEnc(String idenc) throws RemoteException;
    
    Vector Validar(String id, String idpreg, String ident) throws RemoteException;

    Vector Factores(int idfactor) throws RemoteException;

    Vector getReserva(String idprof) throws RemoteException;

    Vector getIdSalon(String idasig) throws RemoteException;

    void eliminaReserva(String idres) throws RemoteException;

    void eliminaCurso(java.lang.String idevento, java.lang.String doc) throws RemoteException;

    Vector getConAudit(String fecha, String hora, String ndia, int horafin) throws RemoteException;

    Vector getConReserva(String desde, String hasta) throws RemoteException;

    Vector getConsAudit(String desde, String hasta) throws java.rmi.RemoteException;

    Vector getEstudiosFormales(String doc) throws RemoteException;

    Vector despEstudiosFormales(String idd) throws RemoteException;

    Vector getEstNoFormales(String doc) throws RemoteException;

    Vector getdespEstudioNoFormal(String idd) throws RemoteException;

    Vector getDistinciones(String doc) throws RemoteException;

    Vector getdespDistincion(String idd) throws RemoteException;

    Vector getExperiencia(String doc) throws RemoteException;

    Vector getdespExperiencia(String idd) throws RemoteException;

    Vector getEventos(String doc) throws RemoteException;
    
     Vector Lineas (String dpto) throws RemoteException;

     Vector EventosdptoLinea(String peracad, String dpto, String linea)throws RemoteException;
             
    Vector InscripEventos(String dpto, String peracad) throws RemoteException;

    Vector InscripEventosVice(String dpto, String peracad) throws RemoteException;

    Vector getdespEvento(String idd) throws RemoteException;

    Vector getSociedades(String doc) throws RemoteException;

    Vector getdespSociedad(String idd) throws RemoteException;

    Vector getIdiomas(String doc) throws RemoteException;

    Vector getdespIdioma(String idd) throws RemoteException;

    Vector getEscritos(String doc) throws RemoteException;

    Vector getdespEscrito(String idd) throws RemoteException;

    Vector departamentos(String peracad) throws RemoteException;

    Vector getInvestigaciones(String doc) throws RemoteException;

    Vector getdespInvestigacion(String idd) throws RemoteException;

    Vector TipoCodigo(String cat) throws RemoteException;

    String sigSecEmpleado(String entidad) throws RemoteException;

    Vector getConsultaIdiomas() throws RemoteException;

    Vector getLissociedades() throws RemoteException;

    Vector getNumorden(String idest, String peracad) throws RemoteException;

    Vector getValorden(String idest, String peracad) throws RemoteException;

    Vector getDocestudiante(String idest) throws RemoteException;

    Vector getSec() throws RemoteException;

    Vector Extensiones() throws RemoteException;

    Vector Validaext(String nombre, String ext) throws RemoteException;

    Vector getCredAsig(String idasig) throws RemoteException;

    Vector getEgresado(String idest, String docest) throws RemoteException;

    int InsertarEst(String idest, String nord, String valder, String valord, String id_prof) throws RemoteException;

    int GuardaExt(java.lang.String usuario, java.lang.String doc, java.lang.String nombres, java.lang.String centro, java.lang.String extension, java.lang.String telefono, java.lang.String bloque) throws RemoteException;

    int InsertAsig(int sec, String asig, String idest, String peraca, int cred) throws RemoteException;

    int Insertaestadis(String año, String mes, String doc) throws RemoteException;

    int comentario(java.lang.String idfact, java.lang.String idenc, java.lang.String comentario) throws RemoteException;

    Vector Centros() throws RemoteException;

    Vector CandidatosCopasst(String tipo) throws RemoteException;

    Vector ConsultaVotoCopasst(String cedula) throws RemoteException;
    
    int ActualizaVotosCopasst(String campo, String idEst)throws RemoteException;

    int InserVotoCopasst(String idcrp, String nro) throws RemoteException;
    
    Vector getSegEstEmpAdmitido(String doc_emp) throws RemoteException;
    
    Vector getConsultaCarne(String carne) throws RemoteException;
    
    Vector getPerRealCarne(String carne) throws RemoteException;
    
    Vector getPeriodos() throws RemoteException;
    
    Vector getAsigEstud(String carne, String perAcad) throws RemoteException;
    
    int setConsultaEst(String fecha, String profesor, String carne, String visita, String tipo, String asignatura, String tema, String observaciones, String perAcad) throws RemoteException;
    
    Vector getHistConsultasEst(String carne, String perAcad, int tipoEmp) throws RemoteException;
    
    Vector getHistConsultasEstCompl(String carne, String perAcad, int tipoEmp) throws RemoteException;
    
    Vector getHistConsultasProf(String codEmp, String perAcad) throws RemoteException;
    
    Vector getHistConsultasProfCompl(String codEmp, String perAcad) throws RemoteException;
    
    Vector getHistConsultasDec(int idDpto, String perAcad, int rolEmp) throws RemoteException;
    
    Vector getHistConsultasDecCompl(int idDpto, String perAcad, int rolEmp) throws RemoteException;
}
