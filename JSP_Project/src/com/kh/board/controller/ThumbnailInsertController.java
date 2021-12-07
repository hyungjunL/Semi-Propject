package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ThumbnailInsertController
 */
@WebServlet("/insert.th")
public class ThumbnailInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// POST => 인코딩
		// 1) 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) 단계 전에 "첨부파일" => multipart/form-data => 조건 먼저 제시
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// MultipartRequest 객체 생성 => 곧바로 서버로 파일이 올라옴
			// 객체 생성 전
			// 1_1. 전송 용량 제한 (10MByte)
			int maxSize = 1024 * 1024 * 10;
			
			// 1_2. 저장할 서버의 물리적 경로 제시
			String savePath = request.getServletContext().getRealPath("/resources/thumbnail_upfiles/");
			
			// 2. MultipartRequet 객체 생성 (***파일명 수정해서 올리기)
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 2) multiRequest 으로 부터 값 뽑기 => getParameter 메소드 이용
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			String userNo = multiRequest.getParameter("userNo");
			
			// 3) VO 가공
			// Board 
			Board b = new Board();
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setBoardWriter(userNo);
			
			// Attachment => 사진게시판에 메인이미지에 required 
			// => 적어도 게시글 한개당 최소 한개의 첨부파일은 존재한다.
			// 여러개의 VO 객체를 묶어서 다룰 경우 ArrayList
			ArrayList<Attachment> list = new ArrayList<>();
			
			// 키값 : file1 ~ 4 
			for(int i = 1; i <= 4; i++) {
				
				// 키값만 미리 변수로 셋팅
				String key = "file" + i;
				
				// 원본파일명이 존재하는지 메소드를 이용해서 파악 => 조건
				System.out.println(multiRequest.getOriginalFileName(key));
				if(multiRequest.getOriginalFileName(key) != null) { // 원본 파일이 존재할경우
					
					// 첨부파일이 존재할 경우 Attachment 객체 생성
					// 필드 : 원본명, 수정명, 폴더경로, 파일레벨** (1:대표, 2:상세)
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key)); // 원본명
					at.setChangeName(multiRequest.getFilesystemName(key)); // 수정명
					at.setFilePath("resources/thumbnail_upfiles/"); // 경로명
					
					// 파일레벨
					if(i == 1) {
						// 대표이미지
						at.setFileLevel(1);
					}
					else {
						// 상세이미지
						at.setFileLevel(2);
					}
					
					list.add(at);
				}
				
			}
			
			// 4) Service 단으로 토스
			int result = new BoardService().insertThumbnailBoard(b, list);
			
			// 5) 결과에 따른 응답뷰 지정
			if(result > 0) { // 성공 => list.th 로 요청 (sendRedirect)
				
				request.getSession().setAttribute("alertMsg", "성공.");
				response.sendRedirect(request.getContextPath() + "/list.th");
			}
			else { // 실패 => 에러페이지
				
			}
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
