/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package talhumano;

import BDintraeci.AspiranteRemote;
import BDintraeci.EmpleadoRemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jgarcia
 */
public class impHojaVida extends HttpServlet {
   
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int msg = 1;

        try {
            HttpSession sesion = request.getSession(false);
            
            if (sesion == null) throw new Exception("0");
            
            EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
            
            if (emp == null) throw new Exception("0");
            
            String idpar = (String) request.getParameter("idpart");
            String estad = (String) request.getParameter("estpart");
            String obsp = (String) request.getParameter("obsp");
            //String mensa = (String) request.getParameter("mensaje");
            //String raz = (String) request.getParameter("razon");

            int ret = emp.setEstadoPart(idpar, "_", obsp, "_", estad) ;
            if (ret > 0) {
                msg = 3;
            }

        } catch (Exception e) {
            Logger.getLogger(impHojaVida.class.getName()).log(Level.SEVERE, null, e);
            msg = Integer.parseInt((e.getMessage().length() > 1)?"1":e.getMessage());
        }
        
        
        String res = "<resultado>";
        
        if (msg == 3) {
            res += "<dato>1</dato>";
            res += "<valor>Se han guardado exitosamente los datos del aspirante.</valor>";
        } else {
            res += "<dato>0</dato>";
            if (msg == 0) {
                res += "<valor>El usuario no está autenticado o su sesión ha finalizado.</valor>";
            } else if (msg == 1) {
                res += "<valor>Ha ocurrido un error mientras se realizaba la operación. Por favor intente de nuevo más tarde.</valor>";
            }
        }

        res += "</resultado>";
        
        PrintWriter pw = response.getWriter();
        
        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(res);
        pw.flush();
        pw.close();
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String res = "";
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        HashMap item = null, perfil = null, estpar = null ;
        HashMap[] estuds = null, idiomas = null, exps = null, escritos = null, membresias = null, distinciones = null, proyectos = null;
        String idp = (String) request.getParameter("idp");
        String par = (String) request.getParameter("par");
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        AspiranteRemote asp = conEjb.lookupAspiranteRemote();
        asp.inicializar(idp);
        try {
            item = asp.detalleAspirante(idp, "-1");
            perfil = asp.getPerfil();
            estuds = asp.getEstudios();
            idiomas = asp.getIdiomas();
            exps = asp.getHislab();
            escritos = asp.getPublicaciones();
            membresias = asp.getMembresia();
            distinciones = asp.getDistinciones();
            proyectos = asp.getProduccion();
            estpar = emp.getParticipa(par);
        } catch (Exception ex) {
            Logger.getLogger(impHojaVida.class.getName()).log(Level.SEVERE, null, ex);
        }

        int i;
        res =   "<hojavida>";
        
        res +=  "<generales>" +
                    "<doc>" + escapeXML((String) item.get("docid")) + "</doc>" +
                    "<tdoc>" + escapeXML((String) item.get("tdoc")) + "</tdoc>" +
                    "<nombre>" + escapeXML((String) item.get("ap1")) + (!((String) item.get("ap2")).equals("")?" " + escapeXML((String) item.get("ap2")):"") + " " + escapeXML((String) item.get("nom")) +"</nombre>" +
                    "<fnac>" + escapeXML((String) item.get("fnac")) + "</fnac>" +
                    "<nciunac>" + escapeXML((String) item.get("nciunac")) + "</nciunac>" +
                    "<eciv>" + escapeXML((String) item.get("eciv")) + "</eciv>" +
                    "<libmil>" + escapeXML((String) item.get("lmil")) + "</libmil>" +
                    "<clamil>" + escapeXML((String) item.get("clase")) + "</clamil>" +
                    "<dismil>" + escapeXML((String) item.get("dmil")) + "</dismil>" +
                    "<dirres>" + escapeXML((String) item.get("dirres")) + "</dirres>" +
                    "<telres>" + escapeXML((String) item.get("telres")) + "</telres>" +
                    "<ciures>" + escapeXML((String) item.get("ciudad")) + "</ciures>" +
                    "<nomciu>" + escapeXML((String) item.get("nom_ciu")) + "</nomciu>" +
                    "<celular>" + escapeXML((String) item.get("cel")) + "</celular>" +
                    "<email>" + escapeXML((String) item.get("email")) + "</email>" +
                    "<genero>" + escapeXML((String) item.get("gen")) + "</genero>" +
                "</generales>";
        
        res +=  "<estudios>";
        for (i = 0; i < estuds.length; i++) {
            item = estuds[i];
            res +=  "<estudio>" +
                        "<nivel>" + escapeXML((String) item.get("des_est")) + "</nivel>" +
                        "<titulo>" + escapeXML((String) item.get("nom_est")) + "</titulo>" +
                        "<universidad>" + escapeXML((String) item.get("nom_ins")) + "</universidad>" +
                        "<fgrado>" + escapeXML((String) item.get("fgra")) + "</fgrado>" +
                        "<tarprof>" + escapeXML((String) item.get("nro_tar")) + "</tarprof>" +
                    "</estudio>" ;
        }
        res +=  "</estudios>";
        
        res +=  "<idiomas>";
        for (i = 0; i < idiomas.length; i++) {
            item = idiomas[i];
            res +=  "<idioma>" +
                        "<lengua>" + escapeXML((String) item.get("lengua")) + "</lengua>" +
                        "<lee>" + escapeXML((String) item.get("nivlec")) + "</lee>" +
                        "<escribe>" + escapeXML((String) item.get("nivesc")) + "</escribe>" +
                        "<habla>" + escapeXML((String) item.get("nivhab")) + "</habla>" +
                    "</idioma>";
        }
        res +=  "</idiomas>";
        
