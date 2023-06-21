<%-- 
    Document   : listCentroCostos
    Created on : 12/08/2011, 11:08:40 AM
    Author     : Juan Pablo Garcia
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Centros de Costos</title>
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

            function inicializar(){
                Datos = dialogArguments;
            }

            function enviar (formulario) {
                for (var i=0;i<formulario.opciones.length;i++)
                {
                    if (formulario.opciones[i].checked){
                        var c=formulario.opciones[i].value.split(" -> ");
                        Datos[0]=c[0];
                        Datos[1]=c[1];
                        break;
                    }
                }
                window.returnValue = Datos;
                window.close();
                return false;
            }

            function verCentroCostos(){
                setVisibilidad(['buscar=none']);
                var tabla=document.getElementById('tablaH');
                var filas=tabla.rows;
                var tam=filas.length;
                for(var i = 0; i < tam; i++){
                    tabla.deleteRow(0);
                }
                //Realizar Peticion
                var url = 'getFiltros?tipo=0&caso=1&filtro='+document.getElementById('nombre').value;
                conectarX(url,muestraCentroCostos);
                return false;
            }

            function muestraCentroCostos() {
                if(http_request.readyState == 4) {
                    if(http_request.status == 200) {
                        var xmldoc = http_request.responseXML;
                        var ccXML = xmldoc.getElementsByTagName("centrosCostos")[0];
                        var CentroCostos=ccXML.getElementsByTagName("centroCosto");
                        var elementos=["id","nombre","cod"];
                        var tamanos=["width :210px;","width :85px;","width :220px;"];
                        var cuerpo=document.getElementById('cuerpoH'),fila,texto,nodo,columna,div;
                        for(var i=0;i<CentroCostos.length;i++){
                            fila=cuerpo.insertRow(0);
                            if ((i % 2) == 0) {
                                fila.style.background = "#FFFFFF";
                            } else {
                                fila.style.background = "#DDDDDD";
                            }
                            columna=fila.insertCell(0);
                            columna.innerHTML="<div style='width :20px;'><input name='opciones' type='radio' value='"+CentroCostos[i].getElementsByTagName("nombre")[0].firstChild.nodeValue+" -> "+CentroCostos[i].getElementsByTagName("id")[0].firstChild.nodeValue+"'/></div>";
                            for(var j=1;j<=3;j++){
                                columna=fila.insertCell(j);
                                div=document.createElement("div");
                                div.setAttribute("style", tamanos[j-1]);
                                texto=document.createTextNode(CentroCostos[i].getElementsByTagName(elementos[j-1])[0].firstChild.nodeValue);
                                div.appendChild(texto);
                                columna.appendChild(div);
                            }
                        }
                        setVisibilidad(['buscar=inline']);
                    }
                }
            }

        </script>
    </head>
    <body background="img/fondoblanco.gif" onload="inicializar();">
        <form  name="formulario">
            <div align="center"><input type="text" id="nombre"/><input type="submit" class="boton" id="buscar" value="Buscar" onclick="return verCentroCostos();"/></div>
            <table class="tabla" border="1" id="tablaP" align="center" width="605px">
                <thead>
                    <tr>
                        <th width="50px"><div align="center"><strong>Identificador</strong></div></th>
                        <th width="310100px"><div align="center"><strong>Nombre</strong></div></th>
                        <th width="255px"><div align="center"><strong>Codigo</strong></div></th>
                    </tr>
                </thead>
                <tbody id="cuerpo">
                    <tr>
                        <td colspan="3">
                            <div id="tbody">
                                <table id="tablaH" class="tabla" width="100%">
                                    <tbody id="cuerpoH">
                                    </tbody>
                                </table>
                            </div>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">
                            <div align="center"><input name="radio2" type="submit" value="Aceptar" onClick="return enviar(this.form)" class="boton"></div>
                        </td>
                    </tr>
                </tfoot>
            </table>
            <input type="hidden" name="opciones" value=" -> "/>
        </form>
    </body>
</html>