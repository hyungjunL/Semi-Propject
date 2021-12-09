package com.kh.admin.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminDao;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class AdminService {

	public ArrayList<Member> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Member> list = new AdminDao().selectList(conn, pi);

		close(conn);

		return list;
	}

	public int deleteMember(int mno) {

		Connection conn = getConnection();

		int result = new AdminDao().deleteMember(conn, mno);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;

	}

	public int updateMember(int mno, String me, String ma, String mp, String mb) {
		Connection conn = getConnection();

		int result = new AdminDao().updateMember(conn, mno, me, ma, mp, mb);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public ArrayList<Member> selectMember(String mId) {
		Connection conn = getConnection();

		ArrayList<Member> mlist = new AdminDao().selectMember(conn, mId);

		close(conn);

		return mlist;
	}

}
