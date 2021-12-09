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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                  <input type="checkbox" id="idSave"> 아이디 기억하기
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
		
		$(document).ready(function() {
			
			var key = getCookie("key");
			$("#floatingInput").val(key);
			
			if($("#floatingInput").val() != "") {
				$("#idSave").attr("checked", true);
			}
			
			$("#idSave").change(function() {
				if($("#idSave").is(":checked")) {
					setCookie("key", $("#floatingInput").val(), 7);
				}
				else {
					deleteCookie("key");
				}
			});
			
			$("#floatingInput").keyup(function() {
				if($("#idSave").is(":checked")) {
					setCookie("key", $("#floatingInput").val(), 7);
				}
			});
			
		});
		
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
	</script>
</html>