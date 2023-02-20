<%-- 
    Document   : logout
    Created on : 7 feb 2023, 22:07:00
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Desconectado</title>
    </head>
    <body>
        <% 
            HttpSession sesion = request.getSession();
            sesion.invalidate();
            response.sendRedirect("login.jsp");
       %>
    </body>
</html>
