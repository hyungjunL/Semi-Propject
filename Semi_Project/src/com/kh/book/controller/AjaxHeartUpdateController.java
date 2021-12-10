package com.kh.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.book.model.service.BookService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AjaxHeartUpdateController
 */
@WebServlet("/heartupdate.bo")
public class AjaxHeartUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxHeartUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Get 방식
		//값뽑기
		int bno = Integer.parseInt(request.getParameter("bno"));
		int userNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
		
		
		int heartCheck = new BookService().selectUpdateHeart(bno,userNo); // 찜 체크 /찜등록/ 찜 삭제
		
		//형식,인코딩 지정
		response.setContentType("application/json; charset=UTF-8");
						
		new Gson().toJson(heartCheck, response.getWriter());
				
		
		
		
		//VO 저장 
		/*
		 * Heart h = new Heart(); h.setHeartBno(bno); h.setHeartMember(userNo);
		 */
		
		
		// Service 단 호출 2
		//int insertHeart = new BookService().insertHeart(h);
		//int deleteHeart = new BookService().deleteHeart(h);
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
