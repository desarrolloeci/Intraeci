<%-- 
    Document   : EDPr-Ppr-1
    Created on : 18/02/2014, 10:20:09 AM
    Author     : Lucero
--%>
<%@ include file="../secureprof.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>

<%
        HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        session.setAttribute("loginex", empleado.getUsrExchange());
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        String cedula = empleado.getIdemp();
        String flag = request.getParameter("flag");
        %>

        <SCRIPT LANGUAGE="JavaScript">

    function comprueba( ){
        for(i=1; i<77; i++){
            nombre = new String("P" + i);

            if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked) {
                alert("Por favor responda todos los campos de la encuesta");
                document.forms.form1[nombre][0].style.backgroundColor= '#ffcc00';
                document.forms.form1[nombre][0].focus();
                return false;
            }
        }
        return true;
    }

</SCRIPT>
<p class="Centro"><strong>EDPr-Ppr-1</strong></p>
	<form name="forma"  method="post" action="Autoevaluacion">
	<input type="hidden" name="total" value="76">
	<input type="hidden" name="idenc" value="167">
	<table width="98%" border="1" cellspacing="0" cellpadding="0">

		<tr><td rowspan="2" width="2%">1. </td>
		  <td rowspan="2" width="38%">Puede expresar con sus propias palabras, ejemplificar o reconocer en la pr�ctica la misi�n institucional:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td>
                  <td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td>
                  <td width="8%" align="center">En desacuerdo</td>
                  <td width="8%" align="center">Totalmente en desacuerdo</td>
                  <td width="8%" align="center">No sabe</td>
                  <td width="8%" align="center">No aplica</td>
                </tr>
		<tr><td width="8%" align="center"><input type="radio" name="P1" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P1" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P1" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P1" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P1" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P1" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P1" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">2. </td>
		  <td rowspan="2" width="38%">Puede expresar con sus propias palabras, ejemplificar o reconocer en la pr�ctica la prospectiva institucional (visi�n) consignada en el Plan de Desarrollo:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P2" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P2" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P2" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P2" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P2" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P2" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P2" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">3. </td>
		  <td rowspan="2" width="38%">Existe correspondencia entre los objetivos del programa acad�mico consignados en el proyecto de formaci�n y la misi�n institucional:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P3" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P3" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P3" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P3" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P3" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P3" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P3" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">4. </td>
		  <td rowspan="2" width="38%">Su comprensi�n del Proyecto de Formaci�n del Programa es suficiente:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P4" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P4" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P4" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P4" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P4" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P4" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P4" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">5. </td>
		  <td rowspan="2" width="38%">Los mecanismos de ingreso utilizados para la selecci�n de estudiantes est�n expresados claramente:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P5" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P5" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P5" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P5" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P5" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P5" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P5" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">6. </td>
		  <td rowspan="2" width="38%">La participaci�n de estudiantes en actividades acad�micas distintas de la docencia, que brinda la instituci�n o el programa para contribuir a la formaci�n integral, es adecuada:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P6" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P6" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P6" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P6" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P6" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P6" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P6" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">7. </td>
		  <td rowspan="2" width="38%">La participaci�n de estudiantes en actividades  culturales distintas de la docencia, que brinda la instituci�n o el programa para contribuir a la formaci�n integral, es suficiente:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P7" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P7" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P7" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P7" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P7" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P7" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P7" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">8. </td>
		  <td rowspan="2" width="38%">Los mecanismos utilizados por la Escuela para la divulgaci�n del Reglamento y R�gimen de participaci�n estudiantil son adecuados:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P8" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P8" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P8" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P8" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P8" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P8" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P8" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">9. </td>
		  <td rowspan="2" width="38%">La participaci�n del estudiantado en los �rganos de direcci�n del programa (Comit� de Programa) es adecuada:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P9" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P9" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P9" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P9" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P9" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P9" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P9" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">10. </td>
		  <td rowspan="2" width="38%">Las pol�ticas y estrategias sobre est�mulos acad�micos para los estudiantes se aplican de acuerdo con lo estipulado::</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P10" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P10" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P10" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P10" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P10" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P10" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P10" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">11. </td>
		  <td rowspan="2" width="38%">Las pol�ticas, normas y criterios acad�micos establecidos por la instituci�n para la selecci�n y la vinculaci�n de los profesores son conocidos:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P11" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P11" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P11" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P11" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P11" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P11" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P11" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">12. </td>
		  <td rowspan="2" width="38%">Las pol�ticas, normas y criterios acad�micos establecidos por la instituci�n para la selecci�n y la vinculaci�n de los profesores son claros:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P12" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P12" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P12" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P12" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P12" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P12" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P12" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">13. </td>
		  <td rowspan="2" width="38%">Las pol�ticas, normas y criterios acad�micos establecidos por la instituci�n para la selecci�n y la vinculaci�n de los profesores se aplican de acuerdo con lo estipulado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P13" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P13" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P13" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P13" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P13" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P13" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P13" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">14. </td>
		  <td rowspan="2" width="38%">Las pol�ticas institucionales en materia de participaci�n del profesorado en los �rganos de direcci�n de la instituci�n y del programa se aplican de acuerdo con lo estipulado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P14" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P14" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P14" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P14" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P14" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P14" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P14" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">15. </td>
		  <td rowspan="2" width="38%">El nivel de formaci�n de los profesores del programa y de los que le prestan servicios de docencia es adecuado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P15" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P15" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P15" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P15" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P15" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P15" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P15" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">16. </td>
		  <td rowspan="2" width="38%">El conocimiento disciplinar de los profesores del programa y de los que le prestan servicios de docencia es adecuado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P16" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P16" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P16" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P16" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P16" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P16" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P16" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">17. </td>
		  <td rowspan="2" width="38%">El conocimiento pedag�gico de los profesores del programa y de los que le prestan servicios de docencia es adecuado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P17" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P17" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P17" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P17" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P17" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P17" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P17" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">18. </td>
		  <td rowspan="2" width="38%">La experiencia profesional de los profesores del programa y de los que le prestan servicios de docencia es adecuada:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P18" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P18" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P18" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P18" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P18" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P18" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P18" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">19. </td>
		  <td rowspan="2" width="38%">Las pol�ticas de capacitaci�n y actualizaci�n del profesorado en los aspectos acad�micos,   pedag�gicos y profesionales,  relacionados con el programa se aplican de acuerdo con lo estipulado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo </td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P19" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P19" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P19" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P19" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P19" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P19" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P19" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">20. </td>
		  <td rowspan="2" width="38%">Las pol�ticas de est�mulo y reconocimiento a los profesores por el ejercicio calificado de la docencia, se aplican de acuerdo con lo estipulado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P20" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P20" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P20" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P20" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P20" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P20" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P20" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">21. </td>
		  <td rowspan="2" width="38%">Las pol�ticas de est�mulo y reconocimiento a los profesores por el ejercicio calificado de la investigaci�n e innovaci�n, se aplican de acuerdo con lo estipulado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P21" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P21" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P21" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P21" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P21" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P21" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P21" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">22. </td>
		  <td rowspan="2" width="38%">Las pol�ticas de est�mulo y reconocimiento a los profesores por el ejercicio calificado de la extensi�n o proyecci�n social, se aplican de acuerdo con lo estipulado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P22" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P22" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P22" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P22" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P22" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P22" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P22" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">23. </td>
		  <td rowspan="2" width="38%">Las pol�ticas de est�mulo y reconocimiento a los profesores por el ejercicio calificado de la cooperaci�n internacional, se aplican de acuerdo con lo estipulado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P23" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P23" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P23" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P23" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P23" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P23" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P23" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">24. </td>
		  <td rowspan="2" width="38%">Los criterios y mecanismos de evaluaci�n de los profesores corresponden a la naturaleza del cargo,  las funciones y los compromisos contra�dos en relaci�n con las metas institucionales y del programa:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P24" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P24" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P24" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P24" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P24" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P24" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P24" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">25. </td>
		  <td rowspan="2" width="38%">En el curr�culo se manifiesta un Proyecto de Formaci�n de calidad
