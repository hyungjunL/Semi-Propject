<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer {
        background : black;
        color : white;
        width : 1000px;
        height : 700px;
        margin : auto;
        margin-top : 50px;
    }

    table { border:1px solid white; }
    table input, table textarea {
        width : 100%;
        box-sizing : border-box;
    }
</style>
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>

    <div class="outer">

        <br>
        <h2 align="center">사진게시판 작성하기</h2>
        <br>

        <form action="<%= contextPath %>/insert.th" id="enroll-form" method="post" enctype="multipart/form-data">

			<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">

            <table align="center">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3"><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                        <textarea name="content" style="resize:none;" rows="5" required></textarea>
                    </td>
                </tr>
                <!-- 미리보기 영역 -->
                <tr>
                    <th>대표이미지</th>
                    <td colspan="3" align="center">
                        <img id="titleImg" width="250" height="170">
                    </td>
                </tr>
                <tr>
                    <th>상세이미지</th>
                    <td><img id="contentImg1" width="150" height="120"></td>
                    <td><img id="contentImg2" width="150" height="120"></td>
                    <td><img id="contentImg3" width="150" height="120"></td>
                </tr>
            </table>

            <div id="file-area">
                <input type="file" id="file1" name="file1" onchange="loadImg(this, 1);" required> <!-- 대표이미지 : 필수 -->
                <input type="file" id="file2" name="file2" onchange="loadImg(this, 2);">
                <input type="file" id="file3" name="file3" onchange="loadImg(this, 3);">
                <input type="file" id="file4" name="file4" onchange="loadImg(this, 4);">
                <!-- onchange : input 태그의 내용물이 변경되었을 때 발생하는 이벤트 -->
                <!-- loadImg() 함수를 호출 => 우리가 만들 함수 (매개변수는 이미지 위치를 의미) -->
            </div>

            <script>
                $(function(){

                    $("#file-area").hide();

                    $("#titleImg").click(function(){
                        $("#file1").click();
                    });

                    $("#contentImg1").click(function(){
                        $("#file2").click();
                    });

                    $("#contentImg2").click(function(){
                        $("#file3").click();
                    });

                    $("#contentImg3").click(function(){
                        $("#file4").click();
                    });
                });

                function loadImg(inputFile, num) {

                    // inputFile : 현재 변화가 생긴 <input type="file"> 요소 객체
                    // num : 몇번째 input 요소인지 확인 후 그 해당 영역에 미리보기 하기 위한 변수

                    // console.log(inputFile.files.length);
                    // inputFile.files.length : 파일 선택 시 1, 파일 선택 취소 시 0 이 찍힘
                    // => 파일의 존재 유무를 알 수 있다.

                    // files 속성 : 업로드된 파일의 정보들을 배열 형식으로 여러개 묶어서 반환
                    //              length 는 배열의 크기를 의미

                    if(inputFile.files.length == 1) { // 파일이 있는 경우

                        // 선택된 파일을 읽어들여서 그 영역에 맞는 곳에 미리보기

                        // 파일을 읽어들일 FileReader 객체 생성
                        var reader = new FileReader();

                        // FileReader 객체로부터 파일을 읽어들이는 메소드를 호출
                        // 어느 파일을 읽어들일건지 매개변수로 제시해야 함!!
                        // 0 번 인덱스에 담긴 파일 정보를 제시
                        reader.readAsDataURL(inputFile.files[0]);
                        // => 해당 파일을 읽어들이는 순간
                        //    해당 그 파일만의 고유한 url 이 부여됨
                        // => 해당 url 을 src 속성으로 부여할것! (attr)

                        // 파일 읽기가 완료되었을 때 실행할 함수를 정의
                        reader.onload = function(e){
                            // e 의 target => e.target => 이벤트 당한 객체 (this)

                            // e 의 target.result 에 각 파일의 url 이 담긴다.
                            // e.target.result == this.result
                            
                            // 각 영역에 맞춰서 이미지 미리보기
                            switch(num) {
                                case 1 : $("#titleImg").attr("src", e.target.result); break;
                                case 2 : $("#contentImg1").attr("src", e.target.result); break;
                                case 3 : $("#contentImg2").attr("src", e.target.result); break;
                                case 4 : $("#contentImg3").attr("src", e.target.result); break;
                            }
                        };

                    }
                    else { // 파일이 없는 경우
                        // 미리보기 사라지게 하기
                        // src=null 을 담아서 사라지게 할 것

                        switch(num) {
                            case 1 : $("#titleImg").attr("src", null); break;
                            case 2 : $("contentImg1").attr("src", null); break;
                            case 3 : $("contentImg2").attr("src", null); break;
                            case 4 : $("contentImg3").attr("src", null); break;
                        }
                    }

                }
            </script>

            <div align="center">
                <button type="submit">등록하기</button>
            </div>

        </form>
    </div>

</body>
</html>