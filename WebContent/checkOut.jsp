<%@page import="org.tutorial.spoken.model.CheckOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
    
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

String connectionURL = "jdbc:mysql://localhost:3306/library";

Connection connection = null;

Statement statement = null;

ResultSet rs = null,rs2 = null;

%>

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

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(connectionURL, 
"root","root123");

statement = connection.createStatement();

rs = statement.executeQuery("SELECT * FROM books");%>
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
<th/>
</thead>
<% while(rs.next()) {
	%>
	<tr align='center'>
	<td><%=rs.getInt("id")%></td>
    <td><%=rs.getString("bookName")%></td>
    <td><%=rs.getString("authorName")%></td>
	<td><%=rs.getString("ISBN")%></td>
	<td><%=rs.getString("publisher")%></td>
    <td><%=rs.getInt("totalcopies")%></td>
	<td><%=rs.getInt("availablecopies")%></td>
    <td><input type='radio' name='bkgroup1' value=<%=rs.getInt("id")%>></td>
	</tr>
<%}%>
   </table>
<br/><br/>
User name:<input type='text' name='username' value="<%=checkout.getUserName()%>"><br/><br/>
<input type='submit' name='checkout' value='Checkout book'/>
<input type='submit' name='return' value='Return book'/>
</form>
<%rs.close();
%>

</form>
<center>Click <a href="index.jsp">here</a> to log out.</center>
</body>
</html>