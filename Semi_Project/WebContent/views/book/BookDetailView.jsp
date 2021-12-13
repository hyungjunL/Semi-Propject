<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.book.model.vo.*" %>
    
<% 
Book b = (Book)request.getAttribute("b");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서상세페이지</title>

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
   

    
    


   /*  .btn-heart {
      color : transparent;
      font-size: 30px;
      border:0;
      outline: 0;
      background-color: transparent;
      text-shadow: 0 0 2px rgba(255,255,255,.7), 0 0 0 #000;

    } */

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

   
    

</style>



</head>
<body>


<div id="wrap">

    <%@include file = "../common/header1.jsp" %>

    <div class="contentwrap">
    
    
    
    
                         <% if(loginUser != null) { %>
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
                    
                    
                    <% if(loginUser != null) { %>
	                    <!-- 로그인이 되어있을 경우 : 채팅 가능 -->
                        
                   <button onclick = "" class="btn-chat" id = "chat" value = "<%=b.getMemNO() %>">✉</button>
       
                        
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
   
    <div class="contentwrap"></div>

   
        

        <%@include file = "../common/footer.jsp" %>
        
   <script>
   
   
 
   
   $(function(){
		$("#chat").click(function(){
			
			// 클릭될때마다 채팅 url 요청 => location.href
			// /javajo/chat.no?toNo=X
					
			// X 먼저 구하기
			var toNo = $(this).val();
					
			window.open("<%=contextPath %>/chat.no?toNo=" + toNo , "chat", "height = 550,width = 500");
		});
	});
   
   
   
  
   $(function() {
       selectHeartCount();})
       
       
       
    
   
   function updateHeart(){

   $.ajax({
       url : "heartupdate.bo",
       data : { bno : <%= b.getBookNo() %> }, 
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
            data : { bno : <%= b.getBookNo() %> }, 
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
        
        

    </div>



</body>
</html>