package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;


public class Registration {

	private String username;
    private String password;
    private String email;
    private String weight;
    private String height;
    
	 public Registration(String username,String password,String email,String weight,String height){
        this.username = username;
        this.password = password;
        this.email = email;
        this.weight = weight;
        this.height = height;
    }
	public boolean Register() throws ClassNotFoundException, SQLException{
    	Connection con = MyConnection.getConnection();
    	String sql_id = "SELECT id_user FROM user ORDER BY id_user DESC LIMIT 1";
    	Statement stmt = con.prepareStatement(sql_id, Statement.RETURN_GENERATED_KEYS);
    	ResultSet rs_id = stmt.executeQuery(sql_id);
    	int idu=0;
    	if(rs_id.next()){
    		idu=rs_id.getInt(1)+1;
    	}

 
    	
    	String sql_search = "select nume,email from user where nume='"+username+"' or email='"+email+"'";
    	Statement st = con.prepareStatement(sql_search);
    	ResultSet rs_search = st.executeQuery(sql_search); 
    	if(rs_search.next()){
    		return false;
    	}
    	
        
    	String sql_insert = "insert into user values('"+idu+"','"+username+"','"+email+"','"+password+"','"+weight+"','"+height+"')";
    	int rinsert = stmt.executeUpdate(sql_insert);
    	if(rinsert>0)
    		return true;
    	else
    		return false;
	}
}
