<%@page import="org.tutorial.spoken.model.CheckOut"%>
<%@page import="org.tutorial.spoken.model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.GregorianCalendar" %>
<%@page import="java.text.SimpleDateFormat" %> 
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Library Management System: Checkout/Return</title>
</head>
<body bgcolor='white'>
<!-- Page Heading -->
<table border='1' cellpadding='5' cellspacing='0' width='400'>
<tr bgcolor='#CCCCFF' align='center' valign='center' height='20'>
<td><h3>Library Management System:Checkout/Return</h3></td>
</tr>
</table>
<p>
This form allows you to checkout and return a book.
</p>
<%

List<Book> books = (ArrayList<Book>)request.getAttribute("books");
%>	
<form action='CheckOutServlet' method='POST'>
<table width='100%' border='1'>
<thead align='center'>
<th>Book Id</th>
<th>Book Name</th>
<th>Author Name</th>
<th>ISBN</th>
<th>Publisher</th>
<th>Total Copies</th>
<th>Available Copies</th>
</thead>
<%
for(Book book:books){
%>	
	<tr align='center'>
		<td><%=book.getBookId()%></td>
		<td><%=book.getBookName()%></td>
		<td><%=book.getAuthorName()%></td>
		<td><%=book.getISBN()%></td>
		<td><%=book.getPublisher()%></td>
		<td><%=book.getTotalCopies()%></td>
		<td><%=book.getAvailCopies() %></td>
		<td><input type='radio' name='bkgroup1' value=<%=book.getBookId()%> /></td>

	</tr>
<%
}
%>
</table>

<br/><br/><br/><br/>


<%
	CheckOut checkout = new CheckOut();
	if(request.getAttribute("errorMsgs") != null){
		%>
		<div>
		<%="Please correct the following errors!!!!" %>
		</div>
		
<% 
		java.util.List<String> errorMsgs = (java.util.List<String>)request.getAttribute("errorMsgs");
		for(String errorMsg: errorMsgs){	
%>
		<li> <%= errorMsgs%></li>		
<%		}
		
		if((CheckOut)request.getAttribute("checkout") != null){
			checkout = (CheckOut)request.getAttribute("checkout");	
		}
		
	}
%>


<% 
   SimpleDateFormat dateFormatter = new SimpleDateFormat();
   
	Date today = new Date();
   String todayString = dateFormatter.format(today);
   System.out.println(todayString);
   Calendar	calendar = new GregorianCalendar();
   calendar.add(Calendar.DAY_OF_YEAR, 7);
   Date sevenDaysAfterNow = calendar.getTime();
   String sevenDaysAfterNowString = dateFormatter.format(sevenDaysAfterNow);%>

User name:<input type='text' name='username' value="<%=checkout.getUserName()%>"><br/><br/>
Date of Checkout:<input type="text" name="dateofcheckout" value=<%= todayString %> />
Date of Return:<input type="text" name="dateofreturn" value=<%= sevenDaysAfterNowString %> />
<input type='submit' name='checkout' value='Checkout book'/>
<input type='submit' name='return' value='Return book'/>



</form>

<center>Click <a href="index.jsp">here</a> to log out.</center>
</body>
</html>