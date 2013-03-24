<%@page import="org.tutorial.spoken.model.CheckOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Library Management System: Return Book Success</title>
</head>
<body bgcolor='white'>
<!-- Page Heading -->
<table border='1' cellpadding='5' cellspacing='0' width='400'>
<tr bgcolor='#CCCCFF' align='center' valign='center' height='20'>
<td><h3>Library Management System: Return Book Success</h3></td>
</tr>
</table>
<%	CheckOut return_book  = (CheckOut)request.getAttribute("returnBook");
 %>
<p>
Your request to return Book ID<i> <%=return_book.getBookId() %></i> by User ID <%=return_book.getUserName() %> was successful.
Click <a href='checkOut.jsp'>here</a> to try another checkout/return.<br/>
</p>
<center>Click <a href="index.jsp">here</a> to log out.</center>
</body>
</html>
