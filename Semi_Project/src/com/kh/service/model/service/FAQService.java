package com.kh.service.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.PageInfo;
import com.kh.service.model.dao.FAQDao;
import com.kh.service.model.vo.FAQ;

public class FAQService {
	
	public ArrayList<FAQ> selectFAQList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<FAQ> list = new FAQDao().selectFAQList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public FAQ selectFAQ(int fno) {
		
		Connection conn = getConnection();
		
		FAQ f = new FAQDao().selectFAQ(conn,fno);
		
		close(conn);
		
		return f;
		
	}
	
	public int selectFAQListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new FAQDao().selectFAQListCount(conn);
		// SELECT 문의 결과는 ResultSet 이 맞긴한데
		// 상식적으로 생각해보면 게시글의 총 갯수는 정수형
		
		close(conn);
		
		return listCount;
	}

}
