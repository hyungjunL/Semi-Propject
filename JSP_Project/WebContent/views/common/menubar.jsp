<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath(); // /jsp

	Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인 전 : menubar.jsp 가 로딩될때 null
	// 로그인 후 : menubar.jsp 가 로딩될때 로그인한 회원의 정보가 담겨있음
	
	// 성공 / 경고 메시지 뽑기
	String alertMsg = (String)session.getAttribute("alertMsg");
	// 서비스 요청 전 : alertMsg = null
	// 서비스 요청 후 성공 시 : alertMsg = 메시지 문구
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>

    #login-form, #user-info {float:right;}

    #user-info a {
        text-decoration : none;
        color : black;
        font-size : 12px;
    }

    .nav-area {background : black;}
    .menu {
        display : table-cell; /* 인라인요소처럼 배치 가능 */
        height : 50px;
        width : 150px;
    }
    .menu a {
        text-decoration : none;
        color : white;
        font-size : 20px;
        font-weight : bold;
        display : block;
        width : 100%;
        height : 100%;
        line-height : 50px;
    }
    .menu a:hover {background : darkgray;}

</style>
</head>
<body>
	
	<script>
		
		// script 태그 내에서도 스크립틀릿과 같은 jsp 요소를 쓸 수 있다.
		
		var msg = "<%= alertMsg %>"; // "메시지 문구" / "null"
		
		if(msg != "null") { // 즉, 성공 / 경고 메시지 문구가 담겨있을 경우
			alert(msg);
		
			// session 에 들어있는 alertMsg 키값에 대한 밸류를 지워줘야함!!
			// 안그러면 menubar.jsp 가 로딩될때마다 매번 alert 가 뜰것
			// => XX.removeAttribute("키값");
			<% session.removeAttribute("alertMsg"); %>
		}
	
	</script>

	<h1 align="center">Welcome D Class</h1>

    <div class="login-area">
    
    	<% if(loginUser == null) { %>
	        <!-- 로그인 전에 보여지는 로그인 form -->
	        <form id="login-form" action="<%= contextPath %>/login.me" method="post">
	            <table>
	                <tr>
	                    <th>아이디 : </th>
	                    <td><input type="text" name="userId" required></td>
	                </tr>
	                <tr>
	                    <th>비밀번호 : </th>
	                    <td><input type="password" name="userPwd" required></td>
	                </tr>
	                <tr>
	                    <th colspan="2">
	                        <button type="submit">로그인</button>
	                        <button type="button" onclick="enrollPage();">회원가입</button>
	                    </th>
	                </tr>
	            </table>
	        </form>
	        
	        <script>
	        	function enrollPage() {
	        		
	        		// 페이지 이동
	        		// location.href = "<%= contextPath %>/views/member/memberEnrollForm.jsp";
	        		// 웹 애플리케이션의 디렉토리 구조가 url 에 노출된다 => 보안에 취약
	        		// localhost:8888/jsp/views/member/memberEnrollForm.jsp
	        		
	        		// 단순한 정적인 페이지 요청이라고 하더라도 반드시 Servlet 을 거쳐서 화면을 띄워줄것임!!!!
	        		// => url 에 서블릿 맵핑값만 노출되게끔 하겠다.
	        		// localhost:8888/jsp/맵핑값
	        		location.href = "<%= contextPath %>/enrollForm.me";
	        		
	        	}
	        </script>
	        
	    <% } else { %>

	        <!-- 로그인 성공 후 화면 -->
	        <div id="user-info">
	            <b><%= loginUser.getUserName() %> 님</b> 환영합니다. <br><br>
	            <div align="center">
	                <a href="<%= contextPath %>/myPage.me">마이페이지</a>
	                <a href="<%= contextPath %>/logout.me">로그아웃</a>
	            </div>
	        </div>
        <% } %>

    </div>

    <br clear="both">
    <br>

    <div class="nav-area" align="center">
        <!-- (div.menu>a)*4 -->
        <div class="menu"><a href="<%= contextPath %>">HOME</a></div>
        <div class="menu"><a href="<%= contextPath %>/list.no">공지사항</a></div> <!-- /jsp/list.no -->
        <div class="menu"><a href="<%= contextPath %>/list.bo?currentPage=1">일반게시판</a></div>
        <div class="menu"><a href="<%= contextPath %>/list.th">사진게시판</a></div>
    </div>
</body>
</html>









