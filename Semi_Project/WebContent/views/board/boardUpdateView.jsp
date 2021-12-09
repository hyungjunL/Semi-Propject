<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.f_board.model.vo.*, java.util.ArrayList"%>
<%

Board b = (Board) request.getAttribute("b");
Attachment at = (Attachment) request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판</title>
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
.wrap {
	width: 1200px;
	margin: 0px auto;
}

#header {
	width: 100%;
	height: 200px;
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

#board-center-header>span {
	font-size: 25px;
}

#title {
	width: 100%;
	resize: none;
	margin-bottom: 10px;
}

#content {
	width: 100%;
	height: 500px;
	resize: none;
}

.input-file {
	margin: 10px 0px;
}
</style>
</head>

<body>

	<%@ include file="../common/header1.jsp"%>
	<div class="wrap">

		<form action="/javajo/update.fb" id="enroll-form" method="post"
			enctype="multipart/form-data">

			<input type="hidden" name="bno" value="<%=b.getF_NO()%>"> <input
				type="hidden" name="userNo" value="1">

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
						<span>게시글 수정하기</span>
						<button type="submit" class="btn btn-success"
							style="float: right;" name="submit">수정</button>
					</div>
					<hr class="hr1">
					<div id="in_title">
						<input type="text" name="title" id="title" placeholder="제목"
							required>
					</div>

					<div id="in_content">
						<textarea name="content" id="content" placeholder="내용" required></textarea>
					</div>

					<!-- 미리보기 영역-->
					<table>

						<tr>

							<td><img id="contentImg1" width="223" height="160"></td>
							<td><img id="contentImg2" width="223" height="160"></td>
							<td><img id="contentImg3" width="223" height="160"></td>
							<td><img id="contentImg4" width="223" height="160"></td>
						</tr>
					</table>


					<div id="file-area">
						<!--  기존 파일이 있다면 원본명 보요주기 -->
						<%
						if (at != null) {
						%>
						<%=at.getOriginName()%>

						<!-- 기존 파일이 있으면 수정파일명, 파일번호 넘기기 -->
						<input type="hidden" name="originFileNo"
							value="<%=at.getFileNo()%>"> <input type="hidden"
							name="originFileName" value="<%=at.getChangeName()%>">
						<%
						}
						%>
						<input type="file" id="file1" name="file1 reUpfile"
							onchange="loadImg(this,1)"> <input type="file" id="file2"
							name="file2" onchange="loadImg(this,2)"> <input
							type="file" id="file3" name="file3" onchange="loadImg(this,3)">
						<input type="file" id="file4" name="file4"
							onchange="loadImg(this,4)">
					</div>


					<script>
						$(function() {

							$("#contentImg1").click(function() {
								$("#file1").click();
							});

							$("#contentImg2").click(function() {
								$("#file2").click();
							})
							$("#contentImg3").click(function() {
								$("#file3").click();
							})
							$("#contentImg4").click(function() {
								$("#file4").click();
							})
						});

						function loadImg(inputFile, num) {

							console.log(inputFile.files.length);

							if (inputFile.files.length == 1) { // 파일이 있는 경우

								var reader = new FileReader();

								reader.readAsDataURL(inputFile.files[0]);

								reader.onload = function(e) {

									switch (num) {
									case 1:
										$("#contentImg1").attr("src",
												e.target.result);
										break;
									case 2:
										$("#contentImg2").attr("src",
												e.target.result);
										break;
									case 3:
										$("#contentImg3").attr("src",
												e.target.result);
										break;
									case 4:
										$("#contentImg4").attr("src",
												e.target.result);
										break;
									}
								};

							} else { // 파일이 없는 경우 
								// 미리보기 사라지게 하기
								// src=null 을 담아서 사라지게 할 것

								switch (num) {
								case 1:
									$("#contentImg1").attr("src", null);
									break;
								case 2:
									$("#contentImg2").attr("src", null);
									break;
								case 3:
									$("#contentImg3").attr("src", null);
									break;
								case 4:
									$("#contentImg4").attr("src", null);
									break;
								}

							}

						}
					</script>

				</div>
			</div>
		</form>
	</div>
</body>

</html>