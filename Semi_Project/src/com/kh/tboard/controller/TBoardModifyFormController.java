package com.kh.tboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tboard.model.service.TBoardService;
import com.kh.tboard.model.vo.Attachment;
import com.kh.tboard.model.vo.Category;
import com.kh.tboard.model.vo.TBoard;


/**
 * Servlet implementation class TBoardModifyFormController
 */
@WebServlet("/modifyForm.it")
public class TBoardModifyFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TBoardModifyFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Category> list = new TBoardService().selectCategoryList();
		
		// 해당 글번호 뽑기 (bno 로 넘긴 값)
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		System.out.println("목록번호: " + boardNo);
		// 글번호에 해당하는 Board 테이블로부터 행을 조회
		TBoard b = new TBoardService().selectBoard(boardNo);
		
		// 글번호에 해당하는 첨부파일 Attachment 테이블로부터 행을 조회
		Attachment at = new TBoardService().selectAttachment(boardNo);
		ArrayList<Attachment> a_list = new TBoardService().selectAttachmentList2(boardNo);
		// 값 넘기기
		request.setAttribute("list", list);
		request.setAttribute("a_list", a_list);
		request.setAttribute("b", b);
		request.setAttribute("at", at);
		request.setAttribute("boardNo", boardNo);
		
		// 화면 먼저 띄워보기 => 포워딩
		request.getRequestDispatcher("views/tboard/tBoardDetailViewModify.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
