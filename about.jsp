<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link rel="stylesheet" type="text/css" href="css/css2.css">
<script type="text/javascript">
	function match() {
		var ps = document.getElementById("pd").value;
		var cp = document.getElementById("cp").value;
		var submit = document.getElementById("submit");
		if (cp != "" || cp != null) {
			if (ps.match(cp) && cp.match(ps)) {
				submit.disabled = false;
				var al = document.getElementById("alrt");
				al.innerHTML = " ";
			} else {
				var al = document.getElementById("alrt");
				al.innerHTML = "Password Does not match";
				submit.disabled = true;
			}
		}

	}
	function changeEmail() {
		var change_control = document.getElementById("mail");
		change_control.disabled = false;
		var change_control_submit = document.getElementById("submitButton");
		change_control_submit.disabled = false;
		if(change_control_submit.type=="hidden"){
			change_control_submit.type="submit";
		}else
			{
			change_control_submit.type="hidden";
			}

	}
	function changeEmailControl() {
		var change_control = document.getElementById("mail");
		change_control.disabled = true;
		var change_control_submit = document.getElementById("submitButton");
		change_control_submit.disabled = true;
		

	}
	

	function editEmailId() {
		var xhttp;
		var new_emailid = document.getElementById("mail").value;

		if (new_emailid == "") {
			
			return false;
		} else {
			xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					alert(this.responseText);
				}
			};
			xhttp.open("GET", "changeEmailId?newemailid=" + new_emailid, true);
			xhttp.send();
			changeEmailControl();
		}

	}
	function showCustomer() {
		var xhttp;
		var str = document.getElementById("pd").value;

		if (str == "") {
			document.getElementById("alrt").innerHTML = "please enter new password";
			return;
		}
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				alert(this.responseText);
				window.location="about.jsp"
			}
		};
		xhttp.open("GET", "changepw?pw=" + str, true);
		xhttp.send();
		
	}
</script>

</head>
<body class="fadeInDown" background="image/1.jpg" style="background-size: 100%;">
<%


		ServletContext cn = request.getServletContext();
		String id = cn.getAttribute("id").toString();
		String name=(String)cn.getAttribute("name");
		String typ=(String)session.getAttribute("typ");
	if( session.isNew() || typ!="employee")
	{
	PrintWriter ps=response.getWriter();
	
	ps.println("<head><meta http-equiv='refresh' content='3;URL=login.jsp'><link rel=\"stylesheet\" type=\"text/css\" href=\"css/css1.css\"></head>");
	ps.println("<body background=\"image/set1.jpg\"><center><fieldset class=\"fadeInDown\" style=\"background: #fff; border:1px solid gray;border-radius: 20px 20px 20px 20px;box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);\"><h1 class=\"fadeIn fifth\" style=\"font-family: Raleway sans-serif;margin-left: 4%; color: skyblue; text-shadow: 1px 0 black,  1px black, 1px  black, 1px black;\">Employee Salary Management<h1></fieldset><br><br><h2><p style='color:red;'><strong>Session Expired please login again...</strong></p></h2></center>");
	ps.println("<center>Redirecting to Login page......<center></body>");
	
	
	}else{
		PrintWriter pw = response.getWriter();
		Connection conn = null;
	%>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/esm", "root", "");
			PreparedStatement pr = (PreparedStatement) conn.prepareStatement("select * from login where userid=?");
			pr.setString(1, id);
			ResultSet rs = pr.executeQuery();
			if (rs.next()) {
	%>
<div class="div_header"><br>
<h1 class="fadeInDown">Employee Salary Management</h1>
<div class="fadeIn first" align="left" style="margin-right: 1%"><p><strong>Welcome <%=name%>!<span style="float: right;"> Log-out? <a href="logout">Click Here!</strong></p></a></span></div>
<hr style="border: 1px solid black;"></body>
<div class="div">
<ul>
  <li><a href="ehome.jsp">Home</a></li>
  <li><a href="leavenote.jsp">Leave note</a></li>
  <li><a  href="checksalary.jsp">Transaction</a></li>
  <li><a class="active" href="about.jsp">About</a></li>
  </ul><br>
	
	<center>
		<span>
			<strong style="font-size: 24px;">User Info:</strong>
		</span>
	
	<table>
		<tr>
			<th>Id:</th>
			<td><%=id%></td>
		</tr>
		<tr>
			<th>Name:</th>
			<td><%=rs.getString("name")%></td>
		</tr>
		<tr>
			<th>Gender:</th>
			<td><%=rs.getString("gender")%></td>
		</tr>
		<tr>
			<th>BOD:</th>
			<td><%=rs.getDate("bod")%></td>
		</tr>
		<tr>
			<th>Address:</th>
			<td><%=rs.getString("address")%></td>
		</tr>
		<tr>
			<th>Join date:</th>
			<td><%=rs.getString("jdate")%></td>
		</tr>
		<tr>
			<th>Email:</th>
			<td><input style="width: 150px;
			height: 30px;box-sizing: border-box;border: 2px solid gray;border-radius: 4px;" type="email" name="email" id="mail"
			value=<%=rs.getString("email")%> disabled></td>
		</tr>
		<hr style="border: 1px solid gray; width: 50%">
		<tr>
			<td></td>
			<td><a href="#" onclick="changeEmail()">Edit Email</a></td>
			
		</tr>
		<tr>
			<td style="display: none"><input class="button" type="hidden" value="submit" id="submitButton" onclick="editEmailId()" disabled></button></td>

		</tr>
		<%
			if (request.getParameter("cp") != null) {
		%>
		<tr>
			<td>New password:</td>
			<td><input class="input" type="text" name="password" id="pd" onblur="match()"></td>
		</tr>
		<tr>
			<td>confirm password</td>
			<td><input class="input" type="text" name="cp" id="cp" onblur="match()"><label id="alrt"></lable>
				</td>
		</tr>
		<tr>
			<td></td>
			<td><button class="button" type="submit" id="submit" onclick="showCustomer()">submit</button></td>
		</tr>

		<%
			} else {
		%>
		<tr>
			<td> </td>
			<td><a href="about.jsp?cp=yes">Change Passoword?</a></td>
		</tr>


		<%
			}
		%>


	</table>
</center>

	<%
		} else {
				pw.println("<head><meta http-equiv='refresh' content='3;URL=leavenote.jsp'></head>");
				pw.println("<h2><p style='color:red;'>Something Wrong...please try again... </p></h2>");
				pw.println("redirecting......");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			conn.close();

		}
	}
	%>


</body>
</html>