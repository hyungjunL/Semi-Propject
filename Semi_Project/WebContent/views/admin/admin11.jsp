<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="java.util.ArrayList, com.kh.common.model.vo.One, com.kh.common.model.vo.PageInfo"%>
<% String alertMsg = (String)session.getAttribute("alertMsg"); %>
<%
String contextPath = request.getContextPath();
ArrayList<One> olist = (ArrayList<One>) request.getAttribute("olist");
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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



<style>


#body-center {
	text-align: left;
	float: left;
	padding-top: 20px;
	width: 70%;
	margin: 20px;
}

.wrap {
	width: 1500px;
	margin: 0 auto;
	position: relative
}

div#pagination {
	position: absolute;
	left: 50%;
}

#page-wrapper {
	padding-left: 250px;
}

#page-content-wrapper {
	width: 100%;
	padding: 20px;
}

.side-bar {
	float: left;
	width: 20%;
	margin-top: 50px;
}

.table-side td {
	width: 200px;
	border: 1px solid lightgrey;
	height: 50px;
	text-indent: 5px;
}

.side-bar>p {
	font-size: 20px;
	text-indent: 10px;
}

.side-bar td:hover {
	color: green;
}
</style>
</head>

<body>
	<div class="wrap">
		<div class="header">
			<nav class="navbar navbar-expand-lg navbar-dark "
				style="background: green;">
				<div class="container-fluid">
					<a class="navbar-brand" href="<%= contextPath %>/list.ad?currentPage=1" style="font-size: 25px;">관리자 페이지</a>
					<form class="d-flex">
						<input id="search" class="form-control me-sm-2" type="text" placeholder="회원 아이디로 검색" name="search">
					</form>
				</div>
			</nav>
		</div>

		<div class="body">
			<div class="side-bar">
				

				<table class="table-side">
					<p style="margin-top: 15px;">고객 센터</p>
					<tr>
						<td><a href="/javajo/list.ad?currentPage=1">회원 관리</a></td>
					</tr>
					<tr>
						<td>FAQ 답변</td>
					</tr>
					
				</table>


			</div>

			<div id="body-center">
				<table class="table table-hover list-area">
					<h3	style="font-weight: bold; text-indent: 50px; padding-bottom: 30px;">회원 관리</h3>
					<thead style="text-align: center;">
						<tr>
							<th scope="col">문의번호</th>
							<th scope="col">회원ID</th>
							<th scope="col">회원번호</th>
							<th scope="col">문의제목</th>
							<th scope="col">문의내용</th>
							<th scope="col">작성일</th>
						</tr>
						
					</thead>

					<tbody>
						<%
						if (olist.isEmpty()) {
						%>

						<tr>
							<td colspan="5" style= "text-align:center">조회된 리스트가 없습니다.</td>
						</tr>
						<%
						} else {
						%>

						<%
						for (One o : olist) {
						%>
						<tr style="text-align: center">
							<td><%=o.getO_Id() %></td>
							<td><%=o.getMemberId() %></td>
							<td><%=o.getMemberNo() %></td>
							<td><%=o.getO_Title() %></td>
							<td><%=o.getO_Content() %></td>
							<td><%=o.getCreate_Date() %></td>
						</tr>
						<%
						}
						%>
						<%
						}
						%>
					</tbody>
				</table>

				<div align="center" id="pagenation">


					<%
					if (currentPage != 1) {
					%>
					<button style="display:inline;" class="page-link" onclick="location.href='/javajo/list.on?currentPage=<%=currentPage - 1%>'">&lt;</button>
					<%
					}
					%>


					<%
					for (int i = startPage; i <= endPage; i++) {
					%>

					<%
					if (i != currentPage) {
					%>
					<button style="display:inline;" class="page-link" onclick="location.href='/javajo/list.on?currentPage=<%=i%>'"><%=i%></button>
					<%
					} else {
					%>

					<button style="display:inline;" class="page-link" disabled><%=i%></button>
					<%
					}
					%>
					<%
					}
					%>

					<%
					if (currentPage != maxPage) {
					%>
					<button style="display:inline;" class="page-link" onclick="location.href='/javajo/list.on?currentPage=<%=currentPage + 1%>'">&gt;</button>
					<%
					}
					%>
				</div>
			</div>

		</div>
	</div>

	<div class="modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">문의 답변</h5>
				</div>
				<form action="/javajo/update.on" >
				<div class="modal-body">
					<hr>
						 문의번호 : <span id="test1"> </span> <br>
					<br> 회원 ID : <span id="test2"> </span> <br>
					<br> 회원 번호 : <span id="test3"> </span> <br>
					<br> 문의제목 : <span id="test4"> </span>  <br>
					<br> 문의내용 : <span id="test5"> </span>  <br>
					<br> 작성일 : <span id="test6"> </span>  <br>
					<br> <span id="test7"> </span> <br><textarea name="answer" placeholder="답변작성" style="width:450px; height:100px; resize:none; float:center" required></textarea> <br>
					<br>

					<hr>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary" id="insert" value="답변하기" >
					<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal" id="modal-close">닫기</button>
				</div>
				
				<input type="hidden" name="oid" id="oid" value="">
					</form>
			</div>
		</div>
	</div>
	

	<script>
		
		$('.list-area>tbody>tr').click(function() {
			$('.modal').modal('show');

			var oid = $(this).children().eq(0).text();
			var mid = $(this).children().eq(1).text();
			var mno = $(this).children().eq(2).text();
			var oti = $(this).children().eq(3).text();
			var oco = $(this).children().eq(4).text();
			var ocr = $(this).children().eq(5).text();
			
			
			$("#test1").text(oid);
			$("#test2").text(mid);
			$("#test3").text(mno);
			$("#test4").text(oti);
			$("#test5").text(oco);
			$("#test6").text(ocr);
			
			
			
			
			$("#oid").val(oid);
			

		});
		
		$('#modal-close').click(function() {
			$('.modal').modal('hide');

		});
		
		 $(document).ready(function() {
	            $("#search").keyup(function() {
	                var k = $(this).val();
	                $(".list-area>tbody>tr").hide();
	                var temp = $(".list-area>tbody>tr > td:nth-child(5n+2):contains('" + k + "')");

	                $(temp).parent().show();
	            })
	        })
		
	</script>
	
	
</body>

</html>