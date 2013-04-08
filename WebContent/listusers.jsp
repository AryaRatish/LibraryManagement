<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ 
page import="java.sql.*"
%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.tutorial.spoken.model.User"%>

<html>
<title>Library Management System: User Details</title>
</head>
<body>
<center><h2><u>Welcome to the User Details Page</u></h2></center>
<%

List<User> users = (ArrayList<User>)request.getAttribute("users");
%>	
<table width='100%' border='1'>
<thead align='center'>
<th>First Name</th>
<th>Surname</th>
<th>Age</th>
<th>Gender</th>
<th>Username</th>
<th>Password</th>
</thead>
<%
for(User user:users){
%>	
	<tr align='center'>
		<td><%=user.getFirstName()%></td>
		<td><%=user.getSurname()%></td>
		<td><%=user.getAge()%></td>
		<td><%=user.getGender()%></td>
		<td><%=user.getUsername()%></td>
		<td><%=user.getPassword()%></td>
		
	</tr>
<%
}
%>
</table>

<br/><br/><br/><br/>

<%
%>
<center>Click <a href="adminsection.jsp">here</a> to go back to the admin page.</center>
<center>Click <a href="index.jsp">here</a> to log out.</center>
</body>
</html>