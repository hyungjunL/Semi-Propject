package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String memberId, String memberPwd) {
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().loginMember(conn, memberId, memberPwd);
		
		close(conn);
		
		return m;
	}

	public int insertMember(Member m) {
		
		int result = 0;
		Connection conn = getConnection();
		
		result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public ArrayList<Member> findId(String email) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> m = new MemberDao().findId(conn, email);
		
		close(conn);
		
		return m;
	}
	
	public int findPwd(String memberId, String email) {
		
		Connection conn = getConnection();
		int result = new MemberDao().findPwd(conn, memberId, email);
		
		close(conn);
		
		return result;
	}
	
	public int updatePassword(String memberId, String email, String pass) {
		
		Connection conn = getConnection();
		int result = new MemberDao().updatePassword(conn, memberId, email, pass);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int result = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		
		return result;
		
	}
}
