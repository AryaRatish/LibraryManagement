package org.tutorial.spoken;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tutorial.spoken.model.CheckOut;

/**
 * Servlet implementation class GreetingServlet
 */
//@WebServlet(description = "Library Management System Greeting Page", urlPatterns = { "/GreetingServlet" })
public class GreetingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GreetingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
			    throws ServletException, IOException {        
			          
		//Keep a set of strings to record form processing errors.
			List<String> errorMsgs=new ArrayList<String>();
			        String userName = request.getParameter("userName").toString();
			        String password = request.getParameter("password").toString();
			        String aTemp1=null,aTemp2=null;
			      //send the ErrorPage view.
					request.setAttribute("errorMsgs", errorMsgs);
					

			        
			        if(userName!=null && userName.length() > 0 && password!=null && password.length() > 0) {
			        	
			        	if(userName.equals("admin") && password.equals("admin")) {
			        
			        		response.sendRedirect("adminsection.jsp");
			        	
			        	}
			        	
			        	else 
			        	{
// connecting to database
					 Connection con = null;  
					 PreparedStatement stmt = null;
					 ResultSet rs = null;
					 try {
					 Class.forName("com.mysql.jdbc.Driver");
					  con =DriverManager.getConnection 
					  ("jdbc:mysql://127.0.0.1:3306/library","root","root123");
					  stmt = con.prepareStatement("select * from users where username = ? and password = ?");
					  stmt.setString(1, userName);
					  stmt.setString(2, password);
					  rs = stmt.executeQuery();
					  String id = null;
					 
					  if(rs.next()){
						id= rs.getString(1);
						
					  }else{
						  errorMsgs.add("Invalid username or password");
						  return;
					  }
					//Send the ErrorPage view if there were errors
						if(!errorMsgs.isEmpty())  {
							RequestDispatcher view = request.getRequestDispatcher("addBook.jsp");
							view.forward(request, response);
							return;
						}
									   
					  
					  stmt = con.prepareStatement("select * from checkout where username = ?");
					  stmt.setString(1, userName);
					  rs = stmt.executeQuery();
					  List<CheckOut> checkedOutItems = new ArrayList<CheckOut>();
					  while(rs.next()){
						  CheckOut item = new CheckOut();
						  item.setTransactionId(rs.getInt(1));
						  item.setBookId(rs.getInt(2));	  
						  item.setUserName(rs.getString(3));
						  checkedOutItems.add(item);
					  }
					  request.setAttribute("checkedOutItems", checkedOutItems);
					  
					//Send the success view
						RequestDispatcher view = request.getRequestDispatcher("successGreeting.jsp");
						view.forward(request, response);
						return;
					 }
						  
					catch (SQLException e) {
					 throw new ServletException("Servlet Could not display records.", e);
					  } catch (ClassNotFoundException e) {
					  throw new ServletException("JDBC Driver not found.", e);
					  } finally {
					  try {
					  if(rs != null) {
					  rs.close();
					  rs = null;
					  }
					  if(stmt != null) {
					  stmt.close();
					  stmt = null;
					  }
					  if(con != null) {
					  con.close();
					  con = null;
					  }
					  } catch (SQLException e) {}
					  }
			        } 
			       }
			        	
	 }

	 public void service(HttpServletRequest request,
			  HttpServletResponse response)
			  throws IOException, ServletException{
		  	  doPost(request,response);
			 
			  }
	 		  
}
