package com.kh.service.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.service.model.vo.FAQ;

import static com.kh.common.JDBCTemplate.*;

public class FAQDao {
	
	private Properties prop = new Properties();
	
	public FAQDao() {
		
		String fileName = FAQDao.class.getResource("/sql/service/faq-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<FAQ> selectFAQList(Connection conn, PageInfo pi) {
		
		ArrayList<FAQ> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFAQList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				FAQ f = new FAQ(rset.getInt("FAQ_NO"),
							    rset.getString("FAQ_TITLE"));
				
				list.add(f);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public FAQ selectFAQ(Connection conn, int fno) {
		
		FAQ f = new FAQ();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFAQ");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, fno);
			
			rset = pstmt.executeQuery();
			
			rset.next();
				
			f = new FAQ(rset.getString("FAQ_TITLE")
					   ,rset.getString("FAQ_CONTENT"));
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return f;
		
	}
	
	public int selectFAQListCount(Connection conn) {
		
		// SELECT => ResultSet => 근데 반환형은 int
		// 변수
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFAQListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("FAQ_NO");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

}
