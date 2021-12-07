<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%@ page import="com.kh.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath(); // /jsp

	Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인 전 : menubar.jsp 가 로딩될때 null
	// 로그인 후 : menubar.jsp 가 로딩될때 로그인한 회원의 정보가 담겨있음
	
	// 성공 / 경고 메시지 뽑기
	String alertMsg = (String)session.getAttribute("alertMsg");
	// 서비스 요청 전 : alertMsg = null
	// 서비스 요청 후 성공 시 : alertMsg = 메시지 문구
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고정헤더</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
<style>


    div, form{
        /*border: 1px solid black;*/
        box-sizing: border-box;
    }
    #miniMenu { height:3%;} 
    #miniMenu>button {
        float: right;
        border-radius: 5px;
    }
    #header {height: 15%;}
    #header>div {
        float: left;
    }
    #search {width: 80%; height: 100%; position: relative;}
    #search_form {
        width: 80%;
        height: 20%;
        margin: auto;
        position: absolute;
        right: 0px;
        left: 0px;
        top: 0px;
        bottom: 0px;
    }
    #search_form>div{
        height: 100%;
        float: left;
    }
    #search_form input {
        box-sizing: border-box;
        width: 100%;
        height: 100%;
    }
    #search_text { width: 90%; }
    #search_btn { width: 10%; }

    #img {width: 20%; height: 100%;}
    #nav { height: 5%;}
    #cat {
        list-style-type: none;
        margin: 0px;
        padding: 0px;
        height: 100%;
        margin-bottom: 0px;
    }
    #cat>li {
        float: left;
        width: 20%;
        height: 100%;
        text-align: center;
    }
    #cat a {
        text-decoration: none;
        color: black;
        font-size: 13px;
        font-weight: 900;
        width: 100%;
        height: 100%;
        display: block;
        line-height: 35px;
    }
    #cat li:hover {
        background-color: rgb(67, 155, 68);
    }
    #cat a:hover {
        color: white;
    }
   
</style>



</head>
<body>

  
        <div id="miniMenu">
            <button>회원가입</button>
            <button>로그인</button>
            <button>마이페이지</button>
            <button type="button" onclick="enrollPage();">상품등록</button>
        </div>
        <script>
	        	function enrollPage() {
	        	
	        		location.href = "<%= contextPath %>/enrollForm.it";
	        		
	        	}
	        </script>
        <div id="header">
            <div id="img"><a href="http://localhost:8888/javajo/"><img src="resources\mainImage.png" style="width:100%; height: 100%;"></a></div>
            <div id="search">
                <form id="search_form" action="search.do" method="post">
                    <div id="search_text">
                        <input type="text" placeholder="내용을 입력해주세요">
                    </div>
                    <div id="search_btn">
                        <input type="submit" value="검색">
                    </div>
                </form>
            </div>
        </div>

        <div id="nav">
            <ul id="cat">
                <li><a href="">국내도서</a></li>
                <li><a href="">해외도서</a></li>
                <li><a href="">초/중/고 참고서</a></li>
                <li><a href="">대학교재</a></li>
                <li><a href="">수험서/자격증</a></li>
            </ul>
        </div>
       
            <hr>
   
    
        
</body>
</html>