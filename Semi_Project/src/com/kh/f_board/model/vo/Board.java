package com.kh.f_board.model.vo;

import java.sql.Date;

public class Board {

	private int F_NO;
	private String F_TITLE;
	private String MEMBER_ID;
	private String CONTENT;
	private String T_COUNT;
	private Date CREATE_DATE;
	private int MEMBER_NO;
	private int FILE_NO;
	private String STATUS;
	private String BOARD_WRITER;
	private int max_NO; 

	public Board() {
		super();
	}
	
	

	public Board(int max_NO) {
		super();
		this.max_NO = max_NO;
	}



	public Board(int f_NO, String f_TITLE, String mEMBER_ID, String cOUNT, Date cREATE_DATE) {
		super();
		F_NO = f_NO;
		F_TITLE = f_TITLE;
		MEMBER_ID = mEMBER_ID;
		T_COUNT = cOUNT;
		CREATE_DATE = cREATE_DATE;
	}

	public Board(int f_NO, String mEMBER_ID, String t_COUNT, Date cREATE_DATE, String f_TITLE,  String cONTENT ) {
		super();
		F_NO = f_NO;
		MEMBER_ID = mEMBER_ID;
		T_COUNT = t_COUNT;
		CREATE_DATE = cREATE_DATE;
		F_TITLE = f_TITLE;
		CONTENT = cONTENT;
	}

	public int getF_NO() {
		return F_NO;
	}

	public void setF_NO(int f_NO) {
		F_NO = f_NO;
	}

	public String getF_TITLE() {
		return F_TITLE;
	}

	public void setF_TITLE(String f_TITLE) {
		F_TITLE = f_TITLE;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getCONTENT() {
		return CONTENT;
	}

	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}

	public String getT_COUNT() {
		return T_COUNT;
	}

	public void setT_COUNT(String t_COUNT) {
		T_COUNT = t_COUNT;
	}

	public Date getCREATE_DATE() {
		return CREATE_DATE;
	}

	public void setCREATE_DATE(Date cREATE_DATE) {
		CREATE_DATE = cREATE_DATE;
	}

	public int getMEMBER_NO() {
		return MEMBER_NO;
	}

	public void setMEMBER_NO(int mEMBER_NO) {
		MEMBER_NO = mEMBER_NO;
	}

	public int getFILE_NO() {
		return FILE_NO;
	}

	public void setFILE_NO(int fILE_NO) {
		FILE_NO = fILE_NO;
	}

	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

	public String getBOARD_WRITER() {
		return BOARD_WRITER;
	}

	public void setBOARD_WRITER(String bOARD_WRITER) {
		BOARD_WRITER = bOARD_WRITER;
	}

	public int getMax_NO() {
		return max_NO;
	}



	public void setMax_NO(int max_NO) {
		this.max_NO = max_NO;
	}



	@Override
	public String toString() {
		return "Board [F_NO=" + F_NO + ", F_TITLE=" + F_TITLE + ", MEMBER_ID=" + MEMBER_ID + ", COUNT=" + T_COUNT
				+ ", CREATE_DATE=" + CREATE_DATE + "]";
	}

}