</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P25" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P25" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P25" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P25" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P25" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P25" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P25" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">26. </td>
		  <td rowspan="2" width="38%">El curr�culo del programa contempla la docencia, investigaci�n y proyecci�n social, as� como las actividades culturales, art�sticas y de bienestar para el logro de la formaci�n integral:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P26" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P26" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P26" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P26" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P26" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P26" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P26" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">27. </td>
		  <td rowspan="2" width="38%">Los profesores utilizan estrategias  para el fomento de la creatividad y el desarrollo del pensamiento aut�nomo en los estudiantes.</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P27" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P27" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P27" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P27" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P27" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P27" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P27" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">28. </td>
		  <td rowspan="2" width="38%">Los profesores utilizan estrategias  efectivas para  el desarrollo de conocimientos, capacidades y habilidades comunicativas en un segundo idioma extranjero:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P28" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P28" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P28" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P28" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P28" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P28" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P28" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">29. </td>
		  <td rowspan="2" width="38%">Los m�todos de ense�anza utilizados por el profesor son acordes con las actitudes, conocimientos, capacidades, y habilidades que se espera alcanzar:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P29" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P29" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P29" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P29" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P29" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P29" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P29" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">30. </td>
		  <td rowspan="2" width="38%">Los m�todos de ense�anza utilizados por el profesor son acordes con el desarrollo de los contenidos del Plan de Estudios:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P30" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P30" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P30" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P30" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P30" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P30" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P30" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">31. </td>
		  <td rowspan="2" width="38%">Las estrategias ofrecidas para que el estudiante pueda adelantar con calidad su Proyecto de Formaci�n en el  tiempo previsto son adecuadas:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P31" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P31" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P31" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P31" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P31" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P31" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P31" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">32. </td>
		  <td rowspan="2" width="38%">La forma y contenido de los trabajos realizados por los estudiantes corresponde a los objetivos de logro definidos en estos trabajos, incluyendo la formaci�n personal:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P32" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P32" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P32" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P32" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P32" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P32" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P32" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">33. </td>
		  <td rowspan="2" width="38%">Existe correspondencia entre las actividades y trabajos realizados por los estudiantes y las formas de evaluaci�n de sus actitudes, conocimientos, capacidades y habilidades:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P33" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P33" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P33" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P33" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P33" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P33" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P33" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">34. </td>
		  <td rowspan="2" width="38%">Las estrategias y mecanismos para incentivar en el estudiante la consulta y uso de material bibliogr�fico son adecuados:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P34" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P34" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P34" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P34" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P34" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P34" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P34" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">35. </td>
		  <td rowspan="2" width="38%">Los criterios y pol�ticas institucionales y del programa en materia de acceso al material bibliogr�fico  se aplican de acuerdo con lo estipulado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P35" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P35" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P35" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P35" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P35" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P35" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P35" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">36. </td>
		  <td rowspan="2" width="38%">Los criterios y pol�ticas institucionales y del programa en materia de adquisici�n  y actualizaci�n de material bibliogr�fico  se aplican de acuerdo con lo estipulado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P36" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P36" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P36" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P36" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P36" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P36" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P36" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">37. </td>
		  <td rowspan="2" width="38%">El material bibliogr�fico con que cuenta el programa para apoyar el desarrollo de las distintas actividades acad�micas responde a sus necesidades:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P37" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P37" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P37" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P37" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P37" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P37" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P37" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">38. </td>
		  <td rowspan="2" width="38%">El material bibliogr�fico con que cuenta el programa para apoyar el desarrollo de las distintas actividades acad�micas es actualizado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P38" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P38" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P38" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P38" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P38" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P38" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P38" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">39. </td>
		  <td rowspan="2" width="38%">El material bibliogr�fico con que cuenta el programa para apoyar el desarrollo de las distintas actividades acad�micas es suficiente:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P39" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P39" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P39" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P39" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P39" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P39" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P39" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">40. </td>
		  <td rowspan="2" width="38%">El servicio que presta la plataforma tecnol�gica en cuanto a conectividad, interactividad  y acceso a los sistemas de informaci�n es adecuado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P40" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P40" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P40" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P40" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P40" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P40" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P40" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">41. </td>
		  <td rowspan="2" width="38%">El servicio que presta la plataforma tecnol�gica en cuanto a apoyos y recursos para el aprendizaje es adecuado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P41" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P41" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P41" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P41" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P41" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P41" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P41" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">42. </td>
		  <td rowspan="2" width="38%">Los recursos inform�ticos y de comunicaci�n para apoyar los procesos acad�micos del programa se caracterizan por estar disponibles:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P42" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P42" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P42" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P42" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P42" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P42" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P42" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">43. </td>
		  <td rowspan="2" width="38%">Los recursos inform�ticos y de comunicaci�n para apoyar los procesos acad�micos del programa se caracterizan por su actualizaci�n:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P43" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P43" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P43" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P43" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P43" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P43" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P43" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">44. </td>
		  <td rowspan="2" width="38%">Los recursos inform�ticos y de comunicaci�n para apoyar los procesos acad�micos del programa se caracterizan por su calidad:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P44" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P44" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P44" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P44" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P44" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P44" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P44" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">45. </td>
		  <td rowspan="2" width="38%">Los recursos inform�ticos y de comunicaci�n se caracterizan por responder a las necesidades de la comunidad institucional :</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P45" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P45" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P45" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P45" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P45" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P45" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P45" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">46. </td>
		  <td rowspan="2" width="38%">Los recursos inform�ticos y de comunicaci�n se caracterizan por ser suficientes:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P46" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P46" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P46" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P46" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P46" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P46" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P46" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">47. </td>
		  <td rowspan="2" width="38%">La dotaci�n de  equipos, materiales e insumos de los laboratorios y talleres para el �ptimo desarrollo de la actividad docente, investigativa y de extensi�n es adecuada:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P47" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P47" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P47" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P47" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P47" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P47" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P47" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">48. </td>
		  <td rowspan="2" width="38%">La capacidad de los laboratorios y talleres es adecuada: </td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P48" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P48" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P48" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P48" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P48" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P48" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P48" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">49. </td>
		  <td rowspan="2" width="38%">La disponibilidad de los laboratorios, talleres y ayudas audiovisuales es adecuada:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P49" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P49" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P49" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P49" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P49" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P49" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P49" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">50. </td>
		  <td rowspan="2" width="38%">La dotaci�n de salones con ayudas audiovisuales es suficiente: </td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P50" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P50" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P50" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P50" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P50" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P50" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P50" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">51. </td>
		  <td rowspan="2" width="38%">Los laboratorios, talleres y ayudas audiovisuales son utilizados de manera adecuada:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P51" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P51" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P51" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P51" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P51" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P51" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P51" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">52. </td>
		  <td rowspan="2" width="38%">Se utilizan mecanismos para incentivar en los estudiantes la generaci�n de ideas y problemas de investigaci�n susceptibles de resolver mediante la aplicaci�n del conocimiento y la innovaci�n: </td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P52" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P52" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P52" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P52" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P52" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P52" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P52" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">53. </td>
		  <td rowspan="2" width="38%">Se utilizan mecanismos para incentivar en los estudiantes la identificaci�n de problemas en el �mbito empresarial susceptibles de resolver mediante la aplicaci�n del conocimiento y la innovaci�n:
