package com.kh.tboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.common.model.vo.PageInfo;
import com.kh.tboard.model.service.TBoardService;
import com.kh.tboard.model.vo.TBoard;

/**
 * Servlet implementation class TBoardListViewController
 */
@WebServlet("/list.it")
public class TBoardListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TBoardListViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; 
		int currentPage; 
		int pageLimit; 
		int boardLimit; 
		
		int maxPage; 
		int startPage; 
		int endPage; 
		
		
		listCount = new TBoardService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		

		pageLimit = 10;
		

		boardLimit = 6;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		
		endPage = startPage + pageLimit - 1;
		
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
	
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, 
								   maxPage, startPage, endPage);
		
		int category = Integer.parseInt(request.getParameter("category"));
		System.out.println("이것의 카테고리 : " + category);
		ArrayList<TBoard> pageList = new TBoardService().selectList(pi, category); 
		
		request.setAttribute("category", category);
		request.setAttribute("pageList", pageList); 
		System.out.println(pageList);
		request.setAttribute("pi", pi); 
		
		request.getRequestDispatcher("views/tboard/tBoardView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
