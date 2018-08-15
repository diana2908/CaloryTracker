package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.Delayed;


public class modify {
	public String mancare;
	public String username;
	
	
	public modify(String mancare, String username){
		this.mancare = mancare;
		this.username = username;
		
	}
	public boolean ad() throws ClassNotFoundException, SQLException{
		Connection con  = MyConnection.getConnection();
        Statement stmt = con.createStatement();
        String sql_id = "select id_user from user where nume='"+username+"'";
        ResultSet  rs_id = stmt.executeQuery(sql_id);
        int id = rs_id.getInt(1);
        String sql_ad = " insert into dimineata values(id_user='"+id+"',mancare='"+mancare+"'";
        int rs = stmt.executeUpdate(sql_ad);
	    if(rs!=0){
	    	return true;
	    }
		
		return false;
	}
	
	

}

