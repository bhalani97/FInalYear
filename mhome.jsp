<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

    
<link rel="stylesheet" type="text/css" href="css/css2.css">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<style type="text/css">
    
input[type="text"]{
    width: 30%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 2px solid gray;
    border-radius: 40px;
}
input[type="text"]:focus{
    width: 80%;
     border: 2px solid red;
  border-radius: 40px;
    outline: none;
    -webkit-transition-duration: 1.0s; /* Safari */
    transition-duration: 1.0s;
    }
    </style>
</head>
<% 

String typ=(String)session.getAttribute("typ");
if( session.isNew() || typ!="manager")
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
<center>
<div class="div_header"><br>
<h1 class="fadeInDown">Employee Salary Management</h1>
<div align="left" class="fadeIn first" style="margin-left: 1%"><h4>Manager Name:<span style="color: red"> <%=name%>!</span><span style="float: right">Logout? <a href="logout">Click Here!</a></span></h4></div></div>
<hr style="border: 1px solid black;"></body>
<div class="div">

<br>
<center>
<button class="button">Employee Details</button>
<a href="Addemployee.jsp"><button class="button">Add Employee</button></a>
<a href="approve.jsp"><button class="button">Pending Request</button></a>
<div class="div">
<h3>Search Employee</h3>
<form action="showedetails.jsp" method="get">
          <input class="search" type="text" name="details" placeholder="Enter Employee name or ID" autocomplete="off"><br>
<button class="button" type="submit" class="" value="search">SEARCH</button>
</form>
</div>
</center>



</body>
<%} %>
</html>