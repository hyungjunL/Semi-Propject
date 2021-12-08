<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<div id="wrap">
 <!-- 상단에는 header1.jsp가 보이게 해줌 -->
<%@include file = "views/common/header1.jsp" %>

        <div id="content1">
            <div class="contain" style="width: 100%; height: 100%; opacity: 1">
                <div class="koreabook" style="float: left; width: 25%; height: 100%;"><a><img src="resources/koreabook1.PNG"></a></div>
                <div class="koreabook" style="float: left; width: 25%; height: 100%;"><img src="resources/koreabook2.PNG"></a></div>
                <div class="koreabook" style="float: left; width: 25%; height: 100%;"><img src="resources/koreabook3.PNG"></a></div>
                <div class="koreabook" style="float: left; width: 25%; height: 100%;"><img src="resources/koreabook4.PNG"></a></div>
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
        <hr>

        <div id="content2">
            <table id="board">
                <tr>
                    <td>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                  <th colspan="2" style="font-size: 20px;" width="87%">거래게시판</th>
                                  <th style="font-size: 10px;"><a href="#">+더보기</a></th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td colspan="3"><a href="#">거래게시글1</a></td>
                                </tr>
                                <tr>
                                    <td colspan="3"><a href="#">거래게시글2</a></td>
                                </tr>
                                <tr>
                                  <td colspan="3"><a href="#">거래게시글3</a></td>
                                </tr>
                              </tbody>
                        </table>
                    </td>
                    <td>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                  <th colspan="2" style="font-size: 20px;" width="87%">자유게시판</th>
                                  <th style="font-size: 10px;"><a href="#">+더보기</a></th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td colspan="3"><a href="#">자유게시글1</a></td>
                                </tr>
                                <tr>
                                    <td colspan="3"><a href="#">자유게시글1</a></td>
                                </tr>
                                <tr>
                                  <td colspan="3"><a href="#">자유게시글1</a></td>
                                </tr>
                              </tbody>
                        </table>
                    </td>
                </tr>

            </table>
        </div>
        <hr>
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
})
</script>
</html>