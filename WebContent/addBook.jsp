<%@page import="org.tutorial.spoken.model.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Library Management System: Add a new book</title>
</head>
<body bgcolor='white'>
<!-- Page Heading -->
<table border='1' cellpadding='5' cellspacing='0' width='400'>
<tr bgcolor='#CCCCFF' align='center' valign='center' height='20'>
<td><h3>Library Management System: Add a new book</h3></td>
</tr>
</table>
<p>
This form allows you to add a new book.
</p>

<%
	Book book = new Book();
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
		
		book = (Book)request.getAttribute("book");
		
	}
%>

<form action='AddBookServlet' method='POST'>

BookName:<input type='text' name='bookname' value="<%=book.getBookName()%>"> <br/><br/>
AuthorName:<input type='text'name='authorname' value="<%=book.getAuthorName()%>"><br/><br/>
ISBN:<input type='text' name='isbn' value="<%=book.getISBN()%>"><br/><br/>
Publisher:<input type='text' name='publisher' value="<%=book.getPublisher() %>"><br/><br/>
Available Copies:<input type='text' name='avail_copies' value="<%=book.getAvailCopies() %>"><br/><br/>
Total Copies:<input type='text' name='total_copies' value="<%=book.getTotalCopies() %>"><br/><br/>
<input type='submit' value='Add Book'/>






</form>
<center>Click <a href="index.jsp">here</a> to log out.</center>
</body>
</html>