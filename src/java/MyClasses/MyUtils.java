package MyClasses;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletContext;

public class MyUtils
{
  
    public static Connection getSiteDBconnection(ServletContext app, String dbPath)
    {
        Connection con = null;
        String path = app.getRealPath("/");
        if(path.indexOf("build") > 0)
        {
            path = path.substring(0, path.indexOf("build"));
            path = path + "web/"+dbPath;
            System.out.println("path1 = " + path);
        }
        else
        {
            path = path + dbPath;
            System.out.println("path2 = " + path);
        }
        try
        {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            String dbURL = "jdbc:ucanaccess://"+path;
            con = DriverManager.getConnection(dbURL);
        }
        catch(Exception ex)
        {
            System.err.println(ex);
        }
 
        return con;
    }

    
}
