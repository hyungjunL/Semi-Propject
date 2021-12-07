package com.kh.tboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.tboard.model.service.TBoardService;


/**
 * Servlet implementation class TBoardDeleteController
 */
@WebServlet("/delete.it")
public class TBoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TBoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		System.out.println(boardNo);
		int result = new TBoardService().deleteBoard(boardNo);
		
		if(result > 0) { // 성공 => /jsp/list.bo url 재요청 => 리스트페이지가 보여지도록
			
			
			response.sendRedirect(request.getContextPath() + "/list.it?currentPage=1");
		}
		else { // 실패 => 에러페이지가 보여지도록 에러문구
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
