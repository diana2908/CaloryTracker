package servlets;

import java.io.IOException;



import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.Utilizator;

@WebServlet("/servlet_login")
public class servlet_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("user");
        String password = request.getParameter("pass");
        Utilizator util = new Utilizator(username,password);
        
           
            	
            try {
				try {
					if(util.checkUser()== true){
					    HttpSession session = request.getSession();
					    session.setAttribute("user",username);
					    session.setAttribute("pass",password);
					    response.sendRedirect("home_logged_in.jsp");
					}
					 
					if(util.checkUser()==false){
						response.sendRedirect("login_error.jsp");
					}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
             
	}

}
