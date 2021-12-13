<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.service.model.vo.Service" %>
<% 
	Service s = (Service)request.getAttribute("s");
%>
<!DOCTYPE html>
<html lang="en"> <!-- 1:1 문의 조회창 -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
        #content1 {
            margin-left: 10%;
            height: 700px;
            width: 70%;
            font-size: 18px;
            font-weight: 700;

        }
    </style>
</head>
<body>
    <div id="wrap">
        
        

        
        <hr>
        <div id="content1" style="margin-top: 50px;">
            <div>
            <table class="table">
                <h4 style="text-align: center; margin-bottom: 70px;"> 1:1 문의 내역</h4>
                <tr>
                    <td style="width: 20%;">등록일</td>
                    <td style="width: 80%;"><%= s.getCreateDate() %></td>
                </tr>
                <tr>
                    <td>문의 유형</td>
                    <% if(s.getoType() == 0) { %>
                    <td>거래문의</td>
                    <%} else if(s.getoType() == 1){ %>
                    <td>계정 및 보안</td>
                    <%} else if(s.getoType() == 2) {%>
                    <td>부정신고</td>
                    <%} else if(s.getoType() == 3) {%>
                    <td>기타</td>
                    <%} %>
                </tr>
                <tr>
                    <td>제목</td>
                    <td><%= s.getOneTitle() %></td>
                </tr>
                <tr>
                    <td style="transform: translateY(+50%)">내용</td>
                    <td><%= s.getOneContent() %></td>
                </tr>
            </table>
            </div>
            <br>
            <hr style="border: 1px solid;">
            <table class="table">
                <tr>
                    <td style="width: 20%;">답변</td>
                    <td style="width: 80%;"><%= s.getAnswer() %></td>
                </tr>
            </table>
            <hr>
        </div>
        
        <br><hr>
        
        
    
</body>
</html>