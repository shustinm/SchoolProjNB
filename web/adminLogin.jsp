
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
        <title>Admin Login</title>
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
                        <li><a href="SignUp.jsp">Sign Up</a></li>
                        <li class="active"><a href="login.jsp">Login</a></li>
                            <% if (session.getAttribute("username") != null) { %>
                        <li><a href="logout.jsp">Log out</a>
                            <% } %>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="a">
            <h1>Admin Login</h1>
            <h2>Enter your details below</h2>
            <form autocomplete="on" onsubmit="return checkLoginForm()" name="log" action="adminLogin.jsp" method="post">
                <div class="form-group">
                    <input align="center" type="text" class="form-control" name="username" placeholder="Username" maxlength="16" required>
                </div>
                <div class="form-group">
                    <input align="center" type="password" class="form-control" name="password" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Login</button>
                    <button type="reset" class="btn btn-default">Reset</button>
                </div>
            </form>
            <a href = "login.jsp" class="btn btn-sm btn-info">I'm not an admin</a>
        </div>

        <%
            if (session.getAttribute("username") != null) {
                response.sendRedirect("listen.jsp");
            }

            String username = request.getParameter("username");
            if (username != null) {

                //connecting to database
                Connection con = MyUtils.getSiteDBconnection(application, "db\\siteDB.mdb");
                Statement stmt = con.createStatement();

                //field values retrieval from server to client
                Encoder encoder = Base64.getEncoder();
                String password = encoder.encodeToString(request.getParameter("password").getBytes());

                String sql = "SELECT * FROM admins WHERE username='" + username + "'";
                ResultSet rs = stmt.executeQuery(sql);

                if (rs.next()) {
                    if (password.equals(rs.getString("password"))) {
                        session.setAttribute("username", username);
                        response.sendRedirect("adminPage.jsp");
                    }
                }

                stmt.close();
                con.close();
            }
        %>

        <nav class="navbar navbar-default navbar-fixed-bottom">
            <div class="container" style="width:100%">
                <p style="padding-top: 5px">Musix<br>© 2016 Michael Shustin<br>CS Project</p>
            </div>
        </nav>
    </body>
</html>
