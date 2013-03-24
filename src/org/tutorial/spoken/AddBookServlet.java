package org.tutorial.spoken;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tutorial.spoken.model.Book;



/**
 * Servlet implementation class AddBookServlet
 */
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Keep a set of strings to record form processing errors.
		List<String> errorMsgs=new ArrayList<String>();
		
		//JDBC variables
		 
         PrintWriter out = response.getWriter();
		 Connection con = null;  
		 PreparedStatement pstmt = null;
		 Statement statement=null;
		 ResultSet rs=null;
		 
		 
		//Store this set in the request scope, in case we need to
		//send the ErrorPage view.
		request.setAttribute("errorMsgs", errorMsgs);
		
		try  {
			//Retrieve form parameters
			
			String bookName=request.getParameter("bookname").trim();
			String authorName=request.getParameter("authorname").trim();
			String ISBN=request.getParameter("isbn").trim();
			String publisher=request.getParameter("publisher").trim();
			String totalCopies=request.getParameter("total_copies");
			String availableCopies=request.getParameter("avail_copies");
			
			//Perform data conversions
			int avail_copies=-1;
			int total_copies=-1;
			
			
			try  {
				avail_copies=Integer.parseInt(availableCopies);
			}
			catch(NumberFormatException nfe) {
				errorMsgs.add("The number of available copies must be a positive integer");
			}
			try {
				total_copies=Integer.parseInt(totalCopies);
			}
			catch(NumberFormatException nfe)  {
				errorMsgs.add("The number of total copies must be a positive integer");
			}
			
			//Verify form parameters
			
			if(bookName.length()==0)  {
				errorMsgs.add("Please enter the book name");
			}
			if(authorName.length()==0)  {
				errorMsgs.add("Please enter the author name");
			}
			if(ISBN.length()==0)  {
				errorMsgs.add("Please enter the ISBN");
			}
			if(ISBN.length()!=10 && ISBN.length()!=13)  {
				errorMsgs.add("The ISBN should be of 10 or 13 characters");
			}
			if(publisher.length()==0)  {
				errorMsgs.add("Please enter the publisher name");
			}
			
			
			Book book =new Book(0, bookName,authorName,ISBN, publisher,total_copies,avail_copies);
			
			//Store the new book in the request-scope
			request.setAttribute("book", book);
			
			//Send the ErrorPage view if there were errors
			if(!errorMsgs.isEmpty())  {
				RequestDispatcher view = request.getRequestDispatcher("addBook.jsp");
				view.forward(request, response);
				return;
			}

			int book_id = 0;
			
			//Store the new book into the database
			 try {
				 Class.forName("com.mysql.jdbc.Driver");
				  con =DriverManager.getConnection 
				  ("jdbc:mysql://127.0.0.1:3306/library","root","root123");
				    statement=con.createStatement();
				  	pstmt = con.prepareStatement("insert into books values(null,?,?,?,?,?,?)");
				  	pstmt.setString(1,bookName);
				  	pstmt.setString(2,authorName);
				  	pstmt.setString(3,ISBN);
				  	pstmt.setString(4,publisher);
				  	pstmt.setInt(5,total_copies);
				  	pstmt.setInt(6,avail_copies);
				  	pstmt.executeUpdate();
				  	
				  	rs = statement.executeQuery("SELECT LAST_INSERT_ID();");
				  	if(rs.next()){
				  		book_id = rs.getInt("LAST_INSERT_ID()");
				  	}

					//Perform business logic
					book =new Book(book_id,bookName,authorName,ISBN, publisher,total_copies,avail_copies);
					
					//Store the new book in the request-scope
					request.setAttribute("book", book);
				  	
			
					//Send the success view
					RequestDispatcher view = request.getRequestDispatcher("successBook.jsp");
					view.forward(request, response);
					return;
			
		}
			 catch(Exception e) {
				 e.printStackTrace();
			 }
		}
		
		//Handle any unexpected exceptions
		catch(RuntimeException e)  {
			e.printStackTrace();
			errorMsgs.add(e.getMessage());
			//dispatch to the ErrorPage
			RequestDispatcher view = request.getRequestDispatcher("addBook.jsp");
			view.forward(request, response);
	}//END of try-catch block
		
	}//END of doPost method
}//END of AddBookServlet class