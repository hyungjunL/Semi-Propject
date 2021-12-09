package com.kh.admin.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.f_board.model.dao.BoardDao;
import com.kh.member.model.vo.Member;

public class AdminDao {

	private Properties prop = new Properties();

	public AdminDao() {

		String fileName = BoardDao.class.getResource("/sql/admin/admin-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int deleteMember(Connection conn, int mno) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteMember");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, mno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public ArrayList<Member> selectList(Connection conn, PageInfo pi) {
		ArrayList<Member> list = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				list.add(new Member(rset.getInt("MEMBER_NO"), 
									rset.getString("MEMBER_ID"), 
									rset.getString("MEMBER_NAME"),
									rset.getString("EMAIL"),
									rset.getString("ADDRESS"),
									rset.getString("PHONE"),
									rset.getString("BIRTH"), 
									rset.getDate("ENROLL_DATE")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int updateMember(Connection conn, int mno, String me, String ma, String mp, String mb) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateMember");

		try {
			pstmt = conn.prepareStatement(sql);

			
			pstmt.setString(1, me);
			pstmt.setString(2, ma);
			pstmt.setString(3, mp);
			pstmt.setString(4, mb);
			pstmt.setInt(5, mno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Member> selectMember(Connection conn, String mId) {
		ArrayList<Member> mlist = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectMember");

		try {
			pstmt = conn.prepareStatement(sql);

			
			pstmt.setString(1, mId);
			

			rset = pstmt.executeQuery();

			while (rset.next()) {

				mlist.add(new Member(rset.getInt("MEMBER_NO"), rset.getString("MEMBER_ID"), rset.getString("MEMBER_NAME"),
						rset.getString("EMAIL"),rset.getString("ADDRESS"),rset.getString("PHONE"),rset.getString("BIRTH"), rset.getDate("ENROLL_DATE")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return mlist;
	}

}
