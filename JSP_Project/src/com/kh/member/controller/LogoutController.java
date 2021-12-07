package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet("/logout.me")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 로그아웃 요청에 대한 처리 => session 을 만료시킨다. (== 무효화한다.)
		// 무효화 메소드 : invalidate() => session 에서 제공하는 메소드
		request.getSession().invalidate();
		
		// 응답페이지 => sendRedirect 방식
		// index.jsp 이 보여지게끔 => localhost:8888/jsp/
		// response.sendRedirect("/jsp"); // 경로 하드코딩 X
		
		// 앞으로는 응답페이지 요청 시 contextPath 를 직접 작성하는것이 아니라
		// request.getContextPath() : contextPath (== contextRoot) 가 나옴
		// 메소드 호출해서 씀!!
		response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
