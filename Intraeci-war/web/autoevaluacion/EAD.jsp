<%@ include file="../secureprof.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>

<%HttpSession sesion;
            response.setHeader("Cache-Control", "no-cache");
            session.setAttribute("loginex", empleado.getUsrExchange());
            inicio.conectaEJB conEjb = new inicio.conectaEJB();
            BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
            String cedula = empleado.getIdemp();
            String flag = request.getParameter("flag");
            String prog = request.getParameter("prog");%>

<SCRIPT LANGUAGE="JavaScript">

    function comprueba( ){
        for(i=1; i<10; i++){
            nombre = new String("P" + i);

            if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked) {
                alert("Por favor responda todos los campos de la encuesta");
                document.forms.form1[nombre][0].style.backgroundColor= '#ffcc00';
                document.forms.form1[nombre][0].focus();
                return false;
            }
        }
        return true;
    }

</SCRIPT>
<style type="text/css"></style>
<p class="Centro" align="center"><strong>Encuesta Administrativos</strong></p>
<form name="form1"  method="post" onSubmit="return comprueba( );" action="autoevaluacion">
    <input type="hidden" name="total" value="9">
    <input type="hidden" name="idenc" value="134">
    <input type="hidden" name="flag" value="<%=flag%>">
    <input type="hidden" name="prog" value="<%=prog%>">

    <table width="98%" border="1" cellspacing="0" cellpadding="0">

        <tr><td rowspan="2" width="2%">1</td>
            <td rowspan="2" width="38%">Administrativos: El Programa tiene claramente definidas las funciones del personal administrativo. </td>
            <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
            <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
        <tr><td width="11%" align="center"><input type="radio" name="P1" value="5"></td>
            <td width="11%" align="center"><input type="radio" name="P1" value="4"></td>
            <td width="11%" align="center"><input type="radio" name="P1" value="3"></td>
            <td width="11%" align="center"><input type="radio" name="P1" value="2"></td>
            <td width="12%" align="center"><input type="radio" name="P1" value="1"></td></tr>
        <tr><td rowspan="2" width="2%">2</td>

            <td rowspan="2" width="38%"> Las funciones y procesos administrativos que
                se realizan en el programa por parte de la decanatura y de los laboratorios
                son eficientes:</td>
            <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
            <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
        <tr><td width="11%" align="center"><input type="radio" name="P2" value="5"></td>
            <td width="11%" align="center"><input type="radio" name="P2" value="4"></td>
            <td width="11%" align="center"><input type="radio" name="P2" value="3"></td>
            <td width="11%" align="center"><input type="radio" name="P2" value="2"></td>
            <td width="12%" align="center"><input type="radio" name="P2" value="1"></td></tr>
        <tr><td rowspan="2" width="2%">3</td>

            <td rowspan="2" width="38%"> Las funciones y procesos administrativos que
                se realizan en el programa por parte de la decanatura y de los laboratorios
                son eficaces:</td>
            <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
            <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
        <tr><td width="11%" align="center"><input type="radio" name="P3" value="5"></td>
            <td width="11%" align="center"><input type="radio" name="P3" value="4"></td>
            <td width="11%" align="center"><input type="radio" name="P3" value="3"></td>
            <td width="11%" align="center"><input type="radio" name="P3" value="2"></td>
            <td width="12%" align="center"><input type="radio" name="P3" value="1"></td></tr>
        <tr><td rowspan="2" width="2%">4</td>

            <td rowspan="2" width="38%">Las funciones y procesos administrativos que
                se realizan en el programa por parte de la decanatura y de los laboratorios
                son claros:</td>
            <td width="11%" align="center">Totalmente de acuerdo</td><td width="11%" align="center">De acuerdo</td>
            <td width="11%" align="center">Parcialmente de acuerdo</td><td width="11%" align="center">En desacuerdo</td><td width="12%" align="center">En total desacuerdo</td></tr>
        <tr><td width="11%" align="center"><input type="radio" name="P4" value="5"></td>
            <td width="11%" align="center"><input type="radio" name="P4" value="4"></td>
            <td width="11%" align="center"><input type="radio" name="P4" value="3"></td>
            <td width="11%" align="center"><input type="radio" name="P4" value="2"></td>
            <td width="12%" align="center"><input type="radio" name="P4" value="1"></td></tr>
        <tr><td rowspan="2" width="2%">5</td>

            <td rowspan="2" width="38%">
                <p>La accesibilidad de los espacios f&iacute;sicos de la Escuela, utilizados
                    en su puesto de trabajo para la operaci&oacute;n del Programa, es:</p>
            </td>
            <td width="11%" align="center">Muy adecuada</td><td width="11%" align="center">Adecuada</td>
            <td width="11%" align="center">Parcialmente adecuada</td><td width="11%" align="center">Poco adecuada</td><td width="12%" align="center">Nada adecuada</td></tr>
        <tr><td width="11%" align="center"><input type="radio" name="P5" value="5"></td>
            <td width="11%" align="center"><input type="radio" name="P5" value="4"></td>
            <td width="11%" align="center"><input type="radio" name="P5" value="3"></td>
            <td width="11%" align="center"><input type="radio" name="P5" value="2"></td>
            <td width="12%" align="center"><input type="radio" name="P5" value="1"></td></tr>
        <tr><td rowspan="2" width="2%">6</td>

            <td rowspan="2" width="38%">La capacidad de los espacios f&iacute;sicos
                de la Escuela, utilizados en su puesto de trabajo para la operaci&oacute;n
                del Programa, es:</td>
            <td width="11%" align="center">Muy adecuada</td><td width="11%" align="center">Adecuada</td>
            <td width="11%" align="center">Parcialmente adecuada</td><td width="11%" align="center">Poco adecuada</td><td width="12%" align="center">Nada adecuada</td></tr>
        <tr><td width="11%" align="center"><input type="radio" name="P6" value="5"></td>
            <td width="11%" align="center"><input type="radio" name="P6" value="4"></td>
            <td width="11%" align="center"><input type="radio" name="P6" value="3"></td>
            <td width="11%" align="center"><input type="radio" name="P6" value="2"></td>
            <td width="12%" align="center"><input type="radio" name="P6" value="1"></td></tr>
        <tr><td rowspan="2" width="2%">7</td>

            <td rowspan="2" width="38%"> La iluminaci&oacute;n de los espacios f&iacute;sicos
                de la Escuela, utilizados en su puesto de trabajo para la operaci&oacute;n
                del Programa,es:</td>
            <td width="11%" align="center">Muy adecuada</td><td width="11%" align="center">Adecuada</td>
            <td width="11%" align="center">Parcialmente adecuada</td><td width="11%" align="center">Poco adecuada</td><td width="12%" align="center">Nada adecuada</td></tr>
        <tr><td width="11%" align="center"><input type="radio" name="P7" value="5"></td>
            <td width="11%" align="center"><input type="radio" name="P7" value="4"></td>
            <td width="11%" align="center"><input type="radio" name="P7" value="3"></td>
            <td width="11%" align="center"><input type="radio" name="P7" value="2"></td>
            <td width="12%" align="center"><input type="radio" name="P7" value="1"></td></tr>
        <tr><td rowspan="2" width="2%">8</td>

            <td rowspan="2" width="38%"> La ventilaci&oacute;n de los espacios f&iacute;sicos
                de la Escuela, utilizados en su puesto de trabajo para la operaci&oacute;n
                del Programa,es:</td>
            <td width="11%" align="center">Muy adecuada</td><td width="11%" align="center">Adecuada</td>
            <td width="11%" align="center">Parcialmente adecuada</td><td width="11%" align="center">Poco adecuada</td><td width="12%" align="center">Nada adecuada</td></tr>
        <tr><td width="11%" align="center"><input type="radio" name="P8" value="5"></td>
            <td width="11%" align="center"><input type="radio" name="P8" value="4"></td>
            <td width="11%" align="center"><input type="radio" name="P8" value="3"></td>
            <td width="11%" align="center"><input type="radio" name="P8" value="2"></td>
            <td width="12%" align="center"><input type="radio" name="P8" value="1"></td></tr>
        <tr><td rowspan="2" width="2%">9</td>

            <td rowspan="2" width="38%"> La seguridad e higiene de los espacios f&iacute;sicos
                de la Escuela, utilizados en su puesto de trabajo para la operaci&oacute;n
                del Programa, es:</td>
            <td width="11%" align="center">Muy adecuada</td><td width="11%" align="center">Adecuada</td>
            <td width="11%" align="center">Parcialmente adecuada</td><td width="11%" align="center">Poco adecuada</td><td width="12%" align="center">Nada adecuada</td></tr>
        <tr><td width="11%" align="center"><input type="radio" name="P9" value="5"></td>
            <td width="11%" align="center"><input type="radio" name="P9" value="4"></td>
            <td width="11%" align="center"><input type="radio" name="P9" value="3"></td>
            <td width="11%" align="center"><input type="radio" name="P9" value="2"></td>
            <td width="12%" align="center"><input type="radio" name="P9" value="1"></td></tr>

    </table>

    <p>&nbsp;</p>
    <div align="center">
        <input type="submit" name="Submit" value="Enviar Datos">
    </div>
</form>
</body>
</html>

