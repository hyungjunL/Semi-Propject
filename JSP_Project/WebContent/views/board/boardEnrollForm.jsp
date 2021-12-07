<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.board.model.vo.Category" %>
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
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

    #enroll-form>table { border : 1px solid white; }
    #enroll-form input, #enroll-form textarea {
        width : 100%;
        box-sizing : border-box;
    }
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">

        <br>
        <h2 align="center">일반게시판 작성하기</h2>
        <br>

		<!-- 파일을 첨부하는 요청을 할 경우에는 반드시 enctype="multipart/form-data" 를 지정해야 한다. -->
        <form id="enroll-form" action="<%= contextPath %>/insert.bo" method="post" enctype="multipart/form-data">

            <!-- 제목, 내용, 카테고리, 첨부파일 입력받기 -->
            <!-- + 작성자의 회원번호를 hidden 으로 같이 넘길것! -->
            <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">

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
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="content" rows="10" style="resize:none;" required></textarea>
                    </td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="upfile"></td>
                </tr>
            </table>

            <br>

            <div align="center">
                <button type="submit">작성하기</button>
                <button type="reset">취소하기</button>
            </div>
        </form>

    </div>

</body>
</html>