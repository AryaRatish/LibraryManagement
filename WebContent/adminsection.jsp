<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body bgcolor='white'>
<form action="AdminSection" method="post">
<table border='1' cellpadding='5' cellspacing='0' width='400'>
<tr bgcolor='#CCCCFF' align='center' valign='center' height='20'>
<td><h3>Welcome to Admin Section Page</h3>
</td>
</table>

<p>
This is the page for Admin Section.

</p> 

<!-- <a href='listusers.jsp'>List all users</a><br/><br/>
<a href='addBook.jsp'>Add a book</a><br/><br/>
<a href='checkOut.jsp'>Checkout a book</a><br/><br/> -->

<input type="radio" name="menuselection" value="listusers">List Users <br>
<input type="radio" name="menuselection" value="addbook">Add book<br>
<input type="radio" name="menuselection" value="checkoutbook">checkout book<br>

<input type="submit" value="Submit">
</form> 
</body>
</html>