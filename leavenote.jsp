<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" type="text/css" href="css/css2.css">
</head>
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
<body class="fadeInDown" background="image/1.jpg" style="background-size: 100%;">
<div class="div_header"><br>
<h1 class="fadeInDown">Employee Salary Management</h1>
<div class="fadeIn first" align="left" style="margin-right: 1%"><label><strong>Welcome <%=name%>!<span style="float: right;"> Log-out? <a href="logout">Click Here!</strong></label></a></span></div>
<hr style="border: 1px solid black;"></body>
<div class="div">
<ul>
  <li><a href="ehome.jsp">Home</a></li>
  <li><a class="active" href="#leave_note">Leave note</a></li>
  <li><a href="checksalary.jsp">Check salary</a></li>
  <li><a href="about.jsp">About</a></li>
</ul>
<div style="margin-top:40px">
<center><h2>Leave Note</h2></center>
 </div>
 
 
 <form method="post" action="note">
 <table align="center">
 <tr>
	<th>Reason</th>
	<th><input type="text" name="reason" class="input"></th>
 </tr>
 <tr>
	<th>Details</th>
	<th><textarea rows="4" cols="21" name="details" class="input"></textarea></th>
 </tr>
 <tr>
<th></th>
 <th>File:<input type="file" name="file" style="margin-left:50px"></th>
 <th></th>
 </tr>
 
 <tr>
<th></th>
 <th><button  class="button" type="submit">SUBMIT</button></th>
 <th></th>
 </tr>

 </table>
  </form>
 



</div>
</body>

<%} %>



</html>