package com.kh.service.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.service.model.service.ServiceService;
import com.kh.service.model.vo.Service;

/**
 * Servlet implementation class ServiceInqController
 */
@WebServlet("/inq.se")
public class ServiceInqController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceInqController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int ino =  Integer.parseInt(request.getParameter("ino"));
		//System.out.println(ino);
		request.setAttribute("ino", ino);
	
		Service s = new ServiceService().selectInq(ino);
		
		request.setAttribute("s", s);
		
		request.getRequestDispatcher("/views/service/serviceInq.jsp").forward(request, response);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
