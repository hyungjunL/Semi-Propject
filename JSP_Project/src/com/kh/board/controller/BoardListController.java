package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/list.bo")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 쿼리스트링으로 요청 /jsp/list.bo?currentPage=1 => GET 인코딩X
		
		// 2) request 로 부터 값 뽑기
		
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
		listCount = new BoardService().selectListCount();
		
		// * currrentPage : 현재페이지 (== 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// * pageLimit : 페이징바의 페이지 최대 갯수
		pageLimit = 10;
		
		// * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수
		boardLimit = 10;
		
		// System.out.println(listCount); // 107
		// System.out.println(currentPage); // 1
		
		// * maxPage : 가장 마지막 페이지가 몇번 페이지인지 (총 페이지 갯수)
		/*
		 * listCount, boardLimit 에 영향을 받음
		 * 
		 * - 공식 구하기
		 *   단, boardLimit 이 10 이라는 가정 하에 규칙을 구해보자!
		 *   
		 *   총 갯수(listCount)		boardLimit(10개)				maxPage (마지막 페이지)
		 *   100 개			/  		10개씩 쪼개서		=	10.0	10번 페이지	
		 *   101.0 개		/		10개씩 쪼개서		=	10.1	11번 페이지
		 *   105.0 개		/		10개씩 쪼개서		=	10.5	11번 페이지
		 *   109.0 개		/		10개씩 쪼개서		= 	10.9	11번 페이지
		 *   110.0 개		/		10개씩 쪼개서		=	11.0	11번 페이지
		 *   111.0 개		/		10개씩 쪼개서		=	11.1	12번 페이지
		 *   => 나눗셈 결과(listCount / boardLimit)를 올림처리 할 경우 maxPage 가 된다.
		 *   
		 *   스텝
		 *   1) listCount 를 double 로 형변환
		 *   2) listCount / boardLimit
		 *   3) 결과에 올림 처리 => Math.ceil()
		 *   4) 결과값을 int 로 형변환
		 */
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// System.out.println(maxPage); // 11
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작수
		/*
		 * pageLimit, currentPage 에 영향을 받음
		 * 
		 * - 공식 구하기
		 *   단, pageLimit 가 10 이라는 가정 하에 규칙을 구해보자!
		 *   
		 *   startPage : 1, 11, 21, 31, 41, ... => n * 10 + 1 => 10 의 배수 + 1
		 *   
		 *   만약에 pageLimit 가 5 였다면?
		 *   startPage : 1, 6, 11, 16, ... => n * 5 + 1 => 5 의 배수 + 1
		 *   
		 *   즉, startPage = n * pageLimit + 1
		 * 
		 *   currentPage		startPage
		 *   1					1
		 *   5					1
		 *   10					1
		 *   11					11
		 *   15					11
		 *   20					11
		 *   
		 *   => 1 ~ 10 	: n * 10 + 1 = 1 	=> n = 0
		 *   => 11 ~ 20 : n * 10 + 1 = 11 	=> n = 1
		 *   => 21 ~ 30 : n * 10 + 1 = 21   => n = 2
		 *   ...
		 *   
		 *   =>	n 을 구하는 공식을 도출해보면
		 *   	n = (currentPage - 1) / pageLimit
		 *   		  0 ~ 9 / 10  = 0
		 *   		  10 ~ 19 / 10 = 1
		 *   		  20 ~ 29 / 10 = 2
		 *   			...
		 *   
		 *   n 을 대입시키면
		 *   startPage = (currentPage - 1) / pageLimit * pageLimit + 1
		 */
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
		ArrayList<Board> list = new BoardService().selectList(pi);
		
		// 5) 응답뷰 지정 => list, pi 를 넘겨서
		request.setAttribute("list", list); // 우리가 실제로 조회한 한 페이지에 보일 10개의 게시글
		request.setAttribute("pi", pi); // 페이징바를 만들때 필요한 변수
		
		// views/board/boardListView.jsp 화면으로 응답 => 포워딩
		request.getRequestDispatcher("views/board/boardListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
