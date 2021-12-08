<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>    
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
<style>
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
	#find_idpwd {
        padding: 3px;
        float: left;
        width: 100%;
      }
      #find_idpwd>a {
        padding: 10px;
        text-decoration: none;
      }
      #find_idpwd>a:hover { cursor : pointer; }
      hr {
        margin: 5px;
      }
      

</style>
</head>
<body>
	<div class="text-center">
        <main class="form-signin">
            <form action="<%= request.getContextPath() %>/login.me" method="post">
              <h1 class="h3 mb-3 fw-normal">로그인</h1>
          
              <div class="form-floating">
                <input type="text" class="form-control" id="floatingInput" name="memberId" placeholder="아이디">
              </div>
              <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" name="memberPwd" placeholder="패스워드">
              </div>
          
              <div class="checkbox mb-3">
                <label>
                  <input type="checkbox" value="remember-me"> 아이디 기억하기
                </label>
                <hr>
                <div id="find_idpwd">
                  <a onclick="findIdPwd();">아이디/비밀번호 찾기</a>
                </div>
              </div>
              <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
              <br>
              <button class="w-100 btn btn-lg btn-secondary" type="button" onclick="enrollForm();">회원가입</button>
            </form>
          </main>
    </div>
</body>
	<script>
		function enrollForm() {
			window.opener.parent.location="<%= request.getContextPath() %>/enrollForm.me";
			window.close();
	    }
		function findIdPwd() {
			window.opener.parent.location="<%= request.getContextPath() %>/findIDPWD.me";
			window.close();
		}
	</script>
</html>