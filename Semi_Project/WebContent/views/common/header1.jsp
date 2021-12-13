<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>    
<%
	String contextPath = request.getContextPath();
%>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	String alertMsg = (String)session.getAttribute("alertMsg");
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
    #wrap {
        width: 1000px;
        height: 1000px;
        margin: auto;
    }
    #miniMenu { height:3%; position: relative;} 
    #miniMenu>button { float: right; }
    #miniMenu>label { float: right; margin-right:10px;}
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

    #menu-toggle, #menu-toggle span {
        display: inline-block;
        transition: all 0.4s;
        box-sizing: border-box;
    }

    #menu-toggle {
        position: relative;
        width: 40px;
        height: 30px;
        background-color: springgreen;
        cursor: pointer;
    }

    #menu-toggle span {
        position: absolute;
        left: 0;
        width: 100%;
        height: 3px;
        background-color: rgb(67, 155, 68);
        border-radius: 4px;
    }

    #menu-toggle span:nth-child(1) {
        top:0;
    }

    #menu-toggle span:nth-child(2) {
        top:13px;
    }

    #menu-toggle span:nth-child(3) {
        bottom: 0;
    }

    #menu-toggle.active span:nth-child(1) {
        transform:translateY(13.6px) rotate(-45deg);
    }
    #menu-toggle.active span:nth-child(2) {
        opacity: 0;
    }
    #menu-toggle.active span:nth-child(3) {
        transform:translateY(-13.6px) rotate(45deg);
    }
    .menu-list{
        list-style: none;
        display: block;
    }
    .menu-list li a {
        text-decoration: none;
        color: black;
    }
    .menu-list li a:hover {
        background-color: rgb(67, 155, 68);
    }
    #MenuContainer {
        border: 1px solid black;
        width: 100%;
        height: 50%;
        position: absolute;
        top: 0;
    }
   .mainMenu {
    position: absolute;
    width: 70%;
    height: 50%;
    z-index: 100;
    top: -100%;
    overflow-y: auto;
    overflow-x: auto;
   }
   .board{
   		textdecoration : none;
   		color : white;
   }
   
   #tList {
  		display: none;
  	}
</style>

	<script>
	
		var msg = "<%= alertMsg %>";
		
		if(msg != "null") { 
			alert(msg);
	
			<% session.removeAttribute("alertMsg"); %>
		}
	
	</script>
</head>
<body>
	<div id="menu-toggle" class="open">
        <span></span>
        <span></span>
        <span></span>
    </div><br>
    <div class="list-group mainMenu">
    	<a class="list-group-item list-group-item-action tradeList">거래 게시판</a>
       <div class="list-group" id="tList">
       		 <a href="<%= contextPath %>/list.it?currentPage=1&category=1" class="list-group-item list-group-item-action">국내도서</a>
       		 <a href="<%= contextPath %>/list.it?currentPage=1&category=2" class="list-group-item list-group-item-action">해외도서</a>
       		 <a href="<%= contextPath %>/list.it?currentPage=1&category=3" class="list-group-item list-group-item-action">초/중/고 참고서</a>
       		 <a href="<%= contextPath %>/list.it?currentPage=1&category=4" class="list-group-item list-group-item-action">대학교재</a>
       		 <a href="<%= contextPath %>/list.it?currentPage=1&category=5" class="list-group-item list-group-item-action">수험서/자격증</a>     
       </div>
        <a href="<%= contextPath %>/list.fb?currentPage=1" class="list-group-item list-group-item-action">자유 게시판</a>
        <a href="<%=contextPath%>/" class="list-group-item list-group-item-action">1:1 문의</a>
    </div>

        <div id="miniMenu">
            
	        <% if(loginMember == null) { %>
	       
	            <button class="btn btn-success btn-sm" onclick="enrollForm()">회원가입</button>
	            <button class="btn btn-success btn-sm" onclick="login();">로그인</button>
	            <button class="btn btn-success btn-sm" onclick = "location.href ='<%= contextPath %>/center.se'">고객센터</button>
	        <% } else if(loginMember != null && loginMember.getMemberNo() == 1){ %>
	       		<button class="btn btn-success btn-sm"><a class="board" href="/javajo/list.ad?currentPage=1">관리자</a></button>
	        	<button class="btn btn-success btn-sm" onclick = "location.href ='<%= contextPath %>/center.se'">고객센터</button>
	        	<button type="button" class="btn btn-success btn-sm" ><a class="board"  href="/javajo/list.fb?currentPage=1">게시판</a></button>
	            <button onclick="location.href='<%= contextPath%>/myPage.me'"class="btn btn-success btn-sm">마이페이지</button>
	            
	            <button class="btn btn-success btn-sm" onclick="logout();">로그아웃</button>
	        <% } else {%>
	        	<button class="btn btn-success btn-sm" onclick = "location.href ='<%= contextPath %>/center.se'">고객센터</button>
	            <button onclick="location.href='<%= contextPath%>/myPage.me'"class="btn btn-success btn-sm">마이페이지</button>
	            
	            <button type="button" class="btn btn-success btn-sm" ><a class="board" href="/javajo/list.fb?currentPage=1">게시판</a></button>
	            <button class="btn btn-success btn-sm" onclick="logout();">로그아웃</button>
	        <%} %>
        
        </div>
        <div id="header">
            <div id="img"><a href="<%= contextPath %>"><img src="resources\mainImage.png" style="width:100%; height: 100%;"></a></div>
            <div id="search">
                <form id="search_form" action="search.bo?currentPage=1" method="post">
                    <div id="search_text">
                        <input type="text" name="keyword" placeholder="내용을 입력해주세요">
                    </div>
                    <div id="search_btn">
                        <input type="submit" value="검색">
                    </div>
                </form>
            </div>
        </div>

        <div id="nav">
            <ul id="cat">
                <li id="cat1"><a href="/javajo/list.it?currentPage=1&category=1">국내도서</a></li>
                <li id="cat2"><a href="/javajo/list.it?currentPage=1&category=2">해외도서</a></li>
                <li id="cat3"><a href="/javajo/list.it?currentPage=1&category=3">초/중/고 참고서</a></li>
                <li id="cat4"><a href="/javajo/list.it?currentPage=1&category=4">대학교재</a></li>
                <li id="cat5"><a href="/javajo/list.it?currentPage=1&category=5">수험서/자격증</a></li>
            </ul>
        </div>  
</body>

	<script>
	
	$('.tradeList').click(function() {
		
		var $a = $(this).next();
		
		if($a.css('display') == 'none') {
			$a.slideDown(500);
		}
		else {
			$a.slideUp(500);
		}
	});
	

        function slideDown() {
            var openState = $(".mainMenu").hasClass("open");
            $(".mainMenu").animate({top : openState ? "5%" : "-100%"}, 500);
        }

        $("#menu-toggle").click(function() {
            $(".mainMenu").toggleClass("open");
            slideDown();
        })
        document.getElementById('menu-toggle').addEventListener('click', function() {
            window.event.currentTarget.classList.toggle('active');
        });
        
	    function login() {
	    	
	        window.open("views/member/minilogin.jsp", "로그인", "width=700, height=400, status=0, toolbar=0, menubar='no'");
	    }
	    
	    function logout() {
	    	location.href = "<%= contextPath %>/logout.me";
	    }
	    
	    function enrollForm() {
	    	location.href = "<%= contextPath %>/enrollForm.me";
	    }
	    
	    function myPage() {
	    	location.href = "<%= contextPath %>/myPage.me";
	    }
	</script>
</html>