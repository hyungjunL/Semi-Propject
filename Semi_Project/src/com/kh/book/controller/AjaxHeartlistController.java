package com.kh.book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.book.model.service.BookService;
import com.kh.book.model.vo.Heart;
import com.kh.member.model.vo.Member;
 
/**
 * Servlet implementation class AjaxHeartlistController
 */
@WebServlet("/hlist.no")
public class AjaxHeartlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxHeartlistController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Get 방식
		
		//값뽑기
		//int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
	
		//System.out.println(userNo);  
		//VO가공
		
		//Service 단으로 토스 => 게시판 관련 기능
		ArrayList<Heart> list = new BookService().selectHeartList(userNo);
		
		//형식,인코딩 지정
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
