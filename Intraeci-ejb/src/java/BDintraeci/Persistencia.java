/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BDintraeci;

import Dto.conciliacion;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import utiles.ConsultaException;

/**
 *
 * @author Juan Pablo Garcia
 */
public class Persistencia {

    private static final String dbName = "jdbc/registro";
    private static final String dbNameN = "jdbc/nobaPro";
    private Connection conexion;
    private Connection conexion2;
    protected int numRegs;
    private boolean conectado;
    private boolean conectado2;
    protected String dbUrl;
    private String driver = "net.sourceforge.jtds.jdbc.Driver";
    /**
     * En este atributo de clase se almacenan todos los mensajes cuando se
     * ejecutan acciones sobre la base de datos. Es importante tener en cuenta
     * que sólo el último mensaje está disponible, porque con cada nueva acción,
     * el mensaje es actualizado.
     */
    protected String mensaje;

    /**
     * Crea una instancia del objeto base de datos para ser usada por otros
     * objetos. Coloca el numero de registros en -1 y no hay conexion aun :
     * conectado = false
     */
    public Persistencia() {
        numRegs = -1;
        conectado = false;
    }

    public boolean isConexion() throws SQLException, Exception {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup(dbName);
            conexion = ds.getConnection();
            conectado = true;
        } catch (Exception e) {
            throw e;
        }
        return conectado;

    }

    public boolean isDesconectar() throws SQLException, Exception {
        try {
            conexion.close();
            conectado = false;
            return true;
        } catch (Exception e) {
            throw e;
        }
    }

    public HashMap[] getRegistros(String consulta) throws
            ClassNotFoundException, SQLException, Exception {
        ResultSet resCons_ = null;
        HashMap[] resultado_ = null;
        PreparedStatement sentenciaConsulta_ = null;
        try {
            this.conectado = isConexion();
            sentenciaConsulta_ = this.conexion.prepareStatement(consulta);
            resCons_ = sentenciaConsulta_.executeQuery();
            ArrayList listado = new ArrayList();
            ResultSetMetaData rsm = resCons_.getMetaData();
            //Almacenamos la tabla con las propiedades obtenidas y su resultado
            while (resCons_.next()) {
                HashMap ht = new HashMap();
                for (int i = 1; i <= rsm.getColumnCount(); i++) {
                    ht.put(rsm.getColumnName(i), resCons_.getString(i));
                }
                listado.add(ht);
            }
            //Preparamos el resultado
            resultado_ = new HashMap[listado.size()];
            resultado_ = (HashMap[]) listado.toArray(resultado_);
            return resultado_;
        } catch (ClassNotFoundException e) {
            throw new ConsultaException("No se encontro el Driver de la Conexion.");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ConsultaException("Error en la Consulta.");
        } catch (Exception e) {
            throw new ConsultaException("Error no Definido. " + e.getMessage());
        } finally {
            try {
                sentenciaConsulta_.close();
                if (conectado) {
                    isDesconectar();
                }
            } catch (Exception e) {
                throw new ConsultaException("Error cerrando la conexion a la Base de Datos.");
            }
        }
    }

    public HashMap getRegistro(String consulta) throws
            ConsultaException {
        ResultSet resCons_ = null;
        HashMap resultado_ = new HashMap();
        PreparedStatement sentenciaConsulta_ = null;
        try {
            this.conectado = isConexion();
            sentenciaConsulta_ = this.conexion.prepareStatement(consulta);
            resCons_ = sentenciaConsulta_.executeQuery();

            ResultSetMetaData rsm = resCons_.getMetaData();
            //Almacenamos la tabla con las propiedades obtenidas y su resultado
            while (resCons_.next()) {
                for (int i = 1; i <= rsm.getColumnCount(); i++) {
                    resultado_.put(rsm.getColumnName(i), resCons_.getString(i));
                }
            }
            return resultado_;
        } catch (ClassNotFoundException e) {
            throw new ConsultaException("No se encontro el Driver de la Conexion.");
        } catch (SQLException e) {
            throw new ConsultaException("Error en la consulta: " + e.getMessage());
        } catch (Exception e) {
            throw new ConsultaException("Error no Definido. " + e.getMessage());
        } finally {
            try {
                sentenciaConsulta_.close();
                if (conectado) {
                    isDesconectar();
                }
            } catch (Exception e) {
                throw new ConsultaException("Error cerrando la conexion a la Base de Datos.");
            }
        }
    }

    public int actualizar(String consulta) throws ConsultaException {
        try {
            this.conectado = isConexion();
            int resCons;
            PreparedStatement sentenciaConsulta;
            consulta = consulta.replaceAll("<mas>", "+");
            sentenciaConsulta = conexion.prepareStatement(consulta);
            resCons = sentenciaConsulta.executeUpdate();
            sentenciaConsulta.close();
            if (resCons == 0) {
                throw new ConsultaException("Cero filas afectadas.");
            }
            return resCons;
        } catch (ClassNotFoundException e) {
            throw new ConsultaException("No se encontro el Driver de la Conexion. " + e.getMessage());
        } catch (SQLException e) {
            throw new ConsultaException("Error en la Actualizacion. " + e.getMessage());
        } catch (Exception e) {
            throw new ConsultaException("Error no Definido. " + e.getMessage());
        } finally {
            try {
                if (conectado) {
                    isDesconectar();
                }
            } catch (Exception e) {
                throw new ConsultaException("Error cerrando la conexion a la Base de Datos.");
            }
        }
    }

    public String getMensaje() {
        return this.mensaje;
    }

    public List<conciliacion> getListEnlace2(String fechaIni, String fechaFin) throws Exception {

        String consulta = "select lc.common_id ,sc.national_id, lc.lc_pl_proveedor_id, lc.due_amt,lc.SCC_ROW_ADD_DTTM from SYSADM.PS_LC_PL_TRANSACCI lc \n" +
                " INNER JOIN SYSADM.ps_scc_pers_nid_vw sc on lc.common_id=sc.emplid\n" +
                " where lc.lc_pl_estado = '4' AND lc.lc_pl_proveedor_id ='PAYU' \n"
                + "AND TO_DATE(to_char(lc.SCC_ROW_ADD_DTTM,'YYYY-MM-DD'),'YYYY-MM-DD') \n"
                + ">= to_timestamp('" + fechaIni + "', 'YYYY-MM-DD')\n"
                + "AND TO_DATE(to_char(lc.SCC_ROW_ADD_DTTM,'YYYY-MM-DD'),'YYYY-MM-DD') \n"
                + "<= to_timestamp('" + fechaFin + "', 'YYYY-MM-DD') ";
        ResultSet resCons_ = null;
        PreparedStatement sentenciaConsulta_ = null;
        try {
            this.conectado = isConexion2();
            sentenciaConsulta_ = this.conexion.prepareStatement(consulta);
            resCons_ = sentenciaConsulta_.executeQuery();
            List<conciliacion> lista = new ArrayList<conciliacion>();
            while (resCons_.next()) {
                String idAlumno = resCons_.getString("common_id") == null ? "" : resCons_.getString("common_id").replaceAll(" ", "");
                String proveedor = resCons_.getString("lc_pl_proveedor_id") == null ? "" : resCons_.getString("lc_pl_proveedor_id").replaceAll(" ", "");
                String valor = resCons_.getString("due_amt") == null ? "" : resCons_.getString("due_amt").replaceAll(" ", "");
                String fecha = resCons_.getString("SCC_ROW_ADD_DTTM") == null ? "" : resCons_.getString("SCC_ROW_ADD_DTTM").substring(0, 10);
                String cedula = resCons_.getString("national_id") == null ? "" : resCons_.getString("national_id").replaceAll(" ", "");
                
                conciliacion c = new conciliacion(idAlumno, fecha, proveedor, valor,cedula);
                lista.add(c);
            }
            return lista;
        } catch (ClassNotFoundException e) {
            throw new ConsultaException("No se encontro el Driver de la Conexion.");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ConsultaException("Error en la Consulta.");
        } catch (Exception e) {
            throw new ConsultaException("Error no Definido. " + e.getMessage());
        } finally {

            sentenciaConsulta_.close();
            if (conectado) {
                isDesconectar2();
            }

        }
    }

    public boolean isConexion2() throws SQLException, Exception {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup("jdbc/enlace");
            conexion = ds.getConnection();
            conectado = true;
        } catch (Exception e) {
            throw e;
        }
        return conectado;

    }

    public boolean isDesconectar2() throws SQLException, Exception {
        try {
            conexion.close();
            conectado = false;
            return true;
        } catch (Exception e) {
            throw e;
        }
    }

    public List<conciliacion> getListNobasoft2(String fechaIni, String fechaFin) throws Exception {

        String consulta = "{call rs_tes_tes0401 (? , ?, ?)}";
        CallableStatement stmt = null;
        try {
            this.conectado2 = isConexion3();
            stmt = this.conexion2.prepareCall(consulta);

            //sentenciaConsulta_ = this.conexion.prepareStatement(consulta);
            //resCons_ = sentenciaConsulta_.executeQuery();
            stmt.setString(1, "PSE");
            stmt.setString(2, fechaIni.replaceAll("-", ""));
            stmt.setString(3, fechaFin.replaceAll("-", ""));
            ResultSet rs = stmt.executeQuery();
            List<conciliacion> lista = new ArrayList<conciliacion>();
            Map<String, conciliacion> datos = new HashMap<String, conciliacion>();
            while (rs.next()) {
                String tipo = rs.getString("sub_tip").replaceAll(" ", "");
//                String idAlumno2 = rs.getString("COD_ALUM")==null ? "" : rs.getString("COD_ALUM").replaceAll(" ","");
//                if(idAlumno2.equals("1000097451")){
//                    System.err.println(idAlumno2);
                if (tipo.equalsIgnoreCase("T040") || tipo.equalsIgnoreCase("T410")) {

                    String idAlumno = rs.getString("COD_ALUM") == null ? "" : rs.getString("COD_ALUM").replaceAll(" ", "");
                    String proveedor = rs.getString("banco") == null ? "" : rs.getString("banco").replaceAll(" ", "");
                    String valor = rs.getString("debito") == null ? "" : rs.getString("debito").replaceAll(" ", "");
                    if (valor != null && valor != "") {
                        String[] parts = valor.split("\\.");
                        valor = parts[0];
                    }
                    String fecha = rs.getString("fch_doc") == null ? "" : rs.getString("fch_doc").substring(0, 10);

                    conciliacion c = new conciliacion(idAlumno, fecha, proveedor, valor);
                    if (datos.containsKey(idAlumno + "|" + fecha)) {
                        conciliacion d = datos.get(idAlumno + "|" + fecha);
                        c.setValorPago(String.valueOf(Integer.valueOf(d.getValorPago()) + Integer.valueOf(c.getValorPago())));
                        datos.remove(idAlumno + "|" + fecha);
                        datos.put(idAlumno + "|" + fecha, c);
                    } else {
                        datos.put(idAlumno + "|" + fecha, c);
                    }
                }
//                }
            }
            for (Map.Entry<String, conciliacion> entry : datos.entrySet()) {
                lista.add(entry.getValue());
            }
            return lista;
        } catch (ClassNotFoundException e) {
            throw new ConsultaException("No se encontro el Driver de la Conexion.");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ConsultaException("Error en la Consulta.");
        } catch (Exception e) {
            throw new ConsultaException("Error no Definido. " + e.getMessage());
        } finally {

            stmt.close();
            if (conectado2) {
                isDesconectar3();
            }

        }
    }

    public boolean isConexion3() throws SQLException, Exception {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup(dbNameN);
            conexion2 = ds.getConnection();
            conectado2 = true;
        } catch (Exception e) {
            throw e;
        }
        return conectado;

    }

    public boolean isDesconectar3() throws SQLException, Exception {
        try {
            conexion2.close();
            conectado2 = false;
            return true;
        } catch (Exception e) {
            throw e;
        }
    }
}
