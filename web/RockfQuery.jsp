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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <title>Queries</title>
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
                        <li><a href="SignUp.jsp">Sign Up</a></li>
                            <% } else {%>
                        <li><a href="SignUp.jsp"><% out.print(session.getAttribute("username")); %></a></li>
                            <% }
                                if (session.getAttribute("username") == null) { %>
                        <li><a href="login.jsp">Login</a></li>
                            <% } else { %>
                        <li><a href="listen.jsp">Listen</a></li>
                            <% } %>
                            <% if (session.getAttribute("username") != null) { %>
                        <li><a href="logout.jsp">Log out</a>
                            <% } %>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="a">
            <h1>Women that like rock:</h1>
            <table class="table table-bordered">
                <tr>
                    <th>Username</th>
                    <th>Gender</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Age</th>
                </tr>
                <%
                    Connection con = MyUtils.getSiteDBconnection(application, "db\\siteDB.mdb");
                    Statement stmt = con.createStatement();

                    String sql = "SELECT * FROM users WHERE gender='female' AND rock='1'";
                    ResultSet rs = stmt.executeQuery(sql);
                    String output = "";

                    while (rs.next()) {
                        String username = rs.getString("username");
                        String gender = rs.getString("gender");
                        String email = rs.getString("email");
                        String password = rs.getString("password");
                        String age = rs.getString("age");
                        String a = "</td><td>";
                        output += "<tr><td>" + username;
                        output += a + gender;
                        output += a + email;
                        output += a + password;
                        output += a + age + "</td>";
                    }
                    out.print(output);
                %>
            </table>
        </div>

        <nav class="navbar navbar-default navbar-fixed-bottom">
            <div class="container" style="width:100%">
                <p style="padding-top: 5px">Musix<br>© 2016 Michael Shustin<br>CS Project</p>
            </div>
        </nav>
    </body>
</html>
