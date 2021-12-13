<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.f_board.model.vo.Board, com.kh.tboard.model.vo.TBoard, java.util.ArrayList, com.kh.member.model.vo.Member" %>
<% 
	ArrayList<Board> fList = (ArrayList<Board>)request.getAttribute("list");
	ArrayList<TBoard> tList = (ArrayList<TBoard>)request.getAttribute("pageList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<style>
	 #wrap {
	 	width:1000px;
	 	height:1500px;
	 	margin:auto;
	 }
	 #content1 {height: 22%;}
     #content2 {height: 20%;}
     #banner {height: 15%;}
     #content1 div{
         box-sizing: border-box;
     }
     #content1 {
         position: relative;
     }
     #content1 img {
         padding: 10%;
         width: 90%;
         height: 90%;
     }
     .contain {
         position:absolute;
         transition: all 0.4s;
         opacity: 0;
         z-index: 5;
     }
     #board {
         width: 100%;
         height: 100%;
     }

     #board a {
         text-decoration: none;
         color: black;
     }
     .fix{
     position: sticky;
      float: right;
      width:40px;
      height:90px;
      top:0; right:0;
     
     }
     
	  .chat {
	 
	 position: sticky;
	  float: left;
	  width: 40px;
	  height: 30px;
	}
	
	 .plus {
	  float: left;
	  width: 30px;
	  height: 30px;
	  position: absolute;
	  left: 0;
	  bottom: 0px;
	}
</style>
</head>
<body>
<div id="wrap">
 <!-- 상단에는 header1.jsp가 보이게 해줌 -->
<%@include file = "views/common/header1.jsp" %>

<div id="content1">
            <div class="contain" style="width: 100%; height: 100%; opacity: 1">
                <div class="koreabook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/koreabook1.PNG"></a></div>
                <div class="koreabook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/koreabook2.PNG"></a></div>
                <div class="koreabook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/koreabook3.PNG"></a></div>
                <div class="koreabook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/koreabook4.PNG"></a></div>
            </div>
            <div class="contain" style="width: 100%; height: 100%;">
                <div class="globalbook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/globalbook1.PNG"></a></div>
                <div class="globalbook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/globalbook2.PNG"></a></div>
                <div class="globalbook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/globalbook3.PNG"></a></div>
                <div class="globalbook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/globalbook4.PNG"></a></div>
            </div>
            <div class="contain" style="width: 100%; height: 100%;">
                <div class="chamgo" style="float: left; width: 25%; height: 100%;"><a><img src="resources/chamgo1.jpg"></a></div>
                <div class="chamgo" style="float: left; width: 25%; height: 100%;"><a><img src="resources/chamgo2.jpg"></a></div>
                <div class="chamgo" style="float: left; width: 25%; height: 100%;"><a><img src="resources/chamgo3.jpg"></a></div>
                <div class="chamgo" style="float: left; width: 25%; height: 100%;"><a><img src="resources/chamgo4.jpg"></a></div>
            </div>
            <div class="contain" style="width: 100%; height: 100%;">
                <div class="univer" style="float: left; width: 25%; height: 100%;"><a><img src="resources/univer1.jpg"></a></div>
                <div class="univer" style="float: left; width: 25%; height: 100%;"><a><img src="resources/univer2.jpg"></a></div>
                <div class="univer" style="float: left; width: 25%; height: 100%;"><a><img src="resources/univer3.jpg"></a></div>
                <div class="univer" style="float: left; width: 25%; height: 100%;"><a><img src="resources/univer4.jpg"></a></div>
            </div>
            <div class="contain" style="width: 100%; height: 100%;">
                <div class="testbook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/testbook1.jpg"></a></div>
                <div class="testbook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/testbook2.jpg"></a></div>
                <div class="testbook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/testbook3.jpg"></a></div>
                <div class="testbook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/testbook4.jpg"></a></div>
            </div>
        </div>
        
        <div class = "fix">
		  <div class="plus">
		    
		    <% if(loginMember != null) { %>
	                  <!-- 로그인이 되어있을 경우 : 판매등록 가능 -->
                        
                   <a href = "<%= contextPath %>/enrollForm.it"><img src="resources\plus.png"></a>
       
                        <% } else { %>
                    <!-- 로그인이 안되어있을 경우 : 판매등록 불가 -->
                    	
                    	 <a><img src="resources\plus.png"></a>
                    	 
                           <script>
					          $(".plus").click(function() {
					              alert("로그인 후 이용해주세요.");
					          })
					       </script>
	                    
                    <% } %>
		    
		  </div>
			
		 <div class="chat">
		    
		    
		    <% if(loginMember != null) { %>
	                  <!-- 로그인이 되어있을 경우 : 채팅함 가능 -->
                        
                   <a onclick = "message();"><img id = "message" src="resources\chat.png"></a>
       
                        <% } else { %>
                    <!-- 로그인이 안되어있을 경우 :  채팅함 불가 -->
                    	
                    	 <a><img src="resources\chat.png"></a>
                    	 
                           <script>
					          $(".chat").click(function() {
					              alert("로그인 후 이용해주세요.");
					          })
					       </script>
	                    
                    <% } %>
		    
		    
		    
		    
		    
		  </div>
		  </div>
        
     

        <div id="content2">
            <table id="board">
                <tr>
                    <td>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                  <th colspan="2" style="font-size: 20px;" width="85%">거래게시판</th>
                                  <th style="font-size: 10px;"><a href="<%= contextPath %>/listAll.it?currentPage=1">+전체보기</a></th>
                                </tr>
                              </thead>
                              <tbody id="indexTList">
                          
                              </tbody>
                        </table>
                    </td>
                    <td>
                        <table class="table table-striped" style="width=50%">
                            <thead>
                                <tr>
                                  <th colspan="2" style="font-size: 20px;" width="85%">자유게시판</th>
                                  <th style="font-size: 10px;"><a href="<%= contextPath %>/list.fb?currentPage=1">+전체보기</a></th>
                                </tr>
                              </thead>
                              <tbody id="indexFList">
                              
                              </tbody>
                        </table>
					</td>
				</tr>
            </table>
        </div>

        <br><br>
        <div id="banner">
            <img src="resources/banner.jfif" style="width: 100%; height: 100%;">
        </div>

