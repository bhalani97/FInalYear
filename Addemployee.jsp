<%@page import="java.io.PrintWriter"%>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="css/styles.css">

<script type="text/javascript">
function check()
{
	var id=document.getElementById("id").value;
	var submit=document.getElementById("submit");
	var xhttp;
	 var alr=document.getElementById("alt");
	if(id=="")
		{
		return;
		}else
			{
			xhttp=new XMLHttpRequest();
			  xhttp.onreadystatechange = function() 
			  {
				  if(this.readyState == 4 && this.status == 200)
					  {
					  var val=this.responseText+"";
					 
					  if(val=="" || val==null)
						  {
						  submit.disabled=false;
						  alr.innerHTML=" ";
						  
						  }else
							  {
							  submit.disabled=true;
							
							  alr.innerHTML="id is already taken."
							  }
					  }
			  }
			  xhttp.open("GET", "checkid?id="+id, true);
			  xhttp.send();
			}
}


</script>
<style type="text/css">
p{
color:red;
}
</style>
</head>


<% ServletContext cn=getServletContext();
String name=(String)cn.getAttribute("name");
String typ=(String)session.getAttribute("typ");
if( session.isNew() || typ!="manager")
	{
	PrintWriter ps=response.getWriter();
	
	ps.println("<head><meta http-equiv='refresh' content='3;URL=login.jsp'><link rel=\"stylesheet\" type=\"text/css\" href=\"css/css1.css\"></head>");
	ps.println("<body background=\"image/set1.jpg\"><center><fieldset class=\"fadeInDown\" style=\"background: #fff; border:1px solid gray;border-radius: 20px 20px 20px 20px;box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);\"><h1 class=\"fadeIn fifth\" style=\"font-family: Raleway sans-serif;margin-left: 4%; color: skyblue; text-shadow: 1px 0 black,  1px black, 1px  black, 1px black;\">Employee Salary Management<h1></fieldset><br><br><h2><p style='color:red;'><strong>Session Expired please login again...</strong></p></h2></center>");
	ps.println("<center>Redirecting to Login page......<center></body>");
	
	
	}else{


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
<h3>Add Employee</h3>

<form action="addemployee" method="post">
<table>

<tr>
<th>EMPLOYEE ID</th> 
<th><input type="text" id="id" name="empid" class="input" onblur="check()"required></th><th><p>
<span id="alt"></span></p></th>
</tr>

<tr>
<th>NAME</th> 
<th><input type="text" name="name" class="input" required></th>
</tr>

<tr>
<th>GENDER</th> 
<th style="text-align: center;"><input type="radio" name="gender" value="male" >  MALE
<input type="radio" name="gender" value="female">  FEMALE
<input type="radio" name="gender" value="other"> OTHER
</th>
</tr>

<tr>
<th>DOB</th> <th><input type="date" name="bod" class="input" style="font-size: 12px" required></th>
</tr>

<tr>
<th>ADDRESS</th> <th><textarea rows="4" cols="21" name="address" class="input" required></textarea></th>
</tr>

<tr>
<th>E-MAIL</th> <th><input type="email" name="email" class="input" required></th>
</tr>




</table>
<button type="submit" class="button" id="submit" disabled>SUBMIT</button>
</form>
</center>



</body>
<%} %>
</html>
