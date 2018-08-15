package classes;
import java.sql.*;

import com.sun.xml.internal.ws.api.pipe.NextAction;

public class Utilizator {
	private String username;
    private String password;

    public Utilizator(String username,String password){
        this.username = username;
        this.password = password;
    }
   
    public boolean checkUser() throws SQLException, ClassNotFoundException {
        Connection con  = MyConnection.getConnection();
        String sql_select = "select * from user where nume='"+username+ "' and parola = '" + password + "'";
        PreparedStatement pstmt = con.prepareStatement(sql_select);
        ResultSet rs = pstmt.executeQuery(sql_select);
        if(rs.next())
        {
        	
        	return true;
        }
        else
            return false;
        
    }
 
}

