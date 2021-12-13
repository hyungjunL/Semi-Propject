package com.kh.f_board.model.service;

import static com.kh.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.common.model.vo.PageInfo;
import com.kh.f_board.model.dao.BoardDao;
import com.kh.f_board.model.vo.Attachment;
import com.kh.f_board.model.vo.Board;
import com.kh.f_board.model.vo.Reply;
import com.kh.tboard.model.dao.TBoardDao;

public class BoardService {

	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Board> list = new BoardDao().selectList(conn, pi);

		close(conn);

		return list;
	}

	public int selectListCount() {
		Connection conn = getConnection();

		int listCount = new BoardDao().selectListCount(conn);

		close(conn);

		return listCount;
	}

	public int increaseCount(int boardNo) {
		Connection conn = getConnection();

		int result = new BoardDao().increaseCount(conn, boardNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();

		Board b = new BoardDao().selectBoard(conn, boardNo);

		close(conn);

		return b;
	}

	public int maxBoard() {
		Connection conn = getConnection();
		int m = new BoardDao().maxBoard(conn);

		close(conn);

		return m;
	}

	public int insertBoard(Board b, ArrayList<Attachment> list) {
		Connection conn = getConnection();

		// 1개의 트랜잭션에 두개의 insert 문이 있음 => DAO 각각 한번씩 호출
		int result1 = new BoardDao().insertBoard(conn, b);

		int result2 = new BoardDao().insertAttachmentList(conn, list);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 * result2;
	}

	public ArrayList<Attachment> selectAttachmentList(int boardNo) {
		Connection conn = getConnection();

		ArrayList<Attachment> list = new BoardDao().selectAttachmentList(conn, boardNo);

		close(conn);

		return list;
	}

	public Attachment selectAttachment(int boardNo) {
		Connection conn = getConnection();

		Attachment at = new BoardDao().selectAttachment(conn, boardNo);

		close(conn);

		return at;
	}

	public int deleteBoard(int boardNo) {

		Connection conn = getConnection();

		int result = new BoardDao().deleteBoard(conn, boardNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;

	}

	public ArrayList<Reply> selectReplyList(int boardNo) {
		Connection conn = getConnection();

		ArrayList<Reply> list = new BoardDao().selectReplyList(conn, boardNo);

		close(conn);

		return list;
	}

	public int insertReply(Reply r) {
		Connection conn = getConnection();

		int result = new BoardDao().insertReply(conn, r);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result;
	}

	public int prevCount(int boardNo) {
		Connection conn = getConnection();

		int plist = new BoardDao().prevCount(conn, boardNo);

		close(conn);

		return plist;
	}

	public int nextCount(int boardNo) {
		Connection conn = getConnection();

		int nlist = new BoardDao().nextCount(conn, boardNo);

		close(conn);

		return nlist;
	}

	public ArrayList<Attachment> selectOriginAttachmentList(int boardNo) {
		Connection conn = getConnection();

		ArrayList<Attachment> origin_list = new BoardDao().selectOriginAttachmentList(conn, boardNo);

		close(conn);

		return origin_list;
	}

	public int updateBoard(Board b, ArrayList<Attachment> list) {
		Connection conn = getConnection();

		int result1 = new BoardDao().updateBoard(conn, b);
		int result2 = new BoardDao().updateAttachment(conn, list, b);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 * result2;
	}

}
