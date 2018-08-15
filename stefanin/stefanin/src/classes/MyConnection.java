package classes;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class MyConnection {
	private static final String user = "root";  
    private static final String pwd = "";            
    private static final String cs = "jdbc:mysql://localhost:3306/counter"; 
    private static Connection con = null;
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        if(con==null)
        {
            con = DriverManager.getConnection(cs, user, pwd);
        }
        return con;
    }
   
}