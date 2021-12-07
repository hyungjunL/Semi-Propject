package com.kh.member.model.vo;

import java.util.Date;

public class Member {

	private int memberNo; //   MEMBER_NO NUMBER PRIMARY KEY,
	private String memberId; //    MEMBER_ID VARCHAR2(20) NOT NULL,
	private String memberPwd; //    MEMBER_PWD VARCHAR2(30) NOT NULL,
	private String memberName; //    MEMBER_NAME VARCHAR2(15) NOT NULL,
	private String email; //    EMAIL VARCHAR2(30) NOT NULL,
	private String address; //    ADDRESS VARCHAR2(100) NOT NULL,
	private String phone; //    PHONE CHAR(13),
	private Date birth; //    BIRTH DATE,
	private Date enrollDate; //    ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
	private String status;
	
	public Member() {
		super();
	}

	public Member(int memberNo, String memberId, String memberPwd, String memberName, String email, String address,
			String phone, Date birth, Date enrollDate, String status) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.birth = birth;
		this.enrollDate = enrollDate;
		this.status = status;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", email=" + email + ", address=" + address + ", phone=" + phone + ", birth=" + birth
				+ ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}
	
	
}
