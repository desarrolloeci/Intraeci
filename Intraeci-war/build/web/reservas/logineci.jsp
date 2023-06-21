<%@ page import="java.util.*"%>
<html>

<head>
<title>ESCUELA COLOMBIANA DE INGENIERIA</title>
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<base target="resultado">
<meta name="Microsoft Border" content="none">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="expires">

<%
Vector mes = new Vector();
int i;
mes.addElement("ene");
mes.addElement("feb");
mes.addElement("mar");
mes.addElement("abr");
mes.addElement("may");
mes.addElement("jun");
mes.addElement("jul");
mes.addElement("ago");
mes.addElement("sep");
mes.addElement("oct");
mes.addElement("nov");
mes.addElement("dic");
%>
<SCRIPT LANGUAGE="JavaScript">
function comprueba( ){
    if(document.forms.form1.desded.value == "" || document.forms.form1.desdea.value == ""){
        alert("El campo Desde no puede estar vacio");
        return false;
    }
    if(document.forms.form1.hastad.value == "" || document.forms.form1.hastaa.value == ""){
        alert("El campo Hasta no puede estar vacio");
        return false;
    }
    document.forms.form1.desde.value = document.forms.form1.desded.value + "-" + document.forms.form1.desdem.value + "-" + document.forms.form1.desdea.value;
    document.forms.form1.hasta.value = document.forms.form1.hastad.value + "-" + document.forms.form1.hastam.value + "-" + document.forms.form1.hastaa.value;
    document.forms.form1.action = "consultReserva.jsp";
}

function compruebaud( ){
    if(document.forms.form1.desded.value == "" || document.forms.form1.desdea.value == ""){
        alert("El campo Desde no puede estar vacio");
        return false;
    }
    if(document.forms.form1.hastad.value == "" || document.forms.form1.hastaa.value == ""){
        alert("El campo Hasta no puede estar vacio");
        return false;
    }
    document.forms.form1.desde.value = document.forms.form1.desded.value + "-" + document.forms.form1.desdem.value + "-" + document.forms.form1.desdea.value;
    document.forms.form1.hasta.value = document.forms.form1.hastad.value + "-" + document.forms.form1.hastam.value + "-" + document.forms.form1.hastaa.value;
    document.forms.form1.action = "consultReservaud.jsp";
}

function llenar( ){
    document.forms.form1.hastad.value = document.forms.form1.desded.value;
    document.forms.form1.hastam.value = document.forms.form1.desdem.value;
    document.forms.form1.hastaa.value = document.forms.form1.desdea.value;
}
</SCRIPT>

</head>

<body text="#000000"  link="#070785" vlink="#070785">
<form name="form1" METHOD="post" action="">
  <p><font size="4" color="#b11d55"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#aa0000">Ingrese 
  las fechas para la consulta :</font></b></font></font></p>
<br>
  <font size="4" color="#b11d55">
  <table width="229" height="153" border="0" align="left" cellpadding="0" cellspacing="0">
    <tr bgcolor="#EEEEEE"> 
      <td width="64" height="36"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Desde: 
        </b></font></td>
      <td width="165" height="36" bgcolor="#EEEEEE">	  <font face="Verdana, Arial, Helvetica, sans-serif"> 
        <input name="desded" id="desded" size="2" maxlength="2">
        <font size="1"> <b>
        <select name="desdem" id="desdem">
            <option value="<%=mes.elementAt(0)%>" selected><%=mes.elementAt(0)%></option>
<%
        for(i=1; i<mes.size(); i++){%>
            <option value="<%=mes.elementAt(i)%>"><%=mes.elementAt(i)%></option>
<%      }
            %>            
        </select>
        <input name="desdea" type="text" id="desdea" size="4" maxlength="4">
        </b></font></font></td>
    </tr>
    <tr> 
      <td height="33" width="64" bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif"><strong><font size="2"><b>Hasta</b></font>:&nbsp;&nbsp; 
        </strong> </font></td>
      <td height="33" width="165" bgcolor="#EEEEEE"> <font face="Verdana, Arial, Helvetica, sans-serif"> 
        <input name="hastad" id="hastad" size="2" maxlength="2" onfocus="llenar();">
        <font size="1"> <b>
        <select name="hastam" id="hastam">            
            <option value="<%=mes.elementAt(0)%>" selected><%=mes.elementAt(0)%></option>
<%
        for(i=1; i<mes.size(); i++){%>
            <option value="<%=mes.elementAt(i)%>"><%=mes.elementAt(i)%></option>
<%      }
            %>  
        </select>
        <input name="hastaa" type="text" id="hastaa" size="4" maxlength="4">
        </b></font></font></td>
    </tr>
    <tr> </tr>
    <tr> </tr>
    <tr> 
      <td height="1" colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif">&nbsp;
        <input name="desde" type="hidden" id="desde">
        <input name="hasta" type="hidden" id="hasta">
</font></td>
    </tr>
	<tr> 
      <td height="41" colspan="2"> 
        <div align="left"> 
          <p align="center"> <font face="Verdana, Arial, Helvetica, sans-serif"> 
            <input name="consultar" type="submit" id="consultar" onClick="return comprueba( );" value="Consultar">
            </font></p>
        </div>
      </td>
    </tr>
    <tr> 
      <td height="1" colspan="2"> 
        <div align="left"> 
          <p align="center"> <font face="Verdana, Arial, Helvetica, sans-serif"> 
            <input name="consultar" type="submit" id="consultar" onClick="return compruebaud( );" value="Consultar Auditorio">
            </font></p>
        </div>
      </td>
    </tr>
  </table>
  </font>
</form>
</body>
</html>
