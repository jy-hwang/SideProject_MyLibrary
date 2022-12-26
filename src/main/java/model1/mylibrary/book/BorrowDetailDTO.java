package model1.mylibrary.book;

public class BorrowDetailDTO {

	private String bookCode;
	private String bookTitle;
	private String bookAuthor;
	private String bookGenre;
	private String bookGenreNm;
	private String borrowStatus;
	private String borrowStatusNm;
	private String publisher;
	private java.sql.Date publishDate;
	private java.sql.Date borrowStartTime;
	private java.sql.Date borrowEndTime;

	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public String getBookGenre() {
		return bookGenre;
	}

	public void setBookGenre(String bookGenre) {
		this.bookGenre = bookGenre;
	}

	public String getBookGenreNm() {
		return bookGenreNm;
	}

	public void setBookGenreNm(String bookGenreNm) {
		this.bookGenreNm = bookGenreNm;
	}

	public String getBorrowStatus() {
		return borrowStatus;
	}

	public void setBorrowStatus(String borrowStatus) {
		this.borrowStatus = borrowStatus;
	}

	public String getBorrowStatusNm() {
		return borrowStatusNm;
	}

	public void setBorrowStatusNm(String borrowStatusNm) {
		this.borrowStatusNm = borrowStatusNm;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public java.sql.Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(java.sql.Date publishDate) {
		this.publishDate = publishDate;
	}

	public java.sql.Date getBorrowStartTime() {
		return borrowStartTime;
	}

	public void setBorrowStartTime(java.sql.Date borrowStartTime) {
		this.borrowStartTime = borrowStartTime;
	}

	public java.sql.Date getBorrowEndTime() {
		return borrowEndTime;
	}

	public void setBorrowEndTime(java.sql.Date borrowEndTime) {
		this.borrowEndTime = borrowEndTime;
	}

}