<%@include file = "views/common/footer.jsp" %>

</div>
</body>
<script>

$(function() {
   $("#cat1").hover(function() {
        $(".contain:eq(0)").css('opacity', '1');
   });

   $("#cat2").hover(function() {
        $(".contain:eq(1)").css('opacity', '1');
   }, function() {
    $(".contain:eq(1)").css('opacity', '0');
   });

   $("#cat3").hover(function() {
        $(".contain:eq(2)").css('opacity', '1');
   }, function() {
    $(".contain:eq(2)").css('opacity', '0');
   });

   $("#cat4").hover(function() {
        $(".contain:eq(3)").css('opacity', '1');
   }, function() {
    $(".contain:eq(3)").css('opacity', '0');
   });

   $("#cat5").hover(function() {
        $(".contain:eq(4)").css('opacity', '1');
   }, function() {
    $(".contain:eq(4)").css('opacity', '0');
   });
   
   $.ajax({
	   url : "Fboard.if",
	   success : function(indexFList) {
		   
		   var fList = "";
		   if(indexFList.length == 0) {
			   fList += '<tr><td colspan="3"><b>게시글이 존재하지 않습니다.</b></td></tr>';
		   }
		   else {
			   for(var i = 0; i < indexFList.length; i++) {
				   
				  	fList += '<tr>';
				  	fList += 	'<td colspan="3">';
				 	fList += 		'<a href = "<%= contextPath %>/detail.fb?bno=' + indexFList[i].F_NO + '">';
				 	fList +=			indexFList[i].F_TITLE;
				 	fList += 		'</a>'
				 	fList += 	'</td>';
				 	fList += '</tr>';
			   }
		   }
		   
		   $("#indexFList").html(fList);

	   }
   });
   
})

  $.ajax({
	   url : "Tboard.it",
	   success : function(indexTList) {
		   
		   var tList = "";
		   console.log(indexTList);
		   if(indexTList.length == 0) {
			   tList += '<tr><td colspan="3"><b>게시글이 존재하지 않습니다.</b></td></tr>';
		   }
		   else {
			   for(var i = 0; i < indexTList.length; i++) {
				   
				    tList += '<tr>';
				  	tList += 	'<td colspan="3">';
				 	tList += 		'<a href = "<%= contextPath %>/detail.it?bno=' + indexTList[i].tNo + '">';
				 	tList +=			indexTList[i].tTitle;
				 	tList += 		'</a>';
				 	tList += 	'</td>';
				 	tList += '</tr>';
			   }
		   }
		   $("#indexTList").html(tList);
	   }
   });
   


$(function(){
	$("#message").click(function(){
		
		// 클릭될때마다 채팅 url 요청 => location.href
		// /javajo/chat.no?toNo=X
				
		// X 먼저 구하기
		var toNo = $(this).val();
				
		window.open("<%=contextPath %>/chatbox.no" , "chatbox", "height = 550,width = 500");
	});
});


</script>
</html>