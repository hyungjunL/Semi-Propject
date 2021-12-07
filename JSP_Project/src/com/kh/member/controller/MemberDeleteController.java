package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1) 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기
		String userPwd = request.getParameter("userPwd");
		
		// 현재 로그인한 회원의 정보를 얻는 방법
		// 방법1. input type="hidden" 으로 애초에 요청시 숨겨서 전달하는 방법
		// 방법2. session 영역에 담겨있는 회원객체로부터 뽑기
		
		// 세션에 담겨있는 기존의 로그인된 사용자의 정보를 얻어온다.
		HttpSession session = request.getSession();
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		// 3) VO 가공 => 패싱
		
		// 4) Service 단으로 토스
		int result = new MemberService().deleteMember(userId, userPwd);
		
		// 5) 결과에따른 응답페이지 지정
		if(result > 0) { // 성공 => 탈퇴가 된것 => 로그인이 유지되어야 하나요? NO => session.removeAttribute()
						 // alert 띄워주기 => session 에 키 "alertMsg" 로 넘기는 코드를 활용해야만 하기 때문에 invalidate() 적합X
			
			// invalidate() 메소드를 사용하면 세션이 만료되어
			// alert 가 되지 않기 때문에
			// removeAttribute() 메소드를 활요해서 로그아웃 시킬것임!!
			session.removeAttribute("loginUser");
			
			// 로그아웃이 되었으므로 마이페이지가 보이면 안됨
			// 메인페이지로 보내버리자 => localhost:8888/jsp
			response.sendRedirect(request.getContextPath());
			
		}
		else { // 실패 => 탈퇴가 아직 안된것 => 오류페이지로 보내버리기 => 아예 경로 지정해서 포워딩
			
			request.setAttribute("errorMsg", "회원 탈퇴에 실패했습니다.");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
