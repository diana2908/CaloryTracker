package servlets;



import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.modify;


@WebServlet("/servlet_add_delete")
public class servlet_add_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = (String) request.getParameter("action"); 
		String username = (String) request.getParameter("nume");
		String food = request.getParameter("mancare");
		
		modify mod = new modify(food,username);
        if(act== null){
	    	
	    }
	    try {
			if(act.equals("Add") &&  mod.ad()==true){
				HttpSession session = request.getSession();
			    response.sendRedirect("plan.jsp");
				
			}
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    
	        

	    }
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    
	}
	

}
