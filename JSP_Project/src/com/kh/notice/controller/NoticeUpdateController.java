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
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// POST 
		// 1) 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기
		// 뽑아야 하는값 : 제목, 내용 (제목 중복 O, 내용 O) + PK 는 게시글 번호
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		// 3) 가공
		Notice n = new Notice();
		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		
		// 4) Service 단으로 토스
		int result = new NoticeService().updateNotice(n);
		
		// 5) 결과값에 따라 응답 지정
		if(result > 0) { // 성공 => 해당 글 상세보기 페이지로 응답뷰 지정 + alert 띄워주고 나서
						 // localhost:8888/jsp/detail.no?nno=XX
			
			request.getSession().setAttribute("alertMsg", "성공적으로 공지사항이 수정되었습니다.");
			
			response.sendRedirect(request.getContextPath() + "/detail.no?nno=" + noticeNo);
		}
		else { // 실패 => 에러페이지 띄우기
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
