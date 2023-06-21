<%-- 
    Document   : Hoja de evaluaci�n del empleado
    Created on : 20/02/2012, 10:05:44 AM
    Author     : Juli�n Garcia
--%>
<%@page import="java.util.HashMap"%>
<%@page import="BDintraeci.EmpleadoRemote"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    response.setHeader("Cache-Control", "no-cache");
    HttpSession sesion = request.getSession(false);
    EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp") ;
    String opc = request.getParameter("opc") ;
    String ed = request.getParameter("ed") ;
    HashMap[] lista = emp.lispacargo(opc) ;
    HashMap item = null;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script language="javascript" type="text/javascript" src="jscript/comun.js"></script>
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script type="text/javascript" src="jscript/talentohum/aspirante.js"></script>
        <script type="text/javascript" src="jscript/talentohum/compromisos.js"></script>
        <script type="text/javascript" src="jscript/talentohum/evaluacion.js"></script>
        <script language="javascript" type="text/javascript">
            var respEstPart = false ;
            var tp = '1' ;
            var tpusu = '0' ;
        </script>
        <script language="javascript" type="text/javascript">tpusu = '<%=opc%>'; oped = '<%=ed%>';</script>
        <title>Hoja de Evaluaci�n</title>
        <link href="css/comunProye.css" rel="stylesheet" type="text/css">
        <style type="text/css" >
            #tbody{
                height: 250px;
                overflow: auto;
            }
        </style>
        <script type="text/javascript" src="jscript/conectar.js"></script>
        <script language="javascript" type="text/javascript">
            var Datos=new Array();
            var respComp = true ;
        </script>
    </head>
    <body background="img/fondo.gif">
        <jsp:include page="encAspirante">
            <jsp:param name="parametro" value="" />
            <jsp:param name="doblenc" value="inicio" />
            <jsp:param name="titulo" value="Hoja de Evaluaci�n" />
        </jsp:include>
        <div align="center"><strong>Evaluaci�n del Recurso Humano:
                <form name="selprof" action="">
                    <select name="selemp" id ="selemp">
                    <%
                    for (int i = 0; i < lista.length; i++) {
                        item = lista[i];
                    %>
                        <option value="<%=item.get("cod_emp")%>"><%=item.get("nombres")%></option>
                        <% if (!item.get("cant").equals("0")) {%>
                            <script language="javascript" type="text/javascript">oped = '0';</script>
                    <%     }
                     }%>
                    </select>                    
                    <input id="bselemp" value="Seleccionar" type="button" class="boton" onclick="SelecccionarEmp();"/>
                </form>
        </strong></div><br>

        <div align="left"><strong>
            <a id="pcomdoc" href="#" style="display: inline;" onclick="compDocencia(1, 1);">+ </a>
            <a id="acomdoc" href="#" style="display: none;" onclick="compDocencia(0, 1);">-- </a>
            Consulta Evaluaci�n del Empleado.</strong>
        <table border="1" class="tabla" id="tabcdoc" style="display: none;" >
            <thead>
                <th width="47%"><div align="center"><strong>Asignatura</strong></div></th>
                <th width="5%"><div align="center"><strong>Grps</strong></div></th>
                <th width="6%"><div align="center"><strong>HClase</strong></div></th>
                <th width="6%"><div align="center"><strong>HPrep</strong></div></th>
                <th width="6%"><div align="center"><strong>HAten</strong></div></th>
                <th width="6%"><div align="center"><strong>HCorr</strong></div></th>
                <th width="5%"><div align="center"><strong>THor</strong></div></th>
                <th width="19%"><div align="center"><strong>Elimine</strong></div></th>
            </thead>
            <tfoot>
                <form name="fcompdoc" action="">
                    <tr><td><input type="hidden" size="6" name="idcdoc" id="idcdoc"/>
                            <input type="hidden" size="6" name="idintdoc" id="idintdoc"/>
                            <input type="hidden" value="PRE" size="4" name="nivd" id="nivd"/>
                            <input type="text" disabled="true" size="54" name="nasig" id="nasig"/>
                        <a href="#" onClick="return consultasModal('nasig','idintdoc',respComp,'2');"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                        <td><input type="text" size="3" name="ngrp" id="ngrp"/></td>
                        <td><input type="text" size="4" name="hc" id="hc"/></td>
                        <td><input type="text" size="4" name="hp" id="hp"/></td>
                        <td><input type="text" size="4" name="ha" id="ha"/></td>
                        <td><input type="text" size="4" name="hd" id="hd"/></td>
                        <td><input type="text" disabled="true" size="4" name="th" id="th"/></td>
                        <td><input type="checkbox" name="bld" id="bld"/>Cnf 
                            <input id="GuardarComDoc" value="Guardar" style="display: none;" type="button" class="boton" onclick="guardarClase();"/></td>
                    </tr>
                </form>
            </tfoot>
            <tbody id="cuerpocdoc">
            </tbody>
        </table>
        </div>
        <br>
        <form name="fevalinst" action="">
        <div align="left"><strong>
            <a id="pevalinst" href="#" style="display: inline;" onclick="evalinstitucional(tpusu, 1);">+ </a>
            <a id="aevalinst" href="#" style="display: none;" onclick="evalinstitucional(tpusu, 0);">-- </a>
            Realizar Evaluaci�n competencias institucionales.</strong>
        <table border="1" class="tabla" id="tabeval" style="display: none;" >
            <thead>
                <th width="25%"><div align="center"><strong>Competencia</strong></div></th>
                <th width="45%"><div align="center"><strong>Descripci�n</strong></div></th>
                <th width="6%"><div align="center"><strong>Deficiente</strong></div></th>
                <th width="6%"><div align="center"><strong>Aceptable</strong></div></th>
                <th width="6%"><div align="center"><strong>Bueno</strong></div></th>
                <th width="6%"><div align="center"><strong>Notable</strong></div></th>
                <th width="6%"><div align="center"><strong>Excelente</strong></div></th>
            </thead>
            <tr><td colspan="7"><font size="0">
                <strong>Deficiente</strong> (No cumple con los est�ndares de trabajo ni satisface las expectativas).
                <strong>Aceptable</strong> (Generalmente cumple con los est�ndares y expectativas de trabajo, aunque en algunas ocasiones, su
                desempe�o es de bajo rendimiento).
                <strong>Bueno</strong> (Cumple sistem�tica y satisfactoriamente con los est�ndares de trabajo y las expectativas).
                <strong>Notable</strong> (Cumple sistem�ticamente y a menudo excede los est�ndares y expectativas de trabajo).
                <strong>Excelente</strong>(Excede los est�ndares de trabajo, supera desaf�os excepcionales).</font>
            </td></tr>
            <tr><td>Compromiso con la misi�n, visi�n y valores institucionales</td>
                <td>Disposici�n, identificaci�n, entusiasmo e inter�s que muestra, a trav�s de actitudes
                    cotidianas, hacia la Misi�n del cargo e instituci�n y el cumplimiento de la Visi�n de
                    la Escuela. Compromiso con los valores institucionales.</td>
                <td><input type="radio" name="P1" value="1"></td>
                <td><input type="radio" name="P1" value="2"></td>
                <td><input type="radio" name="P1" value="3"></td>
                <td><input type="radio" name="P1" value="4"></td>
                <td><input type="radio" name="P1" value="5"></td>
            </tr>
            <tr><td>Orientaci�n hacia el servicio</td>
                <td>Favorece la comunicaci�n con sus compa�eros de trabajo. Asume la responsabilidad
                    de atender solicitudes o problemas espec�ficos de sus clientes internos y externos.</td>
                <td><input type="radio" name="P2" value="1"></td>
                <td><input type="radio" name="P2" value="2"></td>
                <td><input type="radio" name="P2" value="3"></td>
                <td><input type="radio" name="P2" value="4"></td>
                <td><input type="radio" name="P2" value="5"></td>
            </tr>
            <tr><td>Colaboraci�n</td>
                <td>Participa y genera aportes para en el desarrollo de objetivos y planes del equipo de
                    trabajo o de equipos institucionales. Favorece el cumplimiento de objetivos del grupo
                    de trabajo, asumiendo responsabilidades individuales y de equipo.</td>
                <td><input type="radio" name="P3" value="1"></td>
                <td><input type="radio" name="P3" value="2"></td>
                <td><input type="radio" name="P3" value="3"></td>
                <td><input type="radio" name="P3" value="4"></td>
                <td><input type="radio" name="P3" value="5"></td>
            </tr>
            <tr><td>Iniciativa y actitud de aprendizaje</td>
                <td>Genera ideas para proyectos con pertinencia y claridad. Busca soluciones a problemas
                    antes de recibir instrucciones o de ser requerido por su jefe inmediato. Analiza
                    diferentes maneras para hacer las cosas para optimizar el proceso y el resultado.</td>
                <td><input type="radio" name="P4" value="1"></td>
                <td><input type="radio" name="P4" value="2"></td>
                <td><input type="radio" name="P4" value="3"></td>
                <td><input type="radio" name="P4" value="4"></td>
                <td><input type="radio" name="P4" value="5"></td>
            </tr>
            <tr><td>Orientaci�n al logro</td>
                <td>Se plantea retos y desaf�os en busca de �ptimos resultados. Realiza planteamientos
                    novedosos para alcanzar los objetivos. Eval�a su desempe�o para encontrar oportunidades
                    de mejoramiento. Establece altos par�metros de desempe�o.</td>
                <td><input type="radio" name="P5" value="1"></td>
                <td><input type="radio" name="P5" value="2"></td>
                <td><input type="radio" name="P5" value="3"></td>
                <td><input type="radio" name="P5" value="4"></td>
                <td><input type="radio" name="P5" value="5"></td>
            </tr>
            <tr><td>Adaptabilidad</td>
                <td>Modifica su conducta ante cambios en el entorno para lograr los objetivos propuestos. Versatilidad
                    en el comportamiento cuando surgen dificultades y nuevos datos.</td>
                <td><input type="radio" name="P6" value="1"></td>
                <td><input type="radio" name="P6" value="2"></td>
                <td><input type="radio" name="P6" value="3"></td>
                <td><input type="radio" name="P6" value="4"></td>
                <td><input type="radio" name="P6" value="5"></td>
            </tr>
            <tr><td colspan="7" align="center"><input id="GEvalInst" value="Enviar Evaluaci�bn" type="button" class="boton" onclick="guardarEval(1, tpusu, 1, 6);"/></td>
            </tr>
        </table>
        </div>
        <br>
        <div align="left"><strong>
            <a id="pevalcomp" href="#" style="display: inline;" onclick="evalCompromisos(tpusu, 1);">+ </a>
            <a id="aevalcomp" href="#" style="display: none;" onclick="evalCompromisos(tpusu, 0);">-- </a>
            Realizar Evaluaci�n de cumplimiento de compromisos en el periodo.</strong>
        <table border="1" class="tabla" id="tabcomp" style="display: none;" >
            <thead>
                <th width="20%"><div align="center"><strong>Tipo</strong></div></th>
                <th width="25%"><div align="center"><strong>Descripci�n</strong></div></th>
                <th width="12%"><div align="center"><strong>Ind. medidic�n</strong></div></th>
                <th width="3%"><div align="center"><strong>%Cump.</strong></div></th>
                <th width="40%"><div align="center"><strong>Justificaci�n del % de cumplimiento</strong></div></th>
            </thead>
            <thead>
            <td colspan="5"><font size="0">
                <strong>Deficiente (0-20%)</strong> No cumple ni satisface el cumplimiento del objetivo propuesto.
                <strong>Aceptable (21%-40%)</strong> Generalmente cumple con los est�ndares y expectativas del objetivo propuesto, aunque en algunas ocasiones, su orientaci�n al logro es de bajo rendimiento.
                <strong>Bueno (41%-60%)</strong> Cumple con el objetivo propuesto de manera sistem�tica y satisfactoria.
                <strong>Notable (61%-80%)</strong> Cumple sistem�ticamente y a menudo excede los est�ndares y expectativas del objetivo propuesto.
                <strong>Excelente (81%-90%)</strong> Excede los est�ndares del objetivo propuesto, supera desaf�os excepcionales.</font></td>
            </thead>
            <tfoot>
                <tr><td colspan="5" align="center"><input id="GEvalComp" value="Enviar Evaluaci�n" type="button" class="boton" onclick="guardarEval(2, tpusu, 1, 6);"/></td>
            </tfoot>
            <tbody id="cuerpocomp">
            </tbody>
        </table>
        </div>
        </form>
        <br>
    </body>
</html>