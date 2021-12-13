package com.kh.service.model.vo;

import java.sql.Date;

public class Service {
	
		private int oneId;
		private int memberNo;
		private String oneTitle;
		private String oneContent;
		private String answer;
		private Date createDate;
		private String inqId;
		private String inqName;
		private int oType;
		
		public Service(int oneId, int memberNo, String oneTitle, String oneContent, String answer, Date createDate,
			String inqId, String inqName, int oType) {
		super();
		this.oneId = oneId;
		this.memberNo = memberNo;
		this.oneTitle = oneTitle;
		this.oneContent = oneContent;
		this.answer = answer;
		this.createDate = createDate;
		this.inqId = inqId;
		this.inqName = inqName;
		this.oType = oType;
	}

	public Service(int oneId, String oneTitle, String oneContent) {
		super();
		this.oneId = oneId;
		this.oneTitle = oneTitle;
		this.oneContent = oneContent;
	}

	public Service(String oneTitle, String oneContent, String answer, Date createDate) {
		super();
		this.oneTitle = oneTitle;
		this.oneContent = oneContent;
		this.answer = answer;
		this.createDate = createDate;
	}
	
	public Service(int oneId, String oneTitle, Date createDate) {
		super();
		this.oneId = oneId;
		this.oneTitle = oneTitle;
		this.createDate = createDate;
	}
	
	
	
	
	public Service(int oneId, int oType,String oneTitle, String oneContent, Date createDate ) {
		super();
		this.oneId = oneId;
		this.oType = oType;
		this.oneTitle = oneTitle;
		this.oneContent = oneContent;
		this.createDate = createDate;
		
	}

	public Service(String oneTitle, String oneContent, String answer, Date createDate, int oType) {
		super();
		this.oneTitle = oneTitle;
		this.oneContent = oneContent;
		this.answer = answer;
		this.createDate = createDate;
		this.oType = oType;
	}

	public Service(int oType, String oneTitle, String oneContent, String answer, Date createDate) {
		super();
		this.oneTitle = oneTitle;
		this.oneContent = oneContent;
		this.answer = answer;
		this.createDate = createDate;
		this.oType = oType;
	}

	public Service(String oneTitle, String oneContent, String inqId, String inqName, int oType) {
		super();
		this.oneTitle = oneTitle;
		this.oneContent = oneContent;
		this.inqId = inqId;
		this.inqName = inqName;
		this.oType = oType;
	}

	public String getInqId() {
		return inqId;
	}

	public void setInqId(String inqId) {
		this.inqId = inqId;
	}

	public String getInqName() {
		return inqName;
	}

	public void setInqName(String inqName) {
		this.inqName = inqName;
	}

	public int getoType() {
		return oType;
	}

	public void setoType(int oType) {
		this.oType = oType;
	}

	public Service() {
		super();
	}
	
	public Service(int oneId, String oneTitle) {
		super();
		this.oneId = oneId;
		this.oneTitle = oneTitle;
	}
	
	

	

	public int getOneId() {
		return oneId;
	}

	public void setOneId(int oneId) {
		this.oneId = oneId;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getOneTitle() {
		return oneTitle;
	}

	public void setOneTitle(String oneTitle) {
		this.oneTitle = oneTitle;
	}

	public String getOneContent() {
		return oneContent;
	}

	public void setOneContent(String oneContent) {
		this.oneContent = oneContent;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

@Override
	public String toString() {
		return "Service [oneId=" + oneId + ", memberNo=" + memberNo + ", oneTitle=" + oneTitle + ", oneContent="
				+ oneContent + ", answer=" + answer + ", createDate=" + createDate + ", inqId=" + inqId
				+ ", inqName=" + inqName + ", oType=" + oType + "]";
	}



	
	
	
	
}
