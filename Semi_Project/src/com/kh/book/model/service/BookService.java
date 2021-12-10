package com.kh.book.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.book.model.dao.BookDao;
import com.kh.book.model.vo.Book;
import com.kh.book.model.vo.Heart;
import com.kh.common.model.vo.PageInfo;

import static com.kh.common.JDBCTemplate.*;

public class BookService {
	
		public int selectListCount() {
			 
			 
			 Connection conn = getConnection();
			int listCount = new BookDao().selectListCount(conn);
			close(conn);
			 
			 return listCount;
		 }
		
	
	
	 public ArrayList<Book> selectBookList(PageInfo pi){
		 
		 
		 Connection conn = getConnection();
		 ArrayList<Book> list = new BookDao().selectBookList(conn,pi);
		 
		 close(conn);
		 
		 return list;
	 }
	 
	 public ArrayList<Book> selectByTitle(PageInfo pi,String keyword){
		 
		 
		 Connection conn = getConnection();
		 ArrayList<Book> list = new BookDao().selectByTitle(conn,pi,keyword);
		 
		 close(conn);
		 
		 return list;
	 }
	 
	 
	 public Book selectBook(int bookNo) {
			
			Connection conn = getConnection();
			
			Book b = new BookDao().selectBook(conn, bookNo);
			
			close(conn);
			
			return b;
		}
	 
	 
	 public ArrayList<Heart> selectHeartList(int userNo){
		 Connection conn = getConnection();
		 ArrayList<Heart> list = new BookDao().selectHeartList(conn,userNo);
		 
		 close(conn);
		 
		 return list;
		 
	 }
	 
	 public int selectHeartCount(int bno) {
		 
		 
		 Connection conn = getConnection();
		 int heartCount = new BookDao().selectHeartCount(conn,bno);
		 close(conn);
		 
		 return heartCount;
	 }
	 
	 
	 public int selectUpdateHeart(int bno , int userNo) {
		 
		 
		Connection conn = getConnection();
		
		//dao 메소드 호출
		int heartCheck = new BookDao().selectUpdateHeart(conn,bno,userNo);
		int insertHeart = 0;
		int deleteHeart = 0;
		
		//System.out.println(heartCheck);
		
		
		if(heartCheck == 0) { // 찜 안된상태 => 찜하기
			
			
			insertHeart = new BookDao().insertHeart(conn,userNo,bno);
			
			  if(insertHeart > 0) {
			  
			 commit(conn); }
			 
			 else{
			 
			  rollback(conn); }
			 
				
		}
		
		else { // 찜 된 상태 => 찜 삭제
			    
			  deleteHeart = new BookDao().deleteHeart(conn,userNo,bno);
			 
			  if(deleteHeart > 0) {
					
				    commit(conn);
				}
				
				else{
					
					rollback(conn);
				}
		}
	
		close(conn);
		
		return heartCheck;
		 
	 }
	 
	
	 /*
		 * public int insertHeart(Heart h) {
		 * 
		 * Connection conn = getConnection();
		 * 
		 * int insertHeart = new BookDao().insertHeart(conn, h);
		 * 
		 * if(insertHeart > 0) { commit(conn); } else { rollback(conn); }
		 * 
		 * return insertHeart; }
		 * 
		 * 
		 * 
		 * public int deleteHeart(Heart h) {
		 * 
		 * Connection conn = getConnection();
		 * 
		 * int deleteHeart = new BookDao().deleteHeart(conn, h);
		 * 
		 * if(deleteHeart > 0) { commit(conn); } else { rollback(conn); }
		 * 
		 * return deleteHeart; }
		 */
		  
		
	 
	 

}
