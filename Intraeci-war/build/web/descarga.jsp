<%-- 
    Document   : descarga
    Created on : 15/05/2018, 12:36:55 PM
    Author     : andres.rojas
--%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.activation.MimetypesFileTypeMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String userId=null;
    try{
        userId = session.getAttribute("usuario").toString();
        String down = (String) request.getParameter("down");
    String user = (String) request.getParameter("user");
    
            if(down!=null&&down.equals("encuesta")&&userId!=null){ // Solicitud de Descarga de archivos

           //String filepath = "C:\\Sun\\"+user+".pdf";  
            String filepath = "/usr/local/SUN/2/glassfish/domains/domain1/docroot/contenido/osiris/encuestas_nuevas/encuestas/"+user+".pdf";  
           //"/usr/local/SUN/2/glassfish/domains/domain1/docroot/contenido/osiris/encuestas/"+user+".pdf"
       try{
      
        FileInputStream archivo = new FileInputStream(filepath);
        int longitud = archivo.available();
        byte[] datos = new byte[longitud];
        archivo.read(datos);
        archivo.close();
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition","attachment;filename="+down+".pdf");
        ServletOutputStream ouputStream = response.getOutputStream();
        ouputStream.write(datos);
        ouputStream.flush();
        ouputStream.close();
      }catch(Exception e){ e.printStackTrace(); }  

          
            
       
            }else{
                response.sendRedirect("https://www.escuelaing.edu.co/es/");
        }
    }catch(Exception e){
        response.sendRedirect("https://www.escuelaing.edu.co/es/");
    }
    

    
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
    </body>
</html>
