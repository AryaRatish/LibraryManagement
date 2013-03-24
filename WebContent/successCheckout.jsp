<%@page import="org.tutorial.spoken.model.CheckOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Library Management System: Checkout Success</title>
</head>
<body bgcolor='white'>
<!-- Page Heading -->
<table border='1' cellpadding='5' cellspacing='0' width='400'>
<tr bgcolor='#CCCCFF' align='center' valign='center' height='20'>
<td><h3>Library Management System: Checkout Success</h3></td>
</tr>
</table>
<%	CheckOut checkout = (CheckOut)request.getAttribute("checkout");
 %>
<p>
Your request to checkout Book ID<i> <%=checkout.getBookId() %></i> by  <%=checkout.getUserName() %> was successful.
Click <a href='checkOut.jsp'>here</a> to try another checkout/return.<br/>
</p>
<center>Click <a href="index.jsp">here</a> to log out.</center>
</body>
</html>
