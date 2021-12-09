<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.f_board.model.vo.*, java.util.ArrayList"%>
<%
Board b = (Board) request.getAttribute("b");

int m = (int) request.getAttribute("m");

Attachment at = (Attachment) request.getAttribute("at");

ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");

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
	position: relative
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
	text-indent: 10px
}

.table-side tr:hover {
	color: green;
}

.next-content1 {
	height: 50px;
	width: 80%;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	color: gray;
}

.next-content:hover {
	background: lightgray;
	cursor: pointer;
}

.next-content2 {
	height: 50px;
	width: 10%;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	color: gray;
}
</style>

</head>

<body>

	<%@ include file="../common/header1.jsp"%>


	<div class="wrap">

		<div id="board-body">
			<div id="board-side">
				<div id="board-title" onclick="location.href=''"
					style="cursor: pointer;">
					<span>자유게시판</span><br>COMUUNITY
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
					<h2 class="h2">자유게시판</h2>
				</div>
				<hr class="hr1">
				<div id="board-center-body">

					<table style="width: 100%;">

						<thead style="border-bottom: 1px solid lightgray;">
							<tr>
								<td style="width: 52%; padding-bottom: 15px;">제목 <span
									style="font-weight: bold; font-size: large;"><%=b.getF_TITLE()%></span></td>
								<td style="width: 18%; padding-bottom: 15px;">작성자 <span
									style="font-weight: bold; font-size: small;"></span><%=b.getMEMBER_ID()%></td>
								<td style="width: 12%; padding-bottom: 15px;">조회수 <span
									style="font-weight: bold; font-size: small;"></span><%=b.getT_COUNT()%></td>
								<td style="width: 20%; padding-bottom: 15px;">작성일 <span
									style="font-weight: bold; font-size: small;"></span><%=b.getCREATE_DATE()%></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="height: 500px;" colspan="4"><%=b.getCONTENT()%></td>

							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4">
									<div>
										<% for(int i = 0; i < list.size(); i++) { %>
										<img
											src="/javajo/<%=list.get(i).getFilePath() + list.get(i).getChangeName() %>"
											style="margin: 10px" width="400" height="300">
										<%} %>
									</div>
								</td>
							</tr>
						</tfoot>

					</table>


					<br>
					<table style="width: 100%;">
						<%
						if (b.getF_NO() < m) {
						%>
						<tr class="next-content">
							<td class="next-content1" id="nextBoard">다음 게시물</td>
							<td class="next-content2"></td>
						</tr>
						<%
						}
						%>
						<%
						if (b.getF_NO() != 1) {
						%>
						<tr class="next-content">
							<td class="next-content1" id="prevBoard">이전 게시물</td>
							<td class="next-content2">2021-11-01</td>
						</tr>
						<%
						}
						%>
					</table>

					<script>
						$(function() {
							$("#nextBoard")
									.click(
											function() {
												function getParameterByName(
														name) {
													name = name.replace(/[\[]/,
															"\\[").replace(
															/[\]]/, "\\]");
													var regex = new RegExp(
															"[\\?&]"
																	+ name
																	+ "=([^&#]*)"), results = regex
															.exec(location.search);
													return results == null ? ""
															: decodeURIComponent(results[1]
																	.replace(
																			/\+/g,
																			" "));
												}

												var bno = getParameterByName('bno');
												var bno2 = 1;
												var bno3 = +bno + bno2

												location.href = "/javajo/detail.fb?bno="
														+ bno3;
											});
						});
					</script>
					<script>
						$(function() {
							$("#prevBoard")
									.click(
											function() {
												function getParameterByName(
														name) {
													name = name.replace(/[\[]/,
															"\\[").replace(
															/[\]]/, "\\]");
													var regex = new RegExp(
															"[\\?&]"
																	+ name
																	+ "=([^&#]*)"), results = regex
															.exec(location.search);
													return results == null ? ""
															: decodeURIComponent(results[1]
																	.replace(
																			/\+/g,
																			" "));
												}

												var bno = getParameterByName('bno');
												var bno2 = -1;
												var bno3 = +bno + bno2

												location.href = "/javajo/detail.fb?bno="
														+ bno3;
											});
						});
					</script>
					<br>
					<!-- 댓글 영역-->
					<div id="reply-area">
						<table border="1" width=100%>
						<thead>
							<tr>
								<td width="3%">1.</td>
								<td width="10%">작성자</td>
								<td align="right">2021-11-29</td>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
						</table>
					</div>
					<br>

					<div class="reply">
						<div class="card-header">
							<i class="fa fa-comment fa"></i> REPLY
						</div>

						<div class="card-body">
							<ul class="list-group list-group-flush" align="right">
								<li class="list-group-item"><textarea class="form-control"
										id="exampleFormControlTextarea1 replyContent" rows="3"
										style="resize: none;">
									</textarea>
									<button type="button" class="btn btn-dark mt-3 btn-sm"
										onclick="insertReply();">등록</button></li>
							</ul>
						</div>
					</div>
					<!-- 댓글 -->

					<script>
        
        	function insertReply() {
        		
        		$.ajax({
        			url : "rinsert.fb",
        			data : {
        				content : $("#replyContent").val(), // text() 가 아닌 val() 로 가져와야 함
        				bno : <%= b.getF_NO() %>
        			},
        			type : "post",
        			success : function(result) {
        				
        				// result 값에 따라서 성공했으면 성공메시지 띄우기 alert()
        				if(result > 0) { 
        					
           					alert("댓글 작성에 성공했습니다.");
           					
           					selectReplyList(); 
							
           					$("#replyContent").val(""); // textarea 초기화
            			}
        				
        			},
        			error : function() {
        				console.log("댓글 삽입용 ajax 실패");
        			}
        		});
        		
        	}function selectReplyList() {

        		$.ajax({
        			url : "rlist.fb", 
        			data : { bno : <%= b.getF_NO() %> }, 
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
        		
        	}
        	
        	// 댓글은 화면이 로딩되었을 때 곧바로 뿌려줘야 함 => window.onload => $(function)
        	$(function() {
        		
        		selectReplyList(); 
        		
        	});
        	</script>
					
					
					<br> <br>
					<!-- 로그인 시-->
					<div align="center">
						<button type="button" class="btn btn-dark btn-sm" onclick="location.href='/javajo/updateForm.fb?bno=<%= b.getF_NO() %>'">게시글 수정</button>
						
						<button class="btn btn-dark btn-sm" onclick="test()">게시글 삭제</button>
  
						<script>
						    function test() {
						        if (confirm("정말 게시글을 삭제하시겠습니까?")) {
						        	alert("삭제되었습니다");
						        	location.href="/javajo/delete.fb?bno=<%= b.getF_NO() %>";
						        }
						    }
						</script>
				</div>
			</div>
		</div>

	</div>

	</div>

	</div>

</body>

</html>