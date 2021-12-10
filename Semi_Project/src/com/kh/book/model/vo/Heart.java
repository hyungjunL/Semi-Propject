package com.kh.book.model.vo;
import java.util.Date;


    	public class Heart {

    	private int heart; // 찜 +1  //ZZIM_NO NUMBER PRIMARY KEY,
    	private int heartMember;//ZZIM_MEMBER NUMBER NOT NULL, 
    	private int heartBno;//ZZIM_TNO NUMBER NOT NUll,
    	private String bookTitle; // 글 타이틀 제목
    	private Date createDate; //CREATE_DATE DATE NOT NULL,
    	private char status;//STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
		
    	public Heart() {
			super();
		}

		public Heart(int heart, int heartMember, int heartBno, String bookTitle, Date createDate, char status) {
			super();
			this.heart = heart;
			this.heartMember = heartMember;
			this.heartBno = heartBno;
			this.bookTitle = bookTitle;
			this.createDate = createDate;
			this.status = status;
		}
		
		
		public Heart(int heart, int heartBno, String bookTitle) {
			super();
			this.heart = heart;
			this.heartBno = heartBno;
			this.bookTitle = bookTitle;
		}

		public int getHeart() {
			return heart;
		}

		public void setHeart(int heart) {
			this.heart = heart;
		}

		public int getHeartMember() {
			return heartMember;
		}

		public void setHeartMember(int heartMember) {
			this.heartMember = heartMember;
		}

		public int getHeartBno() {
			return heartBno;
		}

		public void setHeartBno(int heartBno) {
			this.heartBno = heartBno;
		}

		public String getBookTitle() {
			return bookTitle;
		}

		public void setBookTitle(String bookTitle) {
			this.bookTitle = bookTitle;
		}

		public Date getCreateDate() {
			return createDate;
		}

		public void setCreateDate(Date createDate) {
			this.createDate = createDate;
		}

		public char getStatus() {
			return status;
		}

		public void setStatus(char status) {
			this.status = status;
		}

		@Override
		public String toString() {
			return "Heart [heart=" + heart + ", heartMember=" + heartMember + ", heartBno=" + heartBno + ", bookTitle="
					+ bookTitle + ", createDate=" + createDate + ", status=" + status + "]";
		}
		
    	
    	
    	
    	
    	
    
	}
    	
    	

	
	
	


