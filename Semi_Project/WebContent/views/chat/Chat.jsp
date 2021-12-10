<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="com.kh.member.model.vo.Member,com.kh.chat.model.vo.*" %>
<% 
//Chat c = (Chat)request.getAttribute("c");
Member loginMember = (Member)session.getAttribute("loginMember");
int toNo = (Integer)request.getAttribute("toNo");
// 로그인 전 : header.jsp 가 로딩될때 null
// 로그인 후 : header.jsp 가 로딩될때 로그인한 회원의 정보가 담겨있음

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>채팅</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
  *{ margin: 0; padding: 0; }
 
  .chat_wrap .header { font-size: 14px; padding: 15px 0; background: #238523; color: white; text-align: center;  }
   
  .chat_wrap .chat { padding-bottom: 80px; }
 
  .chat_wrap .input-div { position: fixed; bottom: 0; width: 100%; background-color: #FFF; text-align: center; border-top: 1px solid  #238523; }
  .chat_wrap .input-div > textarea { width: 100%; height: 80px; border: none; padding: 10px; }
  .submit-button {width : 100%} 
  .format { display: none; }
  
  #chatbox {width:100%; text-align: center; }
  
  
</style>




</head>
<body>


 <div class="chat_wrap">
    <div class="header">
        CHAT
    </div>
    <div class="chat" style="overflow-y: auto; width: auto; height: 600px;">
        <!-- 메세지 -->
        
        <table id ="chatbox" align="center">
        		<thead></thead>
                <tbody>
                </tbody>
            </table>
        
    </div>
    <div class="input-div">
        <textarea id = "chatContent" placeholder="메세지를 입력해주세요."></textarea>
        <button class ="submit-button" onclick = "submitFunction();">전송</button>
   </div>
</div>


 
    
<script>


$(function() {
    selectChatlist();})


function submitFunction() {
	
	
	$.ajax({
	
		url: "chat.submit",
		type: "POST",
		
		data: {
		
			toNo:   <%= toNo %>,
			chatContent: $('#chatContent').val(),
		},
		success: function(result) {
			if(result > 0) { 
							
           					$("#chatContent").val(""); // textarea 초기화
           				      selectChatlist()
            			}
        				
        			},
        			error : function() {
        				console.log(" ajax 실패");
        			}
		});
}




function selectChatlist() {
	
	
	$.ajax({
	
		url: "chatlist.no",
		type: "POST",
		
		data: {
		
			toNo: <%= toNo %>,
		},
		success: function(list) {
				   
		        // 채팅갯수만큼 반복 => 누적(문자열)
		        var result = "";
		        for(var i in list) { 
		          result += "<tr>"
		        	   			   + "<td>" + list[i].fromNo + "번책장" + "</td>"
		        	               + "<td>" + list[i].chatContent + "</td>"
		        	               + "<td>" + list[i].createDate + "</td>"
		                      + "</tr>";
		        }
		        
		        $("tbody").html(result);
		        console.log("ajax 성공");
		        
		      },
		      error : function() {
		        console.log("ajax 실패");
		      }
			
		})
};



</script>


</body>
</html>