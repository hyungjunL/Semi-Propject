<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> <!-- 1:1 문의 제출 실패시 뜨는 창 -->
<title>Insert title here</title> 
</head>
<body>
	<div style="text-align: center;">
		<h1>접수에 실패하였습니다. 내용을 다시 확인해주세요</h1>

		<button onclick="exit();">창 닫기</button>
	</div>

	<script>
		function exit(){
			window.close();
		}
	</script>
</body>
</html>