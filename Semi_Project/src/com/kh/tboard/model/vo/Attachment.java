package com.kh.tboard.model.vo;

public class Attachment {


	private int fileNo;//	 FILE_NO NUMBER NOT NULL PRIMARY KEY,
	private int fNo;//	    F_NO NUMBER NOT NULL REFERENCES F_BOARD (F_NO),
	private String fileName;
	private String changeName;//	    FILE_NAME VARCHAR2(200)NOT NULL,
	private String filePath;
	private String fileLevel;//	    FILE_PATH VARCHAR2(200) ,
	private String status;//	    STATUS VARCHAR2(1) NOT NULL
	private String titleImg;
	
	public Attachment() {
		super();
	}


	public Attachment(int fileNo, String fileName, String changeName, String filePath, String fileLevel,
			String status) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.status = status;
	}


	public String getTitleImg() {
		return titleImg;
	}


	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public int getfNo() {
		return fNo;
	}


	public void setfNo(int fNo) {
		this.fNo = fNo;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public String getFileLevel() {
		return fileLevel;
	}


	public void setFileLevel(String fileLevel) {
		this.fileLevel = fileLevel;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", fNo=" + fNo + ", fileName=" + fileName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", status=" + status + "]";
	}


	
}
