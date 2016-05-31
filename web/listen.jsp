

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/cover.css">
        <script src="js/validation.js"></script>
        <title>Listen</title>
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
                            <% if (session.getAttribute("username") != null) { %>
                        <li><a href="logout.jsp">Log out</a>
                            <% } %>
                    </ul>
                </div>
            </div>
        </nav>

        <% if (session.getAttribute("username") == null) {%>
        <div class="a">
            <h2>Please log in!</h2>
        </div>
        <% } else %>
        <div class="listen-wrapper b">
            <div class="center">
                <form name="reg" action="changePlaylist.jsp" method="POST">
                    <select class="form-control" id="genre" onchange="this.form.submit()">
                        <option>Select Genre</option>
                        <option value="rock">Rock</option>
                        <option value="rnb">R&AMP;B</option>
                        <option value="pop">Pop</option>
                        <option value="rap">Rap</option>
                        <option value="electronic">Electronic</option>
                        <option value="classic">Classic</option>
                        <option value="jazz">Jazz</option>
                    </select>
                </form>
                <% if (session.getAttribute("genre") == null) { %>
                <iframe class="center" width="100%" height="80%" src="https://www.youtube.com/embed/p5RobDomh5U?list=PL55713C70BA91BD6E" frameborder="1" allowfullscreen></iframe>
                    <% } else if (session.getAttribute("genre").equals("rock")) { %>
                <iframe class="center" width="100%" height="80%" src="https://www.youtube.com/embed/pXRviuL6vMY?list=PLRZlMhcYkA2HybvsMzUcsqoxqlCEHXnpC" frameborder="1" allowfullscreen></iframe>
                    <% } else if (session.getAttribute("genre").equals("rnb")) { %>
                <iframe class="center" width="100%" height="80%" src="https://www.youtube.com/embed/p5RobDomh5U?list=PL55713C70BA91BD6E" frameborder="1" allowfullscreen></iframe>
                    <% }%>
            </div>
        </div>



        <nav class="navbar navbar-default navbar-fixed-bottom">
            <div class="container" style="width:100%">
                <p style="padding-top: 5px">Musix<br>© 2016 Michael Shustin<br>CS Project</p>
            </div>
        </nav>
    </body>
</html>
