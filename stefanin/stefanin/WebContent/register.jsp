<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SignUp</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="styles/register-style.css">
</head>
<body background="Media/bg5.jpg">
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
                    <li><a href="login.jsp">Profile</a> </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="register.jsp">Sign Up</a> </li>
                    <li><a href="login.jsp">Login</a> </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container register">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-login">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-12">
                                <a href="#" id="register-form-link">Register</a>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form  id="register-form" action="servlet_register" method="post" role="form" style="display: block;">
                                    <div class="form-group">
                                        <input id="username" type="text" name="user" tabindex="0" class="form-control" placeholder="Username" value="" required>
                                    </div>
                                    <div class="form-group">
                                        <input id="email" type="email" name="email" tabindex="1" class="form-control" placeholder="Email Address" value="" required>
                                    </div>
                                    <div class="form-group">
                                        <input id="password" type="password" name="pass"  tabindex="2" class="form-control" placeholder="Password" required>
                                    </div>
                                    <div  class="form-group">
                                        <input id="weight" type="text" name="weight"  tabindex="3" class="form-control" placeholder="Weight" required>
                                    </div>
                                    <div>
                                        <input id="height" type="text" name="height"  tabindex="4" class="form-control" placeholder="Height" required>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                         <div class="row">
                                             <div class="col-sm-6 col-sm-offset-3">
                                                 <input type="submit" name="submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
                                             </div>
                                         </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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