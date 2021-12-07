<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.Board, com.kh.common.model.vo.PageInfo" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	// 페이징바 만들때 필요한 변수 미리 셋팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
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
        height : 550px;
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
        <h2 align="center">일반게시판</h2>
        <br>

        <!-- 로그인한 회원만 보여지는 버튼 : loginUser 변수가 null 인지 null 이 아닌지만 판단 -->
        <% if(loginUser != null) { %>
	        <div align="right" style="width:850px;">
	            <a href="<%= contextPath %>/enrollForm.bo" class="btn btn-secondary btn-sm">글작성</a>
	            <br><br>
	        </div>
        <% } %>

        <table align="center" class="list-area">
            <thead>
                <tr>
                    <th width="70">글번호</th>
                    <th width="70">카테고리</th>
                    <th width="300">제목</th>
                    <th width="100">작성자</th>
                    <th width="50">조회수</th>
                    <th width="100">작성일</th>
                </tr>
            </thead>
            <tbody>
                
                <!-- 게시글 출력 : 게시글이 있는지 없는지 => isEmpty() 이용해서 없는 경우 먼저 조건 부여 -->
                <% if(list.isEmpty()) { %> <!-- 조회글 없음 -->
                	<tr>
                		<td colspan="6">조회된 리스트가 없습니다.</td>
                	</tr>
                <% } else { %>
                	<!-- 반복 : list 에 있는 값을 순차적으로 접근해서 뽑아오기 -->
                	<% for(Board b : list) { %>
                		<tr>
		                    <td><%= b.getBoardNo() %></td>
		                    <td><%= b.getCategory() %></td>
		                    <td><%= b.getBoardTitle() %></td>
		                    <td><%= b.getBoardWriter() %></td>
		                    <td><%= b.getCount() %></td>
		                    <td><%= b.getCreateDate() %></td>
                		</tr>
                	<% } %>
                <% } %>
                
            </tbody>
        </table>
        
        <script>
        	$(function() {
        		$(".list-area>tbody>tr").click(function() {
        			var bno = $(this).children().eq(0).text();
        			
        			// /jsp/detail.bo?bno=X
        			location.href = "<%= contextPath %>/detail.bo?bno=" + bno;
        		});
        	});
        </script>

        <br><br>

        <!-- 페이징바 -->
        <div align="center" class="paging-area">
        
        	<!-- 페이징바에서 < 를 담당 : 이전페이지로 이동 -->
        	<% if(currentPage != 1) { %>
        		<button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage - 1 %>'">&lt;</button>
        	<% } %>
        
        	<!-- 페이징바에서 숫자를 담당 -->
            <% for(int i = startPage; i <= endPage; i++) { %>
            	<!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
            	<% if(i != currentPage) { %>
            		<button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= i %>'"><%= i %></button>
            	<% } else { %>
            		<!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 막고싶다. -->
            		<button disabled><%= i %></button>
            	<% } %>
            <% } %>
            
            <!-- 페이징바에서 > 를 담당 : 다음페이지로 이동 -->
            <% if(currentPage != maxPage) { %>
            	<button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage + 1 %>'">&gt;</button>
            <% } %>
            
        </div>

    </div>

</body>
</html>










