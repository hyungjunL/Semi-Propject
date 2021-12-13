<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.service.model.vo.FAQ,com.kh.member.model.vo.Member" %>
<% 
	FAQ f = (FAQ)request.getAttribute("f");
	Member loginMember = (Member)session.getAttribute("loginMember");
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en"> <!-- FAQ 게시판에서 FAQ 게시글 누르면 나오는 창 -->

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



  <style>

    #wrap {
      width: 1000px;
      height: auto;
      margin: auto;
      position: relative
    }

    #miniMenu { height:3%;
  
      } 
    #miniMenu>button {
            float: right;
            border-radius: 5px;
        }


    #header {
      width: 100%;
      height: 15%;
      background: rgb(67,155,68);

    }

    #content{

        width:100%;
        height:63%;
    }

    #side-bar {
      width: 20%;
      margin-top: 50px;
      float: left;
     
    }

    .table-side td {
      width: 200px;
      border: 1px solid lightgrey;
      height: 50px;
      text-indent: 5px;
    }

    #side-bar>p {
      font-size: 20px;
      text-indent: 10px;
    }

    #side-bar td:hover {
      color: rgb(67,155,68);
    }
   


    #content-center {
     
      margin-top: 3%;
      width:70%;
      float: right;
      padding-bottom: 15%;
    }

    
    #footer {
        height: 30%;
        width:100%;
        clear:both;
    }

    #footer1 {
            height: 20%;
        }
        #footer2 {
            height: 75%;
            clear:both;
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
        #faq{
          background-color : white; /* 색상을 지정하지 않으면 투명색 */
            border : 1px solid green;
            
            width : 90%;
            height: 400px;
            /* div 의 content 의 가로길이는 부모 요소의 50% 로 지정하겠다 라는 뜻 */
            box-sizing : border-box;
            margin-top: 3%;
        }
        #faq2{
          margin-left:30px;
          margin-top:20px;
        }
        
  </style>
</head>

<body>
  <div id="wrap">
    <div id="header">
      <div id="miniMenu">
        <button>회원가입</button>
        <%if(loginMember == null){ %>
        <button onclick="login();">로그인</button>
        <%} else{ %>
        <button onclick="logout();">로그아웃</button>
        <%} %>
        <button>마이페이지</button>
        <button>고객센터</button>
        <button onclick="home();">홈</button>
    </div>  
    <script>
    	function login(){
    	 // location.href = "로그인창 경로"
    	}
    	function logout(){
    		location.href = "<%= contextPath %>/logout.me";
    	}
    	function home(){
    		location.href = "<%= contextPath %>";
    	}
    	function review(){
    		location.href = "<%= contextPath %>/list.fb?currentPage=1";
    	}
    </script> 

    <br>

    
    <br>
      
      <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="/javajo/center.se" style=" font-size: 30px;">COMMUNITY</a>
          <form class="d-flex">
            
          </form>
        </div>
      </nav>
    </div>

    <div id="content">
      <div id="side-bar">
        <table class="table-side">
          <p>후기</p>
          <tr>
            <td onclick="review();">책 후기</td>
          </tr>
        </table>

        <table class="table-side">
          <p style="margin-top: 15px;">고객 센터</p>
          
          <tr>
            <td> 문의</td>
          </tr>
        </table>

      </div>

    <div id="content-center">
      <div id="faq">
        <div id="faq2">
          <div style="height: 30%;">
            <h4>Q.<%= f.getFaqTitle() %></h4><hr>
          </div>
          <div style="height: 70%;">
            <h5>A.<%= f.getFaqContent() %></h5>
          </div>
      </div>
        
      </div>
    </div>
  </div>  


        <div id="footer">
            <div id="footer1" style="height: 20%;">
                <ul id="miniFoot">
                   
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
                    <a><img src="C:\Frontend-workspace\index\images\facebook.svg"></a>
                    <a><img src="C:\Frontend-workspace\index\images\instar.svg"></a>
                    <a><img src="C:\Frontend-workspace\index\images\blog.svg"></a>
                </p>
                <p style="color: gray; font-size: 12px;">
                    ©Cucumber Market Inc.
                </p>
            </div>
    </div>
    </div>


</body>

</html>