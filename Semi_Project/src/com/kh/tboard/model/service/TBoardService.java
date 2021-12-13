package com.kh.tboard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.tboard.model.dao.TBoardDao;
import com.kh.tboard.model.vo.Attachment;
import com.kh.tboard.model.vo.Category;
import com.kh.tboard.model.vo.TBoard;
import static com.kh.common.JDBCTemplate.*;

public class TBoardService {

   public int insertTBoard(TBoard tb, ArrayList<Attachment> list) {
      
      Connection conn = getConnection();
      
      int result1 = new TBoardDao().insertTBoard(conn, tb);
      
      int result2 = new TBoardDao().insertAttachmentList(conn, list);
      
      if(result1 > 0 && result2 > 0) {
         commit(conn);
      }
      else {
         rollback(conn);
      }
      
      close(conn);
      
      return result1 * result2;
      
      
   }

   public ArrayList<TBoard> selectThumbnailList(PageInfo pi) {
      
      Connection conn = getConnection();
      
      ArrayList<TBoard> list = new TBoardDao().selectThumbnailList(conn,pi);
      
      close(conn);
      
      return list;
   }

   public int selectListCount(int category) {
      
      Connection conn = getConnection();
      
      int listCount = new TBoardDao().selectListCount(conn, category);
      // SELECT 문의 결과는 ResultSet 이 맞긴한데
      // 상식적으로 생각해보면 게시글의 총 갯수는 정수형
      
      close(conn);
      
      return listCount;
   }

   public ArrayList<TBoard> selectList(PageInfo pi,int category) {

      Connection conn = getConnection();
      
      ArrayList<TBoard> pageList = new TBoardDao().selectList(conn, pi, category);
      
      close(conn);
      
      return pageList;
   }

   public TBoard selectBoard(int boardNo) {
      
      Connection conn = getConnection();
      
      TBoard b = new TBoardDao().selectBoard(conn, boardNo);
      
      close(conn);
      
      return b;
      
   }

   public ArrayList<Attachment> selectAttachmentList(int boardNo) {
      Connection conn = getConnection();
      
      ArrayList<Attachment> list = new TBoardDao().selectAttachmentList(conn, boardNo);
      
      close(conn);
      
      return list;
   }

   public int increaseCount(int boardNo) {
      Connection conn = getConnection();
      
      int result = new TBoardDao().increaseCount(conn, boardNo);
      
      if(result > 0) {
         commit(conn);
      }
      else {
         rollback(conn);
      }
      
      close(conn);
      
      return result;
   }

   public int deleteBoard(int boardNo) {
      
      Connection conn = getConnection();
      
      int result = new TBoardDao().deleteBoard(conn, boardNo);
      
      if(result > 0) {
         commit(conn);
      }
      else {
         rollback(conn);
      }
      
      close(conn);
      
      return result;
   }

   public ArrayList<Category> selectCategoryList() {
      Connection conn = getConnection();
      
      ArrayList<Category> list = new TBoardDao().selectCategoryList(conn);
      
      close(conn);
      
      return list;
   }

   public Attachment selectAttachment(int boardNo) {
      Connection conn = getConnection();
      
      Attachment at = new TBoardDao().selectAttachment(conn, boardNo);
      
      close(conn);
      
      return at;
   }

   public ArrayList<Attachment> selectAttachmentList2(int boardNo) { //판매 수정화면에서 사용하기위해서 만들었음
      
      Connection conn = getConnection();
      
      ArrayList<Attachment> a_list = new TBoardDao().selectAttachmentList2(conn, boardNo);
      
      close(conn);
      
      return a_list;
   }

   public int updateTBoard(int boardNo, TBoard tb,ArrayList<Attachment> list) {
      Connection conn = getConnection();
      
      int result1 = new TBoardDao().updateTBoard(conn, boardNo, tb);
      int result2 = new TBoardDao().updateAttachment(conn, list, boardNo);
      
      if(result1 > 0 && result2 > 0) {
         commit(conn);
      }
      else {
         rollback(conn);
      }
      
      close(conn);
      
      return result1 * result2;
   }

   public int selectAllListCount() {
      Connection conn = getConnection();
      
      int listCount = new TBoardDao().selectAllListCount(conn);
      // SELECT 臾몄쓽 寃곌낵 뒗 ResultSet  씠 留욊릿 븳 뜲
      //  긽 떇 쟻 쑝濡   깮媛곹빐蹂대㈃ 寃뚯떆湲  쓽 珥  媛  닔 뒗  젙 닔 삎
      
      close(conn);
      
      return listCount;
   }

   public ArrayList<TBoard> selectAllList(PageInfo pi) {
      Connection conn = getConnection();
      ArrayList<TBoard> indexAllList = new TBoardDao().selectAllList(conn, pi);
      
      close(conn);
      return indexAllList;
   }

   public ArrayList<TBoard> indexSelectTBoard() {
      Connection conn = getConnection();
      
      ArrayList<TBoard> indexTList = new TBoardDao().indexSelectTBoard(conn);
      
      close(conn);
      
      return indexTList;
   }

   public String selectAddress(int boardNo) {
      Connection conn = getConnection();

      String a = new TBoardDao().selectAddress(conn, boardNo);

      close(conn);

      return a;
   }
   
}