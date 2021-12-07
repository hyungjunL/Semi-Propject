package com.kh.tboard.model.vo;

import java.sql.Date;

public class TBoard {
	

	private int tNo;//	T_NO NUMBER PRIMARY KEY,               
	private String tTitle;//	  T_TITLE VARCHAR2(50) NOT NULL,   
	private int tPrice;//	  T_PRICE NUMBER NOT NULL,  
	private int categoryNo;//	  CATEGORY_NO NUMBER NOT NULL,  
	private String bookStatus;//	  BOOK_STATUS CHAR(3) NOT NULL,              
	private String content;//	  CONTENT VARCHAR2(600) NOT NULL,
	private Date createDate;//	  CREATE_DATE DATE DEFAULT SYSDATE,
	private int tCount;//	  T_COUNT NUMBER NOT NULL,
	private String memberNo;//	  USER_NO NUMBER NOT NULL,
	private String status;//	  STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
	private String categoryName;
	private String titleImg;
	

	public TBoard() {
		super();
	}

	public TBoard(int tNo, String tTitle, int tPrice, int categoryNo, String bookStatus, String content,
			Date createDate, int tCount, String memberNo, String status) {
		super();
		this.tNo = tNo;
		this.tTitle = tTitle;
		this.tPrice = tPrice;
		this.categoryNo = categoryNo;
		this.bookStatus = bookStatus;
		this.content = content;
		this.createDate = createDate;
		this.tCount = tCount;
		this.memberNo = memberNo;
		this.status = status;
	}
	public TBoard(int tNo, String tTitle,int tPrice, int categoryNo, Date createDate, int tCount, String memberNo,String status,String titleImg) {
		super();
		this.tNo = tNo;
		this.tTitle = tTitle;
		this.tPrice = tPrice;
		this.categoryNo = categoryNo;
		this.createDate = createDate;
		this.tCount = tCount;
		this.memberNo = memberNo;
		this.status = status;
		this.titleImg = titleImg;
	}
	
	
	public TBoard(int tNo, String tTitle, String categoryName, String content, Date createDate, String memberNo,int tPrice,String status, String bookStatus) {
		super();
		this.tNo = tNo;
		this.tTitle = tTitle;
		this.categoryName = categoryName;
		this.content = content;
		this.createDate = createDate;
		this.memberNo = memberNo;
		this.tPrice = tPrice;
		this.status = status;
		this.bookStatus = bookStatus;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	
	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}

	public String gettTitle() {
		return tTitle;
	}

	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}

	public int gettPrice() {
		return tPrice;
	}

	public void settPrice(int tPrice) {
		this.tPrice = tPrice;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getBookStatus() {
		return bookStatus;
	}

	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int gettCount() {
		return tCount;
	}

	public void settCount(int tCount) {
		this.tCount = tCount;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TBoard [tNo=" + tNo + ", tTitle=" + tTitle + ", tPrice=" + tPrice + ", categoryNo=" + categoryNo
				+ ", bookStatus=" + bookStatus + ", content=" + content + ", createDate=" + createDate + ", tCount="
				+ tCount + ", memberNo=" + memberNo + ", status=" + status + "]";
	}

	
}
