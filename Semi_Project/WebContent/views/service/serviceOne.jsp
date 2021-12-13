<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.kh.member.model.vo.Member" %>
<% 

Member loginMember = (Member)session.getAttribute("loginMember");
// 로그인 전 : header.jsp 가 로딩될때 null
// 로그인 후 : header.jsp 가 로딩될때 로그인한 회원의 정보가 담겨있음

String userId = loginMember.getMemberId();
String userName = loginMember.getMemberName();

%>   
    
    
<!DOCTYPE html>
<html lang="en"> <!-- 1:1 문의 버튼 누르면 나오는 양식 창-->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    
      #wrap{
      width =1000px;
      height = 1000px;
      display: inline-block;
      text-align = center;
      }
    
        #form1{
            background-color : white; /* 색상을 지정하지 않으면 투명색 */
            border : 2px solid green;
            padding-left: 10px;
            width : 100%;
            height: 700px;
            margin: auto;
            /* div 의 content 의 가로길이는 부모 요소의 50% 로 지정하겠다 라는 뜻 */
            box-sizing : border-box;
            /* 가로길이를 border 영역까지 포함해서 지정하겠다 라는 뜻 */
        }
    </style>
</head>
<body>
     <div id = "wrap">
   
           <h2 style="text-align: center;"><strong>1:1 문의</strong></h2>  
           <form action="/javajo/sub.se" method="post">
            <div id="form1" style="margin-top: 70px;">
                    <div id="form2">
                        <br><br>문의유형 &nbsp;
                        <select name="otype" id="faq">
                            <option value="0">거래문의</option>
                            <option value="1">계정 및 보안</option>
                            <option value="2">부정신고</option>
                            <option value="3">기타</option>
                        </select>
                        <br><br><br> ID &nbsp; 
                        <input type="text" value ="<%= userId %>" size="15" name="id" readonly> &nbsp; &nbsp; 
                        문의자명 &nbsp;
                        <input type="text" value ="<%= userName %>" size="15" name="name" readonly>
                        <br><br><br> 제목 &nbsp; &nbsp;
                        <input type="text" size="50px" name="title" maxlength="30">
                        <br><br><br>
                        <textarea name="content" cols="60" rows="10" style="overflow: scroll; resize: none;" maxlength="200"></textarea>
                    </div>
                
                </div>
            
            <br><br>
            <div style="text-align: center;">
            <input type="submit" value="제출하기"> &nbsp; &nbsp;
            </div>
            
            </form> 
            
            </div>
       
        	<script>
	           	function back(){
	           		location.href="/javajo/center.se"
	           	}
        	</script>
        
        <!--요위로작업중-->
     
 
  
    
</body>
</html>