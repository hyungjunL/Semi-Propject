package com.kh.common.model.vo;

import java.sql.Date;

public class One {

   private int o_Id;
   private int memberNo;
   private String memberId;
   private String o_Title;
   private String o_Content;
   private String answer;
   private Date create_Date;



   public One() {
      super();
   }




   public One(int o_Id, int memberNo, String memberId, String o_Title, String o_Content, String answer,
         Date create_Date) {
      super();
      this.o_Id = o_Id;
      this.memberNo = memberNo;
      this.memberId = memberId;
      this.o_Title = o_Title;
      this.o_Content = o_Content;
      this.answer = answer;
      this.create_Date = create_Date;
   }

   
   

   


   public One(int o_Id, String memberId, int memberNo,  String o_Title, String o_Content, Date create_Date) {
      super();
      this.o_Id = o_Id;
      this.memberNo = memberNo;
      this.memberId = memberId;
      this.o_Title = o_Title;
      this.o_Content = o_Content;
      this.create_Date = create_Date;
   }




   public String getMemberId() {
      return memberId;
   }

   public void setMemberId(String memberId) {
      this.memberId = memberId;
   }

   public int getO_Id() {
      return o_Id;
   }

   public void setO_Id(int o_Id) {
      this.o_Id = o_Id;
   }

   public int getMemberNo() {
      return memberNo;
   }

   public void setMemberNo(int memberNo) {
      this.memberNo = memberNo;
   }

   public String getO_Title() {
      return o_Title;
   }

   public void setO_Title(String o_Title) {
      this.o_Title = o_Title;
   }

   public String getO_Content() {
      return o_Content;
   }

   public void setO_Content(String o_Content) {
      this.o_Content = o_Content;
   }

   public String getAnswer() {
      return answer;
   }

   public void setAnswer(String answer) {
      this.answer = answer;
   }

   public Date getCreate_Date() {
      return create_Date;
   }

   public void setCreate_Date(Date create_Date) {
      this.create_Date = create_Date;
   }

   @Override
   public String toString() {
      return "One [o_Id=" + o_Id + ", memberNo=" + memberNo + ", memberId=" + memberId + ", o_Title=" + o_Title
            + ", o_Content=" + o_Content + ", answer=" + answer + ", create_Date=" + create_Date + "]";
   }

}