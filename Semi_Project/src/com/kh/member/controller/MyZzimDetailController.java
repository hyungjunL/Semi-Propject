package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Heart;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MyJjimDetailController
 */
@WebServlet("/zzim.me")
public class MyZzimDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyZzimDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 로그인한 사용자의 회원번호 가져오기
		HttpSession session = request.getSession();
		int userNo = (Integer)((Member)session.getAttribute("loginMember")).getMemberNo();
	
		ArrayList<Heart> list = new MemberService().selectZzim(userNo);
		System.out.println("찜 리그트 : " + list);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/member/zzimPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
