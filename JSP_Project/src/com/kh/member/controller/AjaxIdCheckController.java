package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxIdCheckController
 */
@WebServlet("/idCheck.me")
public class AjaxIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// GET 
		
		// 2) request 로부터 값 뽑기
		String checkId = request.getParameter("checkId");
		
		// 3) VO 가공 => 패싱
		
		// 4) Service 단으로 토스 (MemberService)
		int count = new MemberService().idCheck(checkId); 
		// 중복확인은 SELECT 문이지만 굳이 정보를 다 담아서 넘길 필요가 없기 때문에 숫자로 받겠다.
		
		// 5) 결과에 따른 응답뷰 지정 => 화면이 깜빡
		
		// 형식과 인코딩 먼저 지정
		response.setContentType("text/html; charset=UTF-8");
		
		// ajax는 결과물만 내보낸다 => response.getWriter().print();
		// "NNNNN" 중복값이 있을 때 (count == 1)
		// "NNNNY" 중복값이 없을 때 (count == 0)
		if(count > 0) { // 존재하는 아이디가 이미 있을 경우 => "NNNNN"
			response.getWriter().print("NNNNN");
		}
		else { // 존재하는 아이디가 이미 없을 경우 => "NNNNY"
			response.getWriter().print("NNNNY");
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
