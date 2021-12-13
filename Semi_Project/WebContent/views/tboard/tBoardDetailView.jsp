<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.kh.tboard.model.vo.*" %>
<%
	TBoard b = (TBoard)request.getAttribute("b");
	int bno = b.gettNo();
	int category = b.getCategoryNo();
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
     .btn-heart:hover {
    text-shadow: 0 0 0 red;
    }
    
    .btn-heart{
      color:red;
      font-size: 30px;
      border:0;
      outline: 0;
      text-shadow: 0;
      background-color: transparent;
     
    }
    
    .heart_count{
    
    font-size: 15px;
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
    
    
	#slideshow {
		margin: 80px auto;
		position: relative;
		width: 200px;
		height: 300px;
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
	table{
		font-size: large;
	}
	#review{
		textdecoration : none;
		color : black;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>

	<div id="wrap">
		<%@include file = "../common/header1.jsp" %>
		
		<div class="outer">
		<input type="hidden" name="bno" value="<%= b.gettNo() %>" >
		<input type="hidden" name="category" value="<%= b.getCategoryNo() %>" >
	    <h1 align="center">상점<%= b.getMemberNo()  %>호  </h1>
	    
       
	    <table align="center">
	
	
	            
	        <tr>
	        
	            <td align="left" width="400">
					<div id="slideshow">
						<div>
						  <img src="<%= contextPath %>/<%= list.get(1).getFilePath() + list.get(1).getChangeName() %>" alt="none" width="100%" height="100%">
						</div>
						<div>
						  <img src="<%= contextPath %>/<%= list.get(2).getFilePath() + list.get(2).getChangeName() %>" alt="none" width="100%" height="100%">
						</div>
						<div>
						<img src="<%= contextPath %>/<%= list.get(0).getFilePath() + list.get(0).getChangeName() %>" alt="none" width="100%" height="100%">
					 	</div>
					 </div>
	                
					
	            </td>
	            	
	                <td  width="300" height="300" rowspan="2" >
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
	
                       
	                    <div id="count">
	                        <strong>거래 가능 <%= b.getStatus() %></strong>
	                        
	                    </div>
	                    <br>
	                   	<div class="contentwrap">
    
    
    
    
                         <% if(loginMember != null) { %>
	                    <!-- 로그인이 되어있을 경우 : 찜 가능 -->
                        
                          <button onclick="updateHeart();" class="btn-heart" id ="heart_update">♥<span class="heart_count"> </span></button>
                        
                        <% } else { %>
                    	<!-- 로그인이 안되어있을 경우 : 불가능 -->
                    	
                    	<button class="btn-heart" id ="">♥<span class="heart_count"> </span></button>
                           <script>
					          $(".btn-heart").click(function() {
					              alert("로그인 후 이용해주세요.");
					          })
					       </script>
	                    
                    <% } %>
                    
                    
                    <% if(loginMember != null) { %>
	                    <!-- 로그인이 되어있을 경우 : 채팅 가능 -->
                        
                   <button onclick = "" class="btn-chat" id = "chat" value = "<%= b.getMemberNo() %>">✉</button>
       
                        
                        <% } else { %>
                    	<!-- 로그인이 안되어있을 경우 : 채팅 불가 -->
                    	
                    	<button class="btn-chat">✉</button>
                    	 
                           <script>
					          $(".btn-chat").click(function() {
					              alert("로그인 후 이용해주세요.");
					          })
					       </script>
	                    
                    <% } %>
                    
                   
    
              
 
    </div>
	                    
	                    
	                </div>
	                                
	            </td>
	            
	        </tr>
	        
	        <tr>
	            
	            <td align="center"></td>
	            
	        </tr>
	        
	
	    </table>
	
	        <div align="center">
	        	<% if(loginMember != null &&(loginMember.getMemberNo() == Integer.parseInt(b.getMemberNo()))) { %>
		            <a href="<%= contextPath %>/modifyForm.it?bno=<%= b.gettNo() %>" class="btn btn-warning btn-sm">수정</a>
	            	<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal">삭제</button>
	            	<!-- The Modal -->
					  <div class="modal fade" id="myModal">
					    <div class="modal-dialog">
					      <div class="modal-content">
					      
					        <!-- Modal body -->
					        <div class="modal-body">
					         	삭제된 데이터는 복구 할 수 없습니다. 정말 삭제하시겠습니까??
					        </div>
					        
					        <!-- Modal footer -->
					        <div class="modal-footer">
					          <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">취소</button>
					          <button name="deleteBtn" id="deleteBtn" type="button" class="btn btn-danger btn-sm" data-dismiss="modal">삭제</button>
					        </div>
					        
					      </div>
					    </div>
					  </div>
					  
	            	
	
		        <% } else { %>	
		        	
		        <% } %>
	        
	        
	            
				
	        </div>
	
	    <hr>
		<br>
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
		<br>
		<hr>
		<br>
	    <div class="bottom" align="center">
	        <table border="1">
	            <tr>
	                <th height="200">이미지 : </th>
	                <td width="500" align="center">
	                	<br>
	                    <div>
						  <img src="<%= contextPath %>/<%= list.get(1).getFilePath() + list.get(1).getChangeName() %>" alt="none" width="70%" height="80%">
						</div>
						<br>
						<div>
						  <img src="<%= contextPath %>/<%= list.get(2).getFilePath() + list.get(2).getChangeName() %>" alt="none" width="70%" height="80%">
						</div>
						<br>
						<div>
						<img src="<%= contextPath %>/<%= list.get(0).getFilePath() + list.get(0).getChangeName() %>" alt="none" width="70%" height="80%">
					 	</div>
					 	<br>
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
       			
       			location.href = "<%= contextPath %>/delete.it?bno=<%= b.gettNo() %>&category=<%= b.getCategoryNo() %>";
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
		    
		    <script>
		   
   
 
   
   $(function(){
		$("#chat").click(function(){
			
			// 클릭될때마다 채팅 url 요청 => location.href
			// /javajo/chat.no?toNo=X
					
			// X 먼저 구하기
			var toNo = $(this).val();
			var bno = <%= b.gettNo() %>
					
			window.open("<%=contextPath %>/chat.no?toNo=" + toNo +"&bno="+ bno , "chat", "height = 550,width = 500");
		});
	});
   
   
   
  
   $(function() {
       selectHeartCount();})
       
       
       
    
   
   function updateHeart(){

   $.ajax({
       url : "heartupdate.bo",
       data : { bno : <%= b.gettNo() %> }, 
       success : function(heartCheck) {
					
    	     if(heartCheck > 0){
    	    	   
    	    	selectHeartCount();
    	    	   alert("찜 삭제");
    	     }
    	     
    	     else{
    	    	 
    	    	 selectHeartCount();
  	    	     alert("찜 목록 추가");
    	     }
			
		},
		error : function() {
			console.log("ajax 실패");
		}
   })
};
   
   			
 							
    function selectHeartCount() {
         
    
        $.ajax({
            url : "heartcount.bo", 
            data : { bno : <%= b.gettNo() %> }, 
            success : function(heartCount) {
            
                $(".heart_count").html(heartCount);
               // console.log("ajax 성공");
              
            },
            error : function() {
                //console.log("ajax 실패");
            }
        })
    };
    
  
  
   
 
</script>
</body>
</html>