<!DOCTYPE html>

<html>
    <head>
        <title>Home Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                        <li class="active"><a href="index.jsp">Home</a></li>
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
                            <% }%>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="site-wrapper">
            <div class="site-wrapper-inner">
                <div class="inner cover midtext lead">
                    <h1>Admin Page</h1>
                    <a href = "dump.jsp" class="btn btn-sm btn-info">Dump Database</a>
                    <a href = "kidQuery.jsp" class ="btn btn-sm btn-info">Kids?! On my site?!</a>
                    <a href = "RockfQuery.jsp" class ="btn btn-sm btn-info">Do women like rock?</a> 
                    <br><br>
                    <a href = "deleteUser.jsp" class ="btn btn-sm btn-info">Delete User</a>
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