package com.kh.service.model.dao;


import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;

//import com.kh.service.model.vo.FAQ;
import com.kh.service.model.vo.Service;

public class ServiceDao {
	
	private Properties prop = new Properties();
	
	public ServiceDao() {
		
		String fileName = ServiceDao.class.getResource("/sql/service/service-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	 public ArrayList<Service> selectInqList(Connection conn, int userNo) {
	  
	 ArrayList<Service> list = new ArrayList<>();
	  
	  PreparedStatement pstmt = null;
	 
	  ResultSet rset = null;
	  
	  String sql = prop.getProperty("selectInqList");
	  
	  try { pstmt = conn.prepareStatement(sql);
	  
	  pstmt.setInt(1, userNo);
	  
	  rset = pstmt.executeQuery();
	  
	  while(rset.next()) {
	  
	  Service s = new Service(rset.getInt("O_ID") , rset.getString("O_TITLE"), rset.getDate("O_CREATE_DATE"));
	  
	  list.add(s);
	  
	  } } catch (SQLException e) { e.printStackTrace(); } finally { close(rset);
	  close(pstmt); }
	  
	  return list;
	  
	  }
	  
	  public Service selectInq(Connection conn, int ino) {
	  
	  Service s = new Service();
	  
	  PreparedStatement pstmt = null;
	  
	  ResultSet rset = null;
	  
	  String sql = prop.getProperty("selectInq");
	  
	  try { pstmt = conn.prepareStatement(sql);
	  
	  pstmt.setInt(1, ino);
	  
	  rset = pstmt.executeQuery();
	  
	  rset.next();
	  
	  s = new Service(rset.getInt("O_ID"),rset.getInt("O_TYPE") , rset.getString("O_TITLE") ,
	  rset.getString("O_CONTENT") , rset.getDate("O_CREATE_DATE"));
	  
	  
	  
	  
	  
	  } catch (SQLException e) { e.printStackTrace(); } finally { close(rset);
	  close(pstmt); }
	  
	  return s;
	  
	  }
	 
	
	public int insertInq(Connection conn, Service s) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertInq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, s.getMemberNo());
			pstmt.setInt(2, s.getoType());
			pstmt.setString(3, s.getOneTitle());
			pstmt.setString(4, s.getOneContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
		
	}
	
	

}
