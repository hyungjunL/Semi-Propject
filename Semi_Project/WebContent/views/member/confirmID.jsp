<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.member.model.vo.Member" %>    
<%
	ArrayList<Member> findMemberId = (ArrayList<Member>)session.getAttribute("findMemberId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrap {
	 	width:1000px;
	 	height:1500px;
	 	margin:auto;
	 }
</style>
</head>
<body>
<div id="wrap">
<%@ include file="../common/header1.jsp" %>

<div align="center" id="findIdForm" >
	<div style="width: 50%;">
		<h5>찾고자 하는 아이디는 총 <%= findMemberId.size() %> 개 입니다.</h5>
		<ul class="list-group">
		<% for(int i = 0; i < findMemberId.size(); i++) { %>	
				<li class="list-group-item"><%= findMemberId.get(i).getMemberId() %></li>
		<% } %>
		</ul>
	</div>
</div>
<br><br>
<div align="center">
	<button class="btn btn-primary" onclick="gohome();">확인</button>
</div>

<hr>

<%@ include file="../common/footer.jsp" %>
</div>
</body>

<script>
	function gohome() {
		location.href = "<%= request.getContextPath() %>";
	}
</script>
</html>