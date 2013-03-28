<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='400'>
<tr bgcolor='#CCCCFF' align='center' valign='center' height='20'>
<td><h3>Welcome to Library Management System</h3>
</td>
</table>

<p>
This is the home page for Library Management System.

</p> 


<a href='visitorHomePage.jsp'>Visitor's Home Page</a><br/><br/>


<form action="GreetingServlet" method="POST">
        User Name: <input type="text" name="userName" size="20"><br>
        Password: <input type="password" name="password" size="20">
        <br/><br/>
        <input type="submit" value="Sign in">
        </form>
<p> Not registered yet? Click <a href="addUser.jsp" >here</a> to register.
    
</body>
</html>