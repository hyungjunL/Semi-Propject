package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;

/**
 * Servlet implementation class ThumbnailDetailController
 */
@WebServlet("/detail.th")
public class ThumbnailDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 우선적으로 글번호 뽑아오기
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		// 조회
		// 1. 조회수 증가하는 쿼리문 요청
		int result = new BoardService().increaseCount(boardNo);
		
		// 2. 1 이 성공했을 경우 => Board 에서 조회 요청, Attachment 에서도 조회 요청
		if(result > 0) { // 성공
			
			// Board 에서 조회 요청
			// 기존에 우리가 만들어놨었던 selectBoard 메소드를 호출해서 재활용 하긴 할건데
			// 문제는 일반게시판의 경우에는 카테고리가 있어서 조인을 했을 때 카테고리가 null 인 항목이 조회 안되도 무방했지만
			// 사진게시판의 경우 카테고리가 null 이기 때문에 이너조인을 했을 경우 전부 조회가 안될것임!!
			// => 카테고리 컬럼 기준으로 일치하는 컬럼도, 일치하지 않는 컬럼도 가져오려면
			//	   기존의 쿼리문에서 외부 조인으로 바꿔야 한다!!! (왼쪽 테이블 기준으로)
			Board b = new BoardService().selectBoard(boardNo);
			
			// Attachment 에서도 조회 요청 => ArrayList<Attachment>
			ArrayList<Attachment> list = new BoardService().selectAttachmentList(boardNo);
			
			// 요청결과 request 에 담고
			request.setAttribute("b", b);
			request.setAttribute("list", list);
			
			// 응답뷰 지정
			// views/board/thumbnailDetailView.jsp
			request.getRequestDispatcher("views/board/thumbnailDetailView.jsp").forward(request, response);
		}
		else { // 실패 => 에러페이지
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
