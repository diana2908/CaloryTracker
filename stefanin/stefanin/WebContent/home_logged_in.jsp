<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
     <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="styles/style-home.css">
<link rel="stylesheet" type="text/css" href="styles/style-home.css">
</head>
<body background="Media/bg1.jpeg">
    <%  String a=session.getAttribute("user").toString();%>
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
              <a href="#" class="navbar-brand" ><i class="fas fa-utensils"></i> <span><i class="fas fa-calculator"></i></span></a>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">                 
                  <li><a href="profile.jsp"><%=a %></a> </li>
                  <li><a href="plan.jsp">Daily Plan</a></li>
              </ul>
              <ul class="nav navbar-nav navbar-right">
                  <li><a href="login.jsp">Sign Out</a></li>
              </ul>
          </div>
      </div>
  </nav>

  <!-- Carousel -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="Media/p2.jpg" alt="First slide" style="width:100%;">
            </div>
            <div class="item">
                <img src="Media/p1.jpg" alt="Second slide" style="width:100%;">
            </div>
            <div class="item">
                <img src="Media/p3.jpg" alt="Third slide" style="width:100%;">
            </div>
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
 

    <!--Articol-->
    <div class="articol">
        <div class="container bl">
            <div class="row">
                <div class="col-lg-8 col-sm-6 col-xsm-12">
                    <div class="border-left-shadow bloc">
                        <img src="Media/a1.jpg" style="width: 350px; border-radius: 15px">
                    </div>
                </div>
                <div class="col-lg-4 col-sm-12 col-xsm-12 bloc">
                    <p>"Eat This Much not only helps me hit my macros, but also makes sure I'm not eating the same bland thing every day. I've lost 35 lbs over the past year, and with ETM, I'm eating and performing better than ever."
                       <br> <span class="numeMembru">Sam Konowich</span>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-sm-6 col-xsm-12 bloc">
                    <p>"I found out about Eat This Much in July 2017 and lost 32 lbs in 6 months! Now I'm a fit over 50 female in amazing condition, and this site is what I refer to several times a day to ensure I eat properly and manage my macros."
                       <br> <span class="numeMembru">Meg M., awesome Kalculator user</span>
                    </p>
                </div>
                <div class="col-lg-6 col-sm-6 col-xsm-12 bloc">
                    <div class="border-right">
                      <img src="Media/a2.jpg" style="width: 270px; border-radius: 15px">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-sm-6 col-xsm-12 bloc">
                    <div class="border-left">
                        <img src="Media/a3.jpg" style="width: 180px; height: 180; border-radius: 90px">
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6 col-xsm-12 bloc">
                    <p>"I started tracking my weight in April of 2013 when I was 184lbs. In May I signed up for Eat This Much and immediately appreciated being able to just cook the menu and not worry about what to have for dinner. By November I was down to 155lbs and I still use Eat This Much today!"
                        <br><span class="numeMembru">Ben Kutil, Product designer</span>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!--Footer-->
  <div class="footer">
      <ul class="list-unstyled">
          <li class="foo" id="logo-size"><i class="fas fa-utensils"></i> KalculatorApp</li>
          <li class="foo">ItMarathon2018 <a href="https://stefanini.com/en/">@Stefanini</a></li>
      </ul>
  </div>
  
</body>
</html>