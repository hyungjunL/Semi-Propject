package com.kh.f_board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.f_board.model.service.BoardService;

/**
 * Servlet implementation class F_boardDeleteController
 */
@WebServlet("/delete.fb")
public class F_boardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public F_boardDeleteController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int boardNo = Integer.parseInt(request.getParameter("bno"));

		int result = new BoardService().deleteBoard(boardNo);

		if (result > 0) { 

			request.getSession().setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.fb?currentPage=1");
		} 

	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
