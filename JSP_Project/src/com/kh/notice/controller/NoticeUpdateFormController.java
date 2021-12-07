package com.kh.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateFormController
 */
@WebServlet("/updateForm.no")
public class NoticeUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// GET 방식
		
		// 2) 값 뽑기
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		// 3) 가공
		
		// 4) Service 단으로 토스
		// 상세조회시 필요했던 selectNotice 메소드를 재활용 => 호출만 하면 끝
		Notice n = new NoticeService().selectNotice(noticeNo);
		// n 에 글번호, 글제목, 글내용, 작성자아이디, 작성일
		
		// 5) 응답뷰 지정 => 포워딩
		request.setAttribute("n", n);
		request.getRequestDispatcher("views/notice/noticeUpdateForm.jsp").forward(request, response);
		
		// 참고 : 포워딩 방식이랑 sendRedirect 방식을 어떨 때 쓰면 좋은지
		// - 포워딩 : 구체적인 파일 디렉토리 경로를 제시해서 응답해야 할 때 => 디렉토리 구조 노출을 막으려고
		// - sendRedirect : contextPath 로 시작하는 url 를 응답해야 할 때 => request.getContextPath() ~~
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
