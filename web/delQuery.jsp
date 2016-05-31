<%@page import="java.util.Base64"%>
<%@page import="java.util.Base64.*"%>
<%@page import="MyClasses.MyUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Registration</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/cover.css">
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container" style="width:100%">
                <a href="index.jsp"><b class="navbar-brand"><img src="pics/program.png" width="20" alt="Musix"></b>
                    <b class="navbar-brand">Musix</b></a>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">Home</a></li>
                            <% if (session.getAttribute("username") == null) { %>
                        <li class><a href="SignUp.jsp">Sign Up</a></li>
                            <% } else { %>
                        <li class><a href="SignUp.jsp"><%out.print(session.getAttribute("username"));%></a></li>
                            <% }
                                if (session.getAttribute("username") == null) { %>
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

        <div class="site-wrapper a">
            <div class="site-wrapper-inner">
                <div class="inner cover midtext lead">
                    <%
                        String username = request.getParameter("username");
                        if (username != null) {

                            //connecting to database
                            Connection con = MyUtils.getSiteDBconnection(application, "db\\siteDB.mdb");
                            Statement stmt = con.createStatement();

                            String sql = "SELECT * FROM users WHERE username='" + username + "'";
                            ResultSet rs = stmt.executeQuery(sql);
                            out.print("<h1>Username: " + username + "</h1>");
                            if (rs.next()) {
                                sql = "DELETE FROM users WHERE username='" + username + "'";
                                stmt.executeUpdate(sql);
                                out.print("<h2>Deletion Successful</h2>");
                            } else {
                                out.print("<h2>User not found</h2>");
                            }

                            stmt.close();
                            con.close();
                        }
                    %>
                </div>
            </div>
        </div>

        <nav class="navbar navbar-default navbar-fixed-bottom">
            <div class="container" style="width:100%">
                <p style="padding-top: 5px">Musix<br>© 2016 Michael Shustin<br>CS Project</p>
            </div>
        </nav>
    </body>
</html>