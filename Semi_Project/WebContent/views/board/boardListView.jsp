<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="java.util.ArrayList, com.kh.f_board.model.vo.Board, com.kh.common.model.vo.PageInfo"%>
<%
	
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	
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
.wrap {
	width: 1200px;
	height : 1000px;
	margin: 0px auto;
	text-align: center;
}

#board-side {
	float: left;
	width: 20%;
}

#board-title {
	width: 200px;
	height: 200px;
	background: green;
	font-size: 25px;
	font-display: none;
	text-decoration: none;
	text-align: center;
	color: white;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

#board-center {
	float: left;
	padding: 30px;
	width: 80%;
}

#board-center-body {
	width: 100%;
	height: 800px;
	text-align: center;
}

.hr1 {
	border: 0;
	height: 2px;
	background: green;
}

.table-side td {
	border: 1px solid lightgrey;
	width: 200px;
	height: 50px;
	text-indent: 10px;
	text-align: left;
}

.table-side tr:hover {
	color: green;
}

#btn-write {
	float: right;
	margin-right: 20px;
}

#board-center-header {
	text-align: left;
}
</style>
</head>

<body>

	<%@ include file = "../common/header1.jsp" %>

	<div class="wrap">

		<div id="board-body">
			<div id="board-side">
				<div id="board-title" onclick="location.href=''"
					style="cursor: pointer;">
					<span>후기 게시판</span><br>COMUUNITY
				</div>
				<table class="table-side">
					<tr>
						<td>공지사항</td>
					</tr>
					<tr>
						<td>1:1 문의</td>
					</tr>
					<tr>
						<td>FAQ문의</td>
					</tr>
				</table>
			</div>

			<div id="board-center">
				<div id="board-center-header">
					<h2>후기 게시판</h2>
				</div>
				<hr class="hr1">
				<div id="board-center-body">
					<table class="table table-hover t-body">
						<thead>
							<tr>
								<th scope="col" style="width: 8%; text-align: center;">번호</th>
								<th scope="col" style="width: 47%; text-align: center;">제목</th>
								<th scope="col" style="width: 15%;">작성자</th>
								<th scope="col" style="width: 15%;">조회수</th>
								<th scope="col" style="width: 15%;">작성일</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (list.isEmpty()) {
							%>
							
							<tr>
								<td colspan="5">조회된 리스트가 없습니다.</td>
							</tr>
							<%
							} else {
							%>
							
							<%
							for (Board b : list) {
							%>
							<tr>
								<td><%=b.getF_NO()%></td>
								<td><%=b.getF_TITLE()%></td>
								<td><%=b.getMEMBER_ID()%></td>
								<td><%=b.getT_COUNT()%></td>
								<td><%=b.getCREATE_DATE()%></td>
							</tr>
							<%
							}
							%>
							<%
							}
							%>
						</tbody>
					</table>

					<script>
						$(function() {
							$(".t-body>tbody>tr").click(function() {
								var bno = $(this).children().eq(0).text();

								location.href = "/javajo/detail.fb?bno=" + bno;
							});
						});
					</script>

					<br> <br>
					<div align="center" id="pagenation">

						
						<%
						if (currentPage != 1) {
						%>
						<button
							onclick="location.href='/javajo/list.fb?currentPage=<%=currentPage - 1%>'">&lt;</button>
						<%
						}
						%>

						
						<%
						for (int i = startPage; i <= endPage; i++) {
						%>
						
						<%
						if (i != currentPage) {
						%>
						<button
							onclick="location.href='/javajo/list.fb?currentPage=<%=i%>'"><%=i%></button>
						<%
						} else {
						%>
						
						<button disabled><%=i%></button>
						<%
						}
						%>
						<%
						}
						%>

						
						<%
						if (currentPage != maxPage) {
						%>
						<button
							onclick="location.href='/javajo/list.fb?currentPage=<%=currentPage + 1%>'">&gt;</button>
						<%
						}
						%>
					</div>
					<br>
					<br>
					<br>

					<div align="right" style="width: 850px;">
						<a href="/javajo/enroll.fd"
							class="btn btn-secondary btn-sm">글작성</a> <br>
						<br>
					</div>
<%@include file = "../common/footer.jsp" %>
				</div>
			</div>
		</div>
		
</body>

</html>