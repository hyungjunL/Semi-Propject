package com.kh.member.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST 방식
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String address = request.getParameter("address1");
		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");

		String birth = request.getParameter("birth");
		
		//System.out.println(date); // 문자열 "2021-12-03"
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		
		//Date birth = null;
		
//		try {
//			birth = new Date(fm.parse(date).getTime());
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
		
		System.out.println("----------------");
		
		Member m = new Member(userId, userName, email, address, phone, birth);
		Member updateMem = new MemberService().updateMember(m);

		System.out.println(m);
		
		if(updateMem == null) {
			
			request.setAttribute("errorMsg", "회원정보수정이 실패했습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			
		} else {
			
			HttpSession session = request.getSession();
			
			session.setAttribute("loginMember", updateMem);
			session.setAttribute("alertMsg", "회원정보수정 성공!");
			
			response.sendRedirect(request.getContextPath() + "/myPage.me");
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
