package com.kh.chat.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.kh.chat.model.service.ChatService;
//import com.kh.chat.model.vo.Chat;
//import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ChatController
 */
@WebServlet("/chat.no")
public class ChatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int fromNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		int toNo =  Integer.parseInt(request.getParameter("toNo"));
		request.setAttribute("toNo", toNo);
		//System.out.println(toNo); 잘 넘어옴
		
		
		
		request.getRequestDispatcher("/views/chat/Chat.jsp").forward(request,response);
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
