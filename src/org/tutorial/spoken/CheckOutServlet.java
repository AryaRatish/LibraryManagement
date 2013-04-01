package org.tutorial.spoken;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tutorial.spoken.model.CheckOut;

/**
 * Servlet implementation class AddBookServlet
 */
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Keep a set of strings to record form processing errors.
		List<String> errorMsgs = new ArrayList<String>();

		// JDBC variables
		PrintWriter out = response.getWriter();
		Connection con = null;
		PreparedStatement stmt = null;
		PreparedStatement pst = null, pst2 = null, pst3 = null, pst4 = null;
		ResultSet rs = null, rs2 = null, rs3 = null;
		int oldcopies, totcopies, availcopies;

		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		request.setAttribute("errorMsgs", errorMsgs);

		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/library", "root", "root123");
			stmt = con.prepareStatement("select username from users where username=?");
			stmt.setString(1, request.getParameter("username"));
			rs = stmt.executeQuery();
			String aTemp1 = null;
			int aTemp2 = 0;
			int flag = 1, cflag = 0;

			// Retrieve form parameters

			String userName = request.getParameter("username");
			// String bookId=request.getParameter("bookid");
			// int book_id=Integer.parseInt(bookId);
			// String bookName=request.getParameter("bookname");
			String checkout_book = request.getParameter("checkout");
			String return_book = request.getParameter("return");
			String dateOfCheckout=request.getParameter("dateofcheckout");
			String returndate=request.getParameter("dateofreturn");
			String id = request.getParameter("bkgroup1");
			int book_id = Integer.parseInt(id);

			// Verify form parameters
			// if(bookId.length()==0){
			// errorMsgs.add("Please enter the book id");
			// }
			// if(bookName.length()==0) {
			// errorMsgs.add("Please enter the book name");
			// }
			if (userName.length() == 0) {
				errorMsgs.add("Please enter the user name");
			}
			if (id.length() == 0) {
				errorMsgs.add("Please click on the book you want to checkout");
			}

			// Checking out a book

			int tempid;
			if (checkout_book != null || return_book != null) {
				while (rs.next()) {
					aTemp1 = rs.getString(1);
					if (aTemp1 != null && aTemp1.length() > 0
							&& aTemp1.equals(userName)) {
//						aTemp2 = rs.getInt(1);
						flag = 0;
						pst = con.prepareStatement("select book_id from Checkout where Username=?");
						pst.setString(1, aTemp1);
						rs2 = pst.executeQuery();
						while (rs2.next()) {
							tempid = rs2.getInt(1);
							if (tempid == book_id) {
								cflag = 1;
								break;
							}
						}
					}

				}

				SimpleDateFormat dateFormat = new SimpleDateFormat();
				dateFormat.applyPattern("MM/dd/yy");
				if (flag == 0 && checkout_book != null) {

					pst = con
							.prepareStatement("select bookname,availablecopies from books where id=?");
					pst.setInt(1, book_id);
					rs3 = pst.executeQuery();
					String bname = null;
					if (rs3.next()) {
						oldcopies = rs3.getInt(2);
						bname = rs3.getString(1);
						if (oldcopies > 0) {
							if (cflag == 0) {
								pst2 = con.prepareStatement("insert into checkout values(null,?,?,?,?)");
								pst2.setString(2, userName);
								pst2.setInt(1, book_id);
								pst2.setDate(3, new java.sql.Date(dateFormat.parse(returndate).getTime()));
								pst2.setDate(4, new java.sql.Date(dateFormat.parse(dateOfCheckout).getTime()));
								pst2.executeUpdate();
								oldcopies -= 1;
								pst4 = con.prepareStatement("update books set availablecopies=? where id=?");
								pst4.setInt(1, oldcopies);
								pst4.setInt(2, book_id);
								pst4.executeUpdate();
								CheckOut checkOut = new CheckOut();
								checkOut.setBookId(book_id);
								checkOut.setUserName(userName);
								request.setAttribute("checkout", checkOut);
								
								// Send the success checkout view
								RequestDispatcher view = request
										.getRequestDispatcher("successCheckout.jsp");
								view.forward(request, response);
								return;
							}

							else {
								errorMsgs
										.add("The same user has already borrowed this book!");
							}
						} else {
							errorMsgs
									.add("There are no copies of the requested book available.");

						}
					}
				}

				// Returning a book
				else if (flag == 0 && return_book != null) {
					int borrowcheck = 0;
					pst = con.prepareStatement("select totalcopies,availablecopies from books where id=?");
					pst.setInt(1, book_id);
					rs2 = pst.executeQuery();
					if (rs2.next()) {
						totcopies = rs2.getInt(1);
						availcopies = rs2.getInt(2);
						if ((availcopies + 1) <= totcopies) {
							if (cflag == 1) {
								pst2 = con.prepareStatement("delete from checkout where username=? and transaction_id=?");
								pst2.setInt(1, aTemp2);
								pst2.setInt(2, book_id);
								pst2.executeUpdate();
								availcopies += 1;
								pst4 = con.prepareStatement("update books set availablecopies=? where id=?");
								pst4.setInt(1, availcopies);
								pst4.setInt(2, book_id);

								pst4.executeUpdate();
								// Send the success view
								
								CheckOut checkOut = new CheckOut();
								checkOut.setBookId(book_id);
								checkOut.setUserName(userName);
								request.setAttribute("returnBook", checkOut);
																
								RequestDispatcher view = request.getRequestDispatcher("successReturn.jsp");
								view.forward(request, response);
								return;
							}

							else {
								errorMsgs.add("The given user has not borrowed this book!");
							}
						} else {
							errorMsgs.add("Available copies of the book cannot exceed total copies.");

						}
					}
				} else {
					errorMsgs.add("No such User exists!");
				}
			}

			else {
				errorMsgs.add("Please select either checkout/return option!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Send the ErrorPage view if there were errors
		if (!errorMsgs.isEmpty()) {
		
			RequestDispatcher view = request
					.getRequestDispatcher("checkOut.jsp");
			view.forward(request, response);
			return;
		}

	}
}