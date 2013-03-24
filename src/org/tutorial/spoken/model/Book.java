package org.tutorial.spoken.model;

public class Book {

	private int bookId=0;
	private String bookName=" ";
	private String authorName="";
	private String ISBN="";
	private String publisher="";
	private int totalCopies=0;
	private int availCopies=0;
	
	public Book(int bookId,String bookName, String authorName, String ISBN,String publisher,int totalCopies, int availCopies){
		this.bookId=bookId;
		this.bookName=bookName;
		this.authorName=authorName;
		this.ISBN=ISBN;
		this.publisher=publisher;
		this.availCopies=availCopies;
		this.totalCopies=totalCopies;
	}
	
	public Book() {
		// TODO Auto-generated constructor stub
	}
	
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getAvailCopies() {
		return availCopies;
	}
	public void setAvailCopies(int availCopies) {
		this.availCopies = availCopies;
	}
	public int getTotalCopies()  {
		return totalCopies;
	}
	public void setTotalCopies(int totalCopies)  {
		this.totalCopies=totalCopies;
	}
	

}
