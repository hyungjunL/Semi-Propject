<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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

#wrap{
	width:1000px;
	height:1500px;
	margin: auto;
	
	}
.wrap {
	width: 1000px;
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
<div id="wrap">

<%@ include file="../common/header1.jsp"%>
	<div class="wrap">

		<form action="<%= contextPath %>/insert.fb" id="enroll-form" method="post"
			enctype="multipart/form-data">

			<input type="hidden" name="userNo" value="1">

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
						<span>게시글 작성하기</span>
						<button type="submit" class="btn btn-success"
							style="float: right;" name="submit">등록</button>
					</div>
					<hr class="hr1">
					<div id="in_title">
						<input type="text" name="title" id="title" placeholder="제목" required>
					</div>

					<div id="in_content">
						<textarea name="content" id="content" placeholder="내용" required></textarea>
					</div>

					<!-- 미리보기 영역-->
					<table>
						
						<tr>
							
							<td><img id="contentImg1" width="183" height="150"></td>
							<td><img id="contentImg2" width="183" height="150"></td>
							<td><img id="contentImg3" width="183" height="150"></td>
							<td><img id="contentImg4" width="183" height="150" ></td>
						</tr>
					</table>


					<div id="file-area">
						<input type="file" id="file1" name="file1" onchange="loadImg(this,1)"> 
						<input type="file" id="file2" name="file2" onchange="loadImg(this,2)"> 
						<input type="file" id="file3" name="file3" onchange="loadImg(this,3)">
						<input type="file" id="file4" name="file4" onchange="loadImg(this,4)">
					</div>

					<script>
						$(function() {

							$("#file-area").hide();

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

							// inputFile : 현재 변화가 생긴 <input type="file"> 요소 객체
							// num : 몇번째 input 요소인지 확인 후 그 해당 영역에 미리보기 하기 위한 변수

							console.log(inputFile.files.length);
							// inputFile.files.length : 파일 선택 시 1, 파일 선택 취소 시 0이 찍힘
							// => 파일의 존재 유무를 알 수 있다.

							// files 속성 " 업로드된 파일의 정보들을 배열 형식으로 여러개 묶어서 반환"

							if (inputFile.files.length == 1) { // 파일이 있는 경우

								// 선택된 파일을 읽어들여서 그 영역에 맞는 곳에 미리보기

								// 파일을 읽어들일 FileReader 객체 생성
								var reader = new FileReader();

								// FileReader 객체로부터 파일을 읽어들이는 메소드를 호출
								// 어느 파일을 읽어들일건지 매개변수로 제시해야함 !!
								// 0번 인덱스에 담긴 파일 정보를 제시
								reader.readAsDataURL(inputFile.files[0]);
								// => 해당 파일을 읽어들이는 순간
								//    해당 그 파일만의 고유한 url 이 부여됨
								// => 해당 url 을 src 속성으로 부여할것 !

								// 파일 읽기가 완료되었을 때 실행할 함수를 정의
								reader.onload = function(e) {
									// e의 target => e.target => 이벤트 당한 객체 (this)

									// e 의 target.result 에 각 파일의 url 이 담긴다.
									// e.target.result == this.result

									// 각 영역에 맞춰서 이미지 미리보기
									switch (num) {
									case 1:
										$("#contentImg1").attr("src", e.target.result);
										break;
									case 2:
										$("#contentImg2").attr("src", e.target.result);
										break;
									case 3:
										$("#contentImg3").attr("src", e.target.result);
										break;
									case 4:
										$("#contentImg4").attr("src", e.target.result);
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
	</div>
</body>

</html>