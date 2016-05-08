<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/validation.js"></script>
        <title>Registration</title>
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
                        <li class="active"><a href="SignUp.jsp">Sign Up</a></li>
                            <% } else {
                                //response.sendRedirect("profile.jsp"); 
                            %>
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

        <div class="a">
            <h1>Registration</h1>
            <h2>Enter your details below</h2>
            <h3>General Info:</h3>
            <form autocomplete="off" onsubmit="return checkRegistFerForm()" name="reg" action="insertToDB.jsp" method="post">
                <div class="form-group">
                    <input align="center" type="text" class="form-control" name="username" placeholder="Username" maxlength="16" required>
                </div>
                <div class="form-group">
                    <select class="form-control" name="gender">
                        <option>Select Gender</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" name="email" placeholder="Email" required>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" name="cemail" placeholder="Confirm Email" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="cpassword" placeholder="Confirm password" required>
                </div>
                <br>
                <h3>Tell us about yourself:</h3>
                <div class="form-group">
                    <input type="number" class="form-control" name="age" placeholder="Age" required>
                </div>
                <h4>What genres do you like?</h4>
                <div class="form-group">
                    <input type="checkbox" class="checkbox checkbox-inline" name="rock" value="1" style="margin-top:0px"> Rock
                    <input type="checkbox" class="checkbox checkbox-inline" name="rnb" value="1"> R&AMP;B
                    <input type="checkbox" class="checkbox checkbox-inline" name="pop" value="1"> Pop
                    <input type="checkbox" class="checkbox checkbox-inline" name="rap" value="1"> Rap
                    <input type="checkbox" class="checkbox checkbox-inline" name="electronic" value="1"> Electronic
                    <input type="checkbox" class="checkbox checkbox-inline" name="classic" value="1"> Classic
                    <input type="checkbox" class="checkbox checkbox-inline" name="jazz" value="1"> Jazz
                </div>
                <!-- THIS IS NOT WORKING YET
                <div class="form-group btn-group" data-toggle="buttons">
                    <label class="btn btn-primary">
                        <input type="checkbox" autocomplete="off">Rock
                    </label>
                    
                    <label class="btn btn-primary active">
                        <input type="checkbox" checked autocomplete="off">Rock
                    </label>
                </div>
                -->

                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Sign up</button>
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
