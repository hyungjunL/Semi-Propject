package com.kh.service.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.service.model.service.ServiceService;
import com.kh.service.model.vo.Service;

/**
 * Servlet implementation class SubmitController
 */
@WebServlet("/sub.se")
public class SubmitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String oType = request.getParameter("otype");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int userNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
		
		
		Service s = new Service();
		s.setoType(Integer.parseInt(oType));
		s.setOneTitle(title);
		s.setOneContent(content);
		s.setMemberNo(userNo);
		
	
		
		int result = new ServiceService().insertInq(s);
		
		//System.out.println(result);
		if(result > 0) { // 성공
			
			//request.setAttribute("alertMsg","접수 성공");
			// response.sendRedirect(request.getContextPath()+ "/center.se");
			request.getRequestDispatcher("views/service/success.jsp").forward(request, response);
		}
		
		else {
			//System.out.println("ㅇㅇ");
			request.getRequestDispatcher("views/service/fail.jsp").forward(request, response);
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
