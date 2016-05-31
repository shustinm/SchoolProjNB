
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Playlist</title>
    </head>
    <body>
        <%
            String genre = request.getParameter("genre");
            session.setAttribute("genre", genre);
            response.sendRedirect("listen.jsp");
        %>
    </body>
</html>
