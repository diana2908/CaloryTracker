<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<html lang="en">
<head>
	 <meta charset="UTF-8">
	<title>Profile</title>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="styles/style-profile.css">
</head>
<body background="Media/bg1.jpeg">
    
     <%  String a=session.getAttribute("user").toString();%>
     <%
     Class.forName("com.mysql.jdbc.Driver");
     Connection con = null;
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/counter", "root", "");
     Statement stmt = null;
     stmt = con.createStatement();
     String query = "select id_user,nume,email,parola,greutate,inaltime from user where nume='"+a+"'";
     ResultSet rs = null;
     rs = stmt.executeQuery(query);
     if(rs.next()){
    	 String id = rs.getString("id_user");
         String name = rs.getString("nume");
         String mail = rs.getString("email");
         String parola = rs.getString("parola");
         String greutate = rs.getString("greutate");
         String inaltime = rs.getString("inaltime");
        %>
<!--Navbar-->
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="home_logged_in.jsp" class="navbar-brand" ><i class="fas fa-utensils"></i> <span><i class="fas fa-calculator"></i></span></a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="profile.jsp">Profile</a> </li>
				<li><a href="plan.jsp">Daily Plan</a> </li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp">Sign Out</a> </li>
		</div>
	</div>
</nav>
<br><br><br>
<!--Box-->
    <div class="container profilepb">
        <div class="profile-box">
            <figure class="profile-header">
                  <figcaption class="profile-name">Profile</figcaption>
            </figure>
            <form action="servlet_editare" method="get">
                <input type="hidden" name="id" value='<%=id%>'>
                <p class="profile-detail">
                   <span class="profile-label">Username</span><input id="username" type="text" name="user"  class="form-control" placeholder="Username" value='<%=name%>' required>
                </p>
                <p class="profile-detail">
                    <span class="profile-label">Email Adress</span><input id="email" type="email" name="email"  class="form-control" placeholder="@mail.com"  value='<%=mail %>'  required>
                </p>
                <p class="profile-detail">
                    <span class="profile-label">Password</span><input id="pass" type="password" name="parola"   class="form-control" placeholder="Password" value='<%=parola%>' required>
                </p>
                <p class="profile-detail">
                    <span class="profile-label">Weight</span><input id="weight" type="text" name="greutate"   class="form-control" placeholder="Kgs" value='<%=greutate%>' required>
                </p>
                <p class="profile-detail">
                    <span class="profile-label">Height</span><input id="height" type="height" name="inaltime"  class="form-control" placeholder="Cm"  value='<%=inaltime%>' required>
                </p>
                <p class="profile-detail">
                    <input id="height" type="submit" n class="form-control" required>
                </p>
            </form>
            <% }%> 
        </div>
    </div>

<div class="footer">
        <ul class="list-unstyled">
            <li class="foo" id="logo-size"><i class="fas fa-utensils"></i> KalculatorApp</li>
            <li class="foo">ItMarathon2018 <a href="https://stefanini.com/en/">@Stefanini</a></li>
        </ul>
    </div>

</body>
</html>