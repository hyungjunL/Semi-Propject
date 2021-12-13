package com.kh.book.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.book.model.vo.Book;
import com.kh.book.model.vo.Heart;
import com.kh.common.model.vo.PageInfo;

import static com.kh.common.JDBCTemplate.*;

public class BookDao {
	
	
	private Properties prop = new Properties();
	public BookDao() {
		
		String fileName = BookDao.class.getResource("/sql/book/book-mapper.xml").getPath();
		
		try {
			
			prop.loadFromXML(new FileInputStream(fileName));
		} catch(IOException e) {
			
			e.printStackTrace();
		}
	}
	
	
	public int selectListCount(Connection conn) {
		//SELECT => ResultSet => 근데 반환형은 int
		//변수
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				
				
				listCount = rset.getInt("COUNT");
			}
				
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return listCount;
	}
	
	
	
		public ArrayList<Book> selectBookList(Connection conn,PageInfo pi){
		
		//SELECT문  => RESULT => 여러행 => ArrayList<Book>
		
		ArrayList<Book> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBookList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow =startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Book b = new Book(rset.getInt("T_NO"),rset.getString("T_TITLE"),rset.getInt("T_PRICE"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
		finally {
			
			
			close(rset);
			close(pstmt);
		}

		return list;
	}

		
		public int searchListCount(Connection conn) {
			//SELECT => ResultSet => 근데 반환형은 int
			//변수
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("searchListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset= pstmt.executeQuery();
				
				if(rset.next()) {
					
					
					listCount = rset.getInt("COUNT");
				}
					
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			finally {
				
				close(rset);
				close(pstmt);
				
			}
			
			return listCount;
		}
			
	
	public ArrayList<Book> selectByTitle(Connection conn,PageInfo pi,String keyword){
		
		ArrayList<Book> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectByTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow =startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1,keyword);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3,endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
					Book b = new Book(rset.getInt("T_NO"),
									  rset.getString("T_TITLE"),
									  rset.getInt("T_PRICE"),
									  rset.getString("TITLEIMG"));
				
				    list.add(b);  
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
		finally {
			
			
			close(rset);
			close(pstmt);
		}

		return list;
		
		
	}
	
	
	public Book selectBook(Connection conn, int bookNo) {
		
		// SELECT => ResultSet => PK 에 의해 한건만 => Book
		// 변수
		Book b = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bookNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Book(rset.getInt("T_NO"), 
							  rset.getString("T_TITLE"), 
							  rset.getInt("T_PRICE"),
							  rset.getInt("MEMBER_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}
	
	public ArrayList<Heart> selectHeartList(Connection conn, int userNo){
		
		ArrayList<Heart> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHeartList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,userNo);
		
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				Heart h = new Heart(rset.getInt("ZZIM_NO"),rset.getInt("ZZIM_TNO"),rset.getString("T_TITLE"));
				
			    list.add(h);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
		finally {
			
			
			close(rset);
			close(pstmt);
		}

		return list;
		
		
		
	}
	
	public int selectHeartCount(Connection conn, int bno){
		
		int heartCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHeartCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,bno);
		
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				heartCount = rset.getInt("COUNT");
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
		finally {
			
			
			close(rset);
			close(pstmt);
		}

		return heartCount;
		
		
		
	}
	
	public int selectUpdateHeart(Connection conn, int bno ,int userNo){
		
		int heartCheck = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHeartCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,bno);
			pstmt.setInt(2,userNo);
		
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				
				heartCheck = rset.getInt("COUNT");
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
		finally {
			
			
			close(rset);
			close(pstmt);
		}

		return heartCheck;
		
		
		
	}
	
	public int insertHeart(Connection conn,  int userNo ,int bno) {
		
		// INSERT 문 => 처리된 행의 갯수
		int insertHeart= 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertHeart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bno);

			insertHeart = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return insertHeart;
	}
	
	public int deleteHeart(Connection conn, int userNo ,int bno) {

		// UPDATE 문 => 처리된 행의 수
		
		int deleteHeart = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deletetHeart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, bno);
			
			deleteHeart = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return deleteHeart;
		
	}
	
	
	
	

}
