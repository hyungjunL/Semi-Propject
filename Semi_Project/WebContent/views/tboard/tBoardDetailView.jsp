<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.kh.tboard.model.vo.*" %>
<%
	TBoard b = (TBoard)request.getAttribute("b");
	int bno = b.gettNo();
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
    
	#slideshow {
		margin: 80px auto;
		position: relative;
		width: 140px;
		height: 240px;
		padding: 10px;
		box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
	}

	#slideshow > div {
		position: absolute;
		top: 10px;
		left: 10px;
		right: 10px;
		bottom: 10px;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>

	<div id="wrap">
		<%@include file = "../common/header1.jsp" %>
		
		<div class="outer">
		<input type="hidden" name="bno" value="<%= b.gettNo() %>" >
	    <h1 align="center">XXX님의 서점 </h1>
	    <br>
        <br>
	    <table align="center">
	
	
	            
	        <tr>
	        
	            <td align="left" width="250">
					<div id="slideshow">
						<div>
						  <img src="<%= contextPath %>/<%= list.get(1).getFilePath() + list.get(1).getChangeName() %>" alt="none" width="100%" height="100%">
						</div>
						<div>
						  <img src="<%= contextPath %>/<%= list.get(2).getFilePath() + list.get(2).getChangeName() %>" alt="none" width="100%" height="100%">
						</div>
						<img src="<%= contextPath %>/<%= list.get(0).getFilePath() + list.get(0).getChangeName() %>" alt="none" width="100%" height="100%">
					 </div>
	                
					
	            </td>
	            	
	                <td width="200" height="300" rowspan="2">
	                <div id="info">
	                    <p>
	                        <strong>*제목: <%= b.gettTitle() %> </strong>
	                    </p>
	                    <p>
	                        <strong>*판매가: <%= b.gettPrice() %>원</strong>  
	                    </p>
	                    <p>
	                        <strong>*카테고리: <%= b.getCategoryName() %></strong> 
	                    </p>
	
	                    <p>
	                        <a href="">*리뷰: ★★★★★</a>
	                    </p>
                       
	                    <div id="count">
	                        <strong>거래 가능 <%= b.getStatus() %></strong>
	                        
	                    </div>
	                    <br>
	                    <div id="btn">
	                        
	                        <input type="button" value="쪽지 보내기" class="btn btn-primary btn-sm">
	                        <input type="button" id="zzim" value="찜" class="btn btn-danger btn-sm" >
	                        
	                    
	
	                    </div>
	                    
	                    
	                </div>
	                                
	            </td>
	            
	        </tr>
	        
	        <tr>
	            
	            <td align="center">● ● ● ● </td>
	            
	        </tr>
	        
	
	    </table>
	
	    <br>
	        <div align="center">
	            <a href="<%= contextPath %>/modifyForm.it?bno=<%= b.gettNo() %>" class="btn btn-warning btn-sm">수정</a>
	            <button name="deleteBtn" id="deleteBtn" class="btn btn-danger btn-sm">삭제</button>
	
	        </div>
	
	    <hr>
	
	    <div class="bottom" align="center" >
	        <table border="1">
	            <tr>
	                <th height="200">상세 설명 : </th>
	                <td width="500">
	                    <p>
	                        <%= b.getContent() %>
	                    </p>
	                </td>
	            </tr>
	        </table>
	    </div>
	
	    <div class="bottom" align="center">
	        <table border="1">
	            <tr>
	                <th height="200">거래 장소 : </th>
	                <td width="500">
	                    <img src="" alt="">
	                    지도
	                </td>
	            </tr>
	        </table>
	    </div>
	
		<%@include file = "../common/footer.jsp" %>
	    
		</div>
</div>

	<script>
       	$(function(){
       		$("#modifyBtn").click(function(){
       			
       					
       			location.href = "<%= contextPath %>/modify.it";
       		});
       	});
	</script>
	
	<script>
       	$(function(){
       		$("#deleteBtn").click(function(){
       			
       			var bno = $(this).children().eq(0).text();
       			location.href = "<%= contextPath %>/delete.it?bno=<%= b.gettNo() %>";
       		});
       	});
	</script>
	<script>
        $("#slideshow > div:gt(0)").hide();

setInterval(function() {
  $('#slideshow > div:first')
    .fadeOut(1000)
    .next()
    .fadeIn(1000)
    .end()
    .appendTo('#slideshow');
}, 2000);

    </script>
</body>
</html>