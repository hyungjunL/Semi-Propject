<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.tboard.model.vo.TBoard, com.kh.common.model.vo.PageInfo"  %>
<%
	//ArrayList<TBoard> list = (ArrayList<TBoard>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<TBoard> pageList = (ArrayList<TBoard>)request.getAttribute("pageList");
	//페이징바 만들때 필요한 변수 미리 셋팅
	int category = (int)request.getAttribute("category");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
    #wrap {
        width: 1000px;
        height: 1000px;
        margin: auto;
    }
    div, form{
        /*border: 1px solid black;*/
        box-sizing: border-box;
    }
   

    
    .contentwrap {
        height: 27.5%;
        margin-bottom: 3%;
    }
        

        
    .content {

        margin-top: 1%;
        width : 30%;
        height : 100%;
        text-align: center;
        float:left;
        margin-left:2%
        
        

        }


    .btn-like {
      color : transparent;
      font-size: 30px;
      border:0;
      outline: 0;
      background-color: transparent;
      text-shadow: 0 0 2px rgba(255,255,255,.7), 0 0 0 #000;

    }

    .btn-like:hover {
    text-shadow: 0 0 0 red;
    }
    
    .btn-like.done {
      color:red;
      font-size: 30px;
      border:0;
      outline: 0;
      text-shadow: 0;
      background-color: transparent;
     
    }
    
    
    
    .btn-chat  {
      color: gray;
      font-size: 25px;
      border:0;
      outline: 0;
      background-color:transparent;
    }
    .btn-chat:hover {
      text-shadow: 0 0 0 black;
      background-color:transparent;
      border:0;
      outline: 0;
    }
   
    .btn-page{

      outline:0;
      color : black;
      
    }
    .thumbnamil{
     	textdecoration : none;
     	color : black;}

   
    

</style>


</head>
<body>

<div id="wrap">

    <%@include file = "../common/header1.jsp" %>

    <div class="contentwrap">
        

            <% if(pageList != null) { %>
			
				<% for(TBoard b : pageList) { %>
				
                    <div class= "content"> 
                    <a class="thumbnamil" align = "center">
                    <input type="hidden" value="<%= b.gettNo() %>">
                        <img src="<%= contextPath %>/<%= b.getTitleImg() %>"  width = "140px" height="140px"> 
                            <br><br>
                            <p><strong><%= b.gettTitle() %></strong></p>
                            
                                	가격: <%= b.gettPrice() %>
                        </a>
                            
                                
                                </div>

                          
				
				<% }%>   
            <% } else { %>
            	등록된 게시글이 없습니다.
            <% } %>
              
    </div>
    <script>
        	$(function(){
        		$(".thumbnamil").click(function(){
        			
        			// 클릭될때마다 url 요청 => location.href
        			// /jsp/detail.th?bno=X
        					
        			// X 먼저 구하기
        			var bno = $(this).children().eq(0).val();
        					
        			location.href = "<%= contextPath %>/detail.it?bno=" + bno;
        		});
        	});
        </script>
    <div class="contentwrap"></div>

   
        
     <!-- 페이징바 -->
     <div align="center" class="paging-area">
        
        <!-- 페이징바에서 < 를 담당 : 이전페이지로 이동 -->
        <% if(currentPage != 1) { %>
            <button class = "btn-page" onclick="location.href='<%= contextPath %>/list.it?currentPage=<%= currentPage - 1 %>&category=<%= category %>'">&lt;</button>
        <% } %>
    
        <!-- 페이징바에서 숫자를 담당 -->
        <% for(int i = startPage; i <= endPage; i++) { %>
            <!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
            <% if(i != currentPage) { %>
                <button  class = "btn-page" onclick="location.href='<%= contextPath %>/list.it?currentPage=<%= i %>&category=<%= category %>'"><%= i %></button>
            <% } else { %>
                <!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 막고싶다. -->
                <button class = "btn-page" disabled><%= i %></button>
            <% } %>
        <% } %>
        
        <!-- 페이징바에서 > 를 담당 : 다음페이지로 이동 -->
        <% if(currentPage != maxPage) { %>
            <button class = "btn-page" onclick="location.href='<%= contextPath %>/list.it?currentPage=<%= currentPage + 1 %>&category=<%= category %>'">&gt;</button>
        <% } %>
        
    </div>

        <%@include file = "../common/footer.jsp" %>

    </div>




</body>
</html>

