
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
        sql = "INSERT INTO users(username, gender, email, password) VALUES('"
                + username + "','" + gender + "','" + email + "','" + password + "')";
        stmt.executeUpdate(sql);
        out.print("<center><h4>(" + username + "','" + gender + "','" + email + "','" + password + "')</h4></center>");
        out.print("<center><h3>Registration successful</h3></center><br>");
    }
    //end db connection
    stmt.close();
    con.close();

%>

