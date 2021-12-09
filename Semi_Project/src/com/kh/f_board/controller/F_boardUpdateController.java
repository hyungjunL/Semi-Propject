package com.kh.f_board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.f_board.model.service.BoardService;
import com.kh.f_board.model.vo.Attachment;
import com.kh.f_board.model.vo.Board;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class F_boardUpdateController
 */
@WebServlet("/update.fb")
public class F_boardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public F_boardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
		request.setCharacterEncoding("UTF-8");
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
			int maxSize = 1024 * 1024 * 10;
			
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/f_board_upfiles/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			
			int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			
			
			Board b = new Board();
			b.setF_NO(boardNo);
			b.setF_TITLE(boardTitle);
			b.setCONTENT(boardContent);
			
			
			Attachment at = null;
			
			
			if(multiRequest.getOriginalFileName("reUpfile") != null) {
				
				
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
				at.setChangeName(multiRequest.getFilesystemName("reUpfile"));
				at.setFilePath("resources/f_board_upfiles/");
				
				if(multiRequest.getParameter("originFileNo") != null) {
					
					
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
				}
				else {
					
					
					at.setRefNo(boardNo);
				}
			}
			
		
			int result = new BoardService().updateBoard(b, at);
			
		
			
			
			if(result > 0) { 
				
				
				
				response.sendRedirect(request.getContextPath() + "/detail.fb?bno=" + boardNo);
				
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
