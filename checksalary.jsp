<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="esm.Dbconnection" %>
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
  <li><a href="leavenote.jsp">Leave note</a></li>
  <li><a class="active" href="checksalary.jsp">Transaction</a></li>
  <li><a href="about.jsp">About</a></li>
  </ul><br><br>
<center>     
<a href="#"><button class="button">Search Payment</button></a>
<a href="filegenerator?typ=allsalary"><button class="button">All</button></a>
<a href="pendding.jsp"><button class="button">Pendding</button></a>
</center>
	<center><div class="div">
<h2>Search</h2>
<form action="filegenerator" method="post">
<span style="font-size: 20px">From:<input style="font-size:15px;width: 150px;
    padding: 0px 0px;
    margin: 0px 0;
    box-sizing: border-box;
    border: 2px solid gray;
    border-radius: 4px; " type="date" name="from"></span>
<span style="font-size: 20px">To:<input style="font-size:15px; width: 150px;
    padding: 0px 0px;
    margin: 0px 0;
    box-sizing: border-box;
    border: 2px solid gray;
    border-radius: 4px; " type="date" name="to"></span>
<input type="hidden" id="custId" name="typ" value="3487"/><br><br>
<button class="button" type="submit" value="search">Search</button>
</form>
</div>
            
            </center>                                                     

</body>
<%} %>
</html>