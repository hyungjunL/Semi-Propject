<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.*" %>
<%
	Board b = (Board)request.getAttribute("b");
	// 게시글번호, 카테고리명, 제목, 내용, 작성자아이디, 작성일
	
	Attachment at = (Attachment)request.getAttribute("at");
	// 파일번호, 원본명, 수정명, 저장경로
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
        margin : auto;
        margin-top : 50px;
    }

    .outer table { border-color : white; }
</style>
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>

    <div class="outer">

        <br>
        <h2 align="center">일반게시판 상세보기</h2>
        <br>

        <table id="detail-area" align="center" border="1">

            <!-- (tr>th+td+th+td)*4 -->
            <tr>
                <th width="70">카테고리</th>
                <td width="70"><%= b.getCategory() %></td>
                <th width="70">제목</th>
                <td width="350"><%= b.getBoardTitle() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= b.getBoardWriter() %></td>
                <th>작성일</th>
                <td><%= b.getCreateDate() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p style="height:200px;"><%= b.getBoardContent() %></p>
                </td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td colspan="3">
                	<!-- 첨부파일 없을경우 -->
                	<% if(at == null) { %>
                		첨부파일이 없습니다.
                	<% } else { %>
	                	<!-- 첨부파일 있을경우 -->
	                    <a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>">
	                    	<%= at.getOriginName() %>
	                    </a>
                    <% } %>
                </td>
            </tr>

        </table>

        <br>

        <div align="center">
            <a href="" class="btn btn-secondary btn-sm">목록가기</a>

            <!-- 로그인한 사용자고 그리고 작성자일 경우에만 보여지게끔 -->
            <% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())) { %>
	            <a href="<%= contextPath %>/updateForm.bo?bno=<%= b.getBoardNo() %>" class="btn btn-warning btn-sm">수정하기</a>
	            <a href="<%= contextPath %>/delete.bo?bno=<%= b.getBoardNo() %>" class="btn btn-danger btn-sm">삭제하기</a>
            <% } %>
        </div>

        <br>

        <!-- 댓글창 : 화면만!! AJAX 배우고 나서 기능 구현할것 -->
        <div id="reply-area">

            <table border="1" align="center">
                <thead>
                	<% if(loginUser != null) { %>
	                    <!-- 로그인이 되어있을 경우 : 댓글작성가능 -->
                        <tr>
                            <th>댓글작성</th>
                            <td>
                                <textarea id="replyContent" cols="50" rows="3" style="resize:none;"></textarea>
                            </td>
                            <td><button onclick="insertReply();'">댓글등록</button></td>
                        </tr>
                    <% } else { %>
                    	<!-- 로그인이 안되어있을 경우 : 불가능 -->
	                    <tr>
	                        <th>댓글작성</th>
	                        <td>
	                            <textarea id="" cols="50" rows="3" style="resize:none;" readonly>로그인 후 이용 가능한 서비스 입니다.</textarea>
	                        </td>
	                        <td><button>댓글등록</button></td>
	                    </tr>
                    <% } %>
                </thead>
                <tbody>
                </tbody>
            </table>

            <br><br>

        </div>
        
        <script>
        
        	function insertReply() {
        		
        		$.ajax({
        			url : "rinsert.bo",
        			data : {
        				content : $("#replyContent").text(),
        				bno : <%= b.getBoardNo() %>
        			},
        			type : "post",
        			success : function(result) {
        				
        				// result 값에 따라서 성공했으면 성공메시지 띄우기 alert()
        				
        			},
        			error : function() {
        				console.log("댓글 삽입용 ajax 실패");
        			}
        		});
        		
        	}
        	
        	// 댓글은 화면이 로딩되었을 때 곧바로 뿌려줘야 함 => window.onload => $(function)
        	$(function() {
        		
        		$.ajax({
        			url : "rlist.bo", 
        			data : { bno : <%= b.getBoardNo() %> }, 
        			success : function(list) {
        				
        				// 댓글갯수만큼 반복 => 누적(문자열)
        				var result = "";
        				for(var i in list) { // for in
        					result += "<tr>"
		                               + "<td>" + list[i].replyWriter + "</td>"
		                               + "<td>" + list[i].replyContent + "</td>"
		                               + "<td>" + list[i].createDate + "</td>"
			                        + "</tr>";
        				}
        				
        				$("#reply-area tbody").html(result);
        				
        			},
        			error : function() {
        				console.log("댓글리스트용 ajax 실패");
        			}
        		});
        		
        	});
        	
        </script>

    </div>

</body>
</html>










