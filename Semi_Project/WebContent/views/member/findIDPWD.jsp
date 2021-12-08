<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
<style>
	#wrap {
	 	width:1000px;
	 	height:1500px;
	 	margin:auto;
	 }
	 html,
	body {
	  height: 100%;
	}
	
	body {
	  align-items: center;
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: #f5f5f5;
	}
	
	.form-signin {
	  width: 100%;
	  max-width: 330px;
	  padding: 15px;
	  margin: auto;
	}
	
	.form-signin .checkbox {
	  font-weight: 400;
	}
	
	.form-signin .form-floating:focus-within {
	  z-index: 2;
	}
	
	.form-signin input[type="email"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	
	.form-signin input[type="password"] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
</style>
</head>
<body>
<div id="wrap">
	<%@include file = "../common/header1.jsp" %>
	<div class="text-center">
		<main class="form-signin">
			  <h1 class="h3 mb-3 fw-normal">아이디/비밀번호 찾기</h1>
			  <div class="form-check-inline">
				<label class="form-check-label">
				  <input type="radio" class="form-check-input" name="findIDPWD" value="1" checked>아이디 찾기
				  <input type="radio" class="form-check-input" name="findIDPWD" value="2">비밀번호 찾기
				</label>
			  </div>
			  <br><br>
			  <form id="findID" action="findId.me" method="post">
			  <div class="form-floating">
				<input type="text" class="form-control" id="floatingPassword" name="email1" placeholder="이메일">
			  </div>
			  <br>
			  <button class="btn btn-lg btn-primary" type="submit" style="width: 45%;">찾기</button>
			  <button class="btn btn-lg btn-secondary" type="reset" style="width: 45%;">뒤로가기</button>
			</form>

			<form id="findPwd" action="findPwd.me" method="post" style="display: none;">
				<div class="form-floating">
				  <input type="text" class="form-control" id="floatingInput" name="memberId" placeholder="아이디">
				  <input type="text" class="form-control" id="floatingPassword" name="email2" placeholder="이메일">
				</div>
				<br>
				<button class="btn btn-lg btn-primary" type="submit" style="width: 45%;">찾기</button>
				<button class="btn btn-lg btn-secondary" type="reset" style="width: 45%;">뒤로가기</button>
			</form>
		  </main>
	</div>

	<script>
		$("input:radio[name=findIDPWD]").click(function() {
			if($("input[name=findIDPWD]:checked").val() == "1") {
				$("#findID").css('display', '');
				$("#findPwd").css('display', 'none');
			}
			else {
				$("#findID").css('display', 'none');
				$("#findPwd").css('display', '');
			}
		});

	</script>
	<%@include file = "../common/footer.jsp" %>

</div>

</body>
</html>