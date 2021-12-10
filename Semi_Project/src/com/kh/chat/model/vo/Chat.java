package com.kh.chat.model.vo;

import java.util.Date;

public class Chat {
	
	  private int chatNo;//CHAT_ID NUMBER NOT NULL PRIMARY KEY,
	  private int fromNo;//FROM_ID NUMBER) NOT NULL,
	  private int toNo;//TO_ID NUMBER NOT NULL,
	  private String chatContent;//CHAT_CONTENT VARCHAR2(100) NOT NULL,
	  private Date createDate;//CHAT_TIME DATE DEFAULT SYSDATE
	  private int memberNo;
	  
	  public Chat() {
		super();
	}


	public Chat(int chatNo, int fromNo, int toNo, String chatContent, Date createDate, int memberNo) {
		super();
		this.chatNo = chatNo;
		this.fromNo = fromNo;
		this.toNo = toNo;
		this.chatContent = chatContent;
		this.createDate = createDate;
		this.memberNo = memberNo;
	}
	
	public Chat(int chatNo, int fromNo, int toNo, String chatContent, Date createDate) {
		super();
		this.chatNo = chatNo;
		this.fromNo = fromNo;
		this.toNo = toNo;
		this.chatContent = chatContent;
		this.createDate = createDate;
		
	}

	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public Chat(int toNo) {
		super();
		this.toNo = toNo;
	}


	public int getChatNo() {
		return chatNo;
	}


	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}


	public int getFromNo() {
		return fromNo;
	}


	public void setFromNo(int fromNo) {
		this.fromNo = fromNo;
	}


	public int getToNo() {
		return toNo;
	}


	public void setToNo(int toNo) {
		this.toNo = toNo;
	}


	public String getChatContent() {
		return chatContent;
	}


	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", fromNo=" + fromNo + ", toNo=" + toNo + ", chatContent=" + chatContent
				+ ", createDate=" + createDate + "]";
	}


	

	
	
   
	
	  
	  
	  
	

}
