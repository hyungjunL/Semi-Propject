package com.kh.f_board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.f_board.model.service.BoardService;
import com.kh.f_board.model.vo.Reply;

/**
 * Servlet implementation class AjaxReplyListController
 */
@WebServlet("/rlist.fb")
public class AjaxReplyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxReplyListController() {
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

		// VO 가공

		// Service 단으로 토스 => 게시판 관련 기능
		ArrayList<Reply> list = new BoardService().selectReplyList(boardNo);

		// 응답!!
		// GSON 이용해보자! => ArrayList 를 자바스크립트의 배열형태로 변환
		// 형식, 인코딩 지정
		response.setContentType("application/json; charset=UTF-8");

		new Gson().toJson(list, response.getWriter());
		// => Gson 에서 키값 지정 안하면 필드명 == 키값
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
