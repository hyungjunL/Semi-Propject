package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Category;
import com.kh.board.model.vo.Reply;
import com.kh.common.model.vo.PageInfo;

public class BoardService {

	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		// SELECT 문의 결과는 ResultSet 이 맞긴한데
		// 상식적으로 생각해보면 게시글의 총 갯수는 정수형
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Category> selectCategoryList() {
		
		Connection conn = getConnection();
		
		ArrayList<Category> list = new BoardDao().selectCategoryList(conn);
		
		close(conn);
		
		return list;
	}
	
	public int insertBoard(Board b, Attachment at) {
		
		Connection conn = getConnection();
		
		// board 테이블에 삽입 무조건 하고
		// 첨부파일이 null 이 아니라면 attachment 테이블에 삽입을 선택적으로 함
		
		// 1) board 테이블에 삽입
		int result1 = new BoardDao().insertBoard(conn, b); // 보드 인서트 결과값 // 숙제
		
		// 2) attachment 테이블에 삽입
		int result2 = 1; // 첨부파일이 있다면 실행할 메소드 결과값을 받을 변수 (미리 밖에다가 선언)
		if(at != null) {
			result2 = new BoardDao().insertAttachment(conn, at); // 숙제
		}
		
		// 3) 트랜잭션 처리
		// result1 도 성공이고 그리고 result2 도 성공일때 commit
		// 둘중에 하나라도 실패한다? 무조건 rollback
		// 곱셈
		if((result1 * result2) > 0) { // result1 > 0 && result2 > 0
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		return (result1 * result2);
	}
	
	public int increaseCount(int boardNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCount(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}
		else {
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
	
	public Attachment selectAttachment(int boardNo) {
		
		Connection conn = getConnection();
		
		Attachment at = new BoardDao().selectAttachment(conn, boardNo);
		
		close(conn);
		
		return at;
	}
	
	public int updateBoard(Board b, Attachment at) {
		
		Connection conn = getConnection();
		
		// 1, 2, 3 케이스에 대해 공통적으로 일어나는 BOARD UPDATE 먼저 하고 조건 지정
		int result1 = new BoardDao().updateBoard(conn, b);
		
		int result2 = 1; // ATTACHMENT 테이블과 관련된 결과물
		
		// 새롭게 첨부된 파일이 있을경우 
		if(at != null) {
			
			// 기존의 첨부파일이 있었을 경우
			if(at.getFileNo() != 0) {
				result2 = new BoardDao().updateAttachment(conn, at);
			}
			else {
				// 없었을 경우
				result2 = new BoardDao().insertNewAttachment(conn, at); // 재활용X
			}
		}
		// 아닐경우 따로 ATTACHMENT 에 할 일이 없음 => else 블럭 X
		
		if(result1 > 0 && result2 > 0) { // 둘 다 성공 했을 경우에만 무조건 commit
			commit(conn);
		}
		else { // 둘중에 하나라도 실패했을 경우 무조건 rollback
			rollback(conn);
		}
		
		close(conn);
		
		return (result1 * result2);
	}

	public int deleteBoard(int boardNo) {

		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int insertThumbnailBoard(Board b, ArrayList<Attachment> list) {
		
		Connection conn = getConnection();
		
		// 1개의 트랜잭션에 두개의 insert 문이 있음 => DAO 각각 한번씩 호출
		int result1 = new BoardDao().insertThumbnailBoard(conn, b);
		
		int result2 = new BoardDao().insertAttachmentList(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public ArrayList<Board> selectThumbnailList() {
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectThumbnailList(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Attachment> selectAttachmentList(int boardNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new BoardDao().selectAttachmentList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Reply> selectReplyList(int boardNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new BoardDao().selectReplyList(conn, boardNo);
		
		close(conn);
		
		return list;
	}
	
}















