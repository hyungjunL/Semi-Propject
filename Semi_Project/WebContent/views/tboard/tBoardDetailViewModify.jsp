<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.tboard.model.vo.*" %>
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");	
	TBoard b = (TBoard)request.getAttribute("b");
	Attachment at = (Attachment)request.getAttribute("at");
	ArrayList<Attachment> a_list = (ArrayList<Attachment>)request.getAttribute("a_list");	
	int boardNo = (int)request.getAttribute("boardNo");
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

     
	.outer{
        background: rgb(243, 245, 243);
        color: black;
        width: 100%;
        height : 90%;
        margin: auto;
        margin-top: 50px;
        font-size: 20px;
        }

        #update-form table{
            margin: auto;

        }

        #update-form input{
            margin: 16px;
            font-size: 20px; 
        }
        #update-form textarea {
            width: 100%;
            margin-top: 5px;
            box-sizing: border-box;

        }

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>

	<div id="wrap">
		<%@include file = "../common/header1.jsp" %>
		
		
		<div class="outer">
        <br>
        
        <h2 align="center">내용 수정</h2>
        <form action="<%= contextPath %>/modify.it?bno=<%= boardNo %>" id="update-form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userNo" value="<%= loginMember.getMemberNo() %>">
  
            <table>
                <tr>
                    <th>거래 제목 : </th>
                    <td><input type="text" name="tTitle" value="<%= b.gettTitle() %>"></td>
                    <td></td>
                   
                </tr>
                <hr>
                <tr>
                    <th>거래 가격 : </th>
                    <td><input type="number"name="tPrice" value="<%= b.gettPrice() %>"></td>
                    <td></td>
                </tr>
                
                <tr>
                    <th>카테고리 :</th>
                    <td colspan="2">
                        <select name="category">
                            <% for(Category c : list) { %>
                            		<option value="<%= c.getCategoryNo() %>"><%= c.getCategoryName() %></option>
                            <% } %>
                        </select>
                        <script>
                        	$(function() {
                        		$("#update-form option").each(function() {
                        			
                        			if($(this).text() == "<%= b.getCategoryName() %>") {
                        				$(this).attr("selected", true);
                        			}
                        			
                        		});
                        	});
                        </script>    
                    </td>
                </tr>

                <tr>
                    <th>책 상태 :     </th>
                    <td> 
                    	<select name="status">
                            
                            <option value="<%= b.getBookStatus() %>">상</option>
                            <option value="<%= b.getBookStatus() %>">중</option>
                            <option value="<%= b.getBookStatus() %>">하</option>
                        </select>
                        <script>
                        	$(function() {
                        		$("#update-form option").each(function() {
                        			
                        			if($(this).text() == "<%= b.getBookStatus() %>") {
                        				$(this).attr("selected", true);
                        			}
                        			
                        		});
                        	});
                        </script> 
                    </td>
                    <td></td>
                </tr>
                
                <tr>
                    <th>상세 설명: </th>
                    <td></td>
                </tr>
                
                <tr>
                    <td colspan="2">
                        <textarea name="content" rows="10" style="resize: none;" ><%= b.getContent() %></textarea>
                    </td>
                </tr>
                <tr>
                    <th>이미지 등록 : </th>

                    <td>
                    
                   	
                   	<img src="<%= a_list.get(0).getFilePath() %>/<%= a_list.get(0).getChangeName() %>" id="contentImg1" width="120" height="120">
                    <img src="<%= a_list.get(1).getFilePath() %>/<%= a_list.get(1).getChangeName() %>" id="contentImg2" width="120" height="120">
                    <img src="<%= a_list.get(2).getFilePath() %>/<%= a_list.get(2).getChangeName() %>" id="contentImg3" width="120" height="120">
          
                     	
                        
                    </td>
                </tr>
   	
            </table>

            <br><br>
            <div align="center">
    			<button type="submit" class="btn btn-secondary">수정 완료</button>
    			<button type="reset" class="btn btn-secondary btn-danger">초기화</button>
    		</div>

            <br><br>
            <div id="file-area">
           
            <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);" >
            <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);" >
            <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);" >
  
        </div>
		
            <script>
                $(function(){

                    $("#file-area").hide();


                    $("#contentImg1").click(function(){
                        $("#file1").click();
                    });

                    $("#contentImg2").click(function(){
                        $("#file2").click();
                    });

                    $("#contentImg3").click(function(){
                        $("#file3").click();
                    });
                });

                function loadImg(inputFile, num) {

                  

                    if(inputFile.files.length == 1) { 
                        var reader = new FileReader();

                        reader.readAsDataURL(inputFile.files[0]);
                        
                        reader.onload = function(e){
                           
                            switch(num) {
                                case 1 : $("#contentImg1").attr("src", e.target.result); break;
                                case 2 : $("#contentImg2").attr("src", e.target.result); break;
                                case 3 : $("#contentImg3").attr("src", e.target.result); break;
                            }
                        };

                    }
                    else { 

                        switch(num) {
                            case 1 : $("contentImg1").attr("src", null); break;
                            case 2 : $("contentImg2").attr("src", null); break;
                            case 3 : $("contentImg3").attr("src", null); break;
                        }
                    }

                }
            </script>
            
        </form>
        
        
    </div>
    
		<%@include file = "../common/footer.jsp" %>
	    
	</div>


</body>
</html>