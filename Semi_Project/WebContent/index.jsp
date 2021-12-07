<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오이마켓</title>

<style>
    #wrap {
        width: 1000px;
        height: 1000px;
        margin: auto;
    }

    #content1 {height: 20%;}
        #content2 {height: 20%;}
        #banner {height: 15%;}
</style>

</head>
<body>

    <div id="wrap">


 <!-- 상단에는 header1.jsp가 보이게 해줌 -->


<%@include file = "views/common/header1.jsp" %>

<div id="content1">
    추천도서    
</div>
<hr>

<div id="content2">
    책후기
</div>
<hr>
<div id="banner">
    배너
</div>




<%@include file = "views/common/footer.jsp" %>

    </div>
</body>
</html>