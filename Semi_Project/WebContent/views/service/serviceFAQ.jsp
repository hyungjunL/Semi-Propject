<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.service.model.vo.FAQ, com.kh.common.model.vo.PageInfo,com.kh.member.model.vo.Member" %>
<%
	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	Member loginMember = (Member)session.getAttribute("loginMember");
	String contextPath = request.getContextPath();
	
	// 페이징바 만들때 필요한 변수 미리 셋팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en"> <!-- 고객센터메인에서 FAQ누르면 나오는 게시판 -->

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
      margin-left: auto;
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

        
  </style>
</head>

<body>
  <div id="wrap">
    <div id="header">
      <div id="miniMenu">
        <button>회원가입</button>
        <%if(loginUser == null){ %>
        <button onclick="login();">로그인</button>
        <%} else{ %>
        <button onclick="logout();">로그아웃</button>
        <%} %>
        <button>마이페이지</button>
        <button>고객센터</button>
    </div>  
    <script>
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
            <input class="form-control me-sm-2" type="text" placeholder="Search" >
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
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
            <td>공지사항</td>
          </tr>
          <tr>
            <td> 문의</td>
          </tr>
        </table>

      </div>

      <div id="content-center">
            
            <table class="table table-hover">
                <h2>FAQ</h2>
                <br>
                <thead>
                    <tr>
                        <th>글번호</td>
                        <th>제목</th>
                    </tr>
                </thead>
                <tbody>
                  <% if(list.isEmpty()) { %> <!-- 리스트가 비어있을 경우 -->
                    <tr>
                      <td colspan="2">존재하는 FAQ가 없습니다.</td>
                   	</tr>
                  <% } else { %> 
                    
                    <% for(int i=list.size()-1;i>=0;i--) { %>
                      
                      <tr onclick="link(<%=list.get(i).getFaqNo()%>)">
                        <td><%= list.get(i).getFaqNo() %></td>
                        <td><%= list.get(i).getFaqTitle() %></td>
                      </tr>
                    <% } %>
                  <% } %>
                </tbody>
            </table>
            <script>
          	function link(x){
          		window.open("/javajo/detail.faq?fno=" + x, "FAQ");
          	}
          	</script>
            <br>
            <div align="center" class="paging-area">
        
        	<!-- 페이징바에서 < 를 담당 : 이전페이지로 이동 -->
        	<% if(currentPage != 1) { %>
        		<button onclick="location.href='/javajo/faq.se?currentPage=<%= currentPage - 1 %>'">&lt;</button>
        	<% } %>
        
        	<!-- 페이징바에서 숫자를 담당 -->
            <% for(int i = startPage; i <= endPage; i++) { %>
            	<!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
            	<% if(i != currentPage) { %>
            		<button onclick="location.href='/javajo/faq.se?currentPage=<%= i %>'"><%= i %></button>
            	<% } else { %>
            		<!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 막고싶다. -->
            		<button disabled><%= i %></button>
            	<% } %>
            <% } %>
            
            <!-- 페이징바에서 > 를 담당 : 다음페이지로 이동 -->
            <% if(currentPage != maxPage) { %>
            	<button onclick="location.href='/javajo/faq.se?currentPage=<%= currentPage + 1 %>'">&gt;</button>
            <% } %>
            
        </div>
        
        </div>
        
</div>


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