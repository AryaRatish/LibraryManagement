<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Library Management System: Visitor's Home Page</title>
</head>
<body>
<center><h2><u>Welcome to the Library's Visitor Home Page</u></h2></center>
<%

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection(connectionURL, 
"root","root123");

statement = connection.createStatement();
rs = statement.executeQuery("SELECT * FROM Books");
%>	
<table width='100%' border='1'>
<thead align='center'>
<th>Book Id</th>
<th>Book Name</th>
<th>Author Name</th>
<th>ISBN</th>
<th>Publisher</th>
<th>Available Copies</th>
<th>Total Copies</th>
</thead>
<%
while (rs.next()) {
%>	
	<tr align='center'>
		<td><%=rs.getInt("id")%></td>
		<td><%=rs.getString("bookName")%></td>
		<td><%=rs.getString("authorName")%></td>
		<td><%=rs.getString("ISBN")%></td>
		<td><%=rs.getString("publisher")%></td>
		<td><%=rs.getInt("availablecopies")%></td>
		<td><%=rs.getInt("totalcopies") %>
	</tr>
<%
}
%>
</table>

<br/><br/><br/><br/>

<%
rs.close();
%>
<center>Click <a href="index.jsp">here</a> to log out.</center>
</body>
</html>