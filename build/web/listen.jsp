
<%@page import="java.util.Base64"%>
<%@page import="MyClasses.MyUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Base64.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/validation.js"></script>
        <title>Login</title>
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
                            <% }
                                if (session.getAttribute("username") == null) { %>
                        <li><a href="login.jsp">Login</a></li>
                            <% } else { %>
                        <li class="active"><a href="listen.jsp">Listen</a></li>
                            <% }%>
                    </ul>
                </div>
            </div>
        </nav>

        <% if (session.getAttribute("username") == null) {%>
        <div class="a">
            <h1>Error</h1>
            <h2>You need to log in to listen to music :(</h2>
        </div>
        <% } else { %>
        <div class="a">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/u9Dg-g7t2l4?list=PLhd1HyMTk3f5yqcPXjLo8qroWJiMMFBSk" frameborder="0" allowfullscreen></iframe>
        </div>
        <% }%>



        <nav class="navbar navbar-default navbar-fixed-bottom">
            <div class="container" style="width:100%">
                <p style="padding-top: 5px">Musix<br>© 2016 Michael Shustin<br>CS Project</p>
            </div>
        </nav>
    </body>
</html>
