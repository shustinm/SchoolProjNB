<%-- 
    Document   : logout
    Created on : 31-May-2016, 19:42:55
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            session.setAttribute("username", null);
            response.sendRedirect("index.jsp");
        %>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
