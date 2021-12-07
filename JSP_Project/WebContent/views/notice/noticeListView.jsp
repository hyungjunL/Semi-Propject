<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.notice.model.vo.Notice" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer {
        background : black;
        color : white;
        width : 1000px;
        height : 500px;
        margin : auto;
        margin-top : 50px;
    }

    .list-area {
        border : 1px solid white;
        text-align : center;
    }

    .list-area>tbody>tr:hover {
        background : gray;
        cursor : pointer;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">

        <br>
        <h2 align="center">공지사항</h2>
        <br>

        <!-- 관리자만 글 작성 버튼이 보여지게끔 -->
        <% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
        	<!-- 로그인이 되었고 그리고 관리자일 경우 -->
        
	        <div align="right" style="width:850px;">
	            <!--
	            <button onclick="loctaion.href='이동할페이지';">글작성</button>
	                	버튼에 href 속성이 없기 때문에
	                	버튼을 눌러서 페이지를 이동시키려면 onclick="location.href='요청url'"
	                	onclick 속성에 직접적으로 자바스크립트 코드를 이용하여 요청해야함
	            -->
	            <!-- a 태그를 쓰고도 버튼 모양으로 만들고 싶다면? : 부트스트랩 활용 -->
	            <a href="<%= contextPath %>/enrollForm.no" class="btn btn-secondary btn-sm">글작성</a>
	        
	            <br><br>
	        </div>
        <% } %>

        <table class="list-area" align="center">
            <thead>
                <tr>
                    <th>글번호</th>
                    <th width="400">글제목</th>
                    <th width="100">작성자</th>
                    <th>조회수</th>
                    <th width="100">작성일</th>
                </tr>
            </thead>
            <tbody>
                <!-- 보통 작성일 기준으로 내림차순, 즉 최신글이 가장 위에 온다 -->
                
                <!-- 리스트가 비어있는지 아니면 차있는지 -->
                <% if(list.isEmpty()) { %> <!-- 리스트가 비어있을 경우 -->
                	<tr>
                		<td colspan="5">존재하는 공지사항이 없습니다.</td>
                	</tr>
                <% } else { %> <!-- 리스트가 차있을 경우 : 반복문 -->
                	
                	<!-- 향상된 for 문 -->
                	<% for(Notice n : list) { %>
                		
                		<tr>
                			<td><%= n.getNoticeNo() %></td>
		                    <td><%= n.getNoticeTitle() %></td>
		                    <td><%= n.getNoticeWriter() %></td>
		                    <td><%= n.getCount() %></td>
		                    <td><%= n.getCreateDate() %></td>
                		</tr>
                	<% } %>
                <% } %>
                
            </tbody>
        </table>
        
        <script>
        	$(function() {
        		
        		$(".list-area>tbody>tr").click(function() {
        			
        			// console.log("클릭됨");
        			
        			// 클릭했을 때 해당 공지사항의 번호를 넘겨야 함
        			// 해당 tr 태그의 자손 중에서도 첫번째 td 의 값이 필요 (내용물을 뽑자)
        			var nno = $(this).children().eq(0).text(); // 글번호
        			
        			// console.log(nno);
        			
        			// 글번호를 이용한 요청
        			// => 대놓고 요청 => url 에 키와 밸류를 대놓고 작성해서 요청을 보내버린다.
        			// => GET 방식 : 요청할url?키=밸류&키=밸류&키=밸류..
        			// "쿼리스트링" : ? 뒤의 내용들, 직접 만들어서 넘겨줘야 함
        			// localhost:8888/jsp/detail.no?nno=글번호
        			
        			location.href="<%= contextPath %>/detail.no?nno=" + nno;
        			
        		});
        	});
        </script>
        
    </div>

</body>
</html>





