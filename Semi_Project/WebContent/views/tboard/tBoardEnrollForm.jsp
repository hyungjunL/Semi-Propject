<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #wrap {
        width: 1000px;
        height: 1100px;
        margin: auto;
    }

     
	.outer{
     
        color: black;
        width: 100%;
        height : 90%;
        margin: auto;
        margin-top: 50px;
        font-size: 20px;
        }

        #enroll-form table{
            margin: auto;

        }

        #enroll-form input{
            margin: 16px;
            font-size: 20px; 
        }
        #enroll-form textarea {
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
        <h2 align="center">판매 등록</h2>
        <form action="<%= contextPath %>/insert.it" id="enroll-form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userNo" value="<%= loginMember.getMemberNo() %>">
  
            <table>
                <tr>
                    <th>거래 제목 : </th>
                    <td><input type="text" name="tTitle"  required></td>
                    <td></td>
                   
                </tr>
                <hr>
                <tr>
                    <th>거래 가격 : </th>
                    <td><input type="number"name="tPrice"  required></td>
                    <td></td>
                </tr>
                
                <tr>
                    <th>카테고리 :</th>
                    <td colspan="2">
			                        국내도서:<input type="radio" name="categoryNo" id="korea" value="1"><label for="korea"></label>
			                        해외도서:<input type="radio" name="categoryNo" id="broad" value="2"><label for="broad"></label>
			                        초/중/고 참고서:<input type="radio" name="categoryNo" id="teen" value="3"><label for="teen"></label>
			                        <br>
			                        대학교재:<input type="radio" name="categoryNo" id="univer" value="4"><label for="univer"></label>
			                        수험서/자격증:<input type="radio" name="categoryNo" id="licence" value="5"><label for="licence"></label>
                        
                    </td>
                </tr>

                <tr>
                    <th>책 상태 :     </th>
                    <td>
                   		새거 : <input type="radio" name="bookStatus" value="상" required>
                       	거의 새거 : <input type="radio" name="bookStatus" value="중" required>
                       	사용감 있음 : <input type="radio" name="bookStatus" value="하" required></td>
                    <td></td>
                </tr>
                
                <tr>
                    <th>상세 설명: </th>
                    <td></td>
                </tr>
                
                <tr>
                    <td colspan="2">
                        <textarea name="content" rows="10" style="resize: none;" required></textarea>
                    </td>
                </tr>
                <tr>
                    <th>이미지 등록 : </th>

                    <td>
                        <img id="contentImg1" width="120" height="120">
                        <img id="contentImg2" width="120" height="120">
                        <img id="contentImg3" width="120" height="120">
                    </td>
                </tr>
                
                 
                               
              
               
            </table>
            <br>
            <hr>
 			<div align="center">
                <button type="submit" class="btn btn-secondary">판매 등록</button>
                <button type="reset" class="btn btn-secondary btn-danger">초기화</button>
            </div>
            
           
            
            

         
            <div id="file-area">
           
            <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);" required >
            <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);" required >
            <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);" required >
  
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
    <br>
    <br>
    <br>
    <%@include file = "../common/footer.jsp" %>

</div>
</body>
</html>