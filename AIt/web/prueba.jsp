<%-- 
    Document   : prueba
    Created on : 27/11/2019, 08:22:52 PM
    Author     : aramo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String ido = request.getParameter("datosObj");
            %>
        <h1>
           <%
            out.println(ido);
            %>
        </h1>
    </body>
</html>
