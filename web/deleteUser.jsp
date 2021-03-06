
<%@page import="java.util.Base64"%>
<%@page import="java.util.Base64.*"%>
<%@page import="MyClasses.MyUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete User</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/validation.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container" style="width:100%">
                <a href="index.jsp"><b class="navbar-brand"><img src="pics/program.png" width="20" alt="musixlogo"></b>
                    <b class="navbar-brand">Musix</b></a>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">Home</a></li>
                            <% if (session.getAttribute("username") == null) { %>
                        <li><a href="SignUp.jsp">Sign Up</a></li>
                            <% } else { %>
                        <li><a href="SignUp.jsp"><%out.print(session.getAttribute("username"));%></a></li>
                            <% } %>
                            <% if (session.getAttribute("username") == null) { %>
                        <li><a href="login.jsp">Login</a></li>
                            <% } else { %>
                        <li><a href="listen.jsp">Listen</a></li>
                            <% }%>
                            <% if (session.getAttribute("username") != null) { %>
                        <li><a href="logout.jsp">Log out</a>
                            <% } %>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="a">
            <h1>Delete User</h1>
            <h2>Enter username to delete</h2>
            <form autocomplete="on" onsubmit="return checkLoginForm()" name="log" action="delQuery.jsp" method="post">
                <div class="form-group">
                    <input align="center" type="text" class="form-control" name="username" placeholder="Username" maxlength="16" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Delete</button>
                    <button type="reset" class="btn btn-default">Reset</button>
                </div>
            </form>
        </div>
        <nav class="navbar navbar-default navbar-fixed-bottom">
            <div class="container" style="width:100%">
                <p style="padding-top: 5px">Musix<br>© 2016 Michael Shustin<br>CS Project</p>
            </div>
        </nav>
    </body>
</html>
