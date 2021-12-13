package com.kh.book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.book.model.service.BookService;
import com.kh.book.model.vo.Book;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class SearchBookController
 */
@WebServlet("/search.no")
public class SearchBookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBookController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int listCount;// 현재 일반 게시판의 게시글 총 갯수 => COUNT(*) 활용 (STATUS = 'Y')
		int currentPage;//현재페이지(즉,사용자가 요청한 페이지) => request.getParameter("currentPage")
		int pageLimit; //페이지 하단에 보여진 페이징바의 페이지 최대 갯수 => 6개로 고정
		int boardLimit; //한페이지에 보여질 게시글의 최대 갯수 => 6개로 고정
		
		int maxPage; // 가장 맘지막 페이지가 몇번 페이지인지(==총 페이지 갯 수)
		int startPage; //페이지 하단에 보여질 페이징바의 시작수
		int endPage; //페이지 하단에 보여질 페이징 바의 끝수
		
	    listCount = new BookService().selectListCount(); 
	    currentPage = Integer.parseInt(request.getParameter("currentPage"));
	    pageLimit = 6;
	    boardLimit = 6;
	    
	    //System.out.println(listCount);
	    //System.out.println(currentPage);
	    
	    //maxPage
	    
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		//startPage
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		//endPage
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		
		//keyword
		
		String keyword = request.getParameter("keyword");
		//System.out.println(keyword);
		
		//Service 단으로 토스 => 7개의 변수들 => VO클래스에 만들어서 가공해서 넘길것
		//PageInfo(com.kh.common.model.PageInfo)
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		ArrayList<Book> list = new BookService().selectByTitle(pi,keyword);
		
		
		
		request.setAttribute("list", list); // 우리가 실제로 조회한 한 페이지에 보일 6개의 게시글
		request.setAttribute("pi", pi); // 페이징바를 만들때 필요한 변수
		request.setAttribute("keyword", keyword);
		//화면띄우기
		request.getRequestDispatcher("/views/book/SearchBookView.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
