<%@page import="org.tutorial.spoken.model.CheckOut"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ 
page import="java.sql.*"
%>

<%

String connectionURL = "jdbc:mysql://localhost:3306/library";

Connection connection = null;

Statement statement = null;

ResultSet rs = null,rs2 = null;

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Library Management System: Success Greeting Page</title>
</head>
<body bgcolor='white'>
<!-- Page Heading -->
<table border='1' cellpadding='5' cellspacing='0' width='400'>
<tr bgcolor='#CCCCFF' align='center' valign='center' height='20'>
<td><h3>Library Management System: Success Greeting Page</h3></td>
</tr>
</table>
<%	List<CheckOut> checkout = (ArrayList<CheckOut>)request.getAttribute("checkedOutItems");
 %>
<%
/*
Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(connectionURL, 
"root","root");

statement = connection.createStatement();
rs = statement.executeQuery("SELECT * FROM checkout");*/
%>
<u>Books currently borrowed by you:</u><br/><br/>	
<table width='100%' border='1'>
<thead align='center'>
<th>Transaction Id</th>
<th>User Name</th>
<th>Book Id</th>
</thead>
<%
for(CheckOut checkedOutItem: checkout) {
%>	
	<tr align='center'>
		<td><%=checkedOutItem.getTransactionId()%></td>
		<td><%=checkedOutItem.getUserName()%></td>
		<td><%=checkedOutItem.getBookId()%></td>
	</tr>
<%
}
%>
</table>
<br/><br/><br/><br/>
<center>Click <a href='index.jsp'>here</a> to logout</center><br/>
<%
//rs.close();
%>	
</body>
</html>