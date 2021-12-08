package com.kh.member.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/enroll.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("emailName") + "@" + request.getParameter("domain");
		String phone = request.getParameter("firstPhone") + "-" + request.getParameter("middlePhone") + "-" + request.getParameter("endPhone");
		String address = request.getParameter("address1") + request.getParameter("address2") + request.getParameter("address3");
		String birth = request.getParameter("birth");
		
		Member m = new Member(memberId, memberPwd, memberName, email, address, phone, birth);
		
		int result = new MemberService().insertMember(m);
	
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "회원가입에 성공했습니다.");
			
			response.sendRedirect(request.getContextPath());
			
		}
		else {
			
			//request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
			
			//RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			
			//view.forward(request, response);
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
