<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.*, java.util.ArrayList" %>
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
	Board b = (Board)request.getAttribute("b");
	Attachment at = (Attachment)request.getAttribute("at");
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
	
	#update-form>table { border : 1px solid white; }
	#update-form input, #update-form textarea {
		width : 100%;
		box-sizing : border-box;
	}
	
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">

        <br>
        <h2 align="center">일반게시판 수정하기</h2>
        <br>

		<!-- 파일을 첨부하는 요청을 할 경우에는 반드시 enctype="multipart/form-data" 를 지정해야 한다. -->
        <form id="update-form" action="<%= contextPath %>/update.bo" method="post" enctype="multipart/form-data">

			<!-- 게시글 번호를 hidden 으로 넘길것 -->
			<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">

            <!-- 제목, 내용, 카테고리, 첨부파일 입력받기 -->
            <table align="center">
                <tr>
                    <th width="100">카테고리</th>
                    <td width="500">
                        <!-- 
                           	 만약 카테고리 목록이 수정되거나 삭제된거나 추가되면 DB 에 반영되므로
                            DB 로부터 카테고리를 조회해서 보여주게끔 변경!
                        -->
                        <select name="category">
                            <% for(Category c : list) { %>
                            		<option value="<%= c.getCategoryNo() %>"><%= c.getCategoryName() %></option>
                            <% } %>
                        </select>
                        <script>
                        	$(function() {
                        		$("#update-form option").each(function() {
                        			
                        			if($(this).text() == "<%= b.getCategory() %>") {
                        				$(this).attr("selected", true);
                        			}
                        			
                        		});
                        	});
                        </script>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" value="<%= b.getBoardTitle() %>" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="content" rows="10" style="resize:none;" required><%= b.getBoardContent() %></textarea>
                    </td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                    	<!-- 기존의 파일이 있다면 원본명을 보여주자 aaa.jpg -->
                    	<% if(at != null) { %>
                    		<%= at.getOriginName() %>
                    		<!-- 기존 파일이 있으면 수정파일명, 파일번호 넘기기 -->
                    		<input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
                    		<input type="hidden" name="originFileName" value="<%= at.getChangeName() %>">
                    	<% } %>
                    	<!-- 기존 파일이 없다면 -->
                    	<input type="file" name="reUpfile">
                    </td>
                </tr>
            </table>

            <br>

            <div align="center">
                <button type="submit">수정하기</button>
            </div>
        </form>

    </div>

</body>
</html>