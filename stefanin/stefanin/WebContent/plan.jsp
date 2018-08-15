<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>

<html lang="en">
<head>
     <meta charset="UTF-8">
    <title>Kalculator</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="a/javascript/profileAfterLogin.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="styles/style-plan.css">
</head>
<body background="Media/bg1.jpeg">
<%!
  double total=0;
  int greutate=0,inaltime=0;
%>
<%  String a=session.getAttribute("user").toString();
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/counter", "root", "");
    Statement stmt = con.createStatement();
    try{
    String id_query = "select id_user from user where nume='"+a+"'";
	ResultSet rs_idp = null;
    rs_idp = stmt.executeQuery(id_query);
    int  id = rs_idp.getInt(1);
    
  
    }catch( SQLException e1){
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	  
	  
%>
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
				<li><a href="profile.jsp"><%=a %></a> </li>
				<li><a href="plan.jsp">Daily Plan</a> </li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp">Sign Out</a> </li>
			</ul>
		</div>
	</div>
</nav>
     
	 <div class="fixed-ele col-lg-12 col-sm-12 col-xsm-12">
		 <h1>Daily Plan</h1>
		 <div class="calorie-counter_date">
			 <div id="calendar">
				 <p id="datkal"></p>
			 </div>
		 </div>
	 </div>
	 <div class="displayCal">
		 <div class="bg-consumat ">
			 <p><span class="consumat">0</span><br> Consumed</p>
			 <div class="bg-remain">
			     <%
			       String remaining_query = "select inaltime,greutate from user where nume='"+a+"'";
			       ResultSet rs_total = null;
			       rs_total = stmt.executeQuery(remaining_query);
			       if(rs_total.next()){
			    	   greutate=rs_total.getInt(2);
			    	   inaltime= rs_total.getInt(1);
			       }
			       total = 655 + 4.35*greutate + 4.7*inaltime;
			    	   
			       
			     %>
				 <p><span class="total"><%=total %></span><br> Total</p>
			 </div>
		 </div>
	 </div>
     <div class="container">

		 <div class="calorie-counter-meal col-lg-11 col-sm-8">
			 <br>
			<h2>Breakfast</h2>
			<div class="container">
			<!--Form Card -->
				<div class="card">
					<div class="card-content">
						<span class="card-title">Add Meal / Food Item</span>
							<div class="col">
								<div class="row">
									<button class="add-btn btn blue " onclick="addBreakfastFood();"><i class="fa fa-plus"></i>Add Item</button>
									<button class="add-btn btn green " onclick="calculateBreakfast();">Calculate</button>
								</div>
								<div class="row">
									<div>
										<div id="breakfastFoodOptions">
										</div>
									</div>
								</div>
							</div>
						<h3 class="text-left">Total Calories: <span class="total-caloriesBreakfast">0</span></h3>

					</div>
				</div>
			</div>


	      	<!--Item list -->
        <br>

          	<h2>Lunch</h2>
			 <div class="container">
				 <!--Form Card -->
				 <div class="card">
					 <div class="card-content">
						 <span class="card-title">Add Meal / Food Item</span>
						 <div class="col">
							 <div class="row">
								 <button class="add-btn btn blue " onclick="addLunchtFood();"><i class="fa fa-plus"></i>Add Item</button>
								 <button class="add-btn btn green " onclick="calculateLunch();">Calculate</button>
							 </div>
							 <div class="row">
								 <div>
									 <div id="lunchFoodOptions">
									 </div>
								 </div>
							 </div>
						 </div>
						 <h3 class="text-left">Total Calories: <span class="total-caloriesLunch">0</span></h3>

					 </div>
				 </div>
			 </div>

		 <br>

		 <h2>Dinner</h2>
		 <div class="container">
			 <!--Form Card -->
			 <div class="card">
				 <div class="card-content">
					 <span class="card-title">Add Meal / Food Item</span>
					 <div class="col">
						 <div class="row">
							 <button class="add-btn btn blue " onclick="addDinnerFood();"><i class="fa fa-plus"></i>Add Item</button>
							 <button class="add-btn btn green " onclick="calculateDinner();">Calculate</button>
						 </div>
						 <div class="row">
							 <div>
								 <div id="dinnerFoodOptions">
								 </div>
							 </div>
						 </div>
					 </div>
					 <h3 class="text-left">Total Calories: <span class="total-caloriesDinner">0</span></h3>

				 </div>
			 </div>
		 </div>

         <br>
	 </div>
   </div>

	 
	    <div class="footer">
      <ul class="list-unstyled">
          <li class="foo" id="logo-size"><i class="fas fa-utensils"></i> KalculatorApp</li>
          <li class="foo">ItMarathon2018 <a href="https://stefanini.com/en/">@Stefanini</a></li>
      </ul>
  </div>


	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    <script>
    function calendar(){
        var day = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
        var month = ['January','February','March','April','May','June','July','August','September','October','November','December'];
        var d = new Date();
        var currentDate = day[d.getDay()] + ", " +  d.getDate() + " " +  month[d.getMonth()]+ " " +(1900+ d.getYear());
        document.getElementById("datkal").innerHTML = currentDate;
    }

    window.onload = calendar;

    var foodList = '[{"id": "01", "name": "Mar", "calories": 100}, {"id": "02", "name": "Piept de pui", "calories": 250}, {"id": "03", "name": "Ou", "calories": 50},' +
        '{"id": "04", "name": "Carne de curcan", "calories": 179}, {"id": "05", "name": "Cartofi", "calories": 80}, {"id": "06", "name": "Crap", "calories": 104},' +
        '{"id": "07", "name": "Iaurt", "calories": 30}, {"id": "08", "name": "Capsuni", "calories": 43}, {"id": "09", "name": "Lamai", "calories": 30},' +
        '{"id": "10", "name": "Carne de porc", "calories": 268}]';
    foodList = JSON.parse(foodList);

    var skipDisableBreakfast = false;
    var countBreakfast=0;
    var disableCounterBreakfast=0;
    var indexBreakfast=0;

    var state = {
        breakfast: [],
        lunch: [],
        dinner: []
    };

    function addBreakfastFood() {
        if(countBreakfast > 0 && !skipDisableBreakfast) {
            var foodId = $('.foodBreakfast-' + disableCounterBreakfast + '').val();
            $('.foodBreakfast-' + disableCounterBreakfast + '').prop( "disabled", true );
            state.breakfast.push(foodId);
            disableCounterBreakfast++;
        }

        $('#breakfastFoodOptions')
            .append('<div style="text-align: center"><select class="foodBreakfast-' + indexBreakfast + '"  style="display:block; ">' +
                '<option></option>' +
                createSelect() +
                '</select><button id="foodBreakfast-' + indexBreakfast + '" onclick="removeBreakfast(\''+ indexBreakfast +'\')" style="border-radius:3px; border:1px solid #942911; background-color:#d0451b;background:linear-gradient(to bottom, #d0451b 5%, #bc3315 100%); color: white; display:inline;">Delete</button> ' +
                '</div><br>');

        skipDisableBreakfast=false;
        countBreakfast++;
        indexBreakfast++;
    }


    function createSelect() {
        var ipsDom = foodList.map(function (entry) {
            return '<option value="' + entry.id + '">' + entry.name + '</option>';
        });

        return ipsDom.join('');
    }

    function removeBreakfast(entryId) {

        var entryId = parseInt(entryId);
        var deletedValue = $('.foodBreakfast-' + entryId + '').val();
        $('.foodBreakfast-' + entryId + '').remove();
        $('#foodBreakfast-' + entryId + '').remove();
        for(var i=0; i < state.breakfast.length; i++) {
            if(state.breakfast[i] == deletedValue) {
                state.breakfast.splice(i, 1);
                break;
            }
        }
        disableCounterBreakfast= indexBreakfast-1;
        countBreakfast--;
    }

    function calculateBreakfast() {

        if(!$('.foodBreakfast-' + disableCounterBreakfast + '').prop('disabled')) {
            var foodId = $('.foodBreakfast-' + disableCounterBreakfast + '').val();
            $('.foodBreakfast-' + disableCounterBreakfast + '').prop("disabled", true);
            state.breakfast.push(foodId);
            disableCounterBreakfast++;
            skipDisableBreakfast = true;
        }

        var selectedFoodCalories=0;
        for(var i=0; i<state.breakfast.length; i++) {
            for(var j=0; j<foodList.length; j++) {
                if(state.breakfast[i] == foodList[j]["id"]) {
                    selectedFoodCalories += foodList[j]["calories"];
                }
            }
        }
        $(".total-caloriesBreakfast").text(selectedFoodCalories);

        var lunchScore = parseInt($(".total-caloriesLunch").text());
        var dinnerScore = parseInt($(".total-caloriesDinner").text());
        var total = selectedFoodCalories + lunchScore + dinnerScore;
        $(".consumat").text(total);
    }



    var skipDisableLunch = false;
    var countLunch=0;
    var disableCounterLunch=0;
    var indexLunch=0;

    function addLunchtFood() {
        if(countLunch > 0 && !skipDisableLunch) {
            var foodId = $('.foodLunch-' + disableCounterLunch + '').val();
            $('.foodLunch-' + disableCounterLunch + '').prop( "disabled", true );
            state.lunch.push(foodId);
            disableCounterLunch++;
        }

        $('#lunchFoodOptions')
            .append('<div style="text-align: center"><select class="foodLunch-' + indexLunch + '"  style="display:block; ">' +
                '<option></option>' +
                createSelect() +
                '</select><button id="foodLunch-' + indexLunch + '" onclick="removeLunch(\''+ indexLunch +'\')" style="border-radius:3px; border:1px solid #942911; background-color:#d0451b;background:linear-gradient(to bottom, #d0451b 5%, #bc3315 100%); color: white; display:inline;">Delete</button> ' +
                '</div><br>');

        skipDisableLunch=false;
        countLunch++;
        indexLunch++;
    }

    function removeLunch(entryId) {

        var entryId = parseInt(entryId);
        var deletedValue = $('.foodLunch-' + entryId + '').val();
        $('.foodLunch-' + entryId + '').remove();
        $('#foodLunch-' + entryId + '').remove();
        for(var i=0; i < state.lunch.length; i++) {
            if(state.lunch[i] == deletedValue) {
                state.lunch.splice(i, 1);
                break;
            }
        }
        disableCounterLunch = indexLunch-1;
        countLunch--;
    }

    function calculateLunch() {
        if(!$('.foodLunch-' + disableCounterLunch + '').prop('disabled')) {
            var foodId = $('.foodLunch-' + disableCounterLunch + '').val();
            $('.foodLunch-' + disableCounterLunch + '').prop("disabled", true);
            state.lunch.push(foodId);
            disableCounterLunch++;
            skipDisableLunch = true;
        }

        var selectedFoodCalories=0;
        for(var i=0; i<state.lunch.length; i++) {
            for(var j=0; j<foodList.length; j++) {
                if(state.lunch[i] == foodList[j]["id"]) {
                    selectedFoodCalories += foodList[j]["calories"];
                }
            }
        }
        $(".total-caloriesLunch").text(selectedFoodCalories);

        var breakfastScore = parseInt($(".total-caloriesBreakfast").text());
        var dinnerScore = parseInt($(".total-caloriesDinner").text());
        var total = selectedFoodCalories + breakfastScore + dinnerScore;
        $(".consumat").text(total);
    }


    var skipDisableDinner = false;
    var countDinner=0;
    var disableCounterDinner=0;
    var indexDinner=0;

    function addDinnerFood() {
        if(countDinner > 0 && !skipDisableDinner) {
            var foodId = $('.foodDinner-' + disableCounterDinner + '').val();
            $('.foodDinner-' + disableCounterDinner + '').prop( "disabled", true );
            state.dinner.push(foodId);
            disableCounterDinner++;
        }

        $('#dinnerFoodOptions')
            .append('<div style="text-align: center"><select class="foodDinner-' + indexDinner + '"  style="display:block; ">' +
                '<option></option>' +
                createSelect() +
                '</select><button id="foodDinner-' + indexDinner + '" onclick="removeDinner(\''+ indexDinner +'\')" style="border-radius:3px; border:1px solid #942911; background-color:#d0451b;background:linear-gradient(to bottom, #d0451b 5%, #bc3315 100%); color: white; display:inline;">Delete</button> ' +
                '</div><br>');

        skipDisableDinner=false;
        countDinner++;
        indexDinner++;
    }

    function removeDinner(entryId) {

        var entryId = parseInt(entryId);
        var deletedValue = $('.foodDinner-' + entryId + '').val();
        $('.foodDinner-' + entryId + '').remove();
        $('#foodDinner-' + entryId + '').remove();
        for(var i=0; i < state.dinner.length; i++) {
            if(state.dinner[i] == deletedValue) {
                state.dinner.splice(i, 1);
                break;
            }
        }
        disableCounterDinner = indexDinner-1;
        countDinner--;
    }

    function calculateDinner() {
        if(!$('.foodDinner-' + disableCounterDinner + '').prop('disabled')) {
            var foodId = $('.foodDinner-' + disableCounterDinner + '').val();
            $('.foodDinner-' + disableCounterDinner + '').prop("disabled", true);
            state.dinner.push(foodId);
            disableCounterDinner++;
            skipDisableDinner = true;
        }

        var selectedFoodCalories=0;
        for(var i=0; i<state.dinner.length; i++) {
            for(var j=0; j<foodList.length; j++) {
                if(state.dinner[i] == foodList[j]["id"]) {
                    selectedFoodCalories += foodList[j]["calories"];
                }
            }
        }
        $(".total-caloriesDinner").text(selectedFoodCalories);

        var breakfastScore = parseInt($(".total-caloriesBreakfast").text());
        var lunchScore = parseInt($(".total-caloriesLunch").text());
        var total = selectedFoodCalories + breakfastScore + lunchScore;
        $(".consumat").text(total);
    }
    
    </script>
</body>

</html>