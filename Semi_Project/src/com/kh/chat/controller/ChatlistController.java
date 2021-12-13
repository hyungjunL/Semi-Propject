package com.kh.chat.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.chat.model.service.ChatService;
import com.kh.chat.model.vo.Chat;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ChatlistController
 */
@WebServlet("/chatlist.no")
public class ChatlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatlistController() {
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
	     //String chatContent = request.getParameter("chatContent");
         //String listType = request.getParameter("listType");
         
			
		 ArrayList<Chat> list = new ChatService().selectChatList(fromNo,toNo);
			 
		 response.setContentType("application/json; charset=UTF-8");
			 
		  new Gson().toJson(list, response.getWriter());
			
 		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
