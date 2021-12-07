<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하단고정</title>
<style>
   

    div, form{
        /*border: 1px solid black;*/
        box-sizing: border-box;
    }
   
    #footer {height: 22%;
        width: 100%;
       }
    #footer1 {
        height: 20%;
    }
    #footer2 {
        height: 75%;
    }
    #miniFoot>li {
        list-style-type: none;
        text-decoration: none;
        float: left;
        width: 20%;
        height: 100%;
        text-align: center;
    }
    #miniFoot>li a{
        color: gray;
    }
    #miniFoot>li a:hover {
        font-weight: 900;
        cursor: pointer;
    }

</style>


</head>
<body>


   <div id = "wrapfooter">
    <hr>
    <div id="footer">
        <div id="footer1" style="height: 20%;">
            <ul id="miniFoot">
                <li><a>FAQ</a></li>
                <li><a>회사소개</a></li>
                <li><a>채용</a></li>
                <li><a>이용약관</a></li>
                <li><a>개인정보처리방침</a></li>
            </ul>
        </div>
        <br>
        <br>
        <hr>
        <div id="footer2" style="height: 75%;">
            <p style="height: 70%; font-size: 13px; ">
                고객문의 cs@daangnservice.com 제휴문의 contact@daangn.com <br>
                지역광고 ad@daangn.com PR문의 pr@daangn.com <br>
                <br>
                서울특별시 구로구 디지털로30길 28, 609호 (오이서비스)
                사업자 등록번호 : 375-87-00088 직업정보제공사업 신고번호 : J1200020200016
                <br><br>
                <a><img src="resources\facebook.svg"></a>
                <a><img src="resources\instar.svg"></a>
                <a><img src="resources\blog.svg"></a>
            </p>
            <p style="color: gray; font-size: 12px;">
                ©Cucumber Market Inc.
            </p>
        </div>

</div>



</body>
</html>