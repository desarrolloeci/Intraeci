<%-- 
    Document   : Encuestas
    Created on : 26/09/2011, 09:50:26 AM
    Author     : lrodriguez
--%>

<%@ include file="../secureprof.jsp" %>
<%@ page import="javax.naming.*,
         javax.rmi.PortableRemoteObject,
         login.InicioProfRemoteBusiness,
         login.InicioProfRemoteHome"%>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>

<%HttpSession sesion;
        response.setHeader("Cache-Control", "no-cache");
        session.setAttribute("loginex", empleado.getUsrExchange());
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        String cedula = empleado.getIdemp();
          //String cedula = request.getParameter("cedula");
        Vector Datos = admin.DatosEncuestas(cedula);%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Encuestas Autoevaluación con fines de Acreditación Institucional</title>
    </head>
    <body>
        <% if (Datos.size() > 0) {          
            String iden = Datos.elementAt(1).toString();
            String flag1 = Datos.elementAt(2).toString();
            String iden2=  Datos.elementAt(3).toString();
            String flag2 = Datos.elementAt(4).toString();
            String prog= Datos.elementAt(5).toString();
             if (iden.equals("12") && flag1.equals("0")) {
                response.sendRedirect("EPP1?flag=1&prog="+prog);
            } else if (iden.equals("13") && flag1.equals("0")) {
                response.sendRedirect("EPP2?flag=1");
            } else if (iden.equals("14") && flag1.equals("0")) {
                response.sendRedirect("EPC?flag=1");
            } else if (iden.equals("15") && flag1.equals("0")) {
                response.sendRedirect("ECA?flag=1");
            } else if (iden.equals("16") && flag1.equals("0")) {
                response.sendRedirect("EDCE?flag=1");
            }else if (iden.equals("17") && flag1.equals("0")) {
                response.sendRedirect("TCA?flag=1");
            } else if (iden.equals("18") && flag1.equals("0")) {
                response.sendRedirect("TCD?flag=1");
            } else if (iden.equals("19") && flag1.equals("0")) {
                response.sendRedirect("EDPpr?flag=1");
            } else if (iden.equals("20") && flag1.equals("0")) {
                response.sendRedirect("TDI1?flag=1");
            }else if (iden.equals("21") && flag1.equals("0")) {
                response.sendRedirect("TDI2?flag=1");
            }else if (iden.equals("22") && flag1.equals("0")) {
                response.sendRedirect("TDP1?flag=1");
            }else if (iden.equals("23") && flag1.equals("0")) {
                response.sendRedirect("TDP2?flag=1");
            }else if (iden.equals("24") && flag1.equals("0")) {
                response.sendRedirect("TDCE1?flag=1");
            }else if (iden.equals("25") && flag1.equals("0")) {
                response.sendRedirect("TDCE2?flag=1");
            }else if (iden.equals("26") && flag1.equals("0")) {
                response.sendRedirect("EDI?flag=1");
            }else if (iden.equals("27") && flag1.equals("0")) {
                response.sendRedirect("EAP?flag=1");
            }else if (iden.equals("29") && flag1.equals("0")) {
                response.sendRedirect("ECD?flag=1");
            }else if (iden.equals("30") && flag1.equals("0")) {
                response.sendRedirect("TAP1?flag=1");
            }else if (iden.equals("31") && flag1.equals("0")) {
                response.sendRedirect("TAP2?flag=1");
            }else if (iden.equals("32") && flag1.equals("0")) {
                response.sendRedirect("TASA?flag=1");
            }else if (iden.equals("33") && flag1.equals("0")) {
                response.sendRedirect("TGB1?flag=1");
            }else if (iden.equals("34") && flag1.equals("0")) {
                response.sendRedirect("TGB2?flag=1");
            }else if (iden.equals("35") && flag1.equals("0")) {
                response.sendRedirect("TGB3?flag=1");
            }else if (iden.equals("36") && flag1.equals("0")) {
                response.sendRedirect("TGB4?flag=1");
            }else if (iden.equals("37") && flag1.equals("0")) {
                response.sendRedirect("TGB5?flag=1");
            }else if (iden.equals("38") && flag1.equals("0")) {
                response.sendRedirect("TGB6?flag=1");
            }else if (iden.equals("39") && flag1.equals("0")) {
                response.sendRedirect("TGB7?flag=1");
            }else if (iden.equals("40") && flag1.equals("0")) {
                response.sendRedirect("TGB8?flag=1");
            }else if (iden.equals("41") && flag1.equals("0")) {
                response.sendRedirect("TGB9?flag=1");
            }else if (iden.equals("42") && flag1.equals("0")) {
                response.sendRedirect("TGB10?flag=1");
            }else if (iden.equals("43") && flag1.equals("0")) {
                response.sendRedirect("TGB11?flag=1");
            }else if (iden.equals("43") && flag1.equals("0")) {
                response.sendRedirect("TGB11?flag=1");
            }else if (iden.equals("130") && flag1.equals("0")) {
                response.sendRedirect("EDP?flag=1&prog="+prog);
            }else if (iden.equals("131") && flag1.equals("0")) {
                response.sendRedirect("EPP?flag=1&prog="+prog);
            }else if (iden.equals("132") && flag1.equals("0")) {
                response.sendRedirect("EPC1?flag=1&prog="+prog);
            }else if (iden.equals("133") && flag1.equals("0")) {
                response.sendRedirect("EES?flag=1&prog="+prog);
            }else if (iden.equals("134") && flag1.equals("0")) {
                response.sendRedirect("EAD?flag=1&prog="+prog);
            }else if (iden.equals("135") && flag1.equals("0")) {
                response.sendRedirect("GGB?flag=1&prog="+prog);
            }else if (iden.equals("136") && flag1.equals("0")) {
                response.sendRedirect("GII?flag=1&prog="+prog);
            }else if (iden.equals("137") && flag1.equals("0")) {
                response.sendRedirect("TPP?flag=1&prog="+prog);
            }else if (iden.equals("138") && flag1.equals("0")) {
                response.sendRedirect("CEE?flag=1&prog="+prog);
            }else if (iden.equals("139") && flag1.equals("0")) {
                response.sendRedirect("EDP-Es?flag=1&prog="+prog);
            }else if (iden.equals("140") && flag1.equals("0")) {
                response.sendRedirect("EPP-Es?flag=1&prog="+prog);
           }else if (iden.equals("141") && flag1.equals("0")) {
                response.sendRedirect("EPC-Es?flag=1&prog="+prog);
           }else if (iden.equals("142") && flag1.equals("0")) {
                response.sendRedirect("EES-Es?flag=1&prog="+prog);
           }else if (iden.equals("143") && flag1.equals("0")) {
                response.sendRedirect("EAD-Es?flag=1&prog="+prog);
           }else if (iden.equals("144") && flag1.equals("0")) {
                response.sendRedirect("GGB-Es?flag=1&prog="+prog);
           }else if (iden.equals("145") && flag1.equals("0")) {
                response.sendRedirect("GII-Es?flag=1&prog="+prog);
           }else if (iden.equals("146") && flag1.equals("0")) {
                response.sendRedirect("TPP-Es?flag=1&prog="+prog);
           }else if (iden.equals("147") && flag1.equals("0")) {
                response.sendRedirect("CEE-Es?flag=1&prog="+prog);
           }else if (iden2.equals("13") && flag2.equals("0")) {
                response.sendRedirect("EPP2?flag=2");
            } else if (iden2.equals("14") && flag2.equals("0")) {
                response.sendRedirect("EPC?flag=2");
            } else if (iden2.equals("15") && flag2.equals("0")) {
                response.sendRedirect("ECA?flag=2");
            } else if (iden2.equals("16") && flag2.equals("0")) {
                response.sendRedirect("EDCE?flag=2");
            }else if (iden2.equals("17") && flag2.equals("0")) {
                response.sendRedirect("TCA?flag=2");
            } else if (iden2.equals("18") && flag2.equals("0")) {
                response.sendRedirect("TCD?flag=2");
            } else if (iden2.equals("19") && flag2.equals("0")) {
                response.sendRedirect("EDPpr?flag=2");
            } else if (iden2.equals("20") && flag2.equals("0")) {
                response.sendRedirect("TDI1?flag=2");
            }else if (iden2.equals("21") && flag2.equals("0")) {
                response.sendRedirect("TDI2?flag=2");
            }else if (iden2.equals("22") && flag2.equals("0")) {
                response.sendRedirect("TDP1?flag=2");
            }else if (iden2.equals("23") && flag2.equals("0")) {
                response.sendRedirect("TDP2?flag=2");
            }else if (iden2.equals("24") && flag2.equals("0")) {
                response.sendRedirect("TDCE1?flag=2");
            }else if (iden2.equals("25") && flag2.equals("0")) {
                response.sendRedirect("TDCE2?flag=2");
            }else if (iden2.equals("26") && flag2.equals("0")) {
                response.sendRedirect("EDI?flag=2");
            }else if (iden2.equals("27") && flag2.equals("0")) {
                response.sendRedirect("EAP?flag=2");
            }else if (iden2.equals("29") && flag2.equals("0")) {
                response.sendRedirect("ECD?flag=2");
            }else if (iden2.equals("30") && flag2.equals("0")) {
                response.sendRedirect("TAP1?flag=2");
            }else if (iden2.equals("31") && flag2.equals("0")) {
                response.sendRedirect("TAP2?flag=2");
            }else if (iden2.equals("32") && flag2.equals("0")) {
                response.sendRedirect("TASA?flag=2");
            }else if (iden2.equals("33") && flag2.equals("0")) {
                response.sendRedirect("TGB1?flag=2");
            }else if (iden2.equals("34") && flag2.equals("0")) {
                response.sendRedirect("TGB2?flag=2");
            }else if (iden2.equals("35") && flag2.equals("0")) {
                response.sendRedirect("TGB3?flag=2");
            }else if (iden2.equals("36") && flag2.equals("0")) {
                response.sendRedirect("TGB4?flag=2");
            }else if (iden2.equals("37") && flag2.equals("0")) {
                response.sendRedirect("TGB5?flag=2");
            }else if (iden2.equals("38") && flag2.equals("0")) {
                response.sendRedirect("TGB6?flag=2");
            }else if (iden2.equals("39") && flag2.equals("0")) {
                response.sendRedirect("TGB7?flag=2");
            }else if (iden2.equals("40") && flag2.equals("0")) {
                response.sendRedirect("TGB8?flag=2");
            }else if (iden2.equals("41") && flag2.equals("0")) {
                response.sendRedirect("TGB9?flag=2");
            }else if (iden2.equals("42") && flag2.equals("0")) {
                response.sendRedirect("TGB10?flag=2");
            }else if (iden2.equals("43") && flag2.equals("0")) {
                response.sendRedirect("TGB11?flag=2");
            }else if (iden2.equals("130") && flag2.equals("0")) {
                response.sendRedirect("EDP?flag=2&prog="+prog);
            }else if (iden2.equals("131") && flag2.equals("0")) {
                response.sendRedirect("EPP?flag=2&prog="+prog);
            }else if (iden2.equals("132") && flag2.equals("0")) {
                response.sendRedirect("EPC1?flag=2&prog="+prog);
            }else if (iden2.equals("133") && flag2.equals("0")) {
                response.sendRedirect("EES?flag=2&prog="+prog);
            }else if (iden2.equals("134") && flag2.equals("0")) {
                response.sendRedirect("EAD?flag=2&prog="+prog);
            }else if (iden2.equals("135") && flag2.equals("0")) {
                response.sendRedirect("GGB?flag=2&prog="+prog);
            }else if (iden2.equals("136") && flag2.equals("0")) {
                response.sendRedirect("GII?flag=2&prog="+prog);
            }else if (iden2.equals("137") && flag2.equals("0")) {
                response.sendRedirect("TPP?flag=2&prog="+prog);
            }else if (iden2.equals("138") && flag2.equals("0")) {
                response.sendRedirect("CEE?flag=2&prog="+prog);
            }else if (iden2.equals("139") && flag2.equals("0")) {
                response.sendRedirect("EDP-Es?flag=2&prog="+prog);
            }else if (iden2.equals("140") && flag2.equals("0")) {
                response.sendRedirect("EPP-Es?flag=2&prog="+prog);
           }else if (iden2.equals("141") && flag2.equals("0")) {
                response.sendRedirect("EPC-Es?flag=2&prog="+prog);
           }else if (iden2.equals("142") && flag2.equals("0")) {
                response.sendRedirect("EES-Es?flag=2&prog="+prog);
           }else if (iden2.equals("143") && flag2.equals("0")) {
                response.sendRedirect("EAD-Es?flag=2&prog="+prog);
           }else if (iden2.equals("144") && flag2.equals("0")) {
                response.sendRedirect("GGB-Es?flag=2&prog="+prog);
           }else if (iden2.equals("145") && flag2.equals("0")) {
                response.sendRedirect("GII-Es?flag=2&prog="+prog);
           }else if (iden2.equals("146") && flag2.equals("0")) {
                response.sendRedirect("TPP-Es?flag=2&prog="+prog);
           }else if (iden2.equals("147") && flag2.equals("0")) {
                response.sendRedirect("CEE-Es?flag=2&prog="+prog);
           }

    else {%>
               <center> Gracias por su participación.</center>
               
                <center><h2><a href="../intraeci/salir"> Salir </a></h2></center>
        <%}
            }else{%>
          <center> Gracias por su participación.</center>
            <center><h2><a href="../intraeci/salir"> Salir </a></h2></center>
            <%}%>
            
        <h1>&nbsp;</h1>
        <h1 align="center">&nbsp;</h1>
        <div align="center"></div>
    </body>
</html>
