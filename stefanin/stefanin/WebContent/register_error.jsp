<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type"text/css" href="styles/style_login.css">
</head>
<body>
     <h1 class="name">E M A G </h1>
     <h1 class="name">R E G I S T R A T I O N</h1>
     <h5 class="name">Acest cont exista deja</h5>
     <form action="servlet_register" method="post">
        <p>Name</p>
        <input id="user" type="text" name="user"  required>
        <p>Password</p>
        <input id="pass" type="password" name="pass"  required>
        <p>Email</p>
        <input id="pass" type="email" name="email"  required>
        <p>Weight</p>
        <input id="pass" type="text" name="weight"  required>
        <p>Height</p>
        <input id="pass" type="text" name="height"  required>
         </br></br>
         <button type="submit" name="submit" value="register">Register</button>
     </form>
</body>
</html>