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
    .board{
    	text-decoration : none;
    	color : white;
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

  
        <div id="miniMenu">
            
	        <% if(loginMember == null) { %>
	            <button class="btn btn-success btn-sm">고객센터</button>
	            <button class="btn btn-success btn-sm" onclick="enrollForm()">회원가입</button>
	            <button class="btn btn-success btn-sm" onclick="login();">로그인</button>
	        <% } else if(loginMember != null && loginMember.getMemberNo() == 1){ %>
	       		<button class="btn btn-success btn-sm"><a class="board" href="/javajo/list.ad?currentPage=1">관리자</a></button>
	        	<button class="btn btn-success btn-sm">고객센터</button>
	        	<button type="button" class="btn btn-success btn-sm" ><a class="board"  href="/javajo/list.fb?currentPage=1">게시판</a></button>
	            <button onclick="location.href='<%= contextPath%>/myPage.me'"class="btn btn-success btn-sm">마이페이지</button>
	            <button type="button" class="btn btn-success btn-sm" onclick="enrollPage();">상품등록</button>
	            <button class="btn btn-success btn-sm" onclick="logout();">로그아웃</button>
	        <% } else {%>
	        	<button class="btn btn-success btn-sm">고객센터</button>
	            <button onclick="location.href='<%= contextPath%>/myPage.me'"class="btn btn-success btn-sm">마이페이지</button>
	            <button type="button" class="btn btn-success btn-sm" onclick="enrollPage();">상품등록</button>
	            <button type="button" class="btn btn-success btn-sm" ><a class="board" href="/javajo/list.fb?currentPage=1">게시판</a></button>
	            <button class="btn btn-success btn-sm" onclick="logout();">로그아웃</button>
	        <%} %>
        
        </div>
        <script>
	        	function enrollPage() {
	        	
	        		location.href = "<%= contextPath %>/enrollForm.it";
	        		
	        	}
	        </script>
        <div id="header">
            <div id="img"><a href="http://localhost:8888/javajo/"><img src="resources\mainImage.png" style="width:100%; height: 100%;"></a></div>
            <div id="search">
                <form id="search_form" action="<%= contextPath %>/search.no" method="get">
                	<input type = "hidden" name = "currentPage" value = "1">
                    <div id="search_text">
                        <input type="text" name="keyword" placeholder="검색어를 입력하세요.">
                    </div>
                    <div id="search_btn">
                        <input type="submit" value="검색">
                    </div>
                </form>
            </div>
        </div>

        <div id="nav">
            <ul id="cat">
                <li><a href="/javajo/list.it?currentPage=1&category=1">국내도서</a></li>
                <li><a href="/javajo/list.it?currentPage=1&category=2">해외도서</a></li>
                <li><a href="/javajo/list.it?currentPage=1&category=3">초/중/고 참고서</a></li>
                <li><a href="/javajo/list.it?currentPage=1&category=4">대학교재</a></li>
                <li><a href="/javajo/list.it?currentPage=1&category=5">수험서/자격증</a></li>
            </ul>
        </div>
       
            <hr>
   
    
       <script>

        function slideDown() {
            var openState = $(".mainMenu").hasClass("open");
            $(".mainMenu").animate({top : openState ? "5%" : "-100%"}, 400);
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
	</script> 
</body>
</html>