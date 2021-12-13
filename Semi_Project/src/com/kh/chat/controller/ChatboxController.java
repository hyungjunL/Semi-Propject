package com.kh.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.Chat;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ChatboxController
 */
@WebServlet("/chatbox.no")
public class ChatboxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatboxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 int userNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
		
		 ArrayList<Chat> mylist = new ChatService().selectMyList(userNo);
		 request.setAttribute("mylist", mylist);
		
		 request.getRequestDispatcher("/views/chat/ChatBox.jsp").forward(request,response);
			
			
		 
		 
		 
		 
		 
			 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
