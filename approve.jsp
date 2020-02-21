<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Date"%>
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
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" type="text/css" href="css/css2.css">
<style>
 td, th {  
  border:1px  solid gray;
  text-align: left;
  border-radius:10px;
    box-shadow:0px 5px 0px 0px gray;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 15px;
}
</style>
<script type="text/javascript">
function edit(a)
{
	var e=document.getElementById(a);
	var r=document.getElementById("reason"+a);
	e.disabled=false;
	if(r.type=="hidden")
		{
		r.type="text"
		}
	
	
	
	}



</script>
</head>
<body>
<body>

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

<div class="div_header"><br>
<h1 class="fadeInDown">Employee Salary Management</h1>
<div align="left" class="fadeIn first" style="margin-left: 1%"><h4>Manager Name:<span style="color: red"> <%=name%>!</span><span style="float: right">Logout? <a href="logout">Click Here!</a></span></h4></div></div>
<hr style="border: 1px solid black;"></body>

<center>
<a href="mhome.jsp"><button class="button">Employee Details</button></a>
<a href="Addemployee.jsp"><button class="button">Add Employee</button></a>
<a href="approve.jsp"><button class="button">Pending Request</button></a>
<br><br>
<center>
<form action="approve" method="post">
<%
PrintWriter pw=response.getWriter();
Connection con=null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	 con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/esm","root","");
	PreparedStatement pr=(PreparedStatement) con.prepareStatement("select * from work where approve=? order by date asc");
	pr.setString(1, "1");
	ResultSet rs = pr.executeQuery();
	
	if(rs.next())
	{
		Date dt=null;
		rs.beforeFirst();
		while(rs.next())
		{
			
			
			if(rs.getRow()!=1 && dt.equals(rs.getDate("date")))
			{
				
				%><tr>
				<td><%=rs.getString("name") %></td><td><input type="text" id=<%=rs.getInt("id") %> value=<%=rs.getString("money") %> name=<%=rs.getInt("id") %> disabled><a href="#" onclick="edit(<%=rs.getInt("id") %>)">edit</a></td><td><%=rs.getString("details") %></td><td ><input type="hidden" id="reason<%=rs.getInt("id") %>" name="reason<%=rs.getInt("id") %>"></td>
				</tr>
				
				<%
			}
			else
			{
				dt=rs.getDate("date");
				System.out.print(dt);
			%></table>
				<h4>Date:<%=rs.getDate("date") %></h4>
				
				<table>
				<tr>
				<th>NAME:</th><th>AMOUNT</th><th>DISCRIPTION:</th><th>REASON:</th>
				</tr>
				<tr>
				<td><%=rs.getString("name") %></td><td><input type="text" id=<%=rs.getInt("id") %> value=<%=rs.getString("money") %> name=<%=rs.getInt("id") %> disabled><a href="#" onclick="edit(<%=rs.getInt("id") %>)">edit</a></td><td><%=rs.getString("details") %></td><td ><input type="hidden" id="reason<%=rs.getInt("id") %>" name="reason<%=rs.getInt("id") %>"></td>
				</tr>


				
				
				
			<%}
			if(rs.isLast())
			{
				%>
				</table>
				<%
			}
			
		
			 
		}
	%>
	<br>
	<BUTTON class="button" type="submit" value="approve">APPROVE</BUTTON>
	</form>
</center><% 
	}
	else
	{
		pw.println("<meta http-equiv='refresh' content='5;URL=mhome.jsp'>");
		pw.println("<center><h2><p style='position: fixed;top: 50%;left: 47%;margin-top: -50px;margin-left: -100px;'>No salary Approval is pending ");
		pw.println("</br>Redirecting to Home page......</p></h2></center>");
	}
} catch (SQLException e) {
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}finally
{
	con.close();
}
}
	%>
	

</body>
</html>