        res +=  "<escritos>";
        for (i = 0; i < escritos.length; i++) {
            item = escritos[i];
            res +=  "<escrito>" +
                        "<titulo>" + escapeXML((String) item.get("titulo")) + "</titulo>" +
                        "<tmayor>" + escapeXML((String) item.get("titmay")) + "</tmayor>" +
                        "<area>" + escapeXML((String) item.get("area")) + "</area>" +
                        "<tipo>" + escapeXML((String) item.get("tipo")) + "</tipo>" +
                        "<fecha>" + escapeXML((String) item.get("fec")) + "</fecha>" +
                        "<edicion>" + escapeXML((String) item.get("edic")) + "</edicion>" +
                        "<isbn>" + escapeXML((String) item.get("edit")) + "</isbn>" +
                        "<ciudad>" + escapeXML((String) item.get("ciudad")) + "</ciudad>" +
                        "<pais>" + escapeXML((String) item.get("pais")) + "</pais>" +
                    "</escrito>" ;
        }
        res +=  "</escritos>";
        
        res +=  "<experiencias>";
        for (i = 0; i < exps.length; i++) {
            item = exps[i];
            res +=  "<experiencia>" +
                        "<organizacion>" + escapeXML((String) item.get("nomorg")) + "</organizacion>" +
                        "<cargo>" + escapeXML((String) item.get("cargo")) + "</cargo>" +
                        "<periodo>" + escapeXML((String) item.get("fini")) + " - " + escapeXML(((String) item.get("ffin")).equals("01/01/1900")?"Actualidad":((String) item.get("ffin"))) + "</periodo>" +
                        "<tcargo>" + escapeXML((String) item.get("tpcar")) + "</tcargo>" +
                        "<niveld>" + escapeXML((String) item.get("nivdoc")) + "</niveld>" +
                    "</experiencia>" ;
        }
        res +=  "</experiencias>";
        
        res +=  "<membresias>";
        for (i = 0; i < membresias.length; i++) {
            item = membresias[i];
            res +=  "<membresia>" +
                        "<organizacion>" + escapeXML((String) item.get("org")) + "</organizacion>" +
                        "<cat>" + escapeXML((String) item.get("cat")) + "</cat>" +
                        "<fing>" + escapeXML((String) item.get("fing")) + "</fing>" +
                        "<fret>" + escapeXML(((String) item.get("fret")).equals("01/01/1900")?"Actualidad":((String) item.get("fret"))) + "</fret>" +
                    "</membresia>" ;
        }
        res +=  "</membresias>";
        
        res +=  "<distinciones>";
        for (i = 0; i < distinciones.length; i++) {
            item = distinciones[i];
            res +=  "<distincion>" +
                        "<nombre>" + escapeXML((String) item.get("nombre")) + "</nombre>" +
                        "<institucion>" + escapeXML((String) item.get("instit")) + "</institucion>" +
                        "<pais>" + escapeXML((String) item.get("pais")) + "</pais>" +
                        "<ano>" + escapeXML((String) item.get("anio")) + "</ano>" +
                        "<desc>" + escapeXML((String) item.get("descr")) + "</desc>" +
                    "</distincion>" ;
        }
        res +=  "</distinciones>";
        
        res +=  "<proyectos>";
        for (i = 0; i < proyectos.length; i++) {
            item = proyectos[i];
            res +=  "<proyecto>" +
                        "<nombre>" + escapeXML((String) item.get("titp")) + "</nombre>" +
                        "<objetivo>" + escapeXML((String) item.get("objp")) + "</objetivo>" +
                        "<organizacion>" + escapeXML((String) item.get("orgp")) + "</organizacion>" +
                        "<pais>" + escapeXML((String) item.get("pais")) + "</pais>" +
                        "<tipo>" + escapeXML((String) item.get("tipp")) + "</tipo>" +
                        "<rol>" + escapeXML((String) item.get("rolp")) + "</rol>" +
                        "<periodo>" + escapeXML((String) item.get("fini")) + " - " + escapeXML(((String) item.get("ffin")).equals("01/01/1900")?"Actualidad":((String) item.get("ffin"))) + "</periodo>" +
                    "</proyecto>" ;
        }
        res +=  "</proyectos>";
        
        res +=  "<perfil>" + escapeXML((String) perfil.get("perfil")) + "</perfil>";
        
        res +=  "<estpart>" +
                    "<idpar>" + escapeXML((String) par) + "</idpar>" +
                    "<estad>" + escapeXML((String) estpar.get("estado")) + "</estad>" +
                    "<mensaje>" + escapeXML((String) estpar.get("mensaje")) + "</mensaje>" +
                    "<obs>" + escapeXML((String) estpar.get("obs")) + "</obs><razon>" + escapeXML((String) estpar.get("razon")) + "</razon>" +
                "</estpart>";
        
        res +=  "</hojavida>";

        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(res);
        pw.flush();
        pw.close();
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    private String escapeXML(String escapeText) {
        String result = escapeText;
        if (result == null || result.trim().equals("")) result = "_";
        
        result = result.replaceAll("&", "&amp;");
        result = result.replaceAll("<", "&lt;");
        result = result.replaceAll(">", "&gt;");
        result = result.replaceAll("\"", "&quot;");
        result = result.replaceAll("'", "&apos;");
        return result;
    }

}
