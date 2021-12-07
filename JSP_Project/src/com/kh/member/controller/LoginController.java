package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*
		 * < HttpServletRequest, HttpServletResponse 객체 >
		 * - request : 서버로 요청할때의 정보들이 담겨있음 (요청시 전달값, 요청전송 방식 등등..)
		 * - response : 요청에 대해 응답하고자 할 때 사용하는 객체
		 */
		
		// 1) Post 방식일 경우 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 2) 요청 시 전달값을 꺼내서 변수에 기록 => request 의 parameter 영역
		// request.getParameter("키값") : String
		// request.getParameterValues("키값") : String[] => checkbox 일 경우 사용
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// System.out.println(userId);
		// System.out.println(userPwd);
		
		// 3) 해당 요청을 처리하는 서비스 클래스의 메소드를 호출
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		// 일치하는 회원이 있다면 loginUser 의 값이 회원 정보로 가득 차 있을 것
		// 일치하는 회원이 없다면 null 이 담길 것
		
		// System.out.println(loginUser);
		
		// 4) 처리된 결과를 가지고 사용자가 보게될 응답화면을 지정
		// 스텝1. request 객체에 응답화면에 보여질 값 담기 => request 의 attribute 영역에
		// 스텝2. RequestDispatcher 객체 생성 => 응답할 뷰 화면을 지정
		// 스텝3. RequestDispatcher 객체로부터 forward 메소드 호출
		
		// 스텝1. 어딘가에 응답화면에 보여질 값 담기 (request, session, application, page)
		// 스텝2. RequestDispatcher 객체 생성 또는 url 재요청방식 활용 (sendRedirect 방식)
		// 스텝2. case1 RequestDispatcher 객체 생성(응답할 뷰 화면 지정) -> forward 
		//       case2 response.sendRedirect(응답할 뷰 화면 또는 url 지정);
		
		/*
		 * * 응답 페이지에 전달할 값이 있을 경우 값을 어딘가에 담아야함 => 어딘가의 attribute 영역에 담아서 보낸다.
		 * 	 (담아줄수 있는 객체가 4종류 => Servlet Scope 내장객체)
		 * 
		 * 크다
		 * 
		 * 1) application : 웹 어플리케이션 전역에서 언제나 꺼내 쓸 수 있음
		 * 
		 * 2) session : 모든 jsp 와 servlet 에서 꺼내 쓸 수 있음
		 * 				단, 내가 직접적으로 session 객체에 담은 값을 지우기 전까지만 꺼내 쓸 수 있음
		 * 				세션이 끊기는 경우 : 브라우저가 종료될때, 서버가 멈춘 경우
		 * 
		 * 3) request : 해당 request 를 포워딩한 응답 jsp 페이지에서만 쓸수 있다.
		 * 				요청 페이지에서부터 응답 페이지까지에서만 쓸 수 있다. (한 사이클)
		 * 
		 * 4) page : 담은 값을 해당 jsp 페이지에서만 쓸수 있다. (화면이 넘어가면 담은 값이 소멸)
		 * 
		 * 작다
		 * 
		 * => session, request 가 가장 많이 쓰인다.
		 * => 공통적으로 데이터를 담고자 한다면 : XXX.setAttribute(키, 밸류);
		 * =>		    데이터를 뽑고자 한다면 : XXX.getAttribute(키);
		 * =>		    데이터를 지우고자 한다면 : XXX.removeAttribute(키); : 짝을 맞춰줘야함!!
		 * 예시)
		 * 로그인 시 : session.setAttribute("userInfo", loginUser);
		 * 로그아웃시 : session.removeAttribute("userInfo"); 또는 유효화 시키는 메소드 사용
		 */
		
		if(loginUser == null) { // 로그인 실패 => 에러페이지를 응답
			
			// 에러메시지 넘기기
			// 스텝1. request 의 attribute 영역에 메시지 담기
			request.setAttribute("errorMsg", "로그인에 실패했습니다.");
			
			// 스텝2. RequestDispatcher 객체 생성
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			
			// 스텝3. forward
			// 포워딩 방식 : 해당 경로로 선택된 뷰가 보여진다
			view.forward(request, response);
			
		}
		else { // 로그인 성공 => index.jsp 페이지 응답
			
			// 사용자의 정보 넘기기
			// 스텝1. session 의 attribute 영역에 사용자 정보 담기
			
			// 로그인 한 회원의 정보를 로그아웃 하기 전까지 계속 가져다 쓸 것이기 때문에
			// session 에 담기
			
			// Servlet 에서 JSP 내장 객체인 session 에 접근하려면 (session 객체를 사용하려면)
			// 우선적으로 session 객체를 얻어와야함
			// => session 객체의 type : HttpSession
			// => session 객체 생성 방법 : request.getSession();
			HttpSession session = request.getSession();
			
			session.setAttribute("loginUser", loginUser);
			
			session.setAttribute("alertMsg", "성공적으로 로그인이 되었습니다.");
			
			/*
			// 기존 방식 : 포워딩 응답방식으로 넘길 경우
			// 스텝2. RequestDispatcher 객체 생성
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			
			// 스텝3. forward 메소드 호출
			view.forward(request, response);
			// => 포워딩 방식의 가장 큰 특징 : url 에는 여전히 현재 이 서블릿 맵핑값이 남아있음
			//	  localhost:8888/jsp/login.me
			//    (참고로 응답페이지는 index.jsp 이기 때문에 localhost:8888/jsp/ 로 보여야함)
			*/
			
			// url 재요청방식 (sendRedirect 방식) : url 을 재요청 함으로써 응답페이지가 보여지게끔
			// response 객체를 이용하는 방법
			// response.sendRedirect(재요청할 경로);
			// => url 재요청방식의 가장 큰 특징 : 내가 요청한 경로가 url 에 보임
			response.sendRedirect(request.getContextPath());
			// localhost:8888/jsp 로 url 재요청이 갈 것
			
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
