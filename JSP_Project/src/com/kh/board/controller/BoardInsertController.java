package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
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
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1) 인코딩 설정 (POST)
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기 : multipart 객체를 이용해보자
		
		// System.out.println(request.getParameter("category")); // null
		// 폼 전송을 일반 방식이 아닌 multipart/form-data 방식으로 전송하는 경우
		// request.getParameter 로 request 로 부터 값 뽑기가 불가함
		// => multipart 라는 객체에 값을 이관시켜서 다뤄야 한다.
		
		// 스텝0) enctype 이 multipart/form-data 로 잘 전송되었을 경우 
		// 		 전반적인 내용들이 수정되도록 조건을 걸어줌
		if(ServletFileUpload.isMultipartContent(request)) {
			
			System.out.println("잘 실행 되나?");
			
			// 파일 업로드를 위한 라이브러리 다운로드 (http://www.servlets.com/)
			// 파일 업로드를 위한 라이브러리명 : cos.jar
			
			// 스텝1) 전송되는 파일을 처리할 작업 내용
			//	  (전송되는 파일의 용량 제한, 전달된 파일을 저장할 경로)
			// 1_1. 전송파일 용량 제한
			// 		(int maxSize => byte 단위로 값을 기술해야한다. 10Mbyte 로 제한)
			/*
			 * 단위 정리
			 * byte -> kbyte -> mbyte -> gbyte -> tbyte -> ..
			 * 
			 * 환산
			 * 1kbyte == 1024byte (2의 10승)
			 * 1mbyte == 1024kbyte (2의 10승) == 1024 * 1024 byte (2의 20승)
			 */
			int maxSize = 1024 * 1024 * 10; // 10mbyte
			
			// 1_2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기
			//		(String savePath)
			// => 세션객체에서 제공하는 getRealPath 메소드를 통해 알아내기
			//	    다만, 매개변수로 WebContent 폴더로부터 board_upfiles 폴더까지의 경로를 제시
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			// System.out.println(maxSize);
			// System.out.println(savePath);
			
			// 스텝2) 전달된 파일명 수정 및 서버에 업로드 작업
			/*
			 * - HttpServletRequest request => MultipartRequest multiRequest 객체로 변환
			 * 
			 * MultipartRequest 객체 생성 방법 : 매개변수 생성자로 생성 (cos.jar 에서 제공)
			 * [ 표현법 ]
			 * MultipartRequest multiRequest 
			 * 		= new MultipartRequest(request, savePath, maxSize, 인코딩, 파일명을수정시켜주는객체);
			 * 
			 * 위 구문 한줄 실행만으로 넘어온 첨부파일들이 해당 폴더에 그대로 무조건 업로드됨!!
			 * 그리고 사용자가 올린 파일명은 그대로 해당 폴더에 업로드 하지 않는게 일반적이기 때문에 
			 * 파일명을 수정시켜주는 객체를 생성 (내입맛대로)
			 * 
			 * Q) 파일명을 수정하는 이유?
			 * A) 같은 파일명이 있을 경우를 대비해서, 
			 *    파일명에 한글 / 특수문자 / 띄어쓰기 가 포함된 경우 서버에 따라 문제가 발생할 수 있기 때문에
			 * 
			 * 기본적으로 파일명을 수정시켜주는 객체 => DefaultFileRenamePolicy 객체 (cos.jar 에서 제공)
			 *  => 내부적으로 rename() 이라는 메소드를 실행시키면서 파일명 수정이 됨
			 *  => 기본적으로 동일한 파일명이 존재할 경우 뒤에 카운팅된 숫자를 붙여서 만들어줌
			 *  예) aaa.jpg, aaa1.jpg, aaa2.jpg, ...
			 *  
			 *  너무 성의가 없음 ㅡㅡ
			 *  
			 *  우리 입맛대로 파일명을 수정해서 절대절대로 파일명이 안겹치게끔 rename 해볼것임
			 *  => 즉, DefaultFileRenamePolicy 객체를 이용하지 않을것!!!!
			 *  => 내 입맛대로 나만의 파일명 생성 규칙을 만들어야함
			 *  예) kakaotalk_yyyymmdd_hhmmsssRRR 카카오톡 
			 * 
			 * 나만의 com.kh.common.MyFileRenamePolicy 라는 클래스를 만들어서 rename 메소드를 정의
			 */
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 값 뽑기
			// 카테고리 번호, 제목, 내용, 작성자회원번호를 뽑아서 Board 객체로 가공 => INSERT
			String category = multiRequest.getParameter("category");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			String boardWriter = multiRequest.getParameter("userNo");
			
			// 3) VO 객체로 가공 => 첫번째 INSERT 문에 해당
			Board b = new Board();
			b.setCategory(category);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setBoardWriter(boardWriter);
			
			// 두번째 INSERT => 선택적 (첨부파일이 있을 경우에만  INSERT)
			Attachment at = null; // null 로 초기화, 첨부파일이 있으면 그 때 객체 생성
			
			// 4) Service 단으로 토스 => 선택적으로 첨부파일 객체를 생성 후 토스 (첨부파일 유무)
			// 첨부파일 유무를 가려내는 메소드 (사실은 원본파일명을 리턴)
			// multiRequest.getOriginalFileName("키값");
			// => 첨부파일 있으면 원본파일명 / 첨부파일 없으면 null 리턴
			if(multiRequest.getOriginalFileName("upfile") != null) {
				// 첨부파일이 있다면 VO 객체로 가공
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile")); // 원본명
				
				// 수정파일명 알아오기 : 실제 서버에 업로드된 파일의 이름을 리턴해주는 메소드
				// multiRequest.getFilesystemName("키값");
				at.setChangeName(multiRequest.getFilesystemName("upfile")); // 수정파일명
				
				// 파일 경로
				at.setFilePath("resources/board_upfiles/");
			}
			
			// 4. 서비스요청
			int result = new BoardService().insertBoard(b, at);
				
			if(result > 0) { // 성공 => list.bo?currentPage=1 요청 (가장 최신글이므로)
					
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				response.sendRedirect(request.getContextPath() + 
								"/list.bo?currentPage=1");
			}
			else { // 실패 
			      // => 첨부파일이 있었을 경우 이미 업로드 된 첨부파일을 
			      //     굳이 서버에 보관할 이유가 없다! (용량만 차지)
					
				if(at != null) {
					// 삭제시키고자 하는 파일 객체 생성 => delete 메소드 호출 
					new File(savePath + at.getChangeName()).delete();
				}

				request.setAttribute("errorMsg", "게시글 작성 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
