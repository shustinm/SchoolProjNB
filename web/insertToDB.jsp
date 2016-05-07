
<%@page import="java.util.Base64"%>
<%@page import="MyClasses.MyUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Base64.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    //field values retrieval from server to client
    String username = request.getParameter("username");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    Encoder encoder = Base64.getEncoder();
    String password = encoder.encodeToString(request.getParameter("password").getBytes());
    int age = Integer.parseInt(request.getParameter("age"));

    //connecting to database
    Connection con = MyUtils.getSiteDBconnection(application, "db\\siteDB.mdb");
    Statement stmt = con.createStatement();

    //check if the un exists
    String sql = "SELECT * FROM users WHERE username='" + username + "'";
    ResultSet rs = stmt.executeQuery(sql);
    if (rs.next()) {
        out.print("<center><h3>Registration unsuccessful</h3></center><br>");
        out.print("<center><h3>User already exists</h3></center>");
    } else {
        sql = "INSERT INTO users(username, gender, email, password, age) VALUES('"
                + username + "','" + gender + "','" + email + "','" + password + "','" + age + "')";
        stmt.executeUpdate(sql);
        out.print("<center><h4>(" + username + "','" + gender + "','" + email + "','" + password + "','" + age + "')</h4></center>");
        out.print("<center><h3>Registration successful</h3></center><br>");
    }
    //end db connection
    stmt.close();
    con.close();

%>

<html>
    <head>
        <title>Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/cover.css">
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container" style="width:100%">
                <a href="index.html"><b class="navbar-brand"><img src="pics/program.png" width="20" alt="Musix"></b>
                <b class="navbar-brand">Musix</b></a>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="index.html">Home</a></li>
                        <li><a href="SignUp.html">Sign Up</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="site-wrapper">
            <div class="site-wrapper-inner">
                <div class="inner cover midtext lead">
                    <h1>Welcome to Musix.</h1>
                    <p>Musix brings your favorite music, straight from YouTube.<br>Start your journey now!</p>
                    <p>
                        <a href="SignUp.html" class="btn btn-lg btn-default">Sign up</a>
                    </p>
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