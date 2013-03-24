package org.tutorial.spoken.model;

import java.util.Date;

public class CheckOut {

	int transactionId=0;
    
    String userName="";
	int bookId=0;


	
	
	public CheckOut (int transactionId,String userName,int bookId){
		this.transactionId=transactionId;

		this.userName=userName;
		this.bookId=bookId;
		
	}
	
	public CheckOut() {
		// TODO Auto-generated constructor stub
	}
	public int getTransactionId()  {
		return transactionId;
	}
	public void setTransactionId(int transactionId) {
		this.transactionId=transactionId;
	}
	
	public String getUserName()  {
		return userName;
	}
	public void setUserName(String userName)  {
		this.userName=userName;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	

}
