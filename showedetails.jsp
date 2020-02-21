<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script>
function show(i)
{
	var ty=document.getElementById(i);
	
	if(ty.type=="password")
	{
	ty.type="";
	}
else{
	ty.type="password"
}
	
	
	}
	function back()
	{
		 window.history.back();
	}




</script>

 <link rel="stylesheet" type="text/css" href="css/css2.css">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<style type="text/css">
input[type=text] {
    width: 80%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 2px solid gray;
    border-radius: 4px;
}
</style>
</head>



<%

String name=request.getParameter("details");

String typ=(String)session.getAttribute("typ");
if( session.isNew() || typ!="manager")
	{
	PrintWriter ps=response.getWriter();
	
	ps.println("<head><meta http-equiv='refresh' content='3;URL=login.jsp'><link rel=\"stylesheet\" type=\"text/css\" href=\"css/css1.css\"></head>");
	ps.println("<body background=\"image/set1.jpg\"><center><fieldset class=\"fadeInDown\" style=\"background: #fff; border:1px solid gray;border-radius: 20px 20px 20px 20px;box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);\"><h1 class=\"fadeIn fifth\" style=\"font-family: Raleway sans-serif;margin-left: 4%; color: skyblue; text-shadow: 1px 0 black,  1px black, 1px  black, 1px black;\">Employee Salary Management<h1></fieldset><br><br><h2><p style='color:red;'><strong>Session Expired please login again...</strong></p></h2></center>");
	ps.println("<center>Redirecting to Login page......<center></body>");
	
	}
else{
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/esm","root","");
	PreparedStatement pr=(PreparedStatement) conn.prepareStatement("select * from login where userid=? and type=? or name=? and type=? ");
	pr.setString(1, name);
	pr.setString(2, "employee");
	pr.setString(3, name);
	pr.setString(4, "employee");
	ResultSet rs=pr.executeQuery();
	if(rs.next())
	{%>
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
          <input style="border-radius: 40px; width: 60%" type="text" name="details" placeholder="Enter Employee name or ID"><br>
<button class="button" type="submit" class="" value="search">SEARCH</button>
</form>
</div>
<br>
	<center>
	<span style="font-size: 24px"><strong>Employee Details</strong></span></center>
	<%
	int i=1;
	rs.beforeFirst();
	while(rs.next())
	{
	%><hr size="3px" width="50%" color="gray"><center>
	<h4>EMPLOYEE :<%=i %><h4>
	<table>
	<tr>
	<th>ID:</th><th><%=rs.getString(1) %></th>
	</tr>
	<tr>
	<th>NAME:</th><th><%=rs.getString(2) %></th>
	</tr>
	<tr>
	<th>GENDER:</th><th><%=rs.getString(3) %></th>
	</tr>
	<tr>
	<th>DOB:</th><th><%=rs.getString(4) %></th>
	</tr>
	<tr>
	<th>ADDRESS:</th><th><%=rs.getString(5) %></th>
	</tr>
	<tr>
	<th>E-MAIL:</th><th><%=rs.getString(6) %></th>
	</tr>
	<tr>
	<th>JOINING DATE:</th><th><%=rs.getString(7) %></th>
	</tr>
	<tr>
	<th>PASSWORD:</th><th><input type="password" id="<%=i%>" value="<%=rs.getString(8) %>" disabled></th><th><input type="checkbox" onclick="show(<%=i%>)">Show password</th>
	</tr>
	
	
	
	</table>
		</center>
	<%i++; }
	}else
	{%>
		<center><h3>No details are available.</h3></center>
<%  }
	
%>
<center><button onclick="back()">Back</button></center>
<%


} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
}
%>


</body>
</html>