package com.kh.service.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.service.model.service.FAQService;
import com.kh.service.model.vo.FAQ;

/**
 * Servlet implementation class ServiceFAQController
 */
@WebServlet("/faq.se")
public class ServiceFAQController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceFAQController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		ArrayList<FAQ> list = new FAQService().selectFAQList();
//		
//		// 5) 뽑아온 list 를 request 의  attribute 영역에 담아서 응답페이지로 보내버린다.
//		request.setAttribute("list", list);
//		
//		request.getRequestDispatcher("/views/service/serviceFAQ.jsp").forward( request, response );
		
		// ----------- 페이징 처리 -----------
				// 필요한 변수들
				int listCount; // 현재 일반게시판의 게시글 총 갯수 => BOARD 로 부터 조회 COUNT(*) 활용 (STATUS = 'Y')
				int currentPage; // 현재 페이지 (즉, 사용자가 요청한 페이지) => request.getParameter("currentPage");
				int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수 => 10 개로 고정
				int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수 => 10 개로 고정
				
				int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (== 총 페이지의 갯수)
				int startPage; // 페이지 하단에 보여질 페이징바의 시작수
				int endPage; // 페이지 하단에 보여질 페이징바의 끝수
				
				// * listCount : 총 게시글 갯수
				listCount = new FAQService().selectFAQListCount();
				System.out.println(listCount);
				// * currrentPage : 현재페이지 (== 사용자가 요청한 페이지)
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
				
				// * pageLimit : 페이징바의 페이지 최대 갯수
				pageLimit = 10;
				
				// * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수
				boardLimit = 10;
				
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				
				// * endPage : 페이지 하단에 보여질 페이징바의 끝수
				/*
				 * startPage, pageLimit 에 영향을 받음 (단, maxPage 도 마지막 페이징 바에 대해선 영향을 준다)
				 * 
				 * - 공식 구하기
				 *   단, pageLimit 가 10 이라는 가정 하에 규칙을 구해보자!
				 *   
				 *   startPage : 1  => endPage : 10
				 *   startPage : 11 => endPage : 20
				 *   startPage : 21 => endPage : 30
				 *   ...
				 *   => endPage = startPage + pageLimit - 1
				 * 
				 *  + 선택적으로 (if 문) 마지막 페이징 바에 대해서는 maxPage 까지만 보이게끔 하겠다!
				 */
				endPage = startPage + pageLimit - 1;
				
				// startPage 가 11 이여서 endPage 가 20 이 되야 하는데
				// maxPage 가 마침 13 까지밖에 없다면?
				// => endPage 를  maxPage 로 변경
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				// 여기까지 총 7개의 변수를 만들었음
				// 7 개의 변수를 가지고 해당되는 범위에 따른 게시글 10개씩만 SELECT
				// Service 단으로 토스 => 7개의 변수들 => VO 클래스에 만들어서 가공해서 넘길것!
				// com.kh.common.model.vo.PageInfo
				
				// 3) VO 로 가공
				PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, 
										   maxPage, startPage, endPage);
				
				// 4) Service 단으로 토스
				ArrayList<FAQ> list = new FAQService().selectFAQList(pi);
				
				// 5) 응답뷰 지정 => list, pi 를 넘겨서
				request.setAttribute("list", list); // 우리가 실제로 조회한 한 페이지에 보일 10개의 게시글
				request.setAttribute("pi", pi); // 페이징바를 만들때 필요한 변수
				
				// views/board/boardListView.jsp 화면으로 응답 => 포워딩
				request.getRequestDispatcher("views/service/serviceFAQ.jsp").forward(request, response);
			}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
