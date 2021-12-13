<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.kh.chat.model.vo.Chat,com.kh.member.model.vo.Member" %>   
<% ArrayList<Chat> mylist = (ArrayList<Chat>)request.getAttribute("mylist");

Member loginMember = (Member)session.getAttribute("loginMember");
//로그인 전 : header.jsp 가 로딩될때 null
//로그인 후 : header.jsp 가 로딩될때 로그인한 회원의 정보가 담겨있음

int userNo = loginMember.getMemberNo();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅함</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
    *{ margin: 0; padding: 0; }

    .chat_wrap .header { font-size: 14px; padding: 15px 0; background: #238523; color: white; text-align: center;  }
    
    
    #chatbox {width:100%; text-align: center; }
    
    td {
    border: 1px solid #444444;
  }
     
</style>


</head>
<body>

<div class="chat_wrap">
        <div class="header">
            CHAT BOX
        </div>
        
        
        <select name="chattype" id="chattype">
                           <option value="" selected disabled hidden>==선택하세요==</option>
                            <option value="option1">받은 메세지함 </option>
                            <option value="option2">보낸 메세지함</option>
                        </select>
        
        
         <table id ="chatbox" align="center">
         
        		<thead>
        		<tr>
        		<td> 받은사람 </td>
        		<td> 보낸사람</td>
        		<td> 내용 </td>
        		</tr>
        		</thead>
                <tbody>
             
                
                <% if(mylist != null) { %>
                
                 
				<% for(Chat c : mylist) { %>
				
				  <% if(userNo == c.getToNo()) { %> <!-- 나 = 받은사람 일때 : 받은 메세지함 -->

				  <tr class = "layer1">
				    <td><%=c.getToNo() %></td>
				    <td onclick = 'listNo(this);'><%=c.getFromNo() %></td> <!-- 보낸사람 클릭시 링크 이동 -->
				    <td><%=c.getChatContent() %></td>
				      </tr>
				
				  
				<% } else { %>   <!-- 나 = 보낸사람 일때 : 보낸 메세지함 -->
				
				    <tr class = "layer2">
				    <td onclick = 'listNo(this);'><%=c.getToNo() %></td> <!-- 받은사람 클릭시 링크 이동 -->
				    <td><%=c.getFromNo() %></td>
				    <td><%=c.getChatContent() %></td>
				      </tr>
				  
				  <% } %>
								 
                            
				<% } %>
			    
              <% } else { %>
              <tr>
            	<td>등록된 채팅이 없습니다.</td>
              </tr>
              <% } %>
            
            
                
              
                </tbody>
            </table>
        
        
        
       <script>
        	
        	
        	function listNo(td){
      		  
        		console.log("클릭");
        		  
        	    // 클릭될때마다 url 요청 => location.href
        	    // /javajo/chat.no?toNo=X
        	    // X 먼저 구하기
        	    var toNo = td.innerText; // 자바스크립트
        	    console.log(toNo);
        	        
        	    window.open("/javajo/chat.no?toNo=" + toNo , "chat", "height = 550,width = 500");
       
        }
        	
        	
        	jQuery('#chattype').change(function() {
			var state = jQuery('#chattype option:selected').val();
			if ( state == 'option1' ) {
				jQuery('.layer1').show();
			} else {
				jQuery('.layer1').hide();
			}
		});
        	
        	jQuery('#chattype').change(function() {
    			var state = jQuery('#chattype option:selected').val();
    			if ( state == 'option2' ) {
    				jQuery('.layer2').show();
    			} else {
    				jQuery('.layer2').hide();
    			}
    		});
        	
        	
        	
        	
        	
        	
        </script>    
       
        
        
        
        
        
        
        </div>
    

</body>
</html>