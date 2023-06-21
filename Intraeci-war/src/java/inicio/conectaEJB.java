/*
 * conectaEJB.java
 *
 * Created on 27 de octubre de 2006, 08:39 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package inicio;

import BDintraeci.AspiranteRemote;
import BDintraeci.AspiranteRemoteHome;
import BDintraeci.BDadministrativoRemote;
import BDintraeci.BDadministrativoRemoteHome;
import BDintraeci.BDprofesorRemote;
import BDintraeci.BDprofesorRemoteHome;
import BDintraeci.BDproyectoRemote;
import BDintraeci.BDproyectoRemoteHome;
import BDintraeci.ConvocatoriaRemote;
import BDintraeci.ConvocatoriaRemoteHome;
import BDintraeci.EmpleadoRemote;
import BDintraeci.EmpleadoRemoteHome;
import BDintraeci.UtilesRemote;
import BDintraeci.UtilesRemoteHome;
import EnlaceNovasoft.EnlaceRemote;
import EnlaceNovasoft.EnlaceRemoteHome;
import EnlaceNovasoft.NobasoftRemote;
import EnlaceNovasoft.NobasoftRemoteHome;
import java.rmi.RemoteException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import login.InicioProfRemoteBusiness;
import login.InicioProfRemoteHome;
import login.LoginRemote;
import login.LoginRemoteHome;

/**
 *
 * @author alexgz
 */
public class conectaEJB {

    boolean conProf;
    boolean conLog;

    /** Creates a new instance of conectaEJB */
    public conectaEJB() {
        conProf = false;
        conLog = false;
    }

    /*public InicioProfRemoteBusiness lookupInicioProfBean(String usuario, String clave) {
    try {
    Context c = new InitialContext();
    Object remote = c.lookup("java:comp/env/ejb/InicioProfBean");
    InicioProfRemoteHome rv = (InicioProfRemoteHome) PortableRemoteObject.narrow(remote, InicioProfRemoteHome.class);
    this.conProf = true;
    return rv.create(usuario, clave);
    }
    catch(NamingException ne) {
    this.conProf = false;
    Logger.getLogger(getClass().getName()).log(Level.SEVERE,"exception caught" ,ne);
    throw new RuntimeException(ne);
    }catch(CreateException ce) {
    this.conProf = false;
    Logger.getLogger(getClass().getName()).log(Level.SEVERE,"exception caught" ,ce);
    throw new RuntimeException(ce);
    }
    catch(RemoteException re) {
    this.conProf = false;
    Logger.getLogger(getClass().getName()).log(Level.SEVERE,"exception caught" ,re);
    throw new RuntimeException(re);
    }
    }*/
    public InicioProfRemoteBusiness lookupInicioProfBean(String usuario) {
        try {
            Context c = new InitialContext();
            Object remote = c.lookup("java:comp/env/ejb/InicioProfBean");
            InicioProfRemoteHome rv = (InicioProfRemoteHome) PortableRemoteObject.narrow(remote, InicioProfRemoteHome.class);
            this.conProf = true;
            return rv.create(usuario);
        } catch (NamingException ne) {
            this.conProf = false;
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            this.conProf = false;
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        } catch (RemoteException re) {
            this.conProf = false;
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", re);
            throw new RuntimeException(re);
        }
    }

    public LoginRemote lookupLoginBean() {
        try {
            Context c = new InitialContext();
            Object remote = c.lookup("java:comp/env/ejb/LoginBean");
            LoginRemoteHome rv = (LoginRemoteHome) PortableRemoteObject.narrow(remote, LoginRemoteHome.class);
            this.conLog = true;
            return rv.create();
        } catch (NamingException ne) {
            this.conLog = false;
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            this.conLog = false;
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        } catch (RemoteException re) {
            this.conLog = false;
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", re);
            throw new RuntimeException(re);
        }
    }

