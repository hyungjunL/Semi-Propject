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
import com.kh.board.model.vo.Category;

/**
 * Servlet implementation class BoardUpdateFormContoller
 */
@WebServlet("/updateForm.bo")
public class BoardUpdateFormContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateFormContoller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 우선적으로 해야할것 : 카테고리 전체 조회해오기
		ArrayList<Category> list = new BoardService().selectCategoryList();
		
		// 해당 글번호 뽑기 (bno 로 넘긴 값)
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		// 글번호에 해당하는 Board 테이블로부터 행을 조회
		Board b = new BoardService().selectBoard(boardNo);
		
		// 글번호에 해당하는 첨부파일 Attachment 테이블로부터 행을 조회
		Attachment at = new BoardService().selectAttachment(boardNo);
		
		// 값 넘기기
		request.setAttribute("list", list);
		request.setAttribute("b", b);
		request.setAttribute("at", at);
		
		// 화면 먼저 띄워보기 => 포워딩
		request.getRequestDispatcher("views/board/boardUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
