package com.kh.tboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.f_board.model.service.BoardService;
import com.kh.f_board.model.vo.Board;
import com.kh.tboard.model.service.TBoardService;
import com.kh.tboard.model.vo.TBoard;

/**
 * Servlet implementation class indexTBoardSelectController
 */
@WebServlet("/Tboard.it")
public class indexTBoardSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public indexTBoardSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<TBoard> indexTList = new TBoardService().indexSelectTBoard();
		
		System.out.println(indexTList);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(indexTList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
