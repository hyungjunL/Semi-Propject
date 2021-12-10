package com.kh.chat.model.service;
import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.chat.model.dao.ChatDao;
import com.kh.chat.model.vo.Chat;

public class ChatService {
	
	public int submitChat(Chat c) {
		
		Connection conn = getConnection();
		
		int result = new ChatDao().submitChat(conn, c);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		return result;
	}
	
	 public ArrayList<Chat> selectChatList(int fromNo, int toNo){
		 Connection conn = getConnection();
		 ArrayList<Chat> list = new ChatDao().selectChatList(conn,fromNo, toNo);
		 
		 close(conn);
		 
		 return list;
		 
	 }

}
