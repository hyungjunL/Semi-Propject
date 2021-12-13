package com.kh.service.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.service.model.dao.ServiceDao;
import com.kh.service.model.vo.Service;

public class ServiceService {
	
	
	  public ArrayList<Service> selectInqList(int userNo){
	  
	  Connection conn = getConnection();
	  
	 ArrayList<Service> list = new ServiceDao().selectInqList(conn,userNo);
	  
	  close(conn);
	  
	  return list;
	  
	 
	  }
	  
	 public Service selectInq(int ino) {
	  
	 Connection conn = getConnection();
	 
	 Service s = new ServiceDao().selectInq(conn,ino);
	 
	 close(conn);
	  
	  return s; }
	 
	
	public int insertInq(Service s) {
		
		Connection conn = getConnection();
		
		int result = new ServiceDao().insertInq(conn, s);
		
		if(result > 0) { // 성공
			commit(conn);
		}
		else { // 실패
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
