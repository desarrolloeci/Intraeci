<%-- 
    Document   : Participación en Convocatoria por el Aspirante
    Created on : 20/09/2011, 10:05:44 AM
    Author     : Julián Garcia
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
        <script language="javascript" type="text/javascript">
            var respEstPart = false ;
            var tp = '1' ;
            var tpusu = '0' ;
        </script>
        <script language="javascript" type="text/javascript">tpusu = '<%=opc%>'; oped = '<%=ed%>';</script>
        <title>Hoja de Compromisos</title>
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
            <jsp:param name="titulo" value="Hoja de Compromisos" />
        </jsp:include>
        <div align="center"><strong>Plan de Trabajo y Dedicación: 
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
                    <input id="confcomp" value="Confirmar Compromisos" style="display: none;" type="button" class="boton" onclick="ConfirmarHoja();"/>
                </form>
        </strong></div><br>
HClase: Horas de clase. HPrep: Horas de preparación. HAten: Horas de Atención a estudiantes. HCorr: Horas de Corrección.<br>

        <div align="left"><strong>
            <a id="pcomdoc" href="#" style="display: inline;" onclick="compDocencia(1, 1);">+ </a>
            <a id="acomdoc" href="#" style="display: none;" onclick="compDocencia(0, 1);">-- </a>
            Compromisos con el proceso enseñanza - aprendizaje - Pregrado.</strong> (Registrar horas semanales)
            <a id="ncomdoc" href="#" style="display: none;" onclick="nuevaClase();">            [Crear Nuevo]</a>
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
        <div align="left"><strong>
            <a id="pcomdocp" href="#" style="display: inline;" onclick="compDocencia(1, 2);">+ </a>
            <a id="acomdocp" href="#" style="display: none;" onclick="compDocencia(0, 2);">-- </a>
            Compromisos con el proceso enseñanza - aprendizaje - Posgrado.</strong> (Registrar horas totales del curso)
            <a id="ncomdocp" href="#" style="display: none;" onclick="nuevaClase();">            [Crear Nuevo]</a>
        <table border="1" class="tabla" id="tabcdocp" style="display: none;" >
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
                <form name="fcompdocp" action="">
                    <tr><td><input type="hidden" size="6" name="idcdocp" id="idcdocp"/>
                            <input type="hidden" size="6" name="idintdocp" id="idintdocp"/>
                            <input type="hidden" value="POST" size="4" name="nivdp" id="nivdp"/>
                            <input type="text" disabled="true" size="54" name="nasigp" id="nasigp"/>
                        <a href="#" onClick="return consultasModal('nasigp','idintdocp',respComp,'2');"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                        <td><input type="text" size="3" name="ngrpp" id="ngrpp"/></td>
                        <td><input type="text" size="4" name="hcp" id="hcp"/></td>
                        <td><input type="text" size="4" name="hpp" id="hpp"/></td>
                        <td><input type="text" size="4" name="hap" id="hap"/></td>
                        <td><input type="text" size="4" name="hdp" id="hdp"/></td>
                        <td><input type="text" disabled="true" size="4" name="thp" id="thp"/></td>
                        <td><input type="checkbox" name="bldp" id="bldp"/>Cnf 
                            <input id="GuardarComDocp" value="Guardar" style="display: none;" type="button" class="boton" onclick="guardarClase();"/></td>
                    </tr>
                </form>
            </tfoot>
            <tbody id="cuerpocdocp">
            </tbody>
        </table>
        </div>
        <br>
        <div align="left"><strong>
            <a id="pcomed" href="#" style="display: inline;" onclick="compED(1, 3);">+ </a>
            <a id="acomed" href="#" style="display: none;" onclick="compED(0, 3);">-- </a>
            Compromisos con el proceso enseñanza - aprendizaje - Educación Continuada.</strong> (Registrar horas totales del curso)
            <a id="ncomed" href="#" style="display: none;" onclick="nuevaED();">            [Crear Nuevo]</a>
        <table border="1" class="tabla" id="tabced" style="display: none;" >
            <thead>
                <th width="59%"><div align="center"><strong>Curso</strong></div></th>
                <th width="9%"><div align="center"><strong>Inicio</strong></div></th>
                <th width="9%"><div align="center"><strong>Final</strong></div></th>
                <th width="5%"><div align="center"><strong>Horas</strong></div></th>
                <th width="18%"><div align="center"><strong>Elimine</strong></div></th>
            </thead>
            <tfoot>
                <form name="fcomped" action="">
                    <tr><td><input type="hidden" size="6" name="idced" id="idced"/>
                            <input type="text" size="75" name="ncured" id="ncured"/></td>
                        <td><input type="text" size="10" name="finied" id="finied"/></td>
                        <td><input type="text" size="10" name="ffined" id="ffined"/></td>
                        <td><input type="text" size="4" name="thed" id="thed"/></td>
                        <td><input type="checkbox" name="bled" id="bled"/>Cnf
                            <input type="text" disabled="true" size="4" name="shed" id="shed"/>
                            <input id="GuardarComED" value="Guardar" style="display: none;" type="button" class="boton" onclick="guardarED();"/></td>
                    </tr>
                </form>
            </tfoot>
            <tbody id="cuerpoced">
            </tbody>
        </table>
        </div>
        <br>
        <div align="left"><strong>
            <a id="pcomedit" href="#" style="display: inline;" onclick="compED(1, 4);">+ </a>
            <a id="acomedit" href="#" style="display: none;" onclick="compED(0, 4);">-- </a>
            Compromisos con Proyectos editoriales</strong> (Registrar horas totales en el periodo)
            <a id="ncomedit" href="#" style="display: none;" onclick="nuevaED(4);">            [Crear Nuevo]</a>
        <table border="1" class="tabla" id="tabcedit" style="display: none;" >
            <thead>
                <th width="59%"><div align="center"><strong>Título</strong></div></th>
                <th width="9%"><div align="center"><strong>Inicio</strong></div></th>
                <th width="9%"><div align="center"><strong>Final</strong></div></th>
                <th width="5%"><div align="center"><strong>Horas</strong></div></th>
                <th width="18%"><div align="center"><strong>Elimine</strong></div></th>
            </thead>
            <tfoot>
                <form name="fcompedit" action="">
                    <tr><td><input type="hidden" size="6" name="idcedit" id="idcedit"/>
                            <input type="text" size="75" name="ncuredit" id="ncuredit"/></td>
                        <td><input type="text" size="10" name="finiedit" id="finiedit"/></td>
                        <td><input type="text" size="10" name="ffinedit" id="ffinedit"/></td>
                        <td><input type="text" size="4" name="thedit" id="thedit"/></td>
                        <td><input type="checkbox" name="bledit" id="bledit"/>Cnf
                            <input type="text" disabled="true" size="4" name="shedit" id="shedit"/>
                            <input id="GuardarComEDit" value="Guardar" style="display: none;" type="button" class="boton" onclick="guardarED();"/></td>
                    </tr>
                </form>
            </tfoot>
            <tbody id="cuerpocedit">
            </tbody>
        </table>
        </div>
        <br>
        <div align="left"><strong>
            <a id="pcomtg" href="#" style="display: inline;" onclick="compTG(1);">+ </a>
            <a id="acomtg" href="#" style="display: none;" onclick="compTG(0);">-- </a>
            Compromisos con dirección de trabajos de grado.</strong> (Registrar horas totales)
            <a id="ncomtg" href="#" style="display: none;" onclick="nuevaTG();">            [Crear Nuevo]</a>
        <table border="1" class="tabla" id="tabctg" style="display: none;" >
            <thead>
                <th width="60%"><div align="center"><strong>Descripción</strong></div></th>
                <th width="9%"><div align="center"><strong>PRE/POST</strong></div></th>
                <th width="9%"><div align="center"><strong>THoras</strong></div></th>
                <th width="22%"><div align="center"><strong>Elimine</strong></div></th>
            </thead>
            <tfoot>
                <form name="fcomptg" action="">
                    <tr><td><input type="hidden" size="6" name="idctg" id="idctg"/>
                            <input type="text" size="80" name="nomtg" id="nomtg"/></td>
                        <td><input type="text" size="6" name="nivtg" id="nivtg"/></td>
                        <td><input type="text" size="4" name="htg" id="htg"/></td>
                        <td><input type="checkbox" name="bltg" id="bltg"/>Cnf
                            <input type="text" disabled="true" size="4" name="shtg" id="shtg"/>
                            <input id="GuardarComTG" value="Guardar" style="display: none;" type="button" class="boton" onclick="guardarTG();"/></td>
                    </tr>
                </form>
            </tfoot>
            <tbody id="cuerpoctg">
            </tbody>
        </table>
        </div>
        <br>
        <div align="left"><strong>
            <a id="pcompe" href="#" style="display: inline;" onclick="compPE(1);">+ </a>
            <a id="acompe" href="#" style="display: none;" onclick="compPE(0);">-- </a>
            Compromisos con práctica empresarial.</strong> (Registrar horas totales)
            <a id="ncompe" href="#" style="display: none;" onclick="nuevaPE();">            [Crear Nuevo]</a>
        <table border="1" class="tabla" id="tabcpe" style="display: none;" >
            <thead>
                <th width="60%"><div align="center"><strong>Descripción</strong></div></th>
                <th width="5%"><div align="center"><strong>Estuds</strong></div></th>
                <th width="5%"><div align="center"><strong>Visitas</strong></div></th>
                <th width="5%"><div align="center"><strong>Informes</strong></div></th>
                <th width="5%"><div align="center"><strong>THor</strong></div></th>
                <th width="20%"><div align="center"><strong>Elimine</strong></div></th>
            </thead>
            <tfoot>
                <form name="fcomppe" action="">
                    <tr><td><input type="hidden" size="6" name="idcpe" id="idcpe"/>
                            <input type="text" size="80" name="nompe" id="nompe"/></td>
                        <td><input type="text" size="3" name="nepe" id="nepe"/></td>
                        <td><input type="text" size="4" name="hvis" id="hvis"/></td>
                        <td><input type="text" size="4" name="hinf" id="hinf"/></td>
                        <td><input type="text" disabled="true" size="4" name="thpe" id="thpe"/></td>
                        <td><input type="checkbox" name="blpe" id="blpe"/>Cnf
                            <input type="text" disabled="true" size="4" name="shpe" id="shpe"/>
                            <input id="GuardarComPE" value="Guardar" style="display: none;" type="button" class="boton" onclick="guardarPE();"/></td>
                    </tr>
                </form>
            </tfoot>
            <tbody id="cuerpocpe">
            </tbody>
        </table>
        </div>
        <br>
        <div align="left"><strong>
            <a id="pcompr" href="#" style="display: inline;" onclick="compED(1, 5);">+ </a>
            <a id="acompr" href="#" style="display: none;" onclick="compED(0, 5);">-- </a>
            Participación en proyectos. (Solo los aprobados)</strong> (Registrar horas totales del proyecto)
            <a id="ncompr" href="#" style="display: none;" onclick="nuevaED();">            [Crear Nuevo]</a>
        <table border="1" class="tabla" id="tabcpr" style="display: none;" >
            <thead>
                <th width="59%"><div align="center"><strong>Proyecto</strong></div></th>
                <th width="9%"><div align="center"><strong>Inicio</strong></div></th>
                <th width="9%"><div align="center"><strong>Final</strong></div></th>
                <th width="5%"><div align="center"><strong>Horas</strong></div></th>
                <th width="18%"><div align="center"><strong>Elimine</strong></div></th>
            </thead>
            <tfoot>
                <form name="fcomppr" action="">
                    <tr><td><input type="hidden" size="6" name="idcpr" id="idcpr"/>
                            <input type="hidden" size="6" name="idintpr" id="idintpr"/>
                            <input type="text" disabled="true" size="75" name="npr" id="npr"/>
                            <a href="#" onClick="return consultasModal('npr','idintpr',respComp,'104');"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                        <td><input type="text" size="10" name="finipr" id="finipr"/></td>
                        <td><input type="text" size="10" name="ffinpr" id="ffinpr"/></td>
                        <td><input type="text" size="4" name="thpr" id="thpr"/></td>
                        <td><input type="checkbox" name="blpr" id="blpr"/>Cnf
                            <input type="text" disabled="true" size="4" name="shpr" id="shpr"/>
                            <input id="GuardarComPR" value="Guardar" style="display: none;" type="button" class="boton" onclick="guardarED();"/></td>
                    </tr>
                </form>
            </tfoot>
            <tbody id="cuerpocpr">
            </tbody>
        </table>
        </div>
        <br>
        <div align="left"><strong>
            <a id="pcomoc" href="#" style="display: inline;" onclick="compOC(1);">+ </a>
            <a id="acomoc" href="#" style="display: none;" onclick="compOC(0);">-- </a>
            Otros Compromisos.</strong>(Registrar horas totales)
            <a id="ncomoc" href="#" style="display: none;" onclick="nuevaOC();">            [Crear Nuevo]</a>
        <table border="1" class="tabla" id="tabcooc" style="display: none;" >
            <thead>
                <th width="35%"><div align="center"><strong>Tipo</strong></div></th>
                <th width="40%"><div align="center"><strong>Descripción</strong></div></th>
                <th width="5%"><div align="center"><strong>Horas</strong></div></th>
                <th width="20%"><div align="center"><strong>Elimine</strong></div></th>
            </thead>
            <tfoot>
                <form name="fcompoc" action="">
                    <tr><td><input type="hidden" size="6" name="idcoc" id="idcoc"/>
                            <input type="hidden" size="6" name="idtpc" id="idtpc"/>
                            <input type="text" disabled="true" size="45" name="nooc" id="nooc"/>
                            <a href="#" onClick="return consultasModal('nooc','idtpc',respComp,'103');"><img ALIGN="MIDDLE" alt="" src="img/selector.gif"/></a></td>
                        <td><input type="text" size="55" name="desoc" id="desoc"/></td>
                        <td><input type="text" size="5" name="thoc" id="thoc"/></td>
                        <td><input type="checkbox" name="bloc" id="bloc"/>Cnf
                            <input type="text" disabled="true" size="4" name="shoc" id="shoc"/>
                            <input id="GuardarComOC" value="Guardar" style="display: none;" type="button" class="boton" onclick="guardarOC();"/></td>
                    </tr>
                </form>
            </tfoot>
            <tbody id="cuerpococ">
            </tbody>
        </table>
        </div>
    </body>
</html>