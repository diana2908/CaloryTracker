package classes;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;




public class Edit {
	private String id;
	private String nume;
	private String email;
	private String greutate;
	private String inaltime;
	private String parola;
	
	public Edit(String id,String user,String email,String greutate,String inaltime,String parola){
		this.id = id;
		this.nume = user;
		this.email = email;
		this.greutate = greutate;
		this.inaltime = inaltime;
		this.parola = parola;
	}
	public boolean Editare() throws ClassNotFoundException, SQLException{
    	Connection con = MyConnection.getConnection();
    	//String sql_id = "select id_cl from clienti where Name='"+user+"'";
    	Statement stmt = con.createStatement();
    	
        
    	String sql_insert = "update user set Nume='"+nume+"',Email='"+email+"',greutate='"+greutate+"',inaltime='"+inaltime+"',Parola='"+parola+"' where ID_user='"+id+"'";
    	System.out.println(sql_insert);
    	int rinsert = stmt.executeUpdate(sql_insert);
    	if(rinsert>0)
    		return true;
    	else
    		return false;
	}

}

