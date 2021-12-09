package com.kh.f_board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.f_board.model.vo.Attachment;
import com.kh.f_board.model.vo.Board;
import com.kh.f_board.model.vo.Reply;

import static com.kh.common.JDBCTemplate.*;

public class BoardDao {

	private Properties prop = new Properties();

	public BoardDao() {

		String fileName = BoardDao.class.getResource("/sql/f_board/f_board-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();

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

				list.add(new Board(rset.getInt("F_NO"), rset.getString("F_TITLE"), rset.getString("MEMBER_ID"),
						rset.getString("COUNT"), rset.getDate("CREATE_DATE")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int selectListCount(Connection conn) {
		int listCount = 0;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectListCount");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt("COUNT");
				System.out.println(listCount);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	public int increaseCount(Connection conn, int boardNo) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("increaseCount");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Board selectBoard(Connection conn, int boardNo) {
		Board b = null;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectBoard");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				b = new Board(rset.getInt("F_NO"), rset.getString("MEMBER_ID"), rset.getString("COUNT"),
						rset.getDate("CREATE_DATE"), rset.getString("F_TITLE"), rset.getString("CONTENT"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return b;
	}

	public int maxBoard(Connection conn) {

		int m = 0;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("maxBoard");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				m = rset.getInt("max_NO");
				System.out.println(m);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;

	}

	public int insertBoard(Connection conn, Board b) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertBoard");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, b.getF_TITLE());
			pstmt.setString(2, b.getCONTENT());
			pstmt.setInt(3, Integer.parseInt(b.getBOARD_WRITER()));

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertAttachmentList");

		try {
			for (Attachment at : list) {

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());

				result = pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Attachment> selectAttachmentList(Connection conn, int boardNo) {
		ArrayList<Attachment> list = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectAttachment");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				Attachment at = new Attachment();

				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));

				list.add(at);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int updateBoard(Connection conn, Board b) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateBoard");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, b.getF_TITLE());
			pstmt.setString(2, b.getCONTENT());
			pstmt.setInt(3, b.getF_NO());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateAttachment(Connection conn, Attachment at) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateAttachment");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertNewAttachment(Connection conn, Attachment at) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertNewAttachment");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, at.getRefNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Attachment selectAttachment(Connection conn, int boardNo) {
		Attachment at = null;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectAttachment");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				at = new Attachment();

				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return at;
	}

	public int deleteBoard(Connection conn, int boardNo) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteBoard");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Reply> selectReplyList(Connection conn, int boardNo) {
		ArrayList<Reply> list = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectReplyList");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				list.add(new Reply(rset.getInt("REPLY_NO"), rset.getString("REPLY_CONTENT"),
						rset.getString("MEMBER_ID"), rset.getString("CREATE_DATE")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int insertReply(Connection conn, Reply r) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertReply");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getRefBno());
			pstmt.setInt(3, Integer.parseInt(r.getReplyWriter()));

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
