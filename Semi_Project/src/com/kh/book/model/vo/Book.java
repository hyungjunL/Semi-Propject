package com.kh.book.model.vo;
import java.sql.Date;

public class Book {

private int bookNo;//	T_NO NUMBER PRIMARY KEY,               
private String bookTitle;//T_TITLE VARCHAR2(50) NOT NULL,   
private int bookPrice;//	  T_PRICE NUMBER NOT NULL,  
private int bookCate;//	  CATEGORY_NO NUMBER NOT NULL,  
private char bookStatus;//	  BOOK_STATUS CHAR(3) NOT NULL,              
private String bookContent;//	  CONTENT VARCHAR2(600) NOT NULL,
private Date createDate;//	  CREATE_DATE DATE DEFAULT SYSDATE,
private int count;//	  T_COUNT NUMBER NOT NULL,
private int memNO;//MEMBER_NO NUMBER NOT NULL,
private char status;//	  STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))


public Book() {
	super();
}


public Book(int bookNo, String bookTitle, int bookPrice, int bookCate, char bookStatus, String bookContent,
		Date createDate, int count, int memNO, char status) {
	super();
	this.bookNo = bookNo;
	this.bookTitle = bookTitle;
	this.bookPrice = bookPrice;
	this.bookCate = bookCate;
	this.bookStatus = bookStatus;
	this.bookContent = bookContent;
	this.createDate = createDate;
	this.count = count;
	this.memNO = memNO;
	this.status = status;
}




public Book(int bookNo, String bookTitle, int bookPrice) {
	super();
	this.bookNo = bookNo;
	this.bookTitle = bookTitle;
	this.bookPrice = bookPrice;
}



public Book(int bookNo, String bookTitle, int bookPrice, int memNO) {
	super();
	this.bookNo = bookNo;
	this.bookTitle = bookTitle;
	this.bookPrice = bookPrice;
	this.memNO = memNO;
}


public int getBookNo() {
	return bookNo;
}


public void setBookNo(int bookNo) {
	this.bookNo = bookNo;
}


public String getBookTitle() {
	return bookTitle;
}


public void setBookTitle(String bookTitle) {
	this.bookTitle = bookTitle;
}


public int getBookPrice() {
	return bookPrice;
}


public void setBookPrice(int bookPrice) {
	this.bookPrice = bookPrice;
}


public int getBookCate() {
	return bookCate;
}


public void setBookCate(int bookCate) {
	this.bookCate = bookCate;
}


public char getBookStatus() {
	return bookStatus;
}


public void setBookStatus(char bookStatus) {
	this.bookStatus = bookStatus;
}


public String getBookContent() {
	return bookContent;
}


public void setBookContent(String bookContent) {
	this.bookContent = bookContent;
}


public Date getCreateDate() {
	return createDate;
}


public void setCreateDate(Date createDate) {
	this.createDate = createDate;
}


public int getCount() {
	return count;
}


public void setCount(int count) {
	this.count = count;
}


public int getMemNO() {
	return memNO;
}


public void setMemNO(int memNO) {
	this.memNO = memNO;
}


public char getStatus() {
	return status;
}


public void setStatus(char status) {
	this.status = status;
}


@Override
public String toString() {
	return "Book [bookNo=" + bookNo + ", bookTitle=" + bookTitle + ", bookPrice=" + bookPrice + ", bookCate=" + bookCate
			+ ", bookStatus=" + bookStatus + ", bookContent=" + bookContent + ", createDate=" + createDate + ", count="
			+ count + ", memNO=" + memNO + ", status=" + status + "]";
}
	
	
	
	
}
