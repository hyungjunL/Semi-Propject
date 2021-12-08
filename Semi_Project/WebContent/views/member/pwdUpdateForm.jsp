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
			  <h1 class="h3 mb-3 fw-normal">비밀번호 재설정</h1>
			  <div class="form-check-inline">
			  </div>
			  <br><br>
			  <form id="findID" action="changePwd.me" method="post">
			  <div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword1" name="pass" placeholder="비밀번호" required>
				<input type="password" class="form-control" id="floatingPassword2" placeholder="비밀번호 확인" required> 
			  </div>
			  <br>
			  <button class="btn btn-lg btn-primary" type="submit" style="width: 45%;" onclick="return check();">변경</button>
			  <button class="btn btn-lg btn-secondary" type="button" onclick="back();" style="width: 45%;">뒤로가기</button>
			</form>
		  </main>
	</div>
	<script>

		function check() {

			var floatingPassword1 = document.getElementById('floatingPassword1').value;
			var floatingPassword2 = document.getElementById('floatingPassword2').value;

			var regExp = /^[a-z\d!@#$%^]{8,20}$/i;
			if(!regExp.test(floatingPassword1)) {
				alert('비밀번호는 8~20자리의 영문자/숫자/특수문자(!@#$%^) 로 이루어져야 합니다.');
				document.getElementById('floatingPassword1').value = '';
				document.getElementById('floatingPassword2').value = '';
				document.getElementById('floatingPassword1').focus();

				return false;
			}

			if(floatingPassword1 != floatingPassword2) {
				alert('비밀번호가 일치하지 않습니다.');
				document.getElementById('floatingPassword1').value = '';
				document.getElementById('floatingPassword2').value = '';
				document.getElementById('floatingPassword1').focus();

				return false;
			}
			return true;
		}
		function back() {
			history.back();
		}
	</script>
	<%@include file = "../common/footer.jsp" %>
</div>
</body>
</html>