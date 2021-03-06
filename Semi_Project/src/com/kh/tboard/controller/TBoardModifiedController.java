package com.kh.tboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.tboard.model.service.TBoardService;
import com.kh.tboard.model.vo.Attachment;
import com.kh.tboard.model.vo.TBoard;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class TBoardModifiedController
 */
@WebServlet("/modify.it")
public class TBoardModifiedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TBoardModifiedController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		System.out.println("수정할 번호: " + boardNo);
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
			int maxSize = 1024 * 1024 * 10; 
			
	
			String savePath = request.getSession().getServletContext().getRealPath("/resources/itemImg_upfiles/");
			
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
			
			String tTitle = multiRequest.getParameter("tTitle");
			int tPrice = Integer.parseInt(multiRequest.getParameter("tPrice"));
			int category = Integer.parseInt(multiRequest.getParameter("category"));
			String status = multiRequest.getParameter("status");
			String content = multiRequest.getParameter("content");
			String userNo = multiRequest.getParameter("userNo");
			
			
			TBoard tb = new TBoard();
			tb.settTitle(tTitle);
			tb.settPrice(tPrice);
			tb.setCategoryNo(category);
			tb.setBookStatus(status);
			tb.setContent(content);
			tb.setMemberNo(userNo);
			
			ArrayList<Attachment> list = new ArrayList<>();
			
		
			for(int i = 1; i <= 3; i++) {
				
				// 키값만 미리 변수로 셋팅
				String key = "file" + i;
				System.out.println(multiRequest.getOriginalFileName(key));
				
		
				if(multiRequest.getOriginalFileName(key) != null) { 
					
					
					Attachment at = new Attachment();
					at.setFileName(multiRequest.getOriginalFileName(key)); 
					at.setFilePath("resources/itemImg_upfiles/"); 
					at.setChangeName(multiRequest.getFilesystemName(key));
					System.out.println("변화된 파일명 : " + multiRequest.getFilesystemName(key));
					at.setStatus("Y");
					
					if(i == 1) {
						
						at.setFileLevel("1");
					}
					else if(i == 2) {
						
						at.setFileLevel("2");
					}
					else {
						at.setFileLevel("3");
					}
					
					
					list.add(at);
				}
				
			}
			// 4) Service 단으로 토스
			int result = new TBoardService().updateTBoard(boardNo, tb, list);
			
			// 5) 결과에 따른 응답뷰 지정
			if(result > 0) {
				
				request.getSession().setAttribute("alertMsg", "상품정보 수정에 성공하셨습니다.");
				response.sendRedirect(request.getContextPath() + "/list.it?currentPage=1&category="+category);
				
			}
			else { // 실패 => 에러페이지
				request.setAttribute("errorMsg", "상품 정보 수정에 실패하셨습니다.");
				response.sendRedirect(request.getContextPath() + "/list.it?currentPage=1&category="+category);
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
