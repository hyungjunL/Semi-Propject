package com.kh.chat.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.Chat;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ChatSubmitController
 */
@WebServlet("/chat.submit")
public class ChatSubmitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatSubmitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		   request.setCharacterEncoding("UTF-8");
	       response.setContentType("text/html;charset=UTF-8");
	       int fromNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
		   int toNo =  Integer.parseInt(request.getParameter("toNo"));
	       String chatContent = request.getParameter("chatContent");
	       
	       //System.out.println(fromNo);
		   //System.out.println(toNo);
		   //System.out.println(chatContent);
	       
	       //VO가공
	        Chat c = new Chat();
			c.setFromNo(fromNo);
			c.setToNo(toNo);
			c.setChatContent(chatContent);
			
			// Service 단 호출
			int result = new ChatService().submitChat(c);
	       
			
			// result 1개이므로 그냥 넘기기
			response.setContentType("text/html; charset=UTF-8");
			
			response.getWriter().print(result);
			
	       
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
