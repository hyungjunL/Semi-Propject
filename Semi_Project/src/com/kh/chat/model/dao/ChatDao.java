package com.kh.chat.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.sql.ResultSet;
import java.util.Properties;

import com.kh.chat.model.vo.Chat;



public class ChatDao {
	
private Properties prop = new Properties();
public ChatDao() {
	
	String fileName = ChatDao.class.getResource("/sql/chat/chat-mapper.xml").getPath();
	
	try {
		
		prop.loadFromXML(new FileInputStream(fileName));
	} catch(IOException e) {
		
		e.printStackTrace();
	}
	
	
}


public int submitChat(Connection conn, Chat c) {
	// INSERT 문 => 처리된 행의 갯수
			int result= 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("submitChat");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				
				pstmt.setInt(1, c.getFromNo());
				pstmt.setInt(2, c.getToNo());
				pstmt.setString(3, c.getChatContent());

				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}



public ArrayList<Chat> selectChatList(Connection conn, int fromNo, int toNo){
	
	ArrayList<Chat> list = new ArrayList<>();
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String sql = prop.getProperty("selectChatList");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1,fromNo);
		pstmt.setInt(2,toNo);
		pstmt.setInt(3,toNo);
		pstmt.setInt(4,fromNo);
		
		
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			
			
			Chat c = new Chat(rset.getInt("CHAT_ID"),rset.getInt("FROM_ID"),rset.getInt("TO_ID"),rset.getString("CHAT_CONTENT"),rset.getDate("CHAT_TIME"));
			
		    list.add(c);
			
			
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


public ArrayList<Chat> selectMyList(Connection conn, int userNo){
	
	ArrayList<Chat> mylist = new ArrayList<>();
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String sql = prop.getProperty("selectMyList");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1,userNo);
		pstmt.setInt(2,userNo);
		
		
		
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			
			
			Chat c = new Chat(rset.getInt("CHAT_ID"),rset.getInt("FROM_ID"),rset.getInt("TO_ID"),rset.getString("CHAT_CONTENT"),rset.getDate("CHAT_TIME"));
			
		    mylist.add(c);
			
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	
	finally {
		
		
		close(rset);
		close(pstmt);
	}

	return mylist;
	
	
	
}





}
	








