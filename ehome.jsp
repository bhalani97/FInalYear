<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/animate.css">
<link rel="stylesheet" type="text/css" href="css/css2.css">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<script type="text/javascript">

	function place(){
		document.getElementById('hide').style.display="";
	}
	function Select(){
		var e = document.getElementById('select');
		var val1 = e.options[e.selectedIndex].value;
		rate.innerHTML=val1;
		document.getElementById('visible').style.display="";
		
	}

	function toggleTable()
    {
      var e1=document.getElementById('loginTable');
      e1.style.display="";
      document.getElementById('loginButton').style.display="none"
    }
</script> 
</head>

<body ng-app="myApp" ng-controller="myCtrl"  background="image/1.jpg" style="background-size: 100%;">

<%

String typ=(String)session.getAttribute("typ");
if( session.isNew() || typ!="employee")
	{
	PrintWriter ps=response.getWriter();
	
	ps.println("<head><meta http-equiv='refresh' content='3;URL=login.jsp'><link rel=\"stylesheet\" type=\"text/css\" href=\"css/css1.css\"></head>");
	ps.println("<body background=\"image/set1.jpg\"><center><fieldset class=\"fadeInDown\" style=\"background: #fff; border:1px solid gray;border-radius: 20px 20px 20px 20px;box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);\"><h1 class=\"fadeIn fifth\" style=\"font-family: Raleway sans-serif;margin-left: 4%; color: skyblue; text-shadow: 1px 0 black,  1px black, 1px  black, 1px black;\">Employee Salary Management<h1></fieldset><br><br><h2><p style='color:red;'><strong>Session Expired please login again...</strong></p></h2></center>");
	ps.println("<center>Redirecting to Login page......<center></body>");
	
	
	}else{
		 ServletContext cn=getServletContext();
		 String name=(String)cn.getAttribute("name");
%>
<center>

    <br>
<h1>
    Employee Salary Management
</h1>
  <div class="fadeIn first" align="left" style="margin-right: 1%"><label><strong>Welcome <%=name%>!
<span style="float: right;"> Log-out? <a href="logout"><span style="color: black;">Click Here!</strong></label></a></span></div>
</div>
<hr style="border: 1px solid black;">
</center>
<div class="div">
	<h1 class="bounce">Hello</h1>
<ul class="fadeInDown">
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="leavenote.jsp">Leave note</a></li>
  <li><a href="checksalary.jsp">Check salary</a></li>
  <li><a href="about.jsp">About</a></li>
</ul>
    <hr style="border: 1px solid gray; width: 50%">
<h1 class="fadeInLeft" style="text-align: center;">Welcome to Employee Login Department</h1> <hr style="border: 1px solid gray; width: 50%">
<center><button  class="button" id="loginButton" onclick="toggleTable();">CLick Here to request today's payment.</button></center>
<div style="margin-top:40px">
 </div>
 <table class="fadeInDown" id="loginTable" align="center" style="display:none">
 <form method="post" action="work">
 	<tr><th>Diamond Type:</th>
 	<th><select ng-model="rate" onchange="Select()" id="select" style=" width: 500px;
 	height: 40px;
 	font-size: 15px;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 2px solid gray;
    border-radius: 8px;">
 		<option selected value="0">Select</option>
 		<option value="54">Type-1</option>
 		<option value="58" >Type-2</option>
 		<option value="34">Type-3</option>
 	</select>
 </th>
 </tr>
 <tr id="visible" class="fadeInDown" style="display:none">
 	<th>Rate :</th>
 	<th style="text-align: left"><span id="rate" >0</span>
 </tr>
 <tr>
	<th>Total Diamonds.</th>
	<th><div class="input-icon"><input id="diamond" type="text" class="input" ng-model="quantity" oninput="place()"><div></th>
 </tr>
 
 
 <tr>
 	<th>Weight</th>
 	<th><input type="text" name="weight" class="input" ></div></th>
 </tr>
 <tr style="display: none" class="fadeInDown" id="hide">
 <th>Calculated Amount :</th>
 <th><input class="input" type="text" value="{{amount()}}" name="money" placeholder="Rs."></th>
</tr>
 <tr>
	<th>Details</th>
	<th><textarea rows="4" cols="21" name="details" class="input" ></textarea></th>
 </tr>
 <tr>
 <th></th><th><button class="button" id="submit" type="submit">Request</button></th>
 <th></th>
 <th></th>
 </tr>
 <tr>
  <th></th>
 </tr>
</form>
 </form>
 </table>
 <script>
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope) {
  $scope.rate = "0";
  $scope.quantity = "0";
  $scope.amount = function() {
    return $scope.rate*$scope.quantity;
  };
});
</script>


 
</div>
<%} %>
</body>



</html>