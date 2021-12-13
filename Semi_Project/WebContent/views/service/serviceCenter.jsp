<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.service.model.vo.Service ,com.kh.member.model.vo.Member" %>
<%
	Member loginMember = (Member)session.getAttribute("loginMember");
	String alertMsg = (String)session.getAttribute("alertMsg");
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en"><!-- 고객센터 메인화면 -->

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

	<script>
		
		// script 태그 내에서도 스크립틀릿과 같은 jsp 요소를 쓸 수 있다.
		
		var msg = "<%= alertMsg %>"; // "메시지 문구" / "null"
		
		if(msg != "null") { // 즉, 성공 / 경고 메시지 문구가 담겨있을 경우
			alert(msg);
		
			// session 에 들어있는 alertMsg 키값에 대한 밸류를 지워줘야함!!
			// 안그러면 menubar.jsp 가 로딩될때마다 매번 alert 가 뜰것
			// => XX.removeAttribute("키값");
			<% session.removeAttribute("alertMsg"); %>
		}
	
	</script>

  <style>

    #wrap {
      width: 1000px;
      height:auto;
      margin: auto;
      position: relative;
    }

    #miniMenu { height:2%;
  
      } 
    #miniMenu>button {
            float: right;
            border-radius: 5px;
        }


    #header {
      width: 100%;
      height: 15%;
      background: rgb(67,155,68);
      clear:both;


    }

    #content{

  width:100%;
  height:63%
    }


    #side-bar {
      float: left;
      width: 20%;
      height:100%;
      margin-top: 50px;
     
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
      margin-top: 5%;
      text-align: left;
      float: right;
      width: 80%;
      height: 100%;
      padding-bottom: 15%;
      
    }
    

   
    #content1 {font-weight: 700;
            height: 25%;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            margin-left: 20%;
        }
         #content2 {
          
             height: 25%;
        }

        #content3{

          height: 25%;

        }

        #xx{
            /*border: 1px solid gold;*/
            float: left;
            width: 30%;
            height: 80%;
           
            background: white;
            border-style : outset; 
            border-width : 10px;
        }
        #xx:hover{
            font-weight: bolder;
            cursor: pointer;
        }
        label:hover{
            cursor: pointer;
        }
        
        #zz{
            background: white;
            width: 600px;
            height : 50px;
            border-radius: 10px;
            border : 2px solid gray;
            background: white;
            color: black;
            padding: 5px;
            display: flex;
            align-items: center;
            font-weight: bold;
            font-size: 18px;
            margin-left: 120px;
            margin-right : 100px;
            cursor: pointer;
            
        }

    #content2 p{
            border : 1px solid lightgray;
            width: 600px;
            height: auto;
            border-radius: 10px;
            padding : 5px;
            display: none;
            margin: auto;
            margin-right: 80px;
        }


        #footer {
        height: 30%;
        width:100%;
        clear:both;
    }

    #footer1 {
            height: 20%;
            width:100%;
            
        }
        #footer2 {
            height: 75%;
            width:100%;
            
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
        
        #service{
        
        text-align: center;
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

    	function home(){
    		location.href = "<%= contextPath %>";
    	}
	    function login() {
	    	
	        window.open("views/member/minilogin.jsp", "로그인", "width=700, height=400, status=0, toolbar=0, menubar='no'");
	    }
    	function logout(){
    		location.href = "<%= contextPath %>/logout.me";
    	}
    	
    
    </script>  

    <br>
    <br>
      
      <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="#" style=" font-size: 30px;">COMMUNITY</a>
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
            <td>책 후기</td>
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
       
        <div id="content1">
            <div id="xx" style="margin-right: 30px;" onclick="faq();">
            <label style="margin: 30px 0 50px 0; font-size: 40px;" >FAQ</label> 
            </div>
            <div id="xx" style="margin: 0; margin-right : 150px" onclick="one();">
            <label style="margin: 40px 0 50px 0px; font-size: 40px;" >1:1 문의</label>
            </div>
        </div>

        <script>
          function faq(){
            location.href = "/javajo/faq.se?currentPage=1";
          }
          function one(){
        	  window.open("/javajo/one.se", "one", "height = 550, width = 520");
        	}
        </script>
        <hr>
        <div id="content2">
            <br>
            <h3 style="text-align: center;">자주 묻는 질문 Top 5</h3>
            <br>
            <span id="zz">판매자와 채팅은 어떻게 하나요?</span>
            <p>거래를 원하는 게시글에서 ✉ 버튼을 눌러주세요!<br></p>
            <span id="zz">가격이 비싸요!</span>
            <p>중고 거래인 만큼 오이마켓은 판매자가 자유롭게 가격을 책정하도록 하고 있어요. 오이마켓에서 개입하여 판매가격을 조정하지 않아요.</p>
            <span id="zz">중고거래 게시글 개수에 제한이 있나요?</span>
            <p>제한은 없습니다.</p>
            <span id="zz">택배거래해도 괜찮나요?</span>
            <p>택배 거래를 할 수도 있어요. 다만 택배 거래보다 직거래를 권장합니다:)</p>
            <span id="zz">거래완료 등의 거래 상태 변경은 어떻게 하나요?</span>
            <p>[마이페이지 > 판매내역]에서 [판매중],[거래완료] 버튼을 눌러보세요. </p>
        </div>


        <hr>

        <div id="content3" style="text-align: center; width: 70%; margin-top: 50px; margin-left :120px">
          <h2>1:1 문의내역</h2>
          <br>
          <table class="table table-hover">
              <thead>
                  <tr>
                      <td width="50px" height="15px">문의번호</td>
                      <td width="250px">제목</td>
                  </tr>
              </thead>
            <tbody>
                 <% if(loginMember != null) { %>
				  <!-- 로그인이 되어있을 경우 : 1대1문의 내역보기 가능 -->
				  
				    <input id ="service" type=text value="CLICK>>내 문의 내역  " name=service width=40 onclick="selectServicelist()" readonly>
				    
				    <% } else { %>
				  <!-- 로그인이 안되어있을 경우 : 불가능 -->
				  
				  <tr>
				    <td colspan="2">로그인 후 사용해주세요.</td>
				  </tr>
				<% } %>
                 
              </tbody>
          </table>
          
           </div>

        </div>
         
        <script>
        
            $(function(){
                $("span").click(function(){
    
                    var $p = $(this).next();
    
                    if($p.css("display")== "none"){
    
                        $(this).siblings("p").slideUp(1000);
    
                        $p.slideDown(1000);
                    }
                    else{
                        $p.slideUp(1000);
                    }
    
                });
            });
            
            
            function selectServicelist() {
            	
            	
            	$.ajax({
            	
            		url: "servicelist",
            		success: function(list) {
            				   
            		        // 갯수만큼 반복 => 누적(문자열)
            		        var result = "";
            		        for(var i in list) { 
            		          result += "<tr>"
            		        	   			   + "<td onclick = 'listNo(this);'>" + list[i].oneId +"</td>"
            		        	               + "<td>" + list[i].oneTitle + "</td>"
            		                      + "</tr>";
            		        }
            		        
            		        $("#content3 tbody").html(result);
            		        console.log("ajax 성공");
            		        
            		      },
            		      error : function() {
            		        console.log("ajax 실패");
            		      }
            			
            		})
            };
           
            
            function listNo(td){
            		  
            		console.log("클릭");
            		  
            	    // 클릭될때마다 url 요청 => location.href
            	    // /javajo/inq.se?ino=X
            	    // X 먼저 구하기
            	    var ino = td.innerText; // 자바스크립트
            	    console.log(ino);
            	        
            	    location.href = "/javajo/inq.se?ino="+ino;
           
            }
            	
            
            
        	
        </script>

        </div>
      
        <div id="footer">
          <div id="footer1" style="height: 20%;">
              
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


  </div>
</body>

</html>