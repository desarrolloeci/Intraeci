<%-- 
    Document   : FormatoTaller
    Created on : 8/06/2017, 03:24:03 PM
    Author     : lucero.rodriguez
--%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.text.*, java.net.*;" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties,java.lang.reflect.Array " %>

<%HttpSession sesion;
    response.setHeader("Cache-Control", "no-cache");
    session.setAttribute("loginex", empleado.getUsrExchange());
    inicio.conectaEJB conEjb = new inicio.conectaEJB();
    BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
    String cedula = empleado.getIdemp();
    String prog = request.getParameter("prog");
    String iden = request.getParameter("iden");
    String grupo = request.getParameter("grupo");
    String tipo = request.getParameter("tipo");
    String descripcion = request.getParameter("descripcion");
    String id_encuestado = request.getParameter("id_encuestado");
    String identificar = new String();
    String docunomas;
    String nomunomas;
    String mailunomas;
    String estado;
    String asistencianva;
    int b = 0;
    // String FactorE= new String();

    //String adiciona2 = request.getParameter("nombres1");
    //Vector Datos = admin.DatosEncuestas(cedula);
    Vector FactorEnc = admin.FactoresEnc(iden);
    if (FactorEnc.size() > 0) {
        int totfac = FactorEnc.size();
        int maxi = 0;
        String nombreenc = "";
        String docum = "";
        Vector maximo = admin.MáximoFactor(id_encuestado, iden);
        //Datos de los participantes de cada taller es decir cada grupo
        Vector DatosEnc = admin.DatosEncuestado(iden, grupo);
        String programa = new String();
        String idgrupo = new String();
        int contestan = DatosEnc.size();
        String valor2, valor3;
        String asistencia = new String("asistencia");
        for (int j = 0; j < contestan; j++) {
            programa = (String) ((Vector) DatosEnc.elementAt(0)).elementAt(4);
            idgrupo = (String) ((Vector) DatosEnc.elementAt(0)).elementAt(5);
            valor2 = String.valueOf(j);
            String variableasiste = (String) asistencia.concat(valor2);
            String asiste = request.getParameter(variableasiste);
            
            if (asiste != null) {
                String separa1[] = new String[5];
                StringTokenizer st = new StringTokenizer(asiste, "|");
                int z = 0;
                while (st.hasMoreTokens()) {
                    separa1[z] = st.nextToken();
                    z = z + 1;
                }
                String asistio = separa1[0];
                String idasistente = separa1[1];
                int ret = admin.Asistencia(idasistente, iden, asistio);
            }
        }

        //ARREGLAR EL TOKEN HASTA 2
        for (int j = 0; j < 4; j++) {
            valor3 = String.valueOf(j);
            String adiciona = new String("nombres");
            String agregapart1 = (String) adiciona.concat(valor3);
            String otropartic = request.getParameter(agregapart1);
            if (otropartic == null) {
                otropartic = "0";
            }
            if (!otropartic.equals("0")) {
                
                String separarotro[] = new String[8];
                StringTokenizer st1 = new StringTokenizer(otropartic, "|");
                int n = 0;
                
                while (st1.hasMoreTokens()) {
                    separarotro[n] = st1.nextToken();
                    n = n + 1;
                }
                identificar = separarotro[0];
                docunomas = separarotro[1];
                int ret = admin.ActualizaAsisteOtroGrupo(iden, grupo, identificar, programa);

                //  nomunomas = separarotro[2];
                // mailunomas = separarotro[3];
                //estado = separarotro[5];
                //asistencianva = separarotro[6];

                /* int ret = admin.ActualizaAsisteOtroGrupo(iden, grupo, identificar);
                 if (ret <= 0) {
                 out.println("Esta intentando adicionar un participante que ya se encuentra registrado en otro grupo");
                 }*/

                /* YA NO SE REQUIERE SOLO SE PUEDEN ADICIONAR A OTRO TALLER LOS Q ESTAN EN ENCUESTADOS CON TALLER ASIGNADOS
                 * if (!docunomas.equals("0")) {
                 Vector consultadato = admin.ConsultaDatosEncuestado(docunomas);
                 if (consultadato.size() <= 0) {
                 int ret1 = admin.GuardaEmpleado(docunomas, nomunomas, mailunomas);
                 }
                 //int ret2 = admin.GuardaEncuestado(docunomas, iden, programa, grupo);

                 }*/
            }
        }
        
        String max = maximo.elementAt(0).toString();
        if (max.equals("No disponible")) {
            maxi = 0;
        } else {
            maxi = Integer.parseInt(max);
        }
        
        int cuentafac = 0;
        String dato = "";%>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>

        <title>Encuestas Autoevaluación con fines de Acreditación Institucional-Taller</title>
        <link href="css/encuestaODI.css" rel="stylesheet" type="text/css" media="all"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Arsenal" rel="stylesheet">    
        <SCRIPT LANGUAGE="JavaScript">
            
            function comprueba(contador, CodFactor) {
                
                var nombre, valida, comentarios, p;
                for (i = 1; i <= contador; i++) {
                    nombre = new String("P" + CodFactor + i);
                    comentarios = new String("comentario" + i);
                    p = new String("p" + i);
                    
                    
                    valida = document.getElementById("valida" + i).value;
                    if (valida == 3) {
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][1].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][2].style.outline = '1px solid #990000';
                            //document.getElementById(p).style.backgroundColor = '#FFA74F';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }
                    }
                    
                    if (valida == 4) {
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            //document.forms.form1[nombre][0].style.backgroundColor = '#FFA74F';
                            document.forms.form1[nombre][0].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][1].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][2].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][3].style.outline = '1px solid #990000';
                            
                            // document.getElementById(p).style.backgroundColor = '#FFA74F';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }
                    } else if (valida == 5) {
                        
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][1].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][2].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][3].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][4].style.outline = '1px solid #990000';
                            //document.getElementById(p).style.backgroundColor = '#FFA74F';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }
                        
                    } else if (valida == 6) {
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked && !document.forms.form1[nombre][5].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][1].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][2].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][3].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][4].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][5].style.outline = '1px solid #990000';
                            
                            // document.getElementById(p).style.backgroundColor = '#FFA74F';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }
                    } else if (valida == 7) {
                        if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked && !document.forms.form1[nombre][5].checked && !document.forms.form1[nombre][6].checked) {
                            alert("Por favor responda todos los campos de la encuesta");
                            document.forms.form1[nombre][0].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][1].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][2].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][3].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][4].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][5].style.outline = '1px solid #990000';
                            document.forms.form1[nombre][6].style.outline = '1px solid #990000';
                            //document.getElementById(p).style.backgroundColor = '#FFA74F';
                            document.forms.form1[nombre][0].focus();
                            return false;
                        }
                    }
                    
                    if (document.forms.form1[comentarios].value.length > 500) {
                        alert("La justificación no puede exceder los 500 caracteres");
                        document.form1[comentarios].style.backgroundColor = '#FFA74F';
                        return false;
                    }
                    
                    // if (document.forms.form1[comentarios].value == "") {
                    // alert("Por favor ingrese la justificación de su respuesta a la pregunta número " + [i]);
                    //document.form1[comentarios].style.backgroundColor = '#FFA74F';
                    //return false;
                    //}
                }
                return true;
                
            }
            
            function confirmacion() {
                var pregunta = confirm("Recuerde que hasta el momento usted ha respondido parcialmente la encuesta. Su opinión es muy importante para el proceso de autoevaluación, por lo que lo invitamos a terminarla y enviarla oportunamente para tener en cuenta sus apreciaciones y observaciones.")
                if (pregunta) {
                    window.location = "../intraeci/salir";
                }
                else {
                    alert("Gracias por permanecer en la página!")
                }
            }
            
        </SCRIPT>
        <style type="text/css"></style>
    </head>
    <body>

        <% int valida = 0;%>
        <!--NUEVO-->

        <% Vector preguntas = admin.PreguntasEnc(iden);
            int total = preguntas.size();%>
        <form name="form1"  method="post"  action="autoevaluacionNuevo">
            <input type="hidden" name="prog" value="<%=prog%>">
            <input type="hidden" name="total" value="<%=total%>">      
            <input type="hidden" name="idenc" value="<%=iden%>">
            <input type="hidden" name="tipo" value="<%=tipo%>">
            <input type="hidden" name="grupo" value="<%=grupo%>">
            <%                
                int i = 0;

                //PREGUNTAS POR CADA FACTOR

                Vector Contesto = admin.ContestoFactorTaller(id_encuestado, iden);
                int totalcontesto = Contesto.size();
              //  int totalcontesto = request.getParameter('totalcontesto');
                if (totalcontesto == totfac) {
                    int Encuestado = admin.Encuestado(id_encuestado, iden, prog);
                    int Asiste = admin.GruposAsiste(grupo, iden);
                    int NoAsiste = admin.GruposNoAsiste(grupo, iden);
                    int retestado = admin.ActualizaEstadoOtroGrupo(iden, grupo, identificar);
                    //
            %>
            <p>
            <div id="container">
                <!--inicio header-->
                <header>
                </header>
            </div>
            <center><h3>Usted ha finalizado correctamente la encuesta. Gracias por su participación. </h3></center>
            <br><br>
            <center>
                <h3><a href="../intraeci/salir"> Salir </a>
                    <%} else {
                        
                        Vector FactorE = new Vector();
                        
                        //FactorE = (Vector) FactorEnc.elementAt(totalcontesto);
                        String factorE = request.getParameter("totalcontesto");
                        
                        String nombre = "factor";
                        int CodFactor = (Integer.valueOf((String) FactorE.elementAt(0))).intValue();
                        //int CodFactor = Integer.parseInt(FactorE);
                        Vector Factores = admin.Factores(CodFactor);
                        String nomfac = nombre + CodFactor;
                        Vector preguntasFactor = admin.PreguntasEncFactor(iden, CodFactor);

                    %>
                    <div id="container">  
                        <header> </header> 
                        <!--inicio section-->
                        <!--inicio aside-->
                        <h1><center><font size="5" color="#800000"><b>Factor <%=CodFactor%></font></center></h1>
                        <h1><center><b><font size="5" color="#800000"><%=Factores.elementAt(1)%></font></b></center></h1>
                        <p>
                            <font size="2" ><b><%=Factores.elementAt(0)%></b></font>
                        <h4>&nbsp;</h4>
                        <% if ((preguntasFactor.size() > 0)) {
                                Vector ctascontestofactor = admin.PreguntasFactorContesto(iden, CodFactor, id_encuestado);
                                int ctas = (Integer.valueOf((String) ctascontestofactor.elementAt(0))).intValue();
                                
                                int contador = preguntasFactor.size();
                                // int y = 5;
                                int r = 0;
                                
                                
                                if (ctas < preguntasFactor.size()) {
                                    Vector Faltan = admin.PreguntasQueFaltan(iden, CodFactor, id_encuestado);
                                    if (Faltan.size() > 0) {
                                        FactorE = (Vector) FactorEnc.elementAt(totalcontesto - 1);
                                        //   totalcontesto= totalcontesto -1;
                                        for (int k = 0; k < 2; k++) {
                                            String id_pregunta = (String) ((Vector) Faltan.elementAt(k)).elementAt(0);
                                            Vector PregFactor = admin.DatosPregFaltanEncFactor(iden, CodFactor, id_pregunta);
                                            String idfactortaller = (String) ((Vector) preguntasFactor.elementAt(k)).elementAt(14);
                                            //  Vector PregFactor = (Vector) DatosPregFactor.elementAt(k);
                                            Vector PregFactorFaltan = (Vector) Faltan.elementAt(k);
                                            String identifica = PregFactorFaltan.elementAt(0).toString();
                                            String hasta = PregFactor.elementAt(4).toString();
                                            valida = Integer.parseInt(hasta);%>


                </h3>
            </center>  
            <!--inicio header-->




            <input type="hidden" id="valida<%=k + 1%>" value="<%=valida%>">
            <input type="hidden" name="total" value="<%=total%>">
            <input type="hidden" name="idenc" value="<%=iden%>">
            <input type="hidden" name="prog" value="<%=prog%>">
            <input type="hidden" name="confactor" value="<%=contador%>">
            <input type="hidden" name="CodFactor" value="<%=CodFactor%>">
            <input type="hidden" name="identifica<%=k + 1%>" value="<%=identifica%>">
            <input type="hidden" name="indice<%=k + 1%>" value="<!%=indice%>">
            <input type="hidden" name="nomfac" value="<%=nomfac%>">
            <input type="hidden" name="descripcion" value="<%=descripcion%>">
            <input type="hidden" name="contestan" value="<%=contestan%>">
            <input type="hidden" name="id_encuestado" value="<%=id_encuestado%>">
            <input type="hidden" name="id_factortaller" value="<%=idfactortaller%>">

            <table width="100%" border="0" cellpadding="3" cellspacing="1">
                <tr valign="middle">
                <tr>
                    <td colspan="8"> <font size="2" color="#800000"><b><%=k + 1%>. <%=PregFactor.elementAt(2)%></b></font></td>
                </tr>
                <tr>
                    <td>&nbsp;
                    </td>
                </tr>                  
                <tr>
                    <td  bgcolor="#F4F4F4">
                        <table  width="100%" border ="1" height="90">
                            <tr><td><font size="2"> <%=PregFactor.elementAt(6)%></font></td></tr></table></td>
                    <td bgcolor="#F4F4F4"><table width="100%" border ="1" height="90"><tr><td><font size="2"><%=PregFactor.elementAt(7)%></font></td></tr></table></td>
                    <td bgcolor="#F4F4F4"><table width="100%" border ="1" height="90"><tr><td><font size="2"><%=PregFactor.elementAt(8)%></font></td></tr></table></td>
                                    <% if (PregFactor.elementAt(4).equals("4")) {%>
                    <td bgcolor="#F4F4F4"><table width="100%" border ="1" height="90"><tr><td><font size="2"><%=PregFactor.elementAt(9)%></font></td></tr></table></td>
                                    <% }
                                        if (PregFactor.elementAt(4).equals("5")) {%>
                    <td bgcolor="#F4F4F4"><table width="100%" border ="1" height="90"><tr><td><font size="2"><%=PregFactor.elementAt(9)%></font></td></tr></table></td>
                    <td bgcolor="#F4F4F4"><table  width="100%" border ="1" height="90"><tr><td><font size="2"><%=PregFactor.elementAt(10)%></font></td></tr></table></td>
                                    <%}
                                        if (PregFactor.elementAt(4).equals("6")) {%>
                    <td  bgcolor="#F4F4F4"><table  width="100%" border ="1" height="90"><tr><td><font size="2"><%=PregFactor.elementAt(9)%></font></td></tr></table></td>
                    <td  bgcolor="#F4F4F4"><table  width="100%" border ="1" height="90"><tr><td><font size="2"><%=PregFactor.elementAt(10)%></font></td></tr></table></td>
                    <td  bgcolor="#F4F4F4"><table  width="100%" border ="1" height="90"><tr><td><font size="2"><%=PregFactor.elementAt(11)%></font></td></tr></table></td>
                                    <%}
                                        if (PregFactor.elementAt(4).equals("7")) {%>
                    <td bgcolor="#F4F4F4"><table  width="100%" border ="1" height="90"><tr><td><font size="2"><%=PregFactor.elementAt(9)%></font></td></tr></table></td>
                    <td  bgcolor="#F4F4F4"><table  width="100%" border ="1" height="90"><tr><td><font size="2"><%=PregFactor.elementAt(10)%></font></td></tr></table></td>
                    <td  bgcolor="#F4F4F4"><table  width="100%" border ="1" height="90"><tr><td><font size="2"><%=PregFactor.elementAt(11)%></font></td></tr></table></td>
                    <td  bgcolor="#F4F4F4"><table  width="100%"  border ="1" height="90"><tr><td><font size="2"><%=PregFactor.elementAt(12)%></font></td></tr></table></td>
                                    <%}%>

                </tr>          
                <tr>
                    <%  dato = PregFactor.elementAt(4).toString();
                        int cuantos = Integer.parseInt(dato);
                        int x = cuantos;
                        //int a = (cuantos - 1);
                        int a = 0;
                        
                        for (int p = 1; p <= cuantos; p++) {%>
                    <% String valores = PregFactor.elementAt(5).toString().substring(a, p);
                        a++;
                        // String valores = pregunta.elementAt(5).toString().substring(a, x);
                        //a--;
                        //x--;%>

                    <td id="p<%=k + 1%>"><table width="100%" border ="1" height="30"><tr><td>

                                    <p>&nbsp;</p>
                                    <p>
                                    <div align="center">
                                        <input type="radio" name="P<%=CodFactor%><%=k + 1%>" value="<%=valores%>|<%=PregFactor.elementAt(0)%>">
                                    </div>
                                    </p>
                                </td></tr></table>
                    </td>

                    <%}%>

                </tr>

                <tr>
                <tr valign="middle">
                    <!--td colspan="8">
                        <b>Comentarios:</b>
                    </td-->
                </tr>
                <td colspan="8">

                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="heading<%=k + 1%>">
                                <h5 class="panel-title">
                                    <span class="glyphicon glyphicon-collapse-down"></span>
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<%=k + 1%>" aria-expanded="true" aria-controls="collapse<%=k + 1%>">
                                        <span class="rojo"><small>Justifique aqui su respuesta(máximo 500 caracteres)</small></span> 
                                    </a>
                                </h5>
                            </div>
                            <div id="collapse<%=k + 1%>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading<%=k + 1%>">
                                <div class="panel-body">

                                    <textarea name="comentario<%=k + 1%>" rows="2" cols="120" maxlength="500"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
                </tr>
                <td class="linea" colspan="8"><hr></td>
                    <%}
                                //  }
                            }
                        }
                    %>
                <tr>

                    <td colspan="7"> 
                        <div align="center">
                            <input type="submit" name="Submit" class="input boton" value="GUARDAR Y SIGUIENTE" onclick="return comprueba(<%=contador%>,<%=CodFactor%>);">
                        </div>
                    </td>
                </tr>
            </table>
            Si desea agregar un nuevo participante  <a href="Asistencia?iden=<%=iden%>&prog=<%=prog%>&descripcion=<%=descripcion%>&grupo=<%=grupo%>&tipo=T&id_encuestado=<%=id_encuestado%>"> haga click aquí.</a>
        </div>

    </form>
    <div id="container">

        <table  width="100%" border="0">
            <tr>
                <td> 
                    <div align="center">
                        <input class="boton" type="submit" name="Submit" value="SALIR"  onClick="confirmacion()" >
                    </div>
                </td>
            </tr>
        </table>

    </div>

    <% }
                
            }
        }
    %>

    <h1>&nbsp;</h1>
    <h1 align="center">&nbsp;</h1>
    <div align="center"></div>

    <script src="js/jquery.js"></script>
    <script src="http://code.jquery.com/jquery-latest.jS"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
