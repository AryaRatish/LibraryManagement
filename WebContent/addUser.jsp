<%@page import="org.tutorial.spoken.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Library Management System: Add a new user</title>
</head>
<body bgcolor='white'>
<!-- Page Heading -->
<table border='1' cellpadding='5' cellspacing='0' width='400'>
<tr bgcolor='#CCCCFF' align='center' valign='center' height='20'>
<td><h3>Library Management System: Add a new user</h3></td>
</tr>
</table>
<p>
This form allows you to add a new user.
</p>

<%
	User user = new User();
	if(request.getAttribute("errorMsgs") != null){
		%>
		<div>
		<%="Please correct the following errors!!!!" %>
		</div>
		
<% 
		java.util.List<String> errorMsgs = (java.util.List<String>)request.getAttribute("errorMsgs");
		for(String errorMsg: errorMsgs){	
%>
		<li> <%= errorMsg%></li>		
<%		}
		
		user = (User)request.getAttribute("user");
		
	}
%>

<form action='AddUserServlet' method='POST'>

First Name:<input type='text' name='firstname' value="<%=user.getFirstName()%>"> <br/><br/>
Surname:<input type='text'name='surname' value="<%=user.getSurname()%>"><br/><br/>
Age:<input type='text' name='age' value="<%=user.getAge()%>"><br/><br/>
Gender:<input type='text' name='gender' value="<%=user.getGender() %>"><br/><br/>
Username:<input type='text' name='username' value="<%=user.getUsername() %>"><br/><br/>
Password:<input type='text' name='password' value="<%=user.getPassword() %>"><br/><br/>

<input type='submit' value='Add User'/>






</form>
<center>Click <a href="index.jsp"> here </a>to log out.</center>
</body>
</html>