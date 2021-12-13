package com.kh.service.model.vo;

public class FAQ {
	
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	
	public FAQ() {
		super();
	}
	
	
	

	public FAQ(String faqTitle, String faqContent) {
		super();
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}




	public FAQ(int faqNo, String faqTitle) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
	}



	public FAQ(int faqNo, String faqTitle, String faqContent) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + "]";
	}

	
	
	
	

}