    public BDprofesorRemote lookupBDprofesorBean() {
        try {
            Context c = new InitialContext();
            Object remote = c.lookup("java:comp/env/ejb/BDprofesorBean");
            BDprofesorRemoteHome rv = (BDprofesorRemoteHome) PortableRemoteObject.narrow(remote, BDprofesorRemoteHome.class);
            return rv.create();
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        } catch (RemoteException re) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", re);
            throw new RuntimeException(re);
        }
    }

    public BDadministrativoRemote lookupBDadministrativoBean() {
        try {
            Context c = new InitialContext();
            Object remote = c.lookup("java:comp/env/ejb/BDadministrativoBean");
            BDadministrativoRemoteHome rv = (BDadministrativoRemoteHome) PortableRemoteObject.narrow(remote, BDadministrativoRemoteHome.class);
            return rv.create();
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        } catch (RemoteException re) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", re);
            throw new RuntimeException(re);
        }
    }

    public BDproyectoRemote lookupBDproyectoRemote() {
        try {
            Context c = new InitialContext();
            Object remote = c.lookup("java:comp/env/BDproyecto");
            BDproyectoRemoteHome rv = (BDproyectoRemoteHome) PortableRemoteObject.narrow(remote, BDproyectoRemoteHome.class);
            return rv.create();
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        } catch (RemoteException re) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", re);
            throw new RuntimeException(re);
        }
    }

    public ConvocatoriaRemote lookupConvocatoriaRemote(String idEmp, String idC) {
        try {
            Context c = new InitialContext();
            Object remote = c.lookup("java:comp/env/Convocatoria");
            ConvocatoriaRemoteHome rv = (ConvocatoriaRemoteHome) PortableRemoteObject.narrow(remote, ConvocatoriaRemoteHome.class);
            return rv.create(idEmp, idC);
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        } catch (RemoteException re) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", re);
            throw new RuntimeException(re);
        }
    }

    public UtilesRemote lookupUtilesRemote() {
        try {
            Context c = new InitialContext();
            Object remote = c.lookup("java:comp/env/Utiles");
            UtilesRemoteHome rv = (UtilesRemoteHome) PortableRemoteObject.narrow(remote, UtilesRemoteHome.class);
            return rv.create();
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        } catch (RemoteException re) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", re);
            throw new RuntimeException(re);
        }
    }
    
    public EnlaceRemote lookupEnlaceRemote(String idEmp, String idC) {
        try {
            Context c = new InitialContext();
            Object remote = c.lookup("java:comp/env/Enlace");
            EnlaceRemoteHome rv = (EnlaceRemoteHome) PortableRemoteObject.narrow(remote, EnlaceRemoteHome.class);
            return rv.create(idEmp,idC);
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        } catch (RemoteException re) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", re);
            throw new RuntimeException(re);
        }
    }
    
    public NobasoftRemote lookupNobasoftRemote(String idEmp, String idC) {
        try {
            Context c = new InitialContext();
            Object remote = c.lookup("java:comp/env/Nobasoft");
            NobasoftRemoteHome rv = (NobasoftRemoteHome) PortableRemoteObject.narrow(remote, NobasoftRemoteHome.class);
            return rv.create(idEmp,idC); 
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        } catch (RemoteException re) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", re);
            throw new RuntimeException(re);
        }
    }

    public AspiranteRemote lookupAspiranteRemote() {
        try {
            Context c = new InitialContext();
            Object remote = c.lookup("java:comp/env/Aspirante");
            AspiranteRemoteHome rv = (AspiranteRemoteHome) PortableRemoteObject.narrow(remote, AspiranteRemoteHome.class);
            return rv.create();
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        } catch (RemoteException re) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", re);
            throw new RuntimeException(re);
        }
    }

    public EmpleadoRemote lookupEmpleadoRemote() {
        try {
            Context c = new InitialContext();
            Object remote = c.lookup("java:comp/env/Empleado");
            EmpleadoRemoteHome rv = (EmpleadoRemoteHome) PortableRemoteObject.narrow(remote, EmpleadoRemoteHome.class);
            return rv.create();
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        } catch (CreateException ce) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ce);
            throw new RuntimeException(ce);
        } catch (RemoteException re) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", re);
            throw new RuntimeException(re);
        }
    }
}
