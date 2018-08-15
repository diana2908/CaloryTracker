package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.Registration;

import java.sql.SQLException;



@WebServlet("/servlet_register")
public class servlet_register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        String weight = request.getParameter("weight");
        String height = request.getParameter("height");
        
        Registration reg = new Registration(username,password,email,weight,height);
        try {
			if(reg.Register()==true){
				HttpSession session = request.getSession();
			    session.setAttribute("user",username);
			    session.setAttribute("pass",password);
			    session.setAttribute("email",email);
			    session.setAttribute("weight",weight);
			    session.setAttribute("height",height);
			    
			    response.sendRedirect("login.jsp");
			}
			else{
				response.sendRedirect("register_error.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}

}
