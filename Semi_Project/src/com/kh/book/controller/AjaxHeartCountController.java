package com.kh.book.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.book.model.service.BookService;

/**
 * Servlet implementation class AjaxHeartCountController
 */
@WebServlet("/heartcount.bo")
public class AjaxHeartCountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxHeartCountController() {
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
		//System.out.println(bno);
		
		//Service 단으로 토스
		int heartCount = new BookService().selectHeartCount(bno); 
		
		//형식,인코딩 지정
		response.setContentType("application/json; charset=UTF-8");
				
		new Gson().toJson(heartCount, response.getWriter());
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