</td>
		  <td width="8%" align="center">Totalmente de acuerdo </td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P53" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P53" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P53" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P53" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P53" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P53" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P53" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">54. </td>
		  <td rowspan="2" width="38%">Los procesos administrativos orientados al desarrollo de la  docencia, investigaci�n, la relaci�n con el entorno son eficientes:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P54" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P54" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P54" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P54" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P54" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P54" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P54" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">55. </td>
		  <td rowspan="2" width="38%">Los procesos administrativos orientados al desarrollo de la docencia, investigaci�n, la relaci�n con el entorno son eficaces:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P55" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P55" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P55" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P55" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P55" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P55" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P55" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">56. </td>
		  <td rowspan="2" width="38%">Los sistemas y mecanismos de informaci�n utilizados en el programa facilitan la comunicaci�n interna y externa:   </td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P56" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P56" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P56" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P56" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P56" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P56" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P56" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">57. </td>
		  <td rowspan="2" width="38%">El portal web de la Escuela contiene informaci�n actualizada sobre los temas de inter�s institucional: </td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P57" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P57" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P57" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P57" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P57" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P57" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P57" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">58. </td>
		  <td rowspan="2" width="38%">El portal web de la Escuela es efectivo:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P58" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P58" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P58" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P58" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P58" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P58" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P58" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">59. </td>
		  <td rowspan="2" width="38%">El portal web de la Escuela facilita la comunicaci�n acad�mica y administrativa.</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P59" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P59" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P59" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P59" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P59" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P59" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P59" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">60. </td>
		  <td rowspan="2" width="38%">El portal web de la Escuela incluye  informaci�n detallada y actualizada sobre el curr�culo:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P60" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P60" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P60" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P60" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P60" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P60" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P60" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">61. </td>
		  <td rowspan="2" width="38%">El portal web de la Escuela incluye  informaci�n detallada y actualizada sobre la  formaci�n y trayectoria de los profesores del programa:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P61" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P61" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P61" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P61" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P61" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P61" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P61" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">62. </td>
		  <td rowspan="2" width="38%">El acceso a los sistemas de comunicaci�n e informaci�n mediados por la tecnolog�a, es de calidad:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P62" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P62" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P62" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P62" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P62" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P62" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P62" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">63. </td>
		  <td rowspan="2" width="38%">Existen mecanismos que faciliten a la poblaci�n estudiantil el acceso a la informaci�n.</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P63" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P63" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P63" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P63" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P63" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P63" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P63" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">64. </td>
		  <td rowspan="2" width="38%">Los mecanismos de participaci�n de la comunidad acad�mica son usados para la adecuada gesti�n del programa:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P64" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P64" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P64" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P64" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P64" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P64" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P64" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">65. </td>
		  <td rowspan="2" width="38%">La ubicaci�n profesional de los graduados corresponde al perfil de formaci�n del programa:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P65" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P65" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P65" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P65" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P65" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P65" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P65" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">66. </td>
		  <td rowspan="2" width="38%">Los mecanismos o estrategias  utilizadas en el programa facilitan el paso del estudiante al mundo laboral:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P66" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P66" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P66" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P66" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P66" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P66" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P66" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">67. </td>
		  <td rowspan="2" width="38%">Los espacios f�sicos existentes para el desarrollo de la docencia, investigaci�n, la relaci�n con el entorno  y el bienestar institucional son adecuados:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P67" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P67" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P67" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P67" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P67" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P67" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P67" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">68. </td>
		  <td rowspan="2" width="38%">El acceso a la planta f�sica es adecuado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P68" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P68" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P68" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P68" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P68" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P68" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P68" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">69. </td>
		  <td rowspan="2" width="38%">El dise�o de la planta f�sica es adecuado:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P69" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P69" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P69" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P69" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P69" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P69" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P69" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">70. </td>
		  <td rowspan="2" width="38%">La capacidad de la planta f�sica es adecuada:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P70" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P70" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P70" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P70" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P70" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P70" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P70" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">71. </td>
		  <td rowspan="2" width="38%">La iluminaci�n de la planta f�sica es adecuada:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P71" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P71" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P71" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P71" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P71" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P71" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P71" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">72. </td>
		  <td rowspan="2" width="38%">La ventilaci�n de la planta f�sica es adecuada:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P72" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P72" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P72" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P72" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P72" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P72" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P72" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">73. </td>
		  <td rowspan="2" width="38%">Las condiciones de seguridad e higiene de la planta f�sica son adecuadas:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P73" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P73" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P73" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P73" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P73" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P73" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P73" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">74. </td>
		  <td rowspan="2" width="38%">Los recursos presupuestales asignados al programa son suficientes:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P74" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P74" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P74" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P74" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P74" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P74" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P74" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">75. </td>
		  <td rowspan="2" width="38%">La ejecuci�n de los recursos presupuestales asignados al  programa, es eficiente:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P75" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P75" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P75" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P75" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P75" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P75" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P75" value="N"></td> </tr>
		<tr><td rowspan="2" width="2%">76. </td>
		  <td rowspan="2" width="38%">La asignaci�n de recursos f�sicos y financieros para el programa se realizan de forma equitativa:</td>
		  <td width="8%" align="center">Totalmente de acuerdo</td><td width="8%" align="center">De acuerdo</td>
		  <td width="8%" align="center">Ni de acuerdo, ni en desacuerdo</td><td width="8%" align="center">En desacuerdo</td><td width="8%" align="center">Totalmente en desacuerdo</td><td width="8%" align="center">No sabe</td><td width="8%" align="center">No aplica</td></tr>
		<tr><td width="8%" align="center"><input type="radio" name="P76" value="9"></td>
		  <td width="8%" align="center"><input type="radio" name="P76" value="7"></td>
		  <td width="8%" align="center"><input type="radio" name="P76" value="5"></td>
		  <td width="8%" align="center"><input type="radio" name="P76" value="3"></td>
		  <td width="8%" align="center"><input type="radio" name="P76" value="1"></td>
  		  <td width="8%" align="center"><input type="radio" name="P76" value="0"></td>
  		  <td width="8%" align="center"><input type="radio" name="P76" value="N"></td> </tr>

</table>

<p>&nbsp;</p>
  <input type="submit" name="Submit" value="Enviar Datos">
</form>
</body>
</html>

