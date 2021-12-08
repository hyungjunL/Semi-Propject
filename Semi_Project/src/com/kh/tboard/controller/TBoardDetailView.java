package com.kh.tboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.tboard.model.service.TBoardService;
import com.kh.tboard.model.vo.Attachment;
import com.kh.tboard.model.vo.TBoard;

/**
 * Servlet implementation class TBoardDetailView
 */
@WebServlet("/detail.it")
public class TBoardDetailView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TBoardDetailView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 우선적으로 글번호 뽑아오기
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
	
		int result = new TBoardService().increaseCount(boardNo);
		
		if(result > 0) { 
			
			
			TBoard b = new TBoardService().selectBoard(boardNo);
			
			ArrayList<Attachment> list = new TBoardService().selectAttachmentList(boardNo);
	
			request.setAttribute("b", b);
			request.setAttribute("list", list);
			
			
			request.getRequestDispatcher("views/tboard/tBoardDetailView.jsp").forward(request, response);
		}
		else { 
			
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
