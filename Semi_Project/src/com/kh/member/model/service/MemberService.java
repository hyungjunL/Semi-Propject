package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Heart;
import com.kh.member.model.vo.Member;
import com.kh.tboard.model.vo.TBoard;

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
	public Member updateMember(Member m) {
		
		Connection conn = getConnection();
		
		MemberDao mDao = new MemberDao();
		
		int result = mDao.updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) { // 성공
			commit(conn);
			
			updateMem = mDao.selectMember(conn, m.getMemberId());
		} else { // 실패 
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
	}
	
	public Member updatePwdMember(String userId, String userPwd, String updatePwd) {
		
		Connection conn = getConnection();
		
		// 비밀번호 update 관련 dao 메소드를 먼저 호출
		int result = new MemberDao().updatePwdMember(conn, userId, userPwd, updatePwd);
		
		// 호출 결과에 따라서 성공이면 commit 후 새로 바뀐 회원의 정보를 다시 받아온다.
		Member updateMem = null;
		if(result > 0) { // 성공
			
			commit(conn);
			
			// 갱신된 회원 객체를 다시 받아오기
			updateMem = new MemberDao().selectMember(conn, userId);
			
		} else { // 실패
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
		
		
	}
	
	public int deleteMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userId, userPwd);
		
		if(result > 0) {
			
			commit(conn);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Heart> selectZzim(int userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Heart> list = new MemberDao().selectZzim(conn, userNo);
		
		close(conn);
		
		return list;
	}
	
	 public ArrayList<Heart> selectHeartList(int userNo){
		 Connection conn = getConnection();
		 ArrayList<Heart> list = new MemberDao().selectHeartList(conn,userNo);
		 
		 close(conn);
		 
		 return list;
		 
	 }
	
	
	public ArrayList<TBoard> searchMyTrade(int userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<TBoard> list = new MemberDao().searchMyTrade(conn, userNo);
		
		close(conn);
		
		return list;
	}
}
