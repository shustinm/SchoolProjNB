
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
                        <li class="active"><a href="SignUp.jsp">Sign Up</a></li>
                            <% } else { %>
                        <li class="active"><a href="SignUp.jsp"><%out.print(session.getAttribute("username"));%></a></li>
                            <% }
                                if (session.getAttribute("username") == null) { %>
                        <li><a href="login.jsp">Login</a></li>
                            <% } else { %>
                        <li><a href="listen.jsp">Listen</a></li>
                            <% }%>
                    </ul>
                </div>
            </div>
        </nav>




        <div class="site-wrapper a">
            <div class="site-wrapper-inner">
                <div class="inner cover midtext lead">
                    <%
                        //field values retrieval from server to client
                        String username = request.getParameter("username");

                        //connecting to database
                        Connection con = MyUtils.getSiteDBconnection(application, "db\\siteDB.mdb");
                        Statement stmt = con.createStatement();

                        String sql = "SELECT * FROM users WHERE username='" + username + "'";
                        ResultSet rs = stmt.executeQuery(sql);
                        if (rs.next()) { //check if the un exists
                            out.print("<h1>Registration unsuccessful</h1><br>");
                            out.print("<h2>User already exists</h2>");
                            out.print("<br><a href=\"SignUp.jsp\" class=\"btn btn-lg btn-default\">Sign up</a>");
                        } else { //doesn't exist

                            String gender = request.getParameter("gender");
                            String email = request.getParameter("email");
                            Encoder encoder = Base64.getEncoder();
                            String password = encoder.encodeToString(request.getParameter("password").getBytes());
                            int age = Integer.parseInt(request.getParameter("age"));
                            String[] genres = new String[]{
                                request.getParameter("rock"),
                                request.getParameter("rnb"),
                                request.getParameter("pop"),
                                request.getParameter("rap"),
                                request.getParameter("electronic"),
                                request.getParameter("classic"),
                                request.getParameter("jazz"),
                            };
                            String genreStr = "";
                            for (int i = 0; i < genres.length; i++) {
                                if(i != 0)
                                    genreStr += "','";
                                if(genres[i] != null){
                                    genreStr += genres[i]; 
                                    continue;
                                }
                                genreStr += "0";
                                
                            }
                            sql = "INSERT INTO users(username, gender, email, password, age, rock, rnb, pop, rap, electronic, classic, jazz) "
                                    + "VALUES('" + username + "','" + gender + "','" + email + "','" + password + "','" + age + "','" + genreStr + "')";
                            stmt.executeUpdate(sql);
                            out.print("<h1>Registration successful</h1><br>");
                            out.print("<h2>Your username is " + username + "</h2><br>");
                            out.print("<a href = \"listen.jsp\" class=\"btn btn-lg btn-default\">Listen</a>");
                        }

                        //end db connection
                        stmt.close();
                        con.close();
                        
                        session.setAttribute("username", username);
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