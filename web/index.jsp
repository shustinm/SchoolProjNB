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
                            <% } %>
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
                        <%  if (session.getAttribute("username") == null) {
                        %>
                        <a href = "SignUp.jsp" class="btn btn-lg btn-default">Sign up</a>
                        <a href = "login.jsp" class="btn btn-lg btn-default">Login</a>
                        <%  } else {
                        %>
                        <a href = "listen.jsp" class="btn btn-lg btn-default">Listen</a>  
                        <%
                            }
                        %>
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