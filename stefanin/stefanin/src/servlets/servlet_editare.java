package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.Edit;

@WebServlet("/servlet_editare")
public class servlet_editare extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String act = (String) request.getParameter("action"); 
		String id = (String) request.getParameter("id");
		String username = request.getParameter("user");
        String password = request.getParameter("parola");
        String greutate = request.getParameter("greutate");
        String inaltime = request.getParameter("inaltime");
        String email = request.getParameter("email");
   
		Edit ed = new Edit(id,username,email,greutate, inaltime, password);
		
        
	    try {
			if( ed.Editare()==true){
				HttpSession session = request.getSession();
				session.setAttribute("id",id);
				session.setAttribute("user",username);
			    session.setAttribute("parola",password);
			    session.setAttribute("email",email);
			    session.setAttribute("greutate",greutate);
			    session.setAttribute("inaltime",inaltime);
			    response.sendRedirect("home_logged_in.jsp");
				
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}	

}
