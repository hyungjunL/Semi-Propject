package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberEnrollFormController
 */
@WebServlet("/enrollForm.me")
public class MemberEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 회원가입 폼 띄워주기
		// 서블릿에서 화면 띄워주는 방법 두가지
		// 1. RequestDispatcher 객체를 이용하는 방법 (포워딩방법) : 주소창에 url 맵핑값이 보임
		// 2. sendRedirect 방식 (url 재요청방식) : 주소창에 url 맵핑값이 보이지 않음
		
		// RequestDispatcher view = request.getRequestDispatcher("views/member/memberEnrollForm.jsp");
		// view.forward(request, response);
		
		request.getRequestDispatcher("views/member/memberEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
