<%-- 
    Document   : ciudades
    Created on : 16/09/2011, 10:05:44 AM
    Author     : Julián Garcia
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

            function ver(){
                var tabla=document.getElementById('tablaH');
                var filas=tabla.rows;
                var tam=filas.length;
                for(var i = 0; i < tam; i++){
                    tabla.deleteRow(0);
                }
                //Realizar Peticion
                var url = 'getFiltros?tipo='+ Datos[0]+'&filtro=' + document.formulario.filtro.value ;
                conectarMethod(url,muestra,'POST');
                return false;
            }

            function muestra() {
                if(http_request.readyState != 4)
                    return ;
                if(http_request.status != 200)
                    return ;
                var xmldoc = http_request.responseXML;
                var lista = xmldoc.getElementsByTagName("lista")[0];
                var item =lista.getElementsByTagName("item");
                var elementos=["id","nombre"];
                var tamanos=["width :180px;","width :450px;"];
                var cuerpo=document.getElementById('cuerpoH'),fila,texto,nodo,columna,div;
                for(var i=0;i<item.length;i++){
                    fila=cuerpo.insertRow(0);
                    if ((i % 2) == 0) {
                        fila.style.background = "#FFFFFF";
                    } else {
                        fila.style.background = "#DDDDDD";
                    }
                    nodo=document.createElement("input");
                    nodo.setAttribute("type","radio");
                    nodo.setAttribute("name", "opciones");
                    nodo.setAttribute("value", item[i].getElementsByTagName("nombre")[0].firstChild.nodeValue+" -> "+item[i].getElementsByTagName("id")[0].firstChild.nodeValue);
                    columna=fila.insertCell(0);
                    div=document.createElement("div");
                    div.setAttribute("style", "width :20px;");
                    div.appendChild(nodo);
                    columna.appendChild(div);

                    columna=fila.insertCell(1);
                    div=document.createElement("div");
                    div.setAttribute("style", tamanos[1]);
                    texto=document.createTextNode(item[i].getElementsByTagName(elementos[1])[0].firstChild.nodeValue);
                    div.appendChild(texto);
                    columna.appendChild(div);

                }
                setVisibilidad(['buscar=inline']);
            }

        </script>
    </head>
    <body background="img/fondo.gif" onload="inicializar();">
        <form  name="formulario" action="">
            <div align="center"><input type="text" size="30" id="filtro"/>
                <input type="submit" class="boton" id="buscar" value="Buscar" onclick="return ver();"/></div>
            <table class="tabla" border="1" id="tablaP" align="center" width="605px">
                <thead>
                    <tr>
                        <th width="50px"><div align="center"><strong>Selección</strong></div></th>
                        <th width="310100px"><div align="center"><strong>Nombre</strong></div></th>
